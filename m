Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12BA327551
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:44:44 +0100 (CET)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVjv-0003Ny-Rd
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPq-0005bt-PN
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:58 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPc-0007kH-VQ
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:58 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o10so10361881pgg.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s1JQvNSusTUc8RlPgZx0OC+J+/b+DyOZSi+hnuBILZY=;
 b=vZHpIMGmN/SeRh7r4Y1pJYGmUo6iUtClj6aXZ888DkxIXK3hC1g/cNpHd/z26GAuKN
 b3BlCJkv8xZL/6pjDQq2DJIRcJU6ZgheNIQTy/pxw1OEFqBg4AfJpnlIcN2KXa+YqyRh
 b31kvPn3kol3u4yA5IfiyCz5XazfSNP7zxp6gRwnp8PdqiGmAXfUEwt8n6SFoL2jspOb
 kG43PRXEfdhQ6S7Yo18S0Sgd8Rwk3PeOssImAZ7kKQ9es5yorVlXGeKZpM/6QSDtx5Up
 6q9hqS68uTubItmvKEoVLgHOluqw1H2OEaRmaLophD78e836llBD2qcMhnXvB42YoGcR
 iBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1JQvNSusTUc8RlPgZx0OC+J+/b+DyOZSi+hnuBILZY=;
 b=WgUqxWQVSongAruGJtKMCO3Rd/RaHwdN6tdeWgTTJqBPqxOjlixtLCK+cat8oKgMqK
 LwapS1T09e03ONgmccNOVXfxewWHnh+WP5VJHi6neOPa930sRb93a2i+lvreD5YlQuUJ
 Bhx8o0AJXIt9nA9hX/Pc1k9Vd6jUSHHUp3U+31udwTL1M17jcagIgxbAdPEemFM0Gpf9
 B3ERL3VjbJUhabeLbIGOjHVSYn8G37FPuYoIatOCf2g86psLEY5FAaNgJGJMITQ42gvN
 rVcBF4hrpiNGftG/3HCGeR9CrklQx8Fp23E/umRaeF4Sf30Du6Pu0VLlR4VibrCL0m5u
 6nPg==
X-Gm-Message-State: AOAM5308gDeaIU5JJZZNvRtIqo3G/QPUBHs/4YA+qPBM4uzpWOE1G0df
 cEprquFIjM66D1Z2ImVUlZDKqFPoSIwY5w==
X-Google-Smtp-Source: ABdhPJy0yZNP9AVsdKSXP7+a/X1JjagavCbBf8gYOGjqGZ5kkUkO2ptbfDrfCnUjYU76EBK6jACXZA==
X-Received: by 2002:a63:f808:: with SMTP id n8mr11330443pgh.115.1614554623109; 
 Sun, 28 Feb 2021 15:23:43 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/50] target/i386: Reduce DisasContext.prefix to uint8_t
Date: Sun, 28 Feb 2021 15:22:53 -0800
Message-Id: <20210228232321.322053-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The highest bit in this set is 0x40 (PREFIX_REX).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 19c2034344..79f987b2cf 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -78,7 +78,7 @@ typedef struct DisasContext {
 
     /* current insn context */
     int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
-    int prefix;
+    uint8_t prefix;
     MemOp aflag;
     MemOp dflag;
     target_ulong pc_start;
-- 
2.25.1


