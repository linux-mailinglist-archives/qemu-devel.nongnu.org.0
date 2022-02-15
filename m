Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15D04B7A42
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:12:20 +0100 (CET)
Received: from localhost ([::1]:42034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK63X-0006mb-Dr
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:12:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5b4-0004Ih-JO; Tue, 15 Feb 2022 16:42:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5b2-0002df-OI; Tue, 15 Feb 2022 16:42:54 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FKb2jT015767; 
 Tue, 15 Feb 2022 21:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3ObSAjygcz7I/k6iy1ZH1TGVrg5dk0iuspeeMzuySac=;
 b=LLqICbjfouo74Ici3ronEnBF5ZZrnndvO1G4Lir7lnPOb89gzCd5oi2Bl798/z616Ts9
 57V98GHI0Xh8xnq+p0nynwW+S3TvODK9sM8RSOdmTYBuDXpk4XjtBksYG8TXKUC4wVaU
 4525/tS0OMLexjwFJpGD/LrzazDlxaPqHpdU3zGapkh3jrgPg7/HiKZCLEt9PyIeMY9o
 xyM5NIQJHiFQCNxEbst2qwUmjhoat7PBKk87hVLAJ2y/8hDhVpIxFUOh0edN5rY56QkX
 qE55NNNiAJJXfIIxk4v/wMoGfS1V+2w/uD+3Bc6olhPkKPx/AqABnf+YFuKaEf6NPGTE /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8jn62g4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:47 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLg2YG005749;
 Tue, 15 Feb 2022 21:42:47 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8jn62g4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:47 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLg9rL010785;
 Tue, 15 Feb 2022 21:42:46 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3e64hb2r0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLgjSJ35848666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:45 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89074BE056;
 Tue, 15 Feb 2022 21:42:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D74D1BE054;
 Tue, 15 Feb 2022 21:42:43 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:43 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/27] target/ppc: cpu_init: Move SPR registration macros to a
 header
Date: Tue, 15 Feb 2022 18:41:46 -0300
Message-Id: <20220215214148.1848266-26-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3KI5Z3Jggsjs7ZwpbA1hItUK-AEIZVaO
X-Proofpoint-ORIG-GUID: Gq08y0ILM7uBN_xLG4FYvt_TgqIsO96p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150122
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put the SPR registration macros in a header that is accessible outside
of cpu_init.c. The following patches will move CPU-specific code to
separate files and will need to access it.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
The spr_tcg.h header has always been used for both TCG and KVM, due to
its usage in cpu_init.c, but maybe we should change it to spr_common.h
to avoid confusion?
---
 target/ppc/cpu_init.c | 65 ++++++-------------------------------------
 target/ppc/spr_tcg.h  | 56 +++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 56 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 74e26f60dd..3327ea15fd 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -67,35 +67,15 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
  * may be compiled out, and the system kvm header may not be available
  * for supplying the ID numbers.  This is ugly, but the best we can do.
  */
-
-#ifdef CONFIG_TCG
-# define USR_ARG(X)    X,
-# ifdef CONFIG_USER_ONLY
-#  define SYS_ARG(X)
-# else
-#  define SYS_ARG(X)   X,
-# endif
-#else
-# define USR_ARG(X)
-# define SYS_ARG(X)
-#endif
-#ifdef CONFIG_KVM
-# define KVM_ARG(X)    X,
-#else
-# define KVM_ARG(X)
-#endif
-
-typedef void spr_callback(DisasContext *, int, int);
-
-static void _spr_register(CPUPPCState *env, int num, const char *name,
-                          USR_ARG(spr_callback *uea_read)
-                          USR_ARG(spr_callback *uea_write)
-                          SYS_ARG(spr_callback *oea_read)
-                          SYS_ARG(spr_callback *oea_write)
-                          SYS_ARG(spr_callback *hea_read)
-                          SYS_ARG(spr_callback *hea_write)
-                          KVM_ARG(uint64_t one_reg_id)
-                          target_ulong initial_value)
+void _spr_register(CPUPPCState *env, int num, const char *name,
+                   USR_ARG(spr_callback *uea_read)
+                   USR_ARG(spr_callback *uea_write)
+                   SYS_ARG(spr_callback *oea_read)
+                   SYS_ARG(spr_callback *oea_write)
+                   SYS_ARG(spr_callback *hea_read)
+                   SYS_ARG(spr_callback *hea_write)
+                   KVM_ARG(uint64_t one_reg_id)
+                   target_ulong initial_value)
 {
     ppc_spr_t *spr = &env->spr_cb[num];
 
@@ -122,33 +102,6 @@ static void _spr_register(CPUPPCState *env, int num, const char *name,
 #endif
 }
 
-/* spr_register_kvm_hv passes all required arguments. */
-#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,             \
-                            oea_read, oea_write, hea_read, hea_write,        \
-                            one_reg_id, initial_value)                       \
-    _spr_register(env, num, name,                                            \
-                  USR_ARG(uea_read) USR_ARG(uea_write)                       \
-                  SYS_ARG(oea_read) SYS_ARG(oea_write)                       \
-                  SYS_ARG(hea_read) SYS_ARG(hea_write)                       \
-                  KVM_ARG(one_reg_id) initial_value)
-
-/* spr_register_kvm duplicates the oea callbacks to the hea callbacks. */
-#define spr_register_kvm(env, num, name, uea_read, uea_write,                \
-                         oea_read, oea_write, one_reg_id, ival)              \
-    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,       \
-                        oea_write, oea_read, oea_write, one_reg_id, ival)
-
-/* spr_register_hv and spr_register are similar, except there is no kvm id. */
-#define spr_register_hv(env, num, name, uea_read, uea_write,                 \
-                        oea_read, oea_write, hea_read, hea_write, ival)      \
-    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,       \
-                        oea_write, hea_read, hea_write, 0, ival)
-
-#define spr_register(env, num, name, uea_read, uea_write,                    \
-                     oea_read, oea_write, ival)                              \
-    spr_register_kvm(env, num, name, uea_read, uea_write,                    \
-                     oea_read, oea_write, 0, ival)
-
 /* Generic PowerPC SPRs */
 static void register_generic_sprs(PowerPCCPU *cpu)
 {
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index a4f912faa4..786cdca80d 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -21,6 +21,62 @@
 
 #define SPR_NOACCESS (&spr_noaccess)
 
+#ifdef CONFIG_TCG
+# define USR_ARG(X)    X,
+# ifdef CONFIG_USER_ONLY
+#  define SYS_ARG(X)
+# else
+#  define SYS_ARG(X)   X,
+# endif
+#else
+# define USR_ARG(X)
+# define SYS_ARG(X)
+#endif
+#ifdef CONFIG_KVM
+# define KVM_ARG(X)    X,
+#else
+# define KVM_ARG(X)
+#endif
+
+typedef void spr_callback(DisasContext *, int, int);
+
+void _spr_register(CPUPPCState *env, int num, const char *name,
+                   USR_ARG(spr_callback *uea_read)
+                   USR_ARG(spr_callback *uea_write)
+                   SYS_ARG(spr_callback *oea_read)
+                   SYS_ARG(spr_callback *oea_write)
+                   SYS_ARG(spr_callback *hea_read)
+                   SYS_ARG(spr_callback *hea_write)
+                   KVM_ARG(uint64_t one_reg_id)
+                   target_ulong initial_value);
+
+/* spr_register_kvm_hv passes all required arguments. */
+#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,             \
+                            oea_read, oea_write, hea_read, hea_write,        \
+                            one_reg_id, initial_value)                       \
+    _spr_register(env, num, name,                                            \
+                  USR_ARG(uea_read) USR_ARG(uea_write)                       \
+                  SYS_ARG(oea_read) SYS_ARG(oea_write)                       \
+                  SYS_ARG(hea_read) SYS_ARG(hea_write)                       \
+                  KVM_ARG(one_reg_id) initial_value)
+
+/* spr_register_kvm duplicates the oea callbacks to the hea callbacks. */
+#define spr_register_kvm(env, num, name, uea_read, uea_write,                \
+                         oea_read, oea_write, one_reg_id, ival)              \
+    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,       \
+                        oea_write, oea_read, oea_write, one_reg_id, ival)
+
+/* spr_register_hv and spr_register are similar, except there is no kvm id. */
+#define spr_register_hv(env, num, name, uea_read, uea_write,                 \
+                        oea_read, oea_write, hea_read, hea_write, ival)      \
+    spr_register_kvm_hv(env, num, name, uea_read, uea_write, oea_read,       \
+                        oea_write, hea_read, hea_write, 0, ival)
+
+#define spr_register(env, num, name, uea_read, uea_write,                    \
+                     oea_read, oea_write, ival)                              \
+    spr_register_kvm(env, num, name, uea_read, uea_write,                    \
+                     oea_read, oea_write, 0, ival)
+
 /* prototypes for readers and writers for SPRs */
 void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
-- 
2.34.1


