Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EB308710
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:34:40 +0100 (CET)
Received: from localhost ([::1]:38708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PEl-0006iR-BJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PD5-00054a-CH; Fri, 29 Jan 2021 03:32:55 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:40271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l5PD3-0002UM-B7; Fri, 29 Jan 2021 03:32:55 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MXGSU-1lU8Q80aOU-00Yh4x; Fri, 29 Jan 2021 09:32:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] tcg/tci: Restrict tci_write_reg16() to 64-bit hosts
Date: Fri, 29 Jan 2021 09:32:34 +0100
Message-Id: <20210129083236.584238-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129083236.584238-1-laurent@vivier.eu>
References: <20210129083236.584238-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f5G6Sd3S5lkNKACmVqO4C1GfHyqj7/tVUjhGmX1jtTIu0/pCGx1
 267zMTLOB12O3MLSBfTSThllSIKjlHWTY4HiMOGjCVFxPWDYU15ey4OCMWxt62Xvzi8VtuK
 urj+e37WilOlf+BM5mnDhpQQEqW+w6aIDNy476+DaNcoMt+q1kXDzVTK22X/HwYyxcif4m8
 eIjZP8mBnajybTmWwZaHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A40ekwuV+VQ=:DoSzneYg0PMg4Z/xxtjkBA
 Zy0I9NHT6ieNiWyJtCb9iAFIOcEQ3w/1NM0ccTvqnA3HSX1KJnMF23A6N/nzP3XbpXVrNuhSM
 2BLINZSPL0Cyck0Kj01tSlMaNsPQBUI01+6mTjM+2pV8QMBah7uRERxeb9ZkRl1KP7zzSuN7u
 C3cwYxR9ep7etgupWu71s3YOauSvKde0SWaiOLBELFZsFGGhWUAOu0OeT7piiFJXp2f5d1i9R
 vQSm1e/wr8InNCMkRwTCnwbUmapl/mD1me9Dl967IP04cc5mCGV2GTZPO+surl7zd51rD8r3r
 +digl+aEQjyBqNLPw7Co7djWVkGXkYhmnjNFk4ho/s/8lSzrRcCsBmLnEexeALAQWFYSxfMoa
 am3nx6yNKMaZNdhQdfmRhA/YqF58DvFULT/Lf2bT1Chx3M/CxxnKhycEFlQXde4hNCMSX/9mu
 C+zUtURQGA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict tci_write_reg16() to 64-bit hosts to fix on 32-bit ones:

  [520/1115] Compiling C object libqemu-arm-linux-user.fa.p/tcg_tci.c.o
  FAILED: libqemu-arm-linux-user.fa.p/tcg_tci.c.o
  tcg/tci.c:132:1: error: 'tci_write_reg16' defined but not used [-Werror=unused-function]
   tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
   ^~~~~~~~~~~~~~~

Fixes: 2f160e0f979 ("tci: Add implementation for INDEX_op_ld16u_i64")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20210123094107.2340222-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tcg/tci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2311aa7d3ab6..3fc82d3c79d7 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -128,11 +128,13 @@ static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
     tci_write_reg(regs, index, value);
 }
 
+#if TCG_TARGET_REG_BITS == 64
 static void
 tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
 {
     tci_write_reg(regs, index, value);
 }
+#endif
 
 static void
 tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
-- 
2.29.2


