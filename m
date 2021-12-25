Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D21A47F345
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 13:53:07 +0100 (CET)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n16Xp-0005Kw-KN
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 07:53:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ne0sight@vortex.konotopov.pro>)
 id 1n16QG-000307-Rv
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 07:45:17 -0500
Received: from 95-24-165-59.broadband.corbina.ru ([95.24.165.59]:47010
 helo=vortex.konotopov.pro)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ne0sight@vortex.konotopov.pro>)
 id 1n16QE-0002h3-NJ
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 07:45:16 -0500
Received: by vortex.konotopov.pro (Postfix, from userid 1000)
 id 04650324CA7; Sat, 25 Dec 2021 16:38:34 +0400 (+04)
From: Yuri Konotopov <ykonotopov@gnome.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tpm: fixed be_buffer_size size in in tpm_crb
Date: Sat, 25 Dec 2021 16:38:06 +0400
Message-Id: <20211225123806.113368-1-ykonotopov@gnome.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.24.165.59;
 envelope-from=ne0sight@vortex.konotopov.pro; helo=vortex.konotopov.pro
X-Spam_score_int: 27
X-Spam_score: 2.7
X-Spam_bar: ++
X-Spam_report: (2.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_RDNS_DYNAMIC_FP=0.009,
 RCVD_IN_PBL=3.335, RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, TO_NO_BRKTS_DYNIP=0.001,
 TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
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
Cc: Yuri Konotopov <ykonotopov@gnome.org>, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trying to boot VM with TPM 2.0 CRB in passthrough mode without this change
I got "Requested buffer size of 3968 is smaller than host TPM's fixed
buffer size of 4096".
Looks like it can not be less than backend buffer size nor less than
CRB_CTRL_CMD_SIZE.

Signed-off-by: Yuri Konotopov <ykonotopov@gnome.org>
---
 hw/tpm/tpm_crb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 58ebd1469c..8243645453 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -270,7 +270,7 @@ static void tpm_crb_reset(void *dev)
     s->regs[R_CRB_CTRL_RSP_SIZE] = CRB_CTRL_CMD_SIZE;
     s->regs[R_CRB_CTRL_RSP_ADDR] = TPM_CRB_ADDR_BASE + A_CRB_DATA_BUFFER;
 
-    s->be_buffer_size = MIN(tpm_backend_get_buffer_size(s->tpmbe),
+    s->be_buffer_size = MAX(tpm_backend_get_buffer_size(s->tpmbe),
                             CRB_CTRL_CMD_SIZE);
 
     if (tpm_backend_startup_tpm(s->tpmbe, s->be_buffer_size) < 0) {
-- 
2.32.0


