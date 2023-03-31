Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6356D14A3
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:05:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39I-0003Co-Fy; Thu, 30 Mar 2023 21:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38zAmZAcKChY6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com>)
 id 1pi39E-0003Bg-M1
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:44 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38zAmZAcKChY6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com>)
 id 1pi39B-0006aI-PW
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:44 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 a9-20020a170902b58900b0019e2eafafddso11965413pls.7
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224500;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XOXRBZo6SUoSd57AynvNd+UVB2okpfDqLUFbHhxgplU=;
 b=pTogh7lDs/GEKRGo3to58z1Sxw3OD8mhx7g3RSwhV0K2yrKtMNDF4MyZIjKjoS9JaU
 l2KBBFIAMvmDa1q+hcgL2ULE3wd99byyNQt5shw/pYmy2JhFVOwQG2IyN+yLaZM6Bx7k
 D0Jr7TM+Ms3Ov1thm5nUo4NsUhAKDa1rLc7oNqyT0KETgwWNeVXc8X/CVbZIfvYeITqx
 5NHdxx8fe4VmIBNdYy37ibeGmhZoih+1IhhwlFa3AGPLULtgaL19jrYAA7ZaEG2igjrA
 u4QMhp629Y8dKd+TzAi9X40hpxeblaVrpWKcnA8cC/IFfKwHXXZorll6qvTkN+qMAPbq
 rIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224500;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XOXRBZo6SUoSd57AynvNd+UVB2okpfDqLUFbHhxgplU=;
 b=8B26z9vikTSM9x3r3v+A2rhbGQiangkZBwKlQ9qZG8jvETZo23TQR9DhwQs74ho8xF
 wuDFC2PoKRc8C9FfjQtjlWU0ZpbBd8i9L8pA/9AppnlMunFleCKof8aSDZgE6Xwza5jN
 AGSNLLyGjK+XO3msLmYqH9rZRd8ChdB9An34+iBSI4NH+fsYkVAcLVzB+r+xe4G1ONmp
 rVgplKfa9xESL96AGuAndiC0oBibuiI/o0Qxk9eVWKyo/n+mm+EoFsNtEqSUHATpZjwP
 odjps4nr2z7mVgpqaU8OANAQmSUPIIDhWcpO1H3Hy5yijNDqj6dLCk9fFGtqoEH6FNGd
 5nDw==
X-Gm-Message-State: AAQBX9cZayZBQtbkWVtFR+uhymgkVRa8RVHj/1k7OqfJrURFAoZhH9m0
 NOVnVEVTABjf0bK8hpOz1hiGeDkNgBMKfg0MK/eTzppG0FGL7ooP1RE/aN/V3zwd0lDLyGs2rnY
 CWnM/Cu/+0D08wTi6IuPfr/NvfuU5V/xf8E8G6M1oCH5tqfR9O7ROhpYWA9OC6wk=
X-Google-Smtp-Source: AKy350aFkDqEJs7zIUFN4xtt6o4T6UU2uynbcOi41xETdiSSjkMlgd1XWzmNZldeTiCf92sU9XlY489V5oJt
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a63:a4a:0:b0:502:f20a:6e0a with SMTP id
 z10-20020a630a4a000000b00502f20a6e0amr2426079pgk.0.1680224499997; Thu, 30 Mar
 2023 18:01:39 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:19 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-5-komlodi@google.com>
Subject: [PATCH 04/16] hw/i3c/aspeed_i3c: Add more reset values
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=38zAmZAcKChY6A87Az42AA270.yA8C08G-z0H079A929G.AD2@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x649.google.com
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

Adds reset values for the new registers added.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/aspeed_i3c.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index ae247e03bb..034a17ff8e 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -333,12 +333,29 @@ REG32(DEVICE_ADDR_TABLE_LOC1, 0x280)
 static const uint32_t ast2600_i3c_device_resets[ASPEED_I3C_DEVICE_NR_REGS] = {
     [R_HW_CAPABILITY]               = 0x000e00bf,
     [R_QUEUE_THLD_CTRL]             = 0x01000101,
+    [R_DATA_BUFFER_THLD_CTRL]       = 0x01010100,
+    [R_SLV_EVENT_CTRL]              = 0x0000000b,
+    [R_QUEUE_STATUS_LEVEL]          = 0x00000002,
+    [R_DATA_BUFFER_STATUS_LEVEL]    = 0x00000010,
+    [R_PRESENT_STATE]               = 0x00000003,
     [R_I3C_VER_ID]                  = 0x3130302a,
     [R_I3C_VER_TYPE]                = 0x6c633033,
     [R_DEVICE_ADDR_TABLE_POINTER]   = 0x00080280,
     [R_DEV_CHAR_TABLE_POINTER]      = 0x00020200,
+    [R_SLV_CHAR_CTRL]               = 0x00010000,
     [A_VENDOR_SPECIFIC_REG_POINTER] = 0x000000b0,
     [R_SLV_MAX_LEN]                 = 0x00ff00ff,
+    [R_SLV_TSX_SYMBL_TIMING]        = 0x0000003f,
+    [R_SCL_I3C_OD_TIMING]           = 0x000a0010,
+    [R_SCL_I3C_PP_TIMING]           = 0x000a000a,
+    [R_SCL_I2C_FM_TIMING]           = 0x00100010,
+    [R_SCL_I2C_FMP_TIMING]          = 0x00100010,
+    [R_SCL_EXT_LCNT_TIMING]         = 0x20202020,
+    [R_SCL_EXT_TERMN_LCNT_TIMING]   = 0x00300000,
+    [R_BUS_FREE_TIMING]             = 0x00200020,
+    [R_BUS_IDLE_TIMING]             = 0x00000020,
+    [R_EXTENDED_CAPABILITY]         = 0x00000239,
+    [R_SLAVE_CONFIG]                = 0x00000023,
 };
 
 static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
-- 
2.40.0.348.gf938b09366-goog


