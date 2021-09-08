Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F0E403F4E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 20:56:31 +0200 (CEST)
Received: from localhost ([::1]:51136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO2kI-0002WJ-77
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 14:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1mO2hv-0000v2-0d; Wed, 08 Sep 2021 14:54:03 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1mO2hr-0001FX-8o; Wed, 08 Sep 2021 14:54:02 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CC331FDAD;
 Wed,  8 Sep 2021 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631127232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kkiBfWjf3jVXeG1Bl4jYz7oT2LjjeWQHh7POOnNUoYY=;
 b=cAbbHayHLjvFk8J1PeXiuR/Cwzif6eS0C0yJaEj1TZ5NtGmmYC/WcMjShQsVttZeJlhRKR
 dARXW2YqKt3KgqUICVaIEEDGu9bX3sZzWzwVww/UbMp+cTgCQ1sPzh+vupUnsv/S8iJ7u2
 j09OMtrYYrdJwc9vgYn7mgvaB3GlvSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631127232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kkiBfWjf3jVXeG1Bl4jYz7oT2LjjeWQHh7POOnNUoYY=;
 b=/GVtNkMCiOLIChkZir4Dxm6RWwMOv7v6mvVWJkALe9pA/zdpb7dkPPW08VS9Dfa3CO1m3B
 8okyiAYUU1mZHUBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7E4513336;
 Wed,  8 Sep 2021 18:53:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r4e5H74GOWFRWgAAMHmgww
 (envelope-from <jziviani@suse.de>); Wed, 08 Sep 2021 18:53:50 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/arm: Fix tcg_out_vec_op function signature
Date: Wed,  8 Sep 2021 15:53:38 -0300
Message-Id: <20210908185338.7927-1-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 5e8892db93 fixed several function signatures but tcg_out_vec_op
for arm is missing. It causes a build error on armv6 and armv7:

tcg-target.c.inc:2718:42: error: argument 5 of type 'const TCGArg *'
{aka 'const unsigned int *'} declared as a pointer [-Werror=array-parameter=]
   const TCGArg *args, const int *const_args)
  ~~~~~~~~~~~~~~^~~~
../tcg/tcg.c:120:41: note: previously declared as an array 'const TCGArg[16]'
{aka 'const unsigned int[16]'}
   const TCGArg args[TCG_MAX_OP_ARGS],
  ~~~~~~~~~~~~~~^~~~

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 tcg/arm/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 007ceee68e..e5b4f86841 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2715,7 +2715,8 @@ static const ARMInsn vec_cmp0_insn[16] = {
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGType type = vecl + TCG_TYPE_V64;
     unsigned q = vecl;
-- 
2.33.0


