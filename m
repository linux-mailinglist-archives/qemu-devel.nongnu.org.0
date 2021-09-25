Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2BE418335
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:24:46 +0200 (CEST)
Received: from localhost ([::1]:36226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9Xh-0007vm-IU
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92r-0001CK-7G
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92p-00068T-Hx
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id t8so36540414wrq.4
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esdj4T8w87yQQx5q0gedYQmjf/1Q5yjrjrc7iKp6hio=;
 b=K7jLxmvqCN/iAR6NLt94tpMsCjtkZvoHmGq9pcXL4GqwBoQHtBOQI1FwtJbG30OegV
 1xinWCbteDUwK8SgPK7No59Q6v2LuHugRmPs+Zm6y406qZMUS2MSsTNXaWCGB+Sebp7U
 Oo5+iZg8FIEuCHkKugLO51HwK5n+YjuKEKrT/anJL/7HIMtJTVXtT3h7H4qnl6Z9yYxc
 TtTPVEhSO1bleiZ3DVKDoXUJkmtKh6kYgn6GonNKy2TGUskEeCf6aJjWEGv7UyUPJmfB
 AAlH9n1cMXrDUd+3WEQFQaVpBjTycU7WnGxHbpolz82Kl2hlGBj9TdG/ihhbehMgY84b
 yCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=esdj4T8w87yQQx5q0gedYQmjf/1Q5yjrjrc7iKp6hio=;
 b=UNBazRdDLvveGPMBt7iwVou02Hj7BYvDxEyRhrEs/Vup5WYr380jo+DzBEYdK+mUec
 stm8RVMs/mkikkSPZyzTJpWfaXVfrlpMHMEkK6PFaFMxecexNrhP01xu+HlahzH/NC+Y
 LNu/Fua5gs1p+ALlzotpyzgbTYm/p/yUMnDCaz3uQht2Z2Fb6Gjwh+6ICNqcCAfu4qQ2
 T0mQGGYSXo8aJXsfljqi4qaddunzwupxUNPQZdFxa2l2IUr+tuIkgU2n2qIkzeIjHC8L
 MKirnPS3j+nUTQGh6eX4XBEa8duk+UBBaSj3+ex9U7n9nk2J2Towjr0aCdUROXqnMaLv
 XiZw==
X-Gm-Message-State: AOAM530KNnD17qTtFkY1HNjL4pDAgPe72H/3rB7qVUWMNNXLZz40FuKy
 kFIOYZPuU5LegVamAo0yQm4Kxt6tfMc=
X-Google-Smtp-Source: ABdhPJy6rXV6+Wx3AZinkQiHkZ25/DaFQLwtVD5S/9zSsTwHY41sBHZUnMmz6j93cw90jyigXPWNeQ==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr17721352wrt.267.1632581570054; 
 Sat, 25 Sep 2021 07:52:50 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 u25sm13134530wmm.5.2021.09.25.07.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 19/40] target/avr: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:50:57 +0200
Message-Id: <20210925145118.1361230-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d70e34dd54..6d51f91ca2c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -195,6 +195,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
+    .has_work = avr_cpu_has_work,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
@@ -211,7 +212,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-- 
2.31.1


