Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E184C8336
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 06:36:18 +0100 (CET)
Received: from localhost ([::1]:48020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOvBI-0005WG-Us
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 00:36:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOvA2-0004hC-OE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 00:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOv9z-00087A-Hv
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 00:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646112894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qf9lEJhrxTYpuMD1CcLIOpCTER4JVFj/xpDnPkwHZoY=;
 b=iZohwX9uINy/IlRg+HJUPqRSZYfvv2WoYo4q4T69UJ8L6Stp+f9+VIAP/6EoJCCIooXT6I
 5EoxmgKPKh/6MahpOj04bY3I4m1Ptj/TufqFs+A06sl5rIBjLZyICJepdjd9gA4fTgY1/X
 80/CDRVN17gvIiK81RQM7pAx94fC9JU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-sqeVOj2_NNuuWDZtuCyftw-1; Tue, 01 Mar 2022 00:34:53 -0500
X-MC-Unique: sqeVOj2_NNuuWDZtuCyftw-1
Received: by mail-pg1-f199.google.com with SMTP id
 n188-20020a6340c5000000b003747606cb0dso7897546pga.6
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 21:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qf9lEJhrxTYpuMD1CcLIOpCTER4JVFj/xpDnPkwHZoY=;
 b=MY19ZZuwpuRwtIMRXJJAALGxpSrvcVWQxvCIcjTGWxdLNX/fj7BvmtVS6VHkggpzCC
 0q33nChAKfBT8Vzw4AouNDaJFEQLelvgZ4tJe8ByPZvkUxfz0DYU68uHa2Sf8JBFsPvU
 7rGlYc0f2hrfrUn3JMjOEF9XxjY5ZTH3Gkf1LZW/w6SYsIkDhMItvXQfuX6D6YErSW/l
 SfxSDhtgT3Gp83XoalZmnqM1N0MKEJ3365vECJbVt8N4nUfQu3NYUpu2V2vSTVJIn29z
 KAugNOicqrl03fQ6eWcpDBcKfdGtgIDakMktUEbNDeB5+mBi11EoFKVD7OzhFZG7g7oQ
 UzcA==
X-Gm-Message-State: AOAM533AcWeVnm5VuxyAuliCdcx4ZnBq/hA0ej0+lD+/YouPRxPETbM3
 cFDU1WusJs/n7Yovwqfj+pA0Iz5aOdsd8SwevhBQGm8jM7LajP5QeOYjFECex9ndxv3YXmh/9tr
 shBJUQZpxa6e7en4=
X-Received: by 2002:a17:902:d643:b0:151:6f2c:cfb4 with SMTP id
 y3-20020a170902d64300b001516f2ccfb4mr6345083plh.120.1646112891736; 
 Mon, 28 Feb 2022 21:34:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzg20W+n8v2M70HQOJKIZBQX/BaabN3Wg0rMVacSGkw/7DUuWY1hK16FTzl6custkvudKg2ZQ==
X-Received: by 2002:a17:902:d643:b0:151:6f2c:cfb4 with SMTP id
 y3-20020a170902d64300b001516f2ccfb4mr6345071plh.120.1646112891387; 
 Mon, 28 Feb 2022 21:34:51 -0800 (PST)
Received: from xz-m1.local ([94.177.118.144]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090a859100b001bc20ddcc67sm935455pjn.34.2022.02.28.21.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 21:34:50 -0800 (PST)
Date: Tue, 1 Mar 2022 13:34:46 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 20/20] tests: Add postcopy preempt test
Message-ID: <Yh2wdswUis7TSspK@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-21-peterx@redhat.com>
 <YhTcb9o1d1gCQ3rm@work-vm> <YhXnQLY4/b3V2+VL@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YhXnQLY4/b3V2+VL@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Feb 23, 2022 at 03:50:24PM +0800, Peter Xu wrote:
> On Tue, Feb 22, 2022 at 12:51:59PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > Two tests are added: a normal postcopy preempt test, and a recovery test.
> > 
> > Yes, this is difficult; without hugepages the tests are limited; did you
> > see if this test actually causes pages to go down the fast path?
> 
> I didn't observe the test case explicitly, but I did observe in my own test
> that I ran that it goes with the fast path, or I can't get a huge speed up.
> 
> Meanwhile my own test is only using 2M huge pages, and I can observe
> interruptions of huge page sendings frequently.
> 
> But yeah let me try to capture something in this test too, at least to make
> sure the standalone socket is being used.  Covering of huge pages might be
> doable but obviously requires host privileges, so I'll leave that for later.

When I tried to observe the test case today, I found that the preempt new
tests are all running with the new channels, however funnily I found the
original vanilla test is using it too!

Looked into it, that's because the MigrateStart* pointer is freed in
test_migrate_start() but the test referenced it after that... so it's a
use-after-free bug in the test code.  I need to squash this:

---8<---
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 5053b40589..09a9ce4401 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -664,6 +664,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     MigrateStart *args)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    /* NOTE: args will be freed in test_migrate_start(), cache it */
+    bool postcopy_preempt = args->postcopy_preempt;
     QTestState *from, *to;
 
     if (test_migrate_start(&from, &to, uri, args)) {
@@ -674,7 +676,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
 
-    if (args->postcopy_preempt) {
+    if (postcopy_preempt) {
         migrate_set_capability(from, "postcopy-preempt", true);
         migrate_set_capability(to, "postcopy-preempt", true);
     }
---8<---

That's tricky, and we could have done something better.. E.g., we could
pass in the MigrateStart** into test_migrate_start() so it can clear it
when free, that's not silent use-after-free but crashing, which is better
in this case.

I feel lucky I tried..

-- 
Peter Xu


