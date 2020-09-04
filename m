Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D168F25D004
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 05:52:54 +0200 (CEST)
Received: from localhost ([::1]:50270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2mT-0002cH-RW
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 23:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hR-0002Kl-Hh; Thu, 03 Sep 2020 23:47:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47491 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hN-0004sN-Hs; Thu, 03 Sep 2020 23:47:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsn4MgBz9sVM; Fri,  4 Sep 2020 13:47:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191245;
 bh=PGXTjEP4QoRFOn/jGOws1ISctNffp+geWnV5qJ570xc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UP+Gogc7opNRRmhgXP3/uKpRTOGoeK13yg9005SoppcNiM3y7t23j68JvIskW6b9c
 0vqAvDOEz8cdr8WtHkYhVowRtChJRkcbqpE9FqgvUdqvU8VvdJWJ2to9B3dG4OV0Jo
 cRqtuvCjqlrU3Prcde3gXW0xTy8lc4mqyQ/uQ1Nc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/30] spapr: Remove unnecessary DRC type-checker macros
Date: Fri,  4 Sep 2020 13:46:52 +1000
Message-Id: <20200904034719.673626-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904034719.673626-1-david@gibson.dropbear.id.au>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 23:47:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_drc.h includes typechecker macro boilerplate for the many different
DRC subclasses.  However, most of these types don't actually have different
data in their class and/or instance, making these unneeded, unused, and in
fact a bad idea.  Remove them.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_drc.h | 43 +-------------------------------------
 1 file changed, 1 insertion(+), 42 deletions(-)

diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 21af8deac1..f270860769 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -29,62 +29,21 @@
                                              TYPE_SPAPR_DR_CONNECTOR)
 
 #define TYPE_SPAPR_DRC_PHYSICAL "spapr-drc-physical"
-#define SPAPR_DRC_PHYSICAL_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PHYSICAL)
-#define SPAPR_DRC_PHYSICAL_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, \
-                           TYPE_SPAPR_DRC_PHYSICAL)
 #define SPAPR_DRC_PHYSICAL(obj) OBJECT_CHECK(SpaprDrcPhysical, (obj), \
                                              TYPE_SPAPR_DRC_PHYSICAL)
 
 #define TYPE_SPAPR_DRC_LOGICAL "spapr-drc-logical"
-#define SPAPR_DRC_LOGICAL_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_LOGICAL)
-#define SPAPR_DRC_LOGICAL_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, \
-                           TYPE_SPAPR_DRC_LOGICAL)
-#define SPAPR_DRC_LOGICAL(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                             TYPE_SPAPR_DRC_LOGICAL)
 
 #define TYPE_SPAPR_DRC_CPU "spapr-drc-cpu"
-#define SPAPR_DRC_CPU_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_CPU)
-#define SPAPR_DRC_CPU_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_CPU)
-#define SPAPR_DRC_CPU(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                        TYPE_SPAPR_DRC_CPU)
 
 #define TYPE_SPAPR_DRC_PCI "spapr-drc-pci"
-#define SPAPR_DRC_PCI_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PCI)
-#define SPAPR_DRC_PCI_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_PCI)
-#define SPAPR_DRC_PCI(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                        TYPE_SPAPR_DRC_PCI)
 
 #define TYPE_SPAPR_DRC_LMB "spapr-drc-lmb"
-#define SPAPR_DRC_LMB_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_LMB)
-#define SPAPR_DRC_LMB_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_LMB)
-#define SPAPR_DRC_LMB(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                        TYPE_SPAPR_DRC_LMB)
 
 #define TYPE_SPAPR_DRC_PHB "spapr-drc-phb"
-#define SPAPR_DRC_PHB_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PHB)
-#define SPAPR_DRC_PHB_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_PHB)
-#define SPAPR_DRC_PHB(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                        TYPE_SPAPR_DRC_PHB)
 
 #define TYPE_SPAPR_DRC_PMEM "spapr-drc-pmem"
-#define SPAPR_DRC_PMEM_GET_CLASS(obj) \
-        OBJECT_GET_CLASS(SpaprDrcClass, obj, TYPE_SPAPR_DRC_PMEM)
-#define SPAPR_DRC_PMEM_CLASS(klass) \
-        OBJECT_CLASS_CHECK(SpaprDrcClass, klass, TYPE_SPAPR_DRC_PMEM)
-#define SPAPR_DRC_PMEM(obj) OBJECT_CHECK(SpaprDrc, (obj), \
-                                         TYPE_SPAPR_DRC_PMEM)
+
 /*
  * Various hotplug types managed by SpaprDrc
  *
-- 
2.26.2


