Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B4040DF13
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:06:42 +0200 (CEST)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtuL-0002ZP-Go
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLl-0001g3-KE
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:57 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLc-0002dD-W3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:57 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so5047934pjq.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+b0ulkNTfnCVlv+G/yTL5zdVouYmE4FD5mdoMaQi2iI=;
 b=nEfCprHOv0v/MdBPh8Pq97c85TbHXMkRFa/oOTWd+fHcIytN/3ZoiqmTfW7EniPqB+
 2hX3/R3xd8zVGZq0LnU9cBDYN3XGMoBsrFpORljVXWtKlpUez+Ep/BseZ5FcRwRI5D+e
 ixCN/qVcISPbk7S0v4AHASiR+JEVu72/W4C/RkedgLFiXRk5nn0fneKr5G7E7lv11jMR
 8Uk3+n4Q+SWTZumWIBVEUWCjSLnnCQqdMdisFc04NyljAVagbkjzsBBf7JMTDi10V4+8
 dPBnu1gAWR8LJk/QS8R1lgxjOTseZF1pbb5gq4qb3JI1PIaCuuJzIFbBdx62Un392lsb
 2Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+b0ulkNTfnCVlv+G/yTL5zdVouYmE4FD5mdoMaQi2iI=;
 b=rc+6xnY7ySWO0PcQoHa1mwaAY4G4j3dcZZvkeW3q8IXMZm1I2D/vf0YTwm7gtTTBU2
 1K1Z/9LcBZfkAUCiNm46frWYCTa34DuCkbfC4npSZTEMGSZvjORxu7omu2j4l3F1I2NQ
 JNAbF+K5x+ZEJ7R4g6NSj5QDYITi6maEIuzJI4L+mXD2WE2pRG6FCzXjS2XjWtw76MQh
 qxKUokCnIX91lK66FbfHWpj6ntiLfKhurxLXb/Xgx3TRdj2BACJT3NC4rW9WLmNBensk
 7MdtiH16WtYSsWpUkv0XKxE67RaDH0UHQPEGdJRBWzUm4dZfezRJbgYXA5fzIsnfUvvM
 0mjw==
X-Gm-Message-State: AOAM5320aGwLQwJewxZwiJzk503drFU+JxGmrM/ennuUs4cYIUSu80EO
 eDjuSm/CQleQNzQZbPhS8RS+18Ekrc00wQ==
X-Google-Smtp-Source: ABdhPJxrDjxJaj0VwdUPxA4B94GhAuqZy2uKjizvhiYLHDj68ZxvA34WZtreAgGaRxqETU2uwbFi2g==
X-Received: by 2002:a17:90a:77c2:: with SMTP id
 e2mr6657864pjs.96.1631806246578; 
 Thu, 16 Sep 2021 08:30:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/35] target/tricore: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:19 -0700
Message-Id: <20210916153025.1944763-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-29-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index b95682b7f0..419fa624bd 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -62,10 +62,12 @@ static void tricore_cpu_reset(DeviceState *dev)
     cpu_state_reset(env);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool tricore_cpu_has_work(CPUState *cs)
 {
     return true;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
 {
@@ -154,6 +156,9 @@ static const struct TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .tlb_fill = tricore_cpu_tlb_fill,
+#if !defined(CONFIG_USER_ONLY)
+    .has_work = tricore_cpu_has_work,
+#endif
 };
 
 static void tricore_cpu_class_init(ObjectClass *c, void *data)
@@ -167,7 +172,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_reset);
     cc->class_by_name = tricore_cpu_class_by_name;
-    cc->has_work = tricore_cpu_has_work;
 
     cc->gdb_read_register = tricore_cpu_gdb_read_register;
     cc->gdb_write_register = tricore_cpu_gdb_write_register;
-- 
2.25.1


