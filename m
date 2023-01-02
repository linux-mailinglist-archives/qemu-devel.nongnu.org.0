Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D65665B19A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:57:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJNH-0007G9-Fx; Mon, 02 Jan 2023 06:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJNE-0007Fe-UX
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:53:00 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJND-0002vW-Cl
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:53:00 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-144bd860fdbso33496992fac.0
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3cARjG1/wwT2hePMTnt8/W2vA3rPNVOtanqBwKMrFs=;
 b=pmfbqOZC6/jh2dRtZBXFkSR18HYOOBZAjCGIvUJSf/dGllvN8IAnchSYgZ2jtIq88W
 g6vQ0i38y02NAbl8KjZG2KD1u1hWxUtfG182aHkWnSLCLk7gx4rG3x8yi9XpoR9ZJG0r
 d17gablDCW9n0l+VETE1sGAJD15FixW1OvYnE5W7oMcPnmuZ+VOFJEoJoGMlgIwZR8g9
 NnwYNTc6PaWGPbElRkl1isq8mcVKe4gYUysBLgtrYmfgBCsBCAiYkaXLDqDIPCvguCVa
 OAG8QZAKsE4KU9ZV3HEV+YBpxxMgyBNPQS+S66TM9mFGw7HWThS1VUSYIjJ8Xq1g+LIm
 dZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3cARjG1/wwT2hePMTnt8/W2vA3rPNVOtanqBwKMrFs=;
 b=R0CkM9pX50JIAu6phKsnSheQZWstRMMGk3fJXncYFvblOzpTYjJ9GMz/Fg8WhDmhLg
 GDOQ5lX6U/mQLf+SZB43KxGHZYaOjVeoXSqhM1sU7DKB4oT7KwLBZdbd5Ozfb7+FHOmz
 DZRHU0SWDh5BKup/dtSgFbun0sXEYOtiNsSjP4tM8qfVzb795BLWJ93QwEx0EzmUtAYW
 sY8jlvvZ8mN/HGoxdR1um6qvQnbqKBQZNuWtewoSfRyh9+5suqqO2uk0OzoFOYqf8kKA
 EeyILM+uRfABVLWAQdphKofaLI8o4GZb1bh3FaNnJDwlcU7WXqw+4p/MWUkpvSDzJPQV
 FS6Q==
X-Gm-Message-State: AFqh2kpyr8F312QNHMo67wvuM+smvBHHzej/DUzUHh1oRKp86HmFA3G3
 IRxysPQWTyt1m1phIm70yxWB3h5aZoVnEUFt
X-Google-Smtp-Source: AMrXdXvzyxsNdC8fIt03RXPijjHzHCjxQACNpy8BM7CSCL9Rd6UcCzV14qqoZZ8Bcnw4hjyIjxI/3Q==
X-Received: by 2002:a05:6870:578f:b0:14f:b93f:941a with SMTP id
 i15-20020a056870578f00b0014fb93f941amr12576540oap.50.1672660378072; 
 Mon, 02 Jan 2023 03:52:58 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:52:57 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 04/11] hw/riscv/boot.c: exit early if filename is NULL in
 load functions
Date: Mon,  2 Jan 2023 08:52:34 -0300
Message-Id: <20230102115241.25733-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102115241.25733-1-dbarboza@ventanamicro.com>
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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

riscv_load_firmware(), riscv_load_initrd() and riscv_load_kernel() works
under the assumption that a 'filename' parameter is always not NULL.

This is currently the case since all callers of these functions are
checking for NULL before calling them. Add an g_assert() to make sure
that a NULL value in these cases are to be considered a bug.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 98b80af51b..31aa3385a0 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -153,6 +153,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
     uint64_t firmware_entry, firmware_end;
     ssize_t firmware_size;
 
+    g_assert(firmware_filename != NULL);
+
     if (load_elf_ram_sym(firmware_filename, NULL, NULL, NULL,
                          &firmware_entry, NULL, &firmware_end, NULL,
                          0, EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
@@ -177,6 +179,8 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
 {
     uint64_t kernel_load_base, kernel_entry;
 
+    g_assert(kernel_filename != NULL);
+
     /*
      * NB: Use low address not ELF entry point to ensure that the fw_dynamic
      * behaviour when loading an ELF matches the fw_payload, fw_jump and BBL
@@ -209,6 +213,8 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
 {
     ssize_t size;
 
+    g_assert(filename != NULL);
+
     /*
      * We want to put the initrd far enough into RAM that when the
      * kernel is uncompressed it will not clobber the initrd. However
-- 
2.39.0


