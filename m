Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD24D57E3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 03:05:21 +0100 (CET)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSUed-0001pM-Qm
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 21:05:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUY8-0007yx-13
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nSUY5-0006Pk-PE
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646963912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2nRRRFHwKDvR8XUW+GAIhMOfTyvuNDRKVlvWBH0N+w=;
 b=G9Ypno/wGaLuOedE+IrDHKCdSxSW7cioTIcjWmmhZN48obECoqw/OoOCwluUu2V23n/RSu
 NIHQhnsQdTnyET4m4c7WoKowy79WgLTCSOrE6LprIIq78XKKADYIY8pPt/926aZgi1dU1L
 j9i0Ap/hqodGIUA0PpC7bghV7FzjyGI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-lAjZjenPPaK604uoQJn_tQ-1; Thu, 10 Mar 2022 20:58:31 -0500
X-MC-Unique: lAjZjenPPaK604uoQJn_tQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 r64-20020a17090a43c600b001bf8e05847eso6288742pjg.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u2nRRRFHwKDvR8XUW+GAIhMOfTyvuNDRKVlvWBH0N+w=;
 b=N/BEi1kI27uIiLmJUW1pOYfl2FmjhezJPEE7+bq3Tk5b/yUN8npnVmBj9KcV72DRzR
 K5UPoho+5JAubf+VvL29+QKL4e89ZZ/9oo5mie1ty6KWE7KjcD9wgqEa1VC6HyYIABw4
 OfnkQVkatfCqVA2uuLGRzSzw5oZP2KPF+S2qE0SI2Ct2hCfAN85k59NzuydWo0GsUoU9
 f8+6RpB5xVgD0trDOjB1qysRCTPhtyRQIB5W2XiwSL680QQ8Agy4hfZ8SVfC5oUpcgo6
 pTcOQPOxRBvYiF5xNqBQFq8LPm7zj8n0FOFWt6/jCEWr6vpKf13yeBv+Ah5ZXrH/2jvU
 Wr2g==
X-Gm-Message-State: AOAM530jBipvESm8bGyyA6LYH37hKISXZh0/V8bm6yb8vcBeEOmx1Ahb
 BMMy5z62nI4mDQAJJLROyaxScKLe0VosWmWzrEDSs/zwN3pKg6BLavPaPhPdtGzewhslxF+PHIl
 7voKzPhss2at7t8k=
X-Received: by 2002:a17:903:2349:b0:153:9b5:c468 with SMTP id
 c9-20020a170903234900b0015309b5c468mr8117672plh.163.1646963910255; 
 Thu, 10 Mar 2022 17:58:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSe1ztufq7kC10nmeYiels9Id3PiYoBtLu83y9LQ+bF1FXxSyvgxW7XpzC7jvPY4WrMHqx2Q==
X-Received: by 2002:a17:903:2349:b0:153:9b5:c468 with SMTP id
 c9-20020a170903234900b0015309b5c468mr8117656plh.163.1646963909962; 
 Thu, 10 Mar 2022 17:58:29 -0800 (PST)
Received: from xz-m1.local ([191.101.132.227])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm8496828pfu.82.2022.03.10.17.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:58:29 -0800 (PST)
Date: Fri, 11 Mar 2022 09:58:24 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 00/18] tests: introduce testing coverage for TLS with
 migration
Message-ID: <YiqswPa/VV/lY6yN@xz-m1.local>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 05:18:03PM +0000, Daniel P. Berrangé wrote:
> This significantly expands the migration test suite to cover testing
> with TLS over TCP and UNIX sockets, with both PSK (pre shared keys)
> and x509 credentials, and for both single and multifd scenarios.
> 
> It identified one bug in handling PSK credentials with UNIX sockets,
> but other than that everything was operating as expected.
> 
> To minimize the impact on code duplication alopt of refactoring is
> done of the migration tests to introduce a common helper for running
> the migration process. The various tests mostly just have to provide
> a callback to set a few parameters/capabilities before migration
> starts, and sometimes a callback to cleanup or validate after
> completion/failure.
> 
> There is one functional bugfix in patch 6, I would like to see
> in 7.0. The rest is all test suite additions, and I don't mind
> if they are in 7.0 or 7.1

At least patch 1-4, 6-10 look already good candidates for 7.0, imho, if not
all..

Thanks for doing this, Daniel.

-- 
Peter Xu


