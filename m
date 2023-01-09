Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C76636D4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 02:42:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF3dE-0003gx-CS; Mon, 09 Jan 2023 20:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pF1PH-0004hk-SZ; Mon, 09 Jan 2023 18:18:23 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pF1PA-0006NU-Hy; Mon, 09 Jan 2023 18:18:18 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 49CB511EE06;
 Mon,  9 Jan 2023 23:18:05 +0000 (UTC)
From: ~dreiss-meta <dreiss-meta@git.sr.ht>
Date: Mon, 09 Jan 2023 15:05:19 -0800
Subject: [PATCH qemu 1/3] target/arm: Unify checking for M Main Extension in
 MRS/MSR
Message-ID: <167330628518.10497.13100425787268927786-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 Jan 2023 20:40:44 -0500
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
Reply-To: ~dreiss-meta <dreiss@meta.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Reiss <dreiss@meta.com>

BASEPRI, FAULTMASK, and their _NS equivalents only exist on devices with
the Main Extension.  However, the MRS instruction did not check this,
and the MSR instruction handled it inconsistently (warning BASEPRI, but
silently ignoring writes to BASEPRI_NS).  Unify this behavior and always
warn when reading or writing any of these registers if the extension is
not present.

Signed-off-by: David Reiss <dreiss@meta.com>
---
 target/arm/m_helper.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a..e5ccfa9615 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2481,11 +2481,17 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t r=
eg)
             }
             return env->v7m.primask[M_REG_NS];
         case 0x91: /* BASEPRI_NS */
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
             if (!env->v7m.secure) {
                 return 0;
             }
             return env->v7m.basepri[M_REG_NS];
         case 0x93: /* FAULTMASK_NS */
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
             if (!env->v7m.secure) {
                 return 0;
             }
@@ -2531,8 +2537,14 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t re=
g)
         return env->v7m.primask[env->v7m.secure];
     case 17: /* BASEPRI */
     case 18: /* BASEPRI_MAX */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            goto bad_reg;
+        }
         return env->v7m.basepri[env->v7m.secure];
     case 19: /* FAULTMASK */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            goto bad_reg;
+        }
         return env->v7m.faultmask[env->v7m.secure];
     default:
     bad_reg:
@@ -2597,13 +2609,19 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskr=
eg, uint32_t val)
             env->v7m.primask[M_REG_NS] =3D val & 1;
             return;
         case 0x91: /* BASEPRI_NS */
-            if (!env->v7m.secure || !arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
+            if (!env->v7m.secure) {
                 return;
             }
             env->v7m.basepri[M_REG_NS] =3D val & 0xff;
             return;
         case 0x93: /* FAULTMASK_NS */
-            if (!env->v7m.secure || !arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
+            if (!env->v7m.secure) {
                 return;
             }
             env->v7m.faultmask[M_REG_NS] =3D val & 1;
--=20
2.34.5


