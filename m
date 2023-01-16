Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D501B66CD4A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTNQ-0006Ua-Q5; Mon, 16 Jan 2023 12:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNO-0006TM-HL
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:34:30 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHTNN-0004nN-4N
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:34:30 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1442977d77dso29519012fac.6
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uR+Za30JTgq3Im6TQb73kibUHGAIkzY+HrHZCNg0m4=;
 b=ZSnYryTm8RNQ5onlHeT8MIUDh93cRReLTHFZEvKESE9/R8CP5fvbYQJuLSiYO0Y6A8
 8hyNoM3gj7srs/7/TjckWXbRm0M5KbgygUBT1ufDiBa324xrhtuk1P0fxNOznuk6YqJy
 pESTqv6y6sUiGwmOKDU40JAwHt/WJXw61c5FP9SDKVxmhf0toDni3+o0aN9kdC0tq0X6
 yOtvTlCQ5Xdv0Q/xLgBrUX8AcGq9ot7AN3p9gV6mvC5aHLcS+ouaZwop+NoIBOG40OtH
 bN6vtdQfFQ0yq/brZTVXW3wI3KaxjNEve8on18/ih91bqTzJy8ucAYJxVIF2jONfxu57
 Ae/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6uR+Za30JTgq3Im6TQb73kibUHGAIkzY+HrHZCNg0m4=;
 b=kZb2t7jegvUewdjfDc2g5wt8gQZyPyYE19D8SuV6o0ClD9wBHTeUI58Mdj7I9P3HLt
 gqqq6+V8HPymPTofo9wQq9UpYc4PXhevTaEnrtbcPiJryqEo4yc2rZk6TE5TCjeYaFAV
 QTyjmRLRmM8epLJxQaWMdwebXxyiUUZKf4b0l6nQAvzDLiL8i0ZgCwj5EPPBZiM/q23F
 glO7/LQjG7v5RIrs+Od0xmy9v7xFC6XpN05KEXlm/9/Yvbl4XdVUWZaVZbyjG9pXHrPL
 KHxSFZ4lPXPmzOUK3wrrvS8lczjHStVe67eEkgPn6yokzbUTf+aH85A+qdjPeYxQYx78
 sHQw==
X-Gm-Message-State: AFqh2kpLRPH0/iJoFmsoZk/JTnJE0Hu7DmYdiHvxwORQ0C2B8RZ4eXrP
 dgae4BY6dEUu93tr6BlLkvYoZcqPkH7lLP894QQ=
X-Google-Smtp-Source: AMrXdXtfdg2RGEsqD83xhYVsT8gg12B1EYJGHUtRUkRlaax9PWrwm8QPkImkB+jhTVBAicTbmUniVg==
X-Received: by 2002:a05:6870:c43:b0:151:fd0f:1b59 with SMTP id
 lf3-20020a0568700c4300b00151fd0f1b59mr11194407oab.5.1673890467601; 
 Mon, 16 Jan 2023 09:34:27 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 f23-20020a4ae617000000b0049fd5c02d25sm1353802oot.12.2023.01.16.09.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:34:27 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/6] hw/riscv/boot.c: calculate fdt size after fdt_pack()
Date: Mon, 16 Jan 2023 14:34:15 -0300
Message-Id: <20230116173420.1146808-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

fdt_pack() can change the fdt size, meaning that fdt_totalsize() can
contain a now deprecated (bigger) value.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2594276223..dc14d8cd14 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -253,8 +253,13 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint64_t temp, fdt_addr;
     hwaddr dram_end = dram_base + mem_size;
-    int ret, fdtsize = fdt_totalsize(fdt);
+    int ret = fdt_pack(fdt);
+    int fdtsize;
 
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
+
+    fdtsize = fdt_totalsize(fdt);
     if (fdtsize <= 0) {
         error_report("invalid device-tree");
         exit(1);
-- 
2.39.0


