Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A257A9BD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 00:21:18 +0200 (CEST)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDvae-0004Yv-Va
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 18:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDvZ4-0002bH-HU
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 18:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oDvZ0-0000mH-0Z
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 18:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658269172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vY8Pg2p+vSLGzwB1gM0vXP96XurMqu54BurhPd5ytIk=;
 b=S1jki3wRFEOjBTEsmVZQM16oFMWZGxM2vCl/GLD0Wem2fGHrHR5X/UbVdfV7No0JFOLRST
 qlUuKBtk9niAJwPyxpRllTCsUig4/wAydrn1Uuv+4C1j5KvVc5w2E+SFfN1vk0Uy+OMBxQ
 YRPsHIVwmXp0RY70nSn4PfFy2JItrf0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-1iGPg2GOMl2zZXCtN80n8A-1; Tue, 19 Jul 2022 18:19:30 -0400
X-MC-Unique: 1iGPg2GOMl2zZXCtN80n8A-1
Received: by mail-qk1-f200.google.com with SMTP id
 f20-20020a05620a409400b006b5fc740485so2861638qko.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 15:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vY8Pg2p+vSLGzwB1gM0vXP96XurMqu54BurhPd5ytIk=;
 b=wXPXGaZR5qqFItIfif/0TY5aBb3ZZtGkPqavTKVf/mA9gQ/BPGzJgqZR2b8kHZN5zj
 J1bspHBuelBuqQMreBMPpqAa6HTzgDuEI4/gW/qTZo6+zCSvCR8c0/VJxbYB7ncURPlX
 L52jTZY9y4OvAblEQC2WmWhZzh22JcjknOINLXIggg3C2R4zfG0ibkr6sTbIgop4C/GC
 bfSXUw6SqhyWbls6ocXzuqkgNQH7rnltSsXoQhULwha2y46PA6+J+DWvrToskU807C5X
 Ba/aglk9lLE9QkdCvrp6c84VRFNeHxqMIqFlOdfLdjFn2IIGXAZy61jcBBWaeKnKpcrD
 ijGg==
X-Gm-Message-State: AJIora/RzYRmHXDUe/Aw+7RYkUm+8piI/jEjhLB258viRppiZUSLbuAj
 4Qg2nrUuAbJMSroVNhgESKJLGCaM2YGSHvhlqjDO8N0HST+3zMzcQXnaBWXd0P5bxzemo7P+rM6
 Rfti/BixMcr8QYSg=
X-Received: by 2002:a05:622a:48d:b0:31e:f1a8:61dc with SMTP id
 p13-20020a05622a048d00b0031ef1a861dcmr8271701qtx.129.1658269169927; 
 Tue, 19 Jul 2022 15:19:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfbAxlbYVUXu/e85G3tqKCQzl59+YhEavQRq45b9DoBtxft1+Djn0Ks51yCCo5Kc2g5kHHqg==
X-Received: by 2002:a05:622a:48d:b0:31e:f1a8:61dc with SMTP id
 p13-20020a05622a048d00b0031ef1a861dcmr8271683qtx.129.1658269169640; 
 Tue, 19 Jul 2022 15:19:29 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
 by smtp.gmail.com with ESMTPSA id
 cp4-20020a05622a420400b0031eb393aa45sm11076507qtb.40.2022.07.19.15.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 15:19:28 -0700 (PDT)
Date: Tue, 19 Jul 2022 18:19:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, iii@linux.ibm.com, huangy81@chinatelecom.cn
Subject: Re: [PULL 00/29] migration queue
Message-ID: <Ytct7/TArSHT5va3@xz-m1.local>
References: <20220719170221.576190-1-dgilbert@redhat.com>
 <CAFEAcA_+UkfoetuMeQLGGhg_7_6=rdT3O+z0M8bE0=2Zt-j-TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MzywXlfogyyKrF7l"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_+UkfoetuMeQLGGhg_7_6=rdT3O+z0M8bE0=2Zt-j-TQ@mail.gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MzywXlfogyyKrF7l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 19, 2022 at 10:53:33PM +0100, Peter Maydell wrote:
> On Tue, 19 Jul 2022 at 18:16, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit da7da9d5e608200ecc0749ff37be246e9cd3314f:
> >
> >   Merge tag 'pull-request-2022-07-19' of https://gitlab.com/thuth/qemu into staging (2022-07-19 13:05:06 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220719c
> >
> > for you to fetch changes up to ec0345c1000b3a57b557da4c2e3f2114dd23903a:
> >
> >   migration: Avoid false-positive on non-supported scenarios for zero-copy-send (2022-07-19 17:33:22 +0100)
> >
> > ----------------------------------------------------------------
> > Migration pull 2022-07-19
> >
> >   Hyman's dirty page rate limit set
> >   Ilya's fix for zlib vs migration
> >   Peter's postcopy-preempt
> >   Cleanup from Dan
> >   zero-copy tidy ups from Leo
> >   multifd doc fix from Juan
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > ----------------------------------------------------------------
> 
> Fails to build on some configs, eg:
> https://gitlab.com/qemu-project/qemu/-/jobs/2743059797
> https://gitlab.com/qemu-project/qemu/-/jobs/2743059743
> 
> ../tests/qtest/migration-test.c: In function 'test_postcopy_preempt_tls_psk':
> ../tests/qtest/migration-test.c:1168:23: error:
> 'test_migrate_tls_psk_start_match' undeclared (first use in this
> function)
> 1168 | .start_hook = test_migrate_tls_psk_start_match,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1168:23: note: each undeclared
> identifier is reported only once for each function it appears in
> ../tests/qtest/migration-test.c:1169:24: error:
> 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> 1169 | .finish_hook = test_migrate_tls_psk_finish,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c: In function 'test_postcopy_recovery_tls_psk':
> ../tests/qtest/migration-test.c:1247:23: error:
> 'test_migrate_tls_psk_start_match' undeclared (first use in this
> function)
> 1247 | .start_hook = test_migrate_tls_psk_start_match,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1248:24: error:
> 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> 1248 | .finish_hook = test_migrate_tls_psk_finish,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c: In function 'test_postcopy_preempt_all':
> ../tests/qtest/migration-test.c:1268:23: error:
> 'test_migrate_tls_psk_start_match' undeclared (first use in this
> function)
> 1268 | .start_hook = test_migrate_tls_psk_start_match,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1269:24: error:
> 'test_migrate_tls_psk_finish' undeclared (first use in this function)
> 1269 | .finish_hook = test_migrate_tls_psk_finish,
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> At top level:
> ../tests/qtest/migration-test.c:1264:13: error:
> 'test_postcopy_preempt_all' defined but not used
> [-Werror=unused-function]
> 1264 | static void test_postcopy_preempt_all(void)
> | ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1244:13: error:
> 'test_postcopy_recovery_tls_psk' defined but not used
> [-Werror=unused-function]
> 1244 | static void test_postcopy_recovery_tls_psk(void)
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../tests/qtest/migration-test.c:1164:13: error:
> 'test_postcopy_preempt_tls_psk' defined but not used
> [-Werror=unused-function]
> 1164 | static void test_postcopy_preempt_tls_psk(void)
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sorry my fault.  We'll need to fix the 3 test patches one by one to use "#ifdef
CONFIG_GNUTLS" properly for those functions..

I've attached the three small fixups, Peter/Dave, let me know what's the
best way to redo this.

Thanks,

-- 
Peter Xu

--MzywXlfogyyKrF7l
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-fixup-tests-Add-postcopy-tls-migration-test.patch"

From 7d361c8d61a51ed0df9e1606c3a6f8c306028181 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 19 Jul 2022 18:16:40 -0400
Subject: [PATCH 1/3] fixup! tests: Add postcopy tls migration test
Content-type: text/plain

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 81780189a8..87dc87ba8b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1133,6 +1133,7 @@ static void test_postcopy(void)
     test_postcopy_common(&args);
 }
 
+#ifdef CONFIG_GNUTLS
 static void test_postcopy_tls_psk(void)
 {
     MigrateCommon args = {
@@ -1142,6 +1143,7 @@ static void test_postcopy_tls_psk(void)
 
     test_postcopy_common(&args);
 }
+#endif
 
 static void test_postcopy_preempt(void)
 {
-- 
2.32.0


--MzywXlfogyyKrF7l
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0002-fixup-tests-Add-postcopy-preempt-tests.patch"

From c76945ab7b9a38456f077267ccb51133ef087e35 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 19 Jul 2022 18:16:57 -0400
Subject: [PATCH 2/3] fixup! tests: Add postcopy preempt tests
Content-type: text/plain

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 87dc87ba8b..490ee71b75 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1154,6 +1154,7 @@ static void test_postcopy_preempt(void)
     test_postcopy_common(&args);
 }
 
+#ifdef CONFIG_GNUTLS
 static void test_postcopy_preempt_tls_psk(void)
 {
     MigrateCommon args = {
@@ -1164,6 +1165,7 @@ static void test_postcopy_preempt_tls_psk(void)
 
     test_postcopy_common(&args);
 }
+#endif
 
 static void test_postcopy_recovery_common(MigrateCommon *args)
 {
@@ -1253,6 +1255,7 @@ static void test_postcopy_preempt_recovery(void)
     test_postcopy_recovery_common(&args);
 }
 
+#ifdef CONFIG_GNUTLS
 /* This contains preempt+recovery+tls test altogether */
 static void test_postcopy_preempt_all(void)
 {
@@ -1264,6 +1267,7 @@ static void test_postcopy_preempt_all(void)
 
     test_postcopy_recovery_common(&args);
 }
+#endif
 
 static void test_baddest(void)
 {
-- 
2.32.0


--MzywXlfogyyKrF7l
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0003-fixup-tests-Add-postcopy-tls-recovery-migration-test.patch"

From 3f6e48d9cd915378284fe897ddab19112c097f1f Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 19 Jul 2022 18:17:05 -0400
Subject: [PATCH 3/3] fixup! tests: Add postcopy tls recovery migration test
Content-type: text/plain

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 490ee71b75..b0843d35d4 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1236,6 +1236,7 @@ static void test_postcopy_recovery(void)
     test_postcopy_recovery_common(&args);
 }
 
+#ifdef CONFIG_GNUTLS
 static void test_postcopy_recovery_tls_psk(void)
 {
     MigrateCommon args = {
@@ -1245,6 +1246,7 @@ static void test_postcopy_recovery_tls_psk(void)
 
     test_postcopy_recovery_common(&args);
 }
+#endif
 
 static void test_postcopy_preempt_recovery(void)
 {
-- 
2.32.0


--MzywXlfogyyKrF7l--


