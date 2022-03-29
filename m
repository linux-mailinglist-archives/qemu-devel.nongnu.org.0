Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813374EB3BF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 20:57:01 +0200 (CEST)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZH1Y-0001Q7-3T
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 14:57:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZGzD-0000Hd-8P
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 14:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZGzB-0008Jq-10
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 14:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648580071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nwwphfsyHM99PZXqUSfX4sB+iovmEvES2hkvxJazH1I=;
 b=eNoPqVhAOvcYH1ySfNKi0vfNlovxhQBKyNWiVaFMXbScKZTFE6raM6O2aZeva/i99I4eRH
 bGQUkZ8XT3JGHu+A2bawv+v+ccbw+8/C4jwuYrT5mI7gK1Wb+RQOSjGN3q6s5kU+wzzQKN
 tLDsLB4yOB8EQ0G4lu+WJdPf42YV164=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-kUqyHeAvMr2ma5s3h_B43A-1; Tue, 29 Mar 2022 14:54:30 -0400
X-MC-Unique: kUqyHeAvMr2ma5s3h_B43A-1
Received: by mail-qv1-f69.google.com with SMTP id
 s14-20020ad4446e000000b00440d3810126so14462614qvt.5
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 11:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nwwphfsyHM99PZXqUSfX4sB+iovmEvES2hkvxJazH1I=;
 b=yrm4HQyEsDO5qJMNkFrmLwlNAZZs1in6zYFErdaq42pStIv4oMqqoJktRaEHrwjpsf
 FtduNlUuvl8teDmAEDtklsR7D/ZlqZQUqtqXX0t3rSHWSbaHY1peJEebn1AeJeJGHXDa
 FncY9RuEa6PCz8/vzg5SXPr+S6Ya/ct9ooApQXfdUFbZvooXOEXugw6mNGzt4Hmuwk5T
 FSmxhz4HtQJp4li1NfshLSX7hjKVG5+qOhQTHImceIyuzXAK9CE2rFkyVadAhZwIiojV
 abr70hn4Bt5JbzCTodVtk5ZkinKIT5DQ7iDqm9ymNJA4AvRYx/OPtLPnrD/vtqp6gcpX
 rGdQ==
X-Gm-Message-State: AOAM531iovbdgeCTclEL1GAmnSlAJg6V7VMRk2MVZiNXOb2ixwQF2CTq
 7SvNNBCVuJ60RbLI3e00G/KWgeR39Nfvp1XkJj3lrsqiG0HmC1oXb2LAC1aA23yGNVrtfRac94/
 9ozW0NA3Y0FjlRB8=
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr21462533qkp.463.1648580069990; 
 Tue, 29 Mar 2022 11:54:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8diHsnUuzyjd1s0CKpThOXn4mAlbLe+ErPpZGpddcAkRKYz/aJjmivv39tfCDUyFIImEAeA==
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr21462511qkp.463.1648580069743; 
 Tue, 29 Mar 2022 11:54:29 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05620a066e00b0067d36cc5b12sm9482250qkh.87.2022.03.29.11.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 11:54:29 -0700 (PDT)
Date: Tue, 29 Mar 2022 14:54:27 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v21 8/9] migration-test: Export migration-test util
 funtions
Message-ID: <YkNV42fFoD0xZ4cd@xz-m1.local>
References: <cover.1647435820.git.huangy81@chinatelecom.cn>
 <dc7f8ce5fadc148dc2c2e14bc43940d58cd205bc.1647435820.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <dc7f8ce5fadc148dc2c2e14bc43940d58cd205bc.1647435820.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 09:07:20PM +0800, huangy81@chinatelecom.cn wrote:
> +void wait_for_serial(const char *tmpfs, const char *side)

Passing over tmpfs over and over (even if it's mostly a constant) doesn't
sound appealing to me..

I hope there's still a way that we could avoid doing that when spliting the
file.  Or, how about you just add a new test into migration-test?  After
all all migration tests (including auto-converge) is there, and I don't
strongly feel that we need a separate file urgently.

Thanks,

-- 
Peter Xu


