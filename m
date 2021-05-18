Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04B3871B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:18:22 +0200 (CEST)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lit3d-0000l3-SP
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKs-0007rv-O9
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:06 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007AW-3C
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:06 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N4eOd-1lIrRE3dxP-011mCv; Tue, 18
 May 2021 07:31:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 44/59] linux-user/s390x: Fix frame_addr corruption in
 setup_frame
Date: Tue, 18 May 2021 07:31:16 +0200
Message-Id: <20210518053131.87212-45-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SZ7kuAOZ0C6B91UsjZ4NYREWa4kcI9+Qh+fUMvnTFnFh1Qgvhfh
 LRJpoFdflRaNVwO22o50ZCKPgDLrjlkYGYgU8KlQDTboqYVNaRKBnz+ecwY5Sryu5dFxxrx
 ruUKXmGnMDXtT3xPDtj44lz4QjABz/xfIP+9FkH6/meSWGBvnn3jsWmBSLsJ3Pph2R1RudY
 iHFT4ypIXxmtmHpVJoBRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EgUM2E7ZBaQ=:CbPm2d6+KlnQOnQXdK/XnT
 /BxNIlpkYwLP5kYRAhFBq+tmIl8ayigwgeakoF6bKJAJWq2rPWbRfj98pMXxr5ngY+2iSx6IS
 ljcKzNde2UhSCLdPLkoqsO2rZPbonbxpBw1zV7CqTaSa3nPatU4I3TsYlkmq+v+YT+i2aQ2ZE
 w6JevCbUv4fLUVCJ9F5F1ai/PA6fx4be+xb3kIYtwxkP3f0KV2fjzEAjhV23KPrBIxqzWpe8Q
 BSpUBmOi8sq/pqTwL3Y1Mzv2hPSEU5Ey518hmgHioKV3CvvHsjc7wgLxgqG3xPefbFs7zd3WQ
 rxnLzx+Q5RSTIwsDvCwkx8oTCDYGOmpxySlOODBvx0zYyFeU/VQzNJhbjHqn/ATa8odt0LXrc
 oQtgSzW+Cb6PS7sbaphBdTF/320J46LWbtv7bLfQzHMJDSfN7Il40d4NRp3TnLEYHuoH7TVoG
 rN6Z0fLOTRVOSsnCeYABrsUj1M58psqCR23qBeA+GwiaV7xvuhWj9aIgNWztTox9g+lUTgkYg
 FIj9E9P2/7kSHmgonByZG0=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The original value of frame_addr is still required for
its use in the call to unlock_user_struct below.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index bc41b01c5deb..81ba59b46af5 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -168,7 +168,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig;
-    env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
+    env->regs[3] = frame_addr + offsetof(typeof(*frame), sc);
 
     /*
      * We forgot to include these in the sigcontext.
-- 
2.31.1


