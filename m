Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E786D1494
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:02:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39H-0003Cb-Gg; Thu, 30 Mar 2023 21:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <39TAmZAcKChg8CA9C164CC492.0CAE2AI-12J29BCB4BI.CF4@flex--komlodi.bounces.google.com>)
 id 1pi39F-0003Bx-MT
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:45 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <39TAmZAcKChg8CA9C164CC492.0CAE2AI-12J29BCB4BI.CF4@flex--komlodi.bounces.google.com>)
 id 1pi39D-0006aU-VG
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:45 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 ml17-20020a17090b361100b0023f9e99ab95so10021655pjb.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224502;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=A+pyeFG3TXhnkPx8nHzV8fFrhPD3LijsaszOI3hOF4A=;
 b=Iy2Bt0+PA6boFbHploToxVXDGmLKxK9O/XC2pUGAp9R6+vrm4g0xvqVEfYZcESzk6O
 VD2dMdz25Hysrh8knEJZeAoqJrYhary9O1IMCyRydb5a7GzFrO6Eh9WpPWk1JCT2ZubI
 6qy1cENWrqntPx+u7vCL0yRREI5PUA/eP3tbz9IpO1dHDcJy+XQeIK5HJWQKTr3GXNjx
 GDqVhXVp+2dvP6ZFDt5B0MVI6ctEsWETE0vk2N2EvsjHED8q7kojd1ZWdK0fdAQstE+g
 gbmhIbdOQBKnciSGQXgecBlWyi6eaTDN0a5fvjJpKki0ZR1CY9f5ix9SI6F9Gsf/Q5/L
 8jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224502;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A+pyeFG3TXhnkPx8nHzV8fFrhPD3LijsaszOI3hOF4A=;
 b=wXxOVM883E9anVbHEsoHKL4OPzCExS3301FG6DMuFeIc0QaUynS2dDn4Yn8kokE7Eh
 5u2RgMQTfu8lvHUTrBjcL0fjiv9qY6JqfZMM+u4r5Zli4d9hIqRiZ7fexJFTF4SHMd5X
 C/JUKCA/pkPSTy9r/zESPOn3Op4fkz1HurlrMx54P+YNGfKJYu3DoVB6b6/tDP4uKOsu
 VCTEZF0lDDXJxj1v4in+HTR0WgtZSKAprpLtyYDxsxDcoqV14+c7l/h79egz/kMbVFP2
 bfnZSYc5iLKeCpWx81JffJg/qFo3YWm6ViL92hOtjl7dWabBR0ORlnrL4s4gaOoVT+Nb
 pkLw==
X-Gm-Message-State: AAQBX9fpsUifeSY27TEWjq8i6VwTknpg/inCoeHX/BZGLWl9J8tTJa7t
 kEvnsZ/+raWVM/4bN9Q1VcXLLYrAzZxzZkhG+lND+h3OvjD9AGooCdfz6YoqHzjP0Q/v/ROycBc
 7+nLvBVXc61H65etfwbZq3gl0xW6UNaleOvOxQsbTYAWxTJEpPihi5KOyrovcPHc=
X-Google-Smtp-Source: AKy350b1wK8vEsr7hKIHFcSOoXRAG6VId6khwK2sjKwZVuUhTHNZ8npatQK3bO7jPq+ljjtd6TaISvKi3ilh
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:903:234c:b0:19a:850a:d88b with SMTP id
 c12-20020a170903234c00b0019a850ad88bmr3038197plh.4.1680224501937; Thu, 30 Mar
 2023 18:01:41 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:20 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-6-komlodi@google.com>
Subject: [PATCH 05/16] hw/i3c/aspeed_i3c: Add register RO field masks
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=39TAmZAcKChg8CA9C164CC492.0CAE2AI-12J29BCB4BI.CF4@flex--komlodi.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Adds read-only field masks for the I3C device and controller registers.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/aspeed_i3c.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 034a17ff8e..6f514bef5e 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -330,6 +330,21 @@ REG32(DEVICE_ADDR_TABLE_LOC1, 0x280)
     FIELD(DEVICE_ADDR_TABLE_LOC1, DEV_NACK_RETRY_CNT, 29, 2)
     FIELD(DEVICE_ADDR_TABLE_LOC1, LEGACY_I2C_DEVICE, 31, 1)
 
+static const uint32_t ast2600_i3c_controller_ro[ASPEED_I3C_DEVICE_NR_REGS] = {
+    [R_I3C1_REG0]                   = 0xfc000000,
+    [R_I3C1_REG1]                   = 0xfff00000,
+    [R_I3C2_REG0]                   = 0xfc000000,
+    [R_I3C2_REG1]                   = 0xfff00000,
+    [R_I3C3_REG0]                   = 0xfc000000,
+    [R_I3C3_REG1]                   = 0xfff00000,
+    [R_I3C4_REG0]                   = 0xfc000000,
+    [R_I3C4_REG1]                   = 0xfff00000,
+    [R_I3C5_REG0]                   = 0xfc000000,
+    [R_I3C5_REG1]                   = 0xfff00000,
+    [R_I3C6_REG0]                   = 0xfc000000,
+    [R_I3C6_REG1]                   = 0xfff00000,
+};
+
 static const uint32_t ast2600_i3c_device_resets[ASPEED_I3C_DEVICE_NR_REGS] = {
     [R_HW_CAPABILITY]               = 0x000e00bf,
     [R_QUEUE_THLD_CTRL]             = 0x01000101,
@@ -358,6 +373,45 @@ static const uint32_t ast2600_i3c_device_resets[ASPEED_I3C_DEVICE_NR_REGS] = {
     [R_SLAVE_CONFIG]                = 0x00000023,
 };
 
+static const uint32_t ast2600_i3c_device_ro[ASPEED_I3C_DEVICE_NR_REGS] = {
+    [R_DEVICE_CTRL]                 = 0x04fffe00,
+    [R_DEVICE_ADDR]                 = 0x7f807f80,
+    [R_HW_CAPABILITY]               = 0xffffffff,
+    [R_IBI_QUEUE_STATUS]            = 0xffffffff,
+    [R_DATA_BUFFER_THLD_CTRL]       = 0xf8f8f8f8,
+    [R_IBI_QUEUE_CTRL]              = 0xfffffff0,
+    [R_RESET_CTRL]                  = 0xffffffc0,
+    [R_SLV_EVENT_CTRL]              = 0xffffff3f,
+    [R_INTR_STATUS]                 = 0xffff809f,
+    [R_INTR_STATUS_EN]              = 0xffff8080,
+    [R_INTR_SIGNAL_EN]              = 0xffff8080,
+    [R_INTR_FORCE]                  = 0xffff8000,
+    [R_QUEUE_STATUS_LEVEL]          = 0xffffffff,
+    [R_DATA_BUFFER_STATUS_LEVEL]    = 0xffffffff,
+    [R_PRESENT_STATE]               = 0xffffffff,
+    [R_CCC_DEVICE_STATUS]           = 0xffffffff,
+    [R_I3C_VER_ID]                  = 0xffffffff,
+    [R_I3C_VER_TYPE]                = 0xffffffff,
+    [R_DEVICE_ADDR_TABLE_POINTER]   = 0xffffffff,
+    [R_DEV_CHAR_TABLE_POINTER]      = 0xffcbffff,
+    [R_SLV_PID_VALUE]               = 0xffff0fff,
+    [R_SLV_CHAR_CTRL]               = 0xffffffff,
+    [A_VENDOR_SPECIFIC_REG_POINTER] = 0xffffffff,
+    [R_SLV_MAX_LEN]                 = 0xffffffff,
+    [R_MAX_READ_TURNAROUND]         = 0xffffffff,
+    [R_MAX_DATA_SPEED]              = 0xffffffff,
+    [R_SLV_INTR_REQ]                = 0xfffffff0,
+    [R_SLV_TSX_SYMBL_TIMING]        = 0xffffffc0,
+    [R_DEVICE_CTRL_EXTENDED]        = 0xfffffff8,
+    [R_SCL_I3C_OD_TIMING]           = 0xff00ff00,
+    [R_SCL_I3C_PP_TIMING]           = 0xff00ff00,
+    [R_SCL_I2C_FMP_TIMING]          = 0xff000000,
+    [R_SCL_EXT_TERMN_LCNT_TIMING]   = 0x0000fff0,
+    [R_BUS_IDLE_TIMING]             = 0xfff00000,
+    [R_EXTENDED_CAPABILITY]         = 0xffffffff,
+    [R_SLAVE_CONFIG]                = 0xffffffff,
+};
+
 static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
                                        unsigned size)
 {
@@ -387,6 +441,7 @@ static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
 
     trace_aspeed_i3c_device_write(s->id, offset, value);
 
+    value &= ~ast2600_i3c_device_ro[addr];
     switch (addr) {
     case R_HW_CAPABILITY:
     case R_RESPONSE_QUEUE_PORT:
@@ -475,6 +530,7 @@ static void aspeed_i3c_write(void *opaque,
 
     addr >>= 2;
 
+    data &= ~ast2600_i3c_controller_ro[addr];
     /* I3C controller register */
     switch (addr) {
     case R_I3C1_REG1:
-- 
2.40.0.348.gf938b09366-goog


