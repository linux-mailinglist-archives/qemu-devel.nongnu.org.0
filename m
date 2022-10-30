Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0722612D81
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:36:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGsU-0004aQ-0f; Sun, 30 Oct 2022 18:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrE-0001br-7v
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrC-00007S-Mv
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:44 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bs21so13676740wrb.4
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4Rx4XoRarxPNVQwv2Y9iLizuh95QlVzLtEAjG48efA=;
 b=QfWaCN0xtsi/AJ2C3jLE7zMOhOuN02i/5ZyXyNquBpnMk76l0hQ1Nf+pciu55Mm9Zd
 C5DufUY2PhAJ0hFh0El6XThOp4KxWWTI/m0GST9IdvuguqFxXo5LVtejU714qyVViqBS
 51QAtbWcVhpGjM7v4NXc4g+N8wtySSeYDMVXI9X6ZzeIKD/289LJ5S47J4oukKQsJG+t
 6dF15q6YsibzbX+d0vKKNrmX4cj0D6NwXGmO1fXwIR6EPdJfp9MVOvrIHFHS1Zt5mXeQ
 GjX7RlFZKgk+MwCG3tFWchreNi0B0ZkZtGp/OSA2Wc+64qyg/gqfUQnpVQ1ojK91VfUn
 UJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4Rx4XoRarxPNVQwv2Y9iLizuh95QlVzLtEAjG48efA=;
 b=ej9aC9crEHiNhbZwLOvxl+tjm2FPLeiPUJMuZPhHxVP1Yx6WXAIjAxNfpqDAaFqgga
 ZbDiDS6G593xJc09BAZDviUCnvciAEaG6Im0+zye3aMjESBNpXRLg/d43Y8yalErbURo
 iyakcq6/fW61kZTU9/E2vbzUnRN8Tt65w7f++7uyLekxp4+W3IuzRCeCwn/l4bErsgfu
 Lj8bIWPdE5Sb7Pn2COG13lafgqPxbz2aExaVnmtSwShY684RZ43BwPG3ej6xDH4JQizd
 Kc9MZMlqeNFLeB5neXlXJWvFrk3PX5gFzWAgJXJlqSnyqXgyZ93LPVc1xh8+E9M1fM26
 h4Vw==
X-Gm-Message-State: ACrzQf18IF6wwswgsG/yVf29RPJUyduzE5hBfI3uvWFqI977pbgCQpU0
 vehAk6U1CwxfB0aIN9LdX5Zv+NShvH64iA==
X-Google-Smtp-Source: AMsMyM4M3S/sS8rsK7MVU7du4956LxZx1hHbtt+RVS9dndJicsSwYmvNgKUPEvahPJykU5toCx6+fA==
X-Received: by 2002:a5d:4a0a:0:b0:236:6c65:724d with SMTP id
 m10-20020a5d4a0a000000b002366c65724dmr6047158wrq.350.1667169161129; 
 Sun, 30 Oct 2022 15:32:41 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c4d8600b003b50428cf66sm5380495wmp.33.2022.10.30.15.32.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 36/55] disas/nanomips: Replace Cpp enums for C enums
Date: Sun, 30 Oct 2022 23:28:22 +0100
Message-Id: <20221030222841.42377-37-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

Change enums to typedef enums to keep naming clear.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-23-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 1832c2d3cf..8b4bc910a4 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -40,16 +40,16 @@ typedef uint32_t uint32;
 typedef uint16_t uint16;
 typedef uint64_t img_address;
 
-enum TABLE_ENTRY_TYPE {
+typedef enum  {
     instruction,
     call_instruction,
     branch_instruction,
     return_instruction,
     reserved_block,
     pool,
-};
+} TABLE_ENTRY_TYPE;
 
-enum TABLE_ATTRIBUTE_TYPE {
+typedef enum {
     MIPS64_    = 0x00000001,
     XNP_       = 0x00000002,
     XMMS_      = 0x00000004,
@@ -67,7 +67,7 @@ enum TABLE_ATTRIBUTE_TYPE {
     TLB_       = 0x00004000,
     MVH_       = 0x00008000,
     ALL_ATTRIBUTES = 0xffffffffull,
-};
+} TABLE_ATTRIBUTE_TYPE;
 
 typedef struct Dis_info {
   img_address m_pc;
-- 
2.37.3


