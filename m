Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F263732755D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:51:39 +0100 (CET)
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVqc-0003FQ-Uz
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPp-0005Y5-E4
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:57 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPa-0007jV-AU
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:57 -0500
Received: by mail-pf1-x42d.google.com with SMTP id t29so10256283pfg.11
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rvmtZ0DdIylqRJGvy/9km7r4m1WC7louI5l6231nRKE=;
 b=nixr0SVaFd2dQrJNJy0EQ5Isu1Mh5pEupgkEFHK0h+dpVOPdSXtzoa4rnL03NKOpEg
 IZZ4111C5C6g2S/NQUFVNzRL9eAX7hVuwh7cmBfD2agMqFAiUsWP1oeI3V57HTALADD1
 9A7Dvj5thfUhWugVccAd7muO5rv+b0OVyXjwPJe2bsl2K0YzQU4zruXQLhmRr85gjot1
 0v8+J2ZD+jVIGp4Mm1axSQxXklFD3HJF6MSpsbx4xKy7H4VH1wOB9+ibhxASIV8LVfgA
 VK2gFTFwW8spwU9G9caVvnGYZ4ADKH9jeevn20SNXJHXiPhhGQTbRE6K3nwY+846OCCE
 RQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rvmtZ0DdIylqRJGvy/9km7r4m1WC7louI5l6231nRKE=;
 b=fbPF+YJAW0+PIVLW4GDSDjvL+WyZixHEnPRx1mzH9RsaW7Z3MzTUx4e1wqOFvrJ6Mx
 nly+Anq2sl56wG0TJP7XRaffhDxHi079RGBbY4UsCjCtmG9BXFKn61BXDUsOi4fwKudH
 BLFiBDdbgcUZROd/MppXhBuD5hl1l6qVwKoMQ6F9wyCLIoljZtdMkEWikKVe4R9f+EIV
 4qr0ZVj2vO4un4TLtuzkQKHCJQ9uYkAJ3c8Oye5IKl5bfiFjx9u/yjR2oSREvesOxNyv
 suo+LjAhw3JbawzLlhNH2JG4n92cnRkv/fbUs+P1oGNboYVbcDa20Yv62KwFk9EfXYpR
 XwjQ==
X-Gm-Message-State: AOAM5332fzaPEZPrTHrM/sjes2oiamDBQstGuelrrUbKinqCl8ur3tsT
 HA8vO4OH5EBFQgrDHwWxKa5Yr2BLcFrSfQ==
X-Google-Smtp-Source: ABdhPJzldHF4DaN1RQfMVJyGv0EuXkZQ096WxfIDYOaKaPymmHZzfaTW0k6KED9G5LQfYOJQy1tcUA==
X-Received: by 2002:a65:4083:: with SMTP id t3mr11398721pgp.150.1614554621046; 
 Sun, 28 Feb 2021 15:23:41 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/50] target/i386: Reduce DisasContext.flags to uint32_t
Date: Sun, 28 Feb 2021 15:22:51 -0800
Message-Id: <20210228232321.322053-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

The value comes from tb->flags, which is uint32_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f4af92886f..39af69585f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -105,7 +105,7 @@ typedef struct DisasContext {
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
-    uint64_t flags; /* all execution flags */
+    uint32_t flags; /* all execution flags */
     int popl_esp_hack; /* for correct popl with esp base handling */
     int rip_offset; /* only used in x86_64, but left for simplicity */
     int cpuid_features;
-- 
2.25.1


