Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F6F3071D8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:44:32 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52ul-0001g8-9V
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52au-000649-Mo
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:00 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52as-0005jm-Qr
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:00 -0500
Received: by mail-pf1-x432.google.com with SMTP id f63so3502936pfa.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q83BJIWsR5r5VZKO+D5Uu4FbRZzfyeYfyyPPiEe0tU8=;
 b=y1Nc7WCPgq7XiXpeiGkA6A5R24yythycob6a7aEnW/+9eKYqmu2Y8hSQ8JxiRqN/wQ
 DvhYy/Z1L6byGKTa47ucjHAJ84zrc1RHH7TXGl6MEoCflHEnf4KXvYIyYXyGx7LhMRY6
 CML/qKpmPPP/xbiO/Dbm13kX0RoS4Q/0uLi1ZgorYOBf657ur26Z5EnPm8MFCz3l7mNX
 6iHqOotGkf3EQW3GeRmQg1zujRtwmp3XtHnpAAgdE7Tj+5Z1id2yI+fFBpnzMLC02lUl
 Galc2UoYlH0dwEHv5GpjRJptCbxaimkIxpDRPRVRKUJPBIABR3IZjdnOhIqQfYU3t5aA
 qdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q83BJIWsR5r5VZKO+D5Uu4FbRZzfyeYfyyPPiEe0tU8=;
 b=akWz2xiTmgTS4CVw3ilhKZY9Jeu/cLu/rEY73p7yuOoukg0P53nVDTYicJ+6m2CYlf
 VhPLR0EfK19ofNC52pDUvC2sLYZDUtS48QMGPVFomgljmOVMLIZ62kKSm8Uj3rdzVA8I
 36RUYwZGmh16gMWiN0CIHpK4v5aN5PJhd3vnhsibZ3H6mdbonecjMZrwVHlKHcdXAx3C
 ardGNHOZTeLuXz+3pSFHou9KyEAw5LTXC9B2JVO0qNWFbpy6KS4WvxXgTZqZCMUt7n5l
 blj8gtkvXgMBN49GAEDleZTGBVEePYIW0JFCGkBXFC9LH34QoTZNO56jhXxygwC2cKEq
 aWFw==
X-Gm-Message-State: AOAM531G6u/vmbDuyWm0s8BcUBvEGlp/z/+D29CBdMozbarRdKYlBx9N
 0VB8hPoeG9j6CkV6BtBQUBwkbKgpQQtdGZ0E
X-Google-Smtp-Source: ABdhPJwYMj8qCqAsB1ApuvM6h163JJnofynMxFbk0oiNV8YPrcEaYXX3e3TNSTHoyQobhu7s4mVTWw==
X-Received: by 2002:a63:1f21:: with SMTP id f33mr15652649pgf.31.1611822237602; 
 Thu, 28 Jan 2021 00:23:57 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/23] tcg/tci: Merge INDEX_op_ld16s_{i32,i64}
Date: Wed, 27 Jan 2021 22:23:22 -1000
Message-Id: <20210128082331.196801-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eliminating a TODO for ld16s_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index d197803dca..95625701bb 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -592,6 +592,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
             break;
         case INDEX_op_ld16s_i32:
+        case INDEX_op_ld16s_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -853,9 +854,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld16s_i64:
-            TODO();
-            break;
         case INDEX_op_ld32u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


