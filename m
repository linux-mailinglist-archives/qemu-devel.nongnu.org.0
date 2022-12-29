Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68D659080
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 19:39:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAxNp-0006yM-Nh; Thu, 29 Dec 2022 13:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNm-0006xQ-PF
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 13:11:58 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNl-0003dG-CE
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 13:11:58 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 y18-20020a0568301d9200b0067082cd4679so11877894oti.4
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHy65YgYZ7EFTsqj5jqz5XI2px8pxCQwfSaXjdiH0SQ=;
 b=El8aA8ppoXiamW9bbv4fJ+2XAfwQYQwOrMAjPNxIebV4vVq35ebvoVnzkberlbNMqC
 JzWNd+m5vuiMam/hfKOtWYTU+X8dpoInKdQb+L2b+5U0TbrKfoDFAQNzqOwtwcCjrObd
 rwMcp9SApOvuLTV9iKJ5BkMbLhiowJOEIpnDtcFqP3rBcntqI9STn+WiqW8gAQV4oqN9
 u+UYNxPbbOTHwmFQ8qfBe491qx5H5JcubCjxiMyiRYNUTPBA+sOePKNmgKNBT67cCrco
 ljj+PLL8Xlg49RVEmwivU0eGCKqudT6JM4mtQMm5y3G6nOs/mm6RTjHkALbAUVWC+SE0
 7R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHy65YgYZ7EFTsqj5jqz5XI2px8pxCQwfSaXjdiH0SQ=;
 b=T2hLAQpDXRXO7yZi9gGx5K5KJb/vNCcgahX0Fq8nu/JIufdLgLQMap7hBWh02gEZ//
 TxmN1Zkt+/v2IKlYV44gZVEFbVPIlqVg5ecfvDUpY99uGB5pb+kaFda3oEkNHlBWQ52B
 DPKAj0Vgzvr3Jzb5BYu2SxngVdIT5rm9sIMs9HGdM0+Yb1lGZ4oA7AmqZxbixkHoxXKd
 2zrHPr9yN30wCqduDIrsWjFMiPh/ALfYZH7cyfUyN/X3Rb47jQlL83lm/qRwuotLFRgC
 e7dgzUiLcJcjSONWI5bqSnFs8XhfO/a5gVqA1MyE4W0fmAfmOz/pzBQJO4ZnBglOEJYq
 kqzg==
X-Gm-Message-State: AFqh2krR9h9G0OTUyT1C2pXiix677wOyX21HUQqqzdH62flzmI9zeVz2
 M1DkV4XTvv83CNvmboUzRum6uRRcRoJZd/m6
X-Google-Smtp-Source: AMrXdXs49f/f49p1ar2kODabYXUeMRxP+5nOTWs7yFJR2QDexl0FLfPy5OGGF2o8LyTwunAJ4dqxMw==
X-Received: by 2002:a05:6830:39df:b0:674:f9e9:8ee5 with SMTP id
 bt31-20020a05683039df00b00674f9e98ee5mr14170175otb.3.1672337515781; 
 Thu, 29 Dec 2022 10:11:55 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:11:55 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 04/11] hw/riscv/boot.c: exit early if filename is NULL in
 load_(kernel|initrd)
Date: Thu, 29 Dec 2022 15:11:28 -0300
Message-Id: <20221229181135.270661-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229181135.270661-1-dbarboza@ventanamicro.com>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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

riscv_load_kernel() and riscv_load_initrd() works under the assumption
that 'kernel_filename' and 'filename' are not NULL.

This is currently the case since all callers of both functions are
checking for NULL before calling them. Put an assert in both to make
sure that a NULL value for both cases would be considered a bug.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 98b80af51b..ad196f0fe4 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -177,6 +177,8 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
 {
     uint64_t kernel_load_base, kernel_entry;
 
+    g_assert(kernel_filename != NULL);
+
     /*
      * NB: Use low address not ELF entry point to ensure that the fw_dynamic
      * behaviour when loading an ELF matches the fw_payload, fw_jump and BBL
@@ -209,6 +211,8 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
 {
     ssize_t size;
 
+    g_assert(filename != NULL);
+
     /*
      * We want to put the initrd far enough into RAM that when the
      * kernel is uncompressed it will not clobber the initrd. However
-- 
2.38.1


