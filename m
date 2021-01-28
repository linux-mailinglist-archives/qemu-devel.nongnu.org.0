Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9122B3071C5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:42:15 +0100 (CET)
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52sY-0007av-Lu
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ar-0005vH-HC
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:57 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ap-0005ii-S7
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:57 -0500
Received: by mail-pg1-x536.google.com with SMTP id v19so3783826pgj.12
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lFaT0dC4rp7zkvcUUlivssdk4QAkUEVBjOL/yrkJyPY=;
 b=LHHgzj0j5lmqz+2Y0Vn8VC1ne+svugTSM2hOvOrSbuV3MrYqrKF2fdq3Enm53hf29U
 /BGuxQn0kXvElEL9f+zaouX5tsHk+ugZ81IneqIu2GRZCXZkf/4EBqsupfJNpeSHHfIF
 ahF88gHF+RCAeOmbtpcTTOOImdHq1YznRQYXqJXm2K38r+zVC661+gybrSWAP2AQRXW+
 SFm2DsF98n8ifAVSpm8X+85ulAofQxy7Vd6MnOZlmvi3DOms21CITXBF9p/rPhEJiWdN
 E5uyP1StOb6UhM05EByGUYl1a1JWf6UAFlSWdm94ESrZp9lrBraseRZIeHFIstBuITut
 pzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lFaT0dC4rp7zkvcUUlivssdk4QAkUEVBjOL/yrkJyPY=;
 b=POIkZTW4Ym34eqBKzRUDJtFzVQ1xNQZmIYYt32+jwup8+Zcpc8fMwHGwH9uiXnTVzt
 CD0cYIvLXN3yCoRGmWZOFk0b8HEl/spQyV+AuA22+7BYqswQonyVsAnaebSQ5cHXiHU3
 KbwH8iIALqf3Bb1SIq55cd0wofXoKq1kMHUjstH0u0qKIy0ZufjrcH7t/hZziCz2MEd5
 OrLDsCBIZtxqGetvmj6xoR1zFNYpiltf9Nu1JJo5ymNb/TjQfsai+hh6YgQY+w5UGs2D
 btjZFV0HkojhZxME8bL50LO+mG51YuKbG2S9X5pL6RFrx0P8XNue66ato/P4H8zrv9Yn
 9diQ==
X-Gm-Message-State: AOAM532QoNWXQNY2tiRw+L6JKo+zlwas/1dChVWlElJP4gSZkitF+X0H
 FIXHMi6GYPA6qhmAAehefxUmUZI1Y8qtL5vf
X-Google-Smtp-Source: ABdhPJzbmxM5sywUgN5cEQA0edHyK9xSeWAiunIn861137RuV4AiK9yp97W+ZuF+3lyPr9PDdFt+GA==
X-Received: by 2002:a65:58c4:: with SMTP id e4mr12106867pgu.151.1611822234551; 
 Thu, 28 Jan 2021 00:23:54 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/23] tcg/tci: Merge INDEX_op_ld8s_{i32,i64}
Date: Wed, 27 Jan 2021 22:23:20 -1000
Message-Id: <20210128082331.196801-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Eliminating a TODO for ld8s_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 019035d52f..7d11982eb2 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -578,7 +578,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i32:
-            TODO();
+        case INDEX_op_ld8s_i64:
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
         case INDEX_op_ld16u_i32:
             TODO();
@@ -845,12 +849,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld8s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
-            break;
         case INDEX_op_ld16u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


