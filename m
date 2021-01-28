Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE3E30716F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:29:14 +0100 (CET)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52fx-0002lH-D2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52af-0005ez-SX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:46 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ad-0005dp-UX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:45 -0500
Received: by mail-pl1-x62e.google.com with SMTP id q2so2925201plk.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ef0r5gdQfikjl87vGZNBaWDeqf7Ic5J6b7LYEuBGeCg=;
 b=wf0mcJtqN9XKwb+ztupLua5SafJF7s+LxA0rbUxDcxDg7241lkLAnkrCMd/Xey2dtS
 J14bsk6R3Viggc+MFt8How2r+n/CsBCq7yeG1jBQPVLwDKjsRPdJDfFRzbgpd5zFZfLh
 jURq3aHossuWBFS3hMBQWVQgVzrt8iAuRM35PlVHmKu+Zm5Qmj/aq4SI9QkUwGaaIT8e
 Ig29/UIABuZFb7G0kvuCTtlM44fPrlaCi5sozRs9lcJ+d7qWJj6VT6TJmSZPbocFot23
 mWNJ6qhb/9DGMuUNnKT6O5Wn7rk/rEBa9mbQK/TLW4/GYdsGVz3JZe3O7S90+jidxox4
 jzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ef0r5gdQfikjl87vGZNBaWDeqf7Ic5J6b7LYEuBGeCg=;
 b=SuucskBiFZZdxA8XW7skHWRl8knmPMIDklJHWWgn6WGfsNKeD76WkxT25rQD/W9B6U
 DnkVhLxN8IEnzTDF9RZUllEvzCuIp75xOF976vBr7fGJB+0NLSgrXS7FMDm0PqPPMNBC
 N7B/x3SPFLgONhiMUnV5v+EhRMJFXH3TYPqJE1ZRGVyja1RPehss+FUglMSHekWoMPe2
 8zFymgvVQDw3invN3HcKZ3BhJnR25G55RDWxRfX+C3ksgGO7lumYQsYx0MTCTFlbjQhD
 D8pUh2zpRxfvsIS+FRdrd+zIckXzj5lKSXaq6B18+rkzzZO/YGlQbixH0E1oNLvOXWlu
 ur8Q==
X-Gm-Message-State: AOAM530cQUUfI8O/3S9TwdLUxqTrPTyr6Ar2T5y51m+tj4NxUzXG9svP
 V5d7ufAMNy8T7UhPWFqjC5MuiGxcJUSUJ9y0
X-Google-Smtp-Source: ABdhPJy5YEUbEgQ3Wl6/kNkz6BVxRCg7KvWrPoVNjUi1FkhGerdbXK7f0EGgPsVE6kCaAMhcOKYBIw==
X-Received: by 2002:a17:90a:5911:: with SMTP id
 k17mr10055161pji.152.1611822222377; 
 Thu, 28 Jan 2021 00:23:42 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/23] tcg/tci: Implement INDEX_op_ld16s_i32
Date: Wed, 27 Jan 2021 22:23:12 -1000
Message-Id: <20210128082331.196801-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

That TCG opcode is used by debian-buster (arm64) running ffmpeg:

    qemu-aarch64 /usr/bin/ffmpeg -i theora.mkv theora.webm

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20210128024814.2056958-1-sw@weilnetz.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2311aa7d3a..2edb47506e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -614,7 +614,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             TODO();
             break;
         case INDEX_op_ld16s_i32:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i32:
             t0 = *tb_ptr++;
-- 
2.25.1


