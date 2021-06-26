Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955833B4D39
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:49:47 +0200 (CEST)
Received: from localhost ([::1]:33942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx28Q-0008WA-Je
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vu-0002Ng-3Z
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vq-0000Pc-M6
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id f10so5887617plg.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZ+vu44B3MA2rQDPHlYV5+XUBqzkPAnWuZi1J6wYDao=;
 b=rl+UMr4QYeDRk9iv7XIX6os1urJrrnoZqitR7RzcFDCWExvQPPQAd/AvbrEEIS6sBq
 rpaBzNlnNqtGGRlysJXPFinZl/cxUe2bFPo1XODrY+fddm1/JcpWxk2wkgbi7lzrwKSH
 y3AVBceCK0vd8u/IaMXlSPaC1NeNvNpFPdlezrsMf+TDdZvkqUSV07lMbumi8BsJ4OKf
 vjDp4Jt6sNZRt04BdiNiwU/GRFFnUP/oUKRhE+A3NTqGaJOz6sT1dkGVWwGUuJo8guGF
 8fl4xwdXkb6LIcOO/De+WrCYKtmglBjCw3gd9J6N1S15GJmgKNk6Xp7vPtmKx3sCcIqN
 kiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZ+vu44B3MA2rQDPHlYV5+XUBqzkPAnWuZi1J6wYDao=;
 b=NuvKLrB0tI20DH7CbXY4wB8LyXBHuU8ddrbskBM1Zkn6cUA2UlClD7Wst7K5uG2qUO
 S9EJDeWJzX4SMJgPOhn3p2sl7ac49Bf1gLNSnL/0cmyTguhZivJ6F3OCFGXQjo8/4gJi
 Vjefcx/nW7idQX4CiYQWXBV9YIyamTpB8iTXv06hZrKoCuuhikYirtxqekL8n9Khqsqg
 VlkO84MoKLtz2aMY2f3GwPczXIjlo9CNaCb1nbXcYrKgzk9iLHxYlGKbBf3eow0KchSI
 ITgYb2cb1KN2oAdj92lHhTUJ5QofMw2WfWa6D2i580sM+4W4UfuaPcuLlIvYY8EPfyXe
 EuGA==
X-Gm-Message-State: AOAM532Je2xQEOlNwsLdA2/E9kf5bh6MtycKias37wzcINQYuZM/5TA3
 cV9ne5do3G5gAq90d7ZpNCka+Oc6SfJIvQ==
X-Google-Smtp-Source: ABdhPJzw7+RvUgHLbc7nFyE96OT6sH6OuaONMDz7F2LgBDNtkagWdXkq9hdBluU38EsJBuc9216Q1Q==
X-Received: by 2002:a17:90a:2a86:: with SMTP id
 j6mr25074820pjd.67.1624689405325; 
 Fri, 25 Jun 2021 23:36:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/29] target/arm: Improve REV32
Date: Fri, 25 Jun 2021 23:36:23 -0700
Message-Id: <20210626063631.2411938-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the sf version, we are performing two 32-bit bswaps
in either half of the register.  This is equivalent to
performing one 64-bit bswap followed by a rotate.

For the non-sf version, we can remove TCG_BSWAP_IZ
and the preceding zero-extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f2641a37ba..304fd3d370 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5430,22 +5430,13 @@ static void handle_rev32(DisasContext *s, unsigned int sf,
                          unsigned int rn, unsigned int rd)
 {
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
+    TCGv_i64 tcg_rn = cpu_reg(s, rn);
 
     if (sf) {
-        TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-        TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-
-        /* bswap32_i64 requires zero high word */
-        tcg_gen_ext32u_i64(tcg_tmp, tcg_rn);
-        tcg_gen_bswap32_i64(tcg_rd, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        tcg_gen_concat32_i64(tcg_rd, tcg_rd, tcg_tmp);
-
-        tcg_temp_free_i64(tcg_tmp);
+        tcg_gen_bswap64_i64(tcg_rd, tcg_rn);
+        tcg_gen_rotri_i64(tcg_rd, tcg_rd, 32);
     } else {
-        tcg_gen_ext32u_i64(tcg_rd, cpu_reg(s, rn));
-        tcg_gen_bswap32_i64(tcg_rd, tcg_rd, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+        tcg_gen_bswap32_i64(tcg_rd, tcg_rn, TCG_BSWAP_OZ);
     }
 }
 
-- 
2.25.1


