Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650754C9117
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 18:06:50 +0100 (CET)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP5xY-0003Fi-W7
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 12:06:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nP5rO-0006a8-IE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nP5rK-0001ig-V1
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646154021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Q4QBEJECmtLzlyWi3/qhdZ8KXxiFCidZ+HF/oWuP/M=;
 b=ey90n3aQcp9ieLoOCw3aIs03KznESeB5Q+Z2XYXNVxZOrF2omBHWJyYgT1apjrdtfJkH3u
 vFLWUD7GMu/jC3Z14YHzNsX1rPeOHShFODnTajp+lB+FYituKsPDBRjvKR/rCSk8sND9yb
 +vJJtFxa/m1u4A4kIZ6JQOK4NEc6jPo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-Zal8cMASMNubYOeBPm3qUQ-1; Tue, 01 Mar 2022 12:00:20 -0500
X-MC-Unique: Zal8cMASMNubYOeBPm3qUQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f9-20020a5d58e9000000b001f0247e5e96so214591wrd.15
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 09:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Q4QBEJECmtLzlyWi3/qhdZ8KXxiFCidZ+HF/oWuP/M=;
 b=AuVckYVKYdLsam8Xgji02h4Ec33LQJqumrz9XV4Q3guAX6yqg/32klwDoV3b9VdRrs
 AMkXnblTFg8JE7k9Z5YYEpqJqWV7yw3ZFODjicFIUH6ymvCuMVuEWyfniw5ikwpJ60d8
 wiEof5Ei475Tap9LAP5v7p59wSsyCyCFhXRVSkebAkokZfplIMcSZovc4CYX22ESY++M
 Q3SrBUW3iy3YW2zgxsP995SAGKkoG8ymtla974qq4v4wetHIKhRU5K6NhqIIxRoNWQLd
 9IUHaQh034rA2AKwxzZo5Db9gEQMjefhRBm7kJVyz0uxjnWgrCrPCnecpxvY2FCMyiXc
 RyOQ==
X-Gm-Message-State: AOAM533aeNfq7yLvX4FEDAPUGXEcG/73vrxbeXhZdrfsxyHY0NvTQtep
 Jcr5Fu31IZcCifQsiUuzdMQZ1FhM5xB+GbaSz1ymUTOp5K8gm0O6pAVzf5tKzIok0e2vtpvqllI
 32RW0b9l563BzSPQ=
X-Received: by 2002:a5d:6d87:0:b0:1ef:fbb2:6f66 with SMTP id
 l7-20020a5d6d87000000b001effbb26f66mr4967540wrs.630.1646154018899; 
 Tue, 01 Mar 2022 09:00:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxW52hDbF7L+2CBMmbZE5gpkwPYCC/W6zBbm4/tRV/v1QOIXMhTKHbHWleKN80F62wuIG25Uw==
X-Received: by 2002:a5d:6d87:0:b0:1ef:fbb2:6f66 with SMTP id
 l7-20020a5d6d87000000b001effbb26f66mr4967521wrs.630.1646154018670; 
 Tue, 01 Mar 2022 09:00:18 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b00381753c67a8sm3406422wmq.26.2022.03.01.09.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 09:00:17 -0800 (PST)
Date: Tue, 1 Mar 2022 17:00:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 20/20] tests: Add postcopy preempt test
Message-ID: <Yh5RHyQ9Oy8zZki1@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-21-peterx@redhat.com>
 <YhTcb9o1d1gCQ3rm@work-vm> <YhXnQLY4/b3V2+VL@xz-m1.local>
 <Yh2wdswUis7TSspK@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <Yh2wdswUis7TSspK@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Feb 23, 2022 at 03:50:24PM +0800, Peter Xu wrote:
> > On Tue, Feb 22, 2022 at 12:51:59PM +0000, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > Two tests are added: a normal postcopy preempt test, and a recovery test.
> > > 
> > > Yes, this is difficult; without hugepages the tests are limited; did you
> > > see if this test actually causes pages to go down the fast path?
> > 
> > I didn't observe the test case explicitly, but I did observe in my own test
> > that I ran that it goes with the fast path, or I can't get a huge speed up.
> > 
> > Meanwhile my own test is only using 2M huge pages, and I can observe
> > interruptions of huge page sendings frequently.
> > 
> > But yeah let me try to capture something in this test too, at least to make
> > sure the standalone socket is being used.  Covering of huge pages might be
> > doable but obviously requires host privileges, so I'll leave that for later.
> 
> When I tried to observe the test case today, I found that the preempt new
> tests are all running with the new channels, however funnily I found the
> original vanilla test is using it too!
> 
> Looked into it, that's because the MigrateStart* pointer is freed in
> test_migrate_start() but the test referenced it after that... so it's a
> use-after-free bug in the test code.  I need to squash this:
> 
> ---8<---
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 5053b40589..09a9ce4401 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -664,6 +664,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>                                      MigrateStart *args)
>  {
>      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> +    /* NOTE: args will be freed in test_migrate_start(), cache it */
> +    bool postcopy_preempt = args->postcopy_preempt;
>      QTestState *from, *to;
>  
>      if (test_migrate_start(&from, &to, uri, args)) {
> @@ -674,7 +676,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      migrate_set_capability(to, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-blocktime", true);
>  
> -    if (args->postcopy_preempt) {
> +    if (postcopy_preempt) {
>          migrate_set_capability(from, "postcopy-preempt", true);
>          migrate_set_capability(to, "postcopy-preempt", true);
>      }
> ---8<---

Ah OK, yes I guess that's needed.

> That's tricky, and we could have done something better.. E.g., we could
> pass in the MigrateStart** into test_migrate_start() so it can clear it
> when free, that's not silent use-after-free but crashing, which is better
> in this case.
> 
> I feel lucky I tried..

It could at least do with a comment on test_migrate_start?

Dave

> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


