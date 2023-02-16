Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E458699520
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdww-0004PD-QL; Thu, 16 Feb 2023 08:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwg-0004Ip-6C
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:08 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwc-00020d-Jk
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:05:05 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 y17-20020a4ade11000000b0051762fdf955so204341oot.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hK7hUX9DpCweRWw5pi7iDFzv4O4v8vKk9BPAoNwGEr4=;
 b=PwEP8PoUSUUhlc/r1rPXY07CJCpr2oV1HIRW+Zv0IYBNCrlpOPhrR3m3SrlKJOmoXm
 YJLFN1CWOloIVnL5jeGe3LZDPBsYoUkfK5lRJLcxpu7qa+a6peexpuVq7lppsPrTrBbA
 gqr6eNqJvuWZ9Krim9vE/EgRZPBFmzqLR/4ihNhsjGIIcPw2ryGAKl5h7SbTXR0ms3kP
 Op4p15V6aLj8LRuKdQkQELziv4ssYGrY71HtO9ByEcquAFhrqWIhij/7V8zk2ozeaZoE
 T4JBGTnvSVZZWMyxr/psgSGXCdCE0Z1IMv6l9ApgEtc779MX8Xm2bULPQ6eYZa8XNuE9
 hb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hK7hUX9DpCweRWw5pi7iDFzv4O4v8vKk9BPAoNwGEr4=;
 b=zanVL0U8bs/aJG8yb59Ba+lYcN5pZKBbi3jqP+NtzfZ04jH0fNKKlIEihTmNLxvm7W
 FrUKK8+bqLoDgNJP0uy08GVX+JUBDaefqGwmCDbC1B9662Rqj6/mUjZ36wRlmofY5PvF
 3DPCZZrTjMFUuhj0W7bN20LZLOKrRWXexr53FZfQXNBYydNID5EcqtzR0NvZIkHWP1cd
 NqJTOaVQj/54negQHRKuyeMjQT6cmegVvJZqyL4l1XqIMewbsXUFYJtqUgQm54PGGmlH
 yKxUOsED7wF/UgCVM5l3WOZqCiI7db2wdJ/j3FnUJbuk6RAfZDGsGD4Kz7GT1C9kt16l
 7N4w==
X-Gm-Message-State: AO0yUKWkqwN6tlUGNUOaqg8qs4ngF56RN4Lpv2jDjf8YNBd7MG60ycHz
 fISvXWVrH/Zxg9XC6MsMLDfB+UNTs6ZQ+EBl
X-Google-Smtp-Source: AK7set9BVhHVYEONygd6Qeq6Rf6V9idsQvUH69FFQp2/m+M0/CCjfiyDSc5twoBrKFx7YJk2Yh76ag==
X-Received: by 2002:a4a:9871:0:b0:51a:9c6f:a7a9 with SMTP id
 z46-20020a4a9871000000b0051a9c6fa7a9mr2635761ooi.1.1676552700627; 
 Thu, 16 Feb 2023 05:05:00 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 02/10] target/riscv: remove RISCV_FEATURE_MISA
Date: Thu, 16 Feb 2023 10:04:36 -0300
Message-Id: <20230216130444.795997-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
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

It's unused after write_misa() became a regular no-op.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..01803a020d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
-- 
2.39.1


