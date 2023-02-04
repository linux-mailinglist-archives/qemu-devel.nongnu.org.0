Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4468AB17
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:10:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5w-0005JR-HL; Sat, 04 Feb 2023 11:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5s-0005Dn-QF
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5q-0006yF-Rt
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MPoPd-1p29HS14ol-00Mrqm; Sat, 04
 Feb 2023 17:08:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 21/22] linux-user: Implement SOL_ALG encryption support
Date: Sat,  4 Feb 2023 17:08:29 +0100
Message-Id: <20230204160830.193093-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lQd1o3aGuBgKlcDge8bZJ98/pcNRPbnqyRTXsUGS+brH4F20YDK
 jXJXcQXS7dQyvxOwVyEEKcBQwmA8fSwTi1GVyDR9FrmLn/gDtLlpDraqUUAfhGov+Yc1cFq
 eAfmRcI7tfsHVppyhSTY/djjRPV3g1U16KNLhMJizrFcd33uOOlN/Nw32BCSR7CrlnVYvFw
 Ee9xbcSdFdVlQCzEQdM6w==
UI-OutboundReport: notjunk:1;M01:P0:MHSzIqsyP9M=;Vyqtid8HkLc7urRCVq005zFzJQj
 loYYnH+C1RYcLpP5WYU6ceVHpOM5BpNmfSVjcap8Qm9kcjjUOGPjwFI2xv0sdjVayKZNA1aI/
 na2/dS2YwnEdnoTs8KbeZy3tBgXheDTDc2TOUbiI3ToYfi0shCAkHcQQ2CoHZgBTb+xoWx1jk
 +hPASazwJvChXNK10pyCHEhYRzfmUWiM2EZcm4njATz8b5vjy6fmQY8MhsNpA/W/DTeqKVZ1W
 Wkw0qEOhwChHfPcvIF72GYIorb3ApysswdxpoEqHhdPWxMQWuhnUjcqLfctznnWiNcPVlJlit
 k6+pFGTOkUOiedPPpPA92QirtYZ6pAouCDcM4fJ3rEm7Eqt7rcAcvEtoboTIZotlDTyz3D2SK
 kAXRHNYiUkpUk1SkzezoEO9U/rFiV52OYERpH2/OELbVavay2CTdijd3+jFlggA74+lnSCNN+
 6Fi/lSahfc3Uk/B2KJDDYn+FxMjl1rZgZ93CVoksgVuyo4YKphlLcfMQQYi2i2nuA8lh5zNh6
 G0V0yRnWxzczraowd6s1Rdu5CFCGeWIltl5v2ojqorYiLKkUBcJQfj9RtgH+RBUwT/7YuFuhA
 2/DXIaCw0K6BVcm930DJbYKVrt/4PotAmVExV2JJslBlPCs1x//iMFa1N+sUzOmEdoULuR9VC
 TFrHceBkxhQxgCE+6KT36RmOg9mhSB277RZr5DX9Qw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

Add suport to handle SOL_ALG packets via sendmsg() and recvmsg().
This allows emulated userspace to use encryption functionality.

Tested with the debian ell package with hppa guest on x86_64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221212173416.90590-1-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 55d53b344b84..a0d2beddaa4e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1829,6 +1829,14 @@ static inline abi_long target_to_host_cmsg(struct msghdr *msgh,
             __get_user(cred->pid, &target_cred->pid);
             __get_user(cred->uid, &target_cred->uid);
             __get_user(cred->gid, &target_cred->gid);
+        } else if (cmsg->cmsg_level == SOL_ALG) {
+            uint32_t *dst = (uint32_t *)data;
+
+            memcpy(dst, target_data, len);
+            /* fix endianess of first 32-bit word */
+            if (len >= sizeof(uint32_t)) {
+                *dst = tswap32(*dst);
+            }
         } else {
             qemu_log_mask(LOG_UNIMP, "Unsupported ancillary data: %d/%d\n",
                           cmsg->cmsg_level, cmsg->cmsg_type);
-- 
2.39.1


