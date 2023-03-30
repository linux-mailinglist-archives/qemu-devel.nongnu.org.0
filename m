Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B36D065C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:19:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsAo-0006KS-NJ; Thu, 30 Mar 2023 09:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tan_hong_ze@163.com>)
 id 1phqc0-0003t5-NA
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:38:36 -0400
Received: from m12.mail.163.com ([220.181.12.214])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tan_hong_ze@163.com>) id 1phqbx-0001Cj-5w
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=379PZ
 /b4FVj74bzHdXAcUWD4C1QDnGLimR9Bhsf7Zo8=; b=mLYteGQTJAqxrVJ/J8s9I
 aC6aQdeX9P24EAVYxmrgOMuHENcp6dBqYhigNBbYP+EkqgRLmYLFmylVyT6DIYyW
 BOvdP5DMEYVOgNdtXKK4z6Lw72OEzZ1XH/vv3hCTq2iNRaY83N5xtKG2iU0dRYfs
 MbNiK3XF9mddBe+GtSGzpw=
Received: from localhost (unknown [123.125.11.117])
 by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id _____wDXPsufdCVkr1NxAA--.30377S2;
 Thu, 30 Mar 2023 19:38:07 +0800 (CST)
From: tan_hong_ze <tan_hong_ze@163.com>
To: qemu-devel@nongnu.org
Cc: tan_hong_ze <tan_hong_ze@163.com>
Subject: [PATCH] target/loongarch: Enables plugins to get instruction codes
Date: Thu, 30 Mar 2023 19:38:06 +0800
Message-Id: <20230330113806.1458040-1-tan_hong_ze@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXPsufdCVkr1NxAA--.30377S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4ktw4UWF45Ar4kGF43Awb_yoW3Zrg_ZF
 1fXas7Wr4ruFyIyw409r98Xr1UCF18WFnYv3Z0gay8GFy5Jw43Gw4qq3Z5ur4j9Fs8Xrnx
 ur9rtry3Ar1rujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRCksD5UUUUU==
X-Originating-IP: [123.125.11.117]
X-CM-SenderInfo: pwdqsxprqjs6rh6rljoofrz/1tbiLABC-VsphEmdYAAAsR
Received-SPF: pass client-ip=220.181.12.214; envelope-from=tan_hong_ze@163.com;
 helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Mar 2023 09:18:32 -0400
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

Signed-off-by: tan_hong_ze <tan_hong_ze@163.com>
---
 target/loongarch/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 3bb63bfb3e..50d6b62f39 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -198,7 +198,7 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     CPULoongArchState *env = cs->env_ptr;
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    ctx->opcode = translator_ldl(env, &ctx->base, ctx->base.pc_next);
 
     if (!decode(ctx, ctx->opcode)) {
         qemu_log_mask(LOG_UNIMP, "Error: unknown opcode. "
-- 
2.34.1


