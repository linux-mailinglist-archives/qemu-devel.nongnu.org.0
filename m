Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CC64B43FB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:21:25 +0100 (CET)
Received: from localhost ([::1]:50298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWbs-00013O-Dm
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:21:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWJQ-0000j1-F0
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:02:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWJO-0006HP-MB
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644825738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=paZPg5mrfwCdIur7MNOA/9h999yP2PvKkBwcZKQOyho=;
 b=UHj9+HsUWmBNngrY2UU0749sz3oZXrLlQH0WH2bb8x15ZUMKnCy+/rD4t0Zn6+Uqaqgwr6
 NyYoaeQNUJsRSn1LAFtNPvAZapjANswp/qHMd117Z68XOHR2ir0/lLXDgIppkYuYY3RuYD
 sncuomNOIwfaX8xy4k7jaKtrhYVV7Qk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-ZUvqWhjRM4OpXBzW_fuxYQ-1; Mon, 14 Feb 2022 03:02:16 -0500
X-MC-Unique: ZUvqWhjRM4OpXBzW_fuxYQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 d5-20020a623605000000b004e01ccd08abso11201249pfa.10
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 00:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=paZPg5mrfwCdIur7MNOA/9h999yP2PvKkBwcZKQOyho=;
 b=pZ9stohleqNbyGzljMFOhzetipPPi8cpedmsREu1nWhB3eOc9xHaCZCJzfqpL+B+vB
 BEDTi5KHiWmzYr980FiEbFW49QE23H7DaC4frg1TmfBtWpIM83f7rGtnwk2XHN2JjU0V
 Q4F8Q+UM2heLDQSRtNbrAk62J+zaAaYoRm4GTZ9t5QlFvQql8GkpG/W7RyLaxV7f35jc
 otjUEC1BeOQUVVCArelhPAC5QCXSh3AwsMuRqVona81koT94bi7lZK1iIFHgej0DveZE
 JSCGFJGMPu01bJnbkduh+w71ZzLPj/TLTxt21lQ47y1Qp2FBzEhYk0bRdOiSGI3oDtaq
 Bvcw==
X-Gm-Message-State: AOAM530z7i2SgZvZK9d7hWNKSZqHBp3DpOgB/qF53SIvK8mqjvQLhp6Y
 H3/PPm6CqjslV3O8xpeNtArKV97DSaG+6XMCvfXuRNM2ijqcSJ0chVFqfe9q+m7g94P2R8rQJp1
 jv9lzL3ChuNY0aHY=
X-Received: by 2002:a05:6a00:134b:: with SMTP id
 k11mr13380786pfu.33.1644825735326; 
 Mon, 14 Feb 2022 00:02:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweT/J0fF0hhqQ3FfucpRhyvAW9XMa70zsgCR4Yhq223rxpcegHRMlnw2q4vGSzV7vtk0D5Zw==
X-Received: by 2002:a05:6a00:134b:: with SMTP id
 k11mr13380764pfu.33.1644825735082; 
 Mon, 14 Feb 2022 00:02:15 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id l22sm36959894pfc.191.2022.02.14.00.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:02:14 -0800 (PST)
Date: Mon, 14 Feb 2022 16:02:07 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v14 5/7] accel/kvm/kvm-all: Introduce kvm_dirty_ring_size
 function
Message-ID: <YgoMf7Z6pum3ysgX@xz-m1.local>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <c941eaaef19350366e5d7dc41c445b6f97503b1a.1644509582.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <c941eaaef19350366e5d7dc41c445b6f97503b1a.1644509582.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 12:17:39AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce kvm_dirty_ring_size util function to help calculate
> dirty ring ful time.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


