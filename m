Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D728B67C3F1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu27-00007y-NQ; Wed, 25 Jan 2023 23:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu23-00006N-Gd
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:40 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu21-0004OR-TW
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:39 -0500
Received: by mail-pl1-x636.google.com with SMTP id z13so912795plg.6
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9o9Kqlm4R8WHQAINVfaYH28J5DgA1McwtQxHNZ+nmQ=;
 b=i+6TR3WypDeSkb5T1+LwAjTNom+Yf8SM7IBIzWXbFHMZuYkBnP43Ni+tfT+MDvQVZw
 wf7tg0OkDXu3kbWEDxlB3hpvyuUxY9HMEjp9q2JIBm1tCbXYMOsO3eBjr3dn1qTYncOd
 Y+/mQiRwfH7lg8GfcEyCeuxjqxnKoPdXTNneCv4mxqdPfiaCKqqQ23NteAziPHLyI1pm
 zAE5TZ7Sry6FXEa0M2JpIqy2g/sZUGoFYNhTdzR7YbytPGcrKOYAdt3noYeXvU4aRA9U
 VFbnBTMcLYtRPiSy26rSS0RN9vtxWhI5c+0ScKM6rsU412qag9S/SLFEoduDhKtgwzr4
 f4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9o9Kqlm4R8WHQAINVfaYH28J5DgA1McwtQxHNZ+nmQ=;
 b=HN1DMQLn6jnQyxtjW6yI7OXOqOBf6AFVzmBpX2XmwBjzcuCF6Wr0f+xPjcOYNK3DuY
 eu/P2gPIbDZxMsRtSwHy3AENeXlul5V1pmcnc2pIk3t4hfpxga8o65Na8hnvF6DMBRQ9
 N0DEEYHKGyCJaKYJzJCV3L0UnZqsWHOQTphaEIzcV3sdi3uWcOA7J1hRvR5nSb8wbNl7
 aM26l3sZXmt32CEX574NFC2vjwnaB/k3zvEXKI2A8VoQEUbh/Li25SgzbdYSHms/mIUU
 NbHKsBJ5JPKe3pPFI2UrTDdNjEip9fM23c821N/YHSD0jeKArApCITKoP9EWecfliQZS
 Nk4w==
X-Gm-Message-State: AO0yUKXPU/WzBHrD/JGFtEYhjtEPKJkCOZfhhEUISzzVcb+NzbdLALX9
 ecscLtBqAA2RqD9JhCDTIHVLVMK9ZnXnTPhSl4c=
X-Google-Smtp-Source: AK7set+eOxFwVO7ZJa84DpuV4a5NWuJYuxFzwpFBMXJ/wDPoCwW2KQYSC/0WEWAJ98NqRxR2Lnk2Eg==
X-Received: by 2002:a17:90a:1da:b0:22b:e2ef:6845 with SMTP id
 26-20020a17090a01da00b0022be2ef6845mr10552033pjd.41.1674707912408; 
 Wed, 25 Jan 2023 20:38:32 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v5 03/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Date: Wed, 25 Jan 2023 18:37:51 -1000
Message-Id: <20230126043824.54819-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When allocating a temp to the stack frame, consider the
base type and allocate all parts at once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index ffddda96ed..ff30f5e141 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3264,11 +3264,12 @@ static bool liveness_pass_2(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    int size = tcg_type_size(ts->type);
-    int align;
     intptr_t off;
+    int size, align;
 
-    switch (ts->type) {
+    /* When allocating an object, look at the full type. */
+    size = tcg_type_size(ts->base_type);
+    switch (ts->base_type) {
     case TCG_TYPE_I32:
         align = 4;
         break;
@@ -3299,13 +3300,26 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
         tcg_raise_tb_overflow(s);
     }
     s->current_frame_offset = off + size;
-
-    ts->mem_offset = off;
 #if defined(__sparc__)
-    ts->mem_offset += TCG_TARGET_STACK_BIAS;
+    off += TCG_TARGET_STACK_BIAS;
 #endif
-    ts->mem_base = s->frame_temp;
-    ts->mem_allocated = 1;
+
+    /* If the object was subdivided, assign memory to all the parts. */
+    if (ts->base_type != ts->type) {
+        int part_size = tcg_type_size(ts->type);
+        int part_count = size / part_size;
+
+        ts -= ts->temp_subindex;
+        for (int i = 0; i < part_count; ++i) {
+            ts[i].mem_offset = off + i * part_size;
+            ts[i].mem_base = s->frame_temp;
+            ts[i].mem_allocated = 1;
+        }
+    } else {
+        ts->mem_offset = off;
+        ts->mem_base = s->frame_temp;
+        ts->mem_allocated = 1;
+    }
 }
 
 /* Assign @reg to @ts, and update reg_to_temp[]. */
-- 
2.34.1


