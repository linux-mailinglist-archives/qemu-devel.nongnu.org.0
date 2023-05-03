Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191E6F5154
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:26:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qw-0003xf-FE; Wed, 03 May 2023 03:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q9-0001y5-4Y
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q5-0001Rq-Iq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so2315766f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098628; x=1685690628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMCPDYW/bSvtCEhNNmDGKubRcgt+lsVA2BXAWeZiX78=;
 b=k21vvfwSaDBAQ+UTlzjwhidnWn6G3RF/QonePLFBJPR6e63VfKo86Jr72hTsMhULdy
 z85EpG0n9EB61Rs4f73AwMQt4RHkuWLmNiGRe56VMtCkrL2wfAgPwEs2+NN2iDJ0TmWL
 GPGqBUcH2ktCb97pEkIBnspKOJw27U/rCW3gkCMXJH1R8PbWpaA6ylqNtGKAzcdmjtnn
 5bxC51IzwV5I2rVUFvup1DjSJka+ZPhaxxKQQBhq92gW+ExLVqT73knvZPsnRQeJiR/S
 FpXaTwYVmjLLHc3xB7EUhWv2YoQl8SzpczLWqJVxnvsAo4P4Ildp9o1bDYyBd3Qad+GE
 tAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098628; x=1685690628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMCPDYW/bSvtCEhNNmDGKubRcgt+lsVA2BXAWeZiX78=;
 b=JXMmE3VFA18IO5y0voKJ0tNrbBNjCFpIa/IammYgNnjr3t8DrkR1Ur4PFLoCqVE541
 y0LDv9yW+1bOocVwPUWwBhNKjtE9FVrf+E0+ZkJ3z6tRZ+5ix3KxbydU8KxCt9R9HuYp
 i6LIAmvHFNBwIGmG9fIlAh5bwGRpxQVGCanslpXwsS7GZb09S23k5410BuAfvUQUlrXy
 exBn4YXjEHfaNbi09OL/d3hIkdjxlDc3Fdmf7VTEM/1f19qCWSrs2Xt4L5lb0w9S9n6/
 gqZp0d67rKqHtU0aYMdcussmhPTTP2H6KSBRFb9cO08MhElcluHnWqz15DINEFlHXDGM
 bUsA==
X-Gm-Message-State: AC+VfDzthYT3q8NvL5jt6j4qCs+7vcNlJvfEnjt//p+S+SbMOkw4DGR0
 Xe3x+GzAZR9cjV2MHCVUBAq69TwzpNyxe1qvqx3sLg==
X-Google-Smtp-Source: ACHHUZ5OQy04LBS1QuotgfaPKrMSzHL67yKrh4NAvNc/NzjOiMczh9QdZCK7zf+hg/vvT+agbyCTWA==
X-Received: by 2002:a5d:560a:0:b0:2f4:de63:a0b5 with SMTP id
 l10-20020a5d560a000000b002f4de63a0b5mr13807256wrv.69.1683098628719; 
 Wed, 03 May 2023 00:23:48 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 19/84] tcg/i386: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:26 +0100
Message-Id: <20230503072331.1747057-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All uses can be infered from the INDEX_op_qemu_*_a{32,64}_* opcode
being used.  Add a field into TCGLabelQemuLdst to record the usage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 430240de12..1a01520983 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1971,10 +1971,8 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->addrhi_reg = addrhi;
 
     if (TCG_TARGET_REG_BITS == 64) {
-        if (TARGET_LONG_BITS == 64) {
-            ttype = TCG_TYPE_I64;
-            trexw = P_REXW;
-        }
+        ttype = s->addr_type;
+        trexw = (ttype == TCG_TYPE_I32 ? 0 : P_REXW);
         if (TCG_TYPE_PTR == TCG_TYPE_I64) {
             hrexw = P_REXW;
             if (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32) {
@@ -2019,7 +2017,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->label_ptr[0] = s->code_ptr;
     s->code_ptr += 4;
 
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+    if (TCG_TARGET_REG_BITS == 32 && s->addr_type == TCG_TYPE_I64) {
         /* cmp 4(TCG_REG_L0), addrhi */
         tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, TCG_REG_L0, cmp_ofs + 4);
 
-- 
2.34.1


