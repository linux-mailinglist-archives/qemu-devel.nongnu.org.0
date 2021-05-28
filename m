Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F923947DA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 22:18:02 +0200 (CEST)
Received: from localhost ([::1]:41104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmivh-0006tk-Cv
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 16:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lmiuI-0005YS-K5; Fri, 28 May 2021 16:16:34 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:39845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lmiuG-0001FG-KU; Fri, 28 May 2021 16:16:34 -0400
Received: by mail-qv1-xf31.google.com with SMTP id eb9so2547666qvb.6;
 Fri, 28 May 2021 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZVw5vhNfuvBosHfnI9zo+zyK29KWfnqHEHiFcj2necM=;
 b=XTmT2w3K0oQKLabKEJsEYH7zbm/7UBsbCNjXyFBCieircRqLBcKXsNb7QpSv16/FXd
 atV/9JZbe3KNwepvCMX2un86qfxZS1K4z3zFUmbU9Yd2SoRFJ3pCbSoGqO1gNMax7nmi
 ETwvSt43nOwvhc2LAz8VkLInda3WoqjwCTIrtn9JeOsDNRO7VAbxrdMttDVOnVRel6hu
 ifBULfViqjy3cU79zDmbnEp0U6pVgR9Kpavipo9ra2HOY2EQvMpKgMDtKK/GY98gdXkQ
 UB1TOyKCENrvYQ5O65empBKlBf/lTP0Sjx/q2zT0PJaBnFSZibnyUStBw6yXSOVsODyX
 YztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZVw5vhNfuvBosHfnI9zo+zyK29KWfnqHEHiFcj2necM=;
 b=J0rwh9ZYFMKV0unwrCm1lZxTdIg+w0W864B5vSKcKLcMf7VgoLOrgkojB3BY+SyX0C
 rs7VaHbSGXQL5AAXRGHs7by8DJtUHp8M9/YjayARpr34mME5ViymtEvaKSPCP7WY3c+X
 mybb6G7rA80eVjagiul3gMvoqHMO60h7NYOva/e27cJj8MyAN06g3YKmbh212Jyd/E7b
 JQInQfVmsiBjAQ89V3uWMjf0PVjXEoHAHfmtzCuL6siVVOLPecTMwgKiPcm9iH/pYwuE
 i2j4opL7jBzIfar61zWHQGo8ZgvcS4b/sCIVfwpyzI2sR0moJicZ/+8ztUW4LaxuNSBw
 B31w==
X-Gm-Message-State: AOAM531ufGvY01EpUfsq5r2+kcRSHNnnPEBR34iNA9vpzR9wOqaWrfJ3
 bxHHjJeBz8S/HoHx95sgD7Pa68ZR9es=
X-Google-Smtp-Source: ABdhPJwaFtn6K4cVg1qMH839Fl92cKE1dQuc6DKsWm81DQxRcGbo7rw4jBr9I+6HmSsEK8dABUNLiw==
X-Received: by 2002:a05:6214:9d2:: with SMTP id
 dp18mr5741230qvb.16.1622232990255; 
 Fri, 28 May 2021 13:16:30 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.29.194])
 by smtp.gmail.com with ESMTPSA id l10sm4163313qtn.28.2021.05.28.13.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 13:16:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] ppc/pef.c: initialize cgs->ready in kvmppc_svm_init()
Date: Fri, 28 May 2021 17:16:19 -0300
Message-Id: <20210528201619.52363-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: linuxram@us.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU is failing to launch a CGS pSeries guest in a host that has PEF
support:

qemu-system-ppc64: ../softmmu/vl.c:2585: qemu_machine_creation_done: Assertion `machine->cgs->ready' failed.
Aborted

This is happening because we're not setting the cgs->ready flag that is
asserted in qemu_machine_creation_done() during machine start.

cgs->ready is set in s390_pv_kvm_init() and sev_kvm_init(). Let's set it
in kvmppc_svm_init() as well.

Reported-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pef.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
index 573be3ed79..cc44d5e339 100644
--- a/hw/ppc/pef.c
+++ b/hw/ppc/pef.c
@@ -41,7 +41,7 @@ struct PefGuest {
     ConfidentialGuestSupport parent_obj;
 };
 
-static int kvmppc_svm_init(Error **errp)
+static int kvmppc_svm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
 #ifdef CONFIG_KVM
     static Error *pef_mig_blocker;
@@ -65,6 +65,8 @@ static int kvmppc_svm_init(Error **errp)
     /* NB: This can fail if --only-migratable is used */
     migrate_add_blocker(pef_mig_blocker, &error_fatal);
 
+    cgs->ready = true;
+
     return 0;
 #else
     g_assert_not_reached();
@@ -102,7 +104,7 @@ int pef_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         return -1;
     }
 
-    return kvmppc_svm_init(errp);
+    return kvmppc_svm_init(cgs, errp);
 }
 
 int pef_kvm_reset(ConfidentialGuestSupport *cgs, Error **errp)
-- 
2.31.1


