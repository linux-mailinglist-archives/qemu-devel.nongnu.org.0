Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5E53D094B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:59:16 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66CJ-0008NB-RP
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vo-0005B2-U5
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:13 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vn-0005Y8-Es
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:12 -0400
Received: by mail-pf1-x42e.google.com with SMTP id o201so1513424pfd.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RDO2b1TAF4ztgLUbPUMoAMU1yhwWU0vJ3YMD4i8Z5ck=;
 b=xUEUzCEJDkm0XJo+d2j09/rHWEEcXkuV4q3eTk6dszJyzFhRkvMeeP+0rZcy76wu9U
 7qg/ckh2VetA+vboOBOCICL5zxXE1ueEGIEI3BF5PaUJIzs/rqiKU+2+ySiiWCyRLA1X
 RpeEw+Tgr71i378n9ORx0YrO4286rzDlqTqlE5PdS8OlBBfk3lw7eorzHhXA9qPyW/zk
 vTnV//HAK4hXx3l9urBoEmFxc7hAIgvWJIhftNGwdAHdslCMdBEtegb5uqqLkfh8/aLN
 Fztk9z5NgK8W/JHLuDqG6i71sZNxsTxg8HuNF8Y/sLtWyzHRnK9JbIUZxoBev758DQ+0
 oNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RDO2b1TAF4ztgLUbPUMoAMU1yhwWU0vJ3YMD4i8Z5ck=;
 b=i189h7K+2LHUX9AxDBCfcJGFXORf9Ud5s02o6aRBWeE7r9KcAJ5m+1BAD/1PY9ZTIj
 cELC8ME0keC4pt9QN3Ot+XnS9Bv/3ENvrb7yWgGfQP3HkT/WWWbLTMqrEyH8S+OlgggS
 Yi27mw4ppqirPhQAopwKDAMPVvdcnMsA4EaIdZwjNLQiNKbz+s34h8MDq0LFBAAoLfj7
 GR0hgau0NUxhzT7DBpZTyh0lzg7BMZjrc8u3ddTShThDlTLluM03/S2a86aciTcrNfPH
 J8QbEJ5YfX47AdVV7N4kOIpAziZNdF9rE/E2goIoZVoK68pSPOLbpQeHg1Dz+ux2h6DV
 rVug==
X-Gm-Message-State: AOAM532gMTPmlrSAi073x6FoKkctAHeAbUZ0j4WIlPaGqa1FX6AeMzii
 Wz6TnWK/BW6bS949IDZR7SZqQ+sQZ/3E1g==
X-Google-Smtp-Source: ABdhPJyY9BYMrcM7Q0pKMNlRR9MtMVfOWRo41xgjlyRCy/oE680wsgjENHuEvn9et1A7ie+b+vIWIg==
X-Received: by 2002:a63:214b:: with SMTP id s11mr26263654pgm.87.1626849730238; 
 Tue, 20 Jul 2021 23:42:10 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 12/23] target/microblaze: Drop checks for
 singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:44 -1000
Message-Id: <20210721064155.645508-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e465b629a..437bbed6d6 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -126,12 +126,7 @@ static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    if (dc->base.singlestep_enabled) {
-        TCGv_i32 tmp = tcg_const_i32(EXCP_DEBUG);
-        tcg_gen_movi_i32(cpu_pc, dest);
-        gen_helper_raise_exception(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
-    } else if (translator_use_goto_tb(&dc->base, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
@@ -1807,12 +1802,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
         /* Indirect jump (or direct jump w/ goto_tb disabled) */
         tcg_gen_mov_i32(cpu_pc, cpu_btarget);
         tcg_gen_discard_i32(cpu_btarget);
-
-        if (unlikely(cs->singlestep_enabled)) {
-            gen_raise_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
         return;
 
     default:
-- 
2.25.1


