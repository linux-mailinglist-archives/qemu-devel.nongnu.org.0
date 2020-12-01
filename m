Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C7C2CA3E7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:34:06 +0100 (CET)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5nB-0006F7-94
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5i2-0002nr-Qx
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:28:46 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5hw-0006KY-Qk
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:28:41 -0500
Received: by mail-wr1-x444.google.com with SMTP id e7so2629143wrv.6
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iA0ePG/LyXWMj1HoCxSdhzXRV/vZBN9smpyyTyM9Sgc=;
 b=AYX/dUO9iRaS5JLYfq4RGdP57EsHxq9o8T5PAZ05+K6aHNEl759NSwDAW3QJRrdnna
 MT1dd4hJFP1+gZKt7CXsGCXB8jdz6hWBJZJ2LG6CnrVGjikld77VMtJPJR+mXn20tWwH
 neJCS+fK9mesDbpSJPSApf+phtEpRJiowR/qrWvbO+u/s3evrrDCD37B5LXarGR7hZS1
 +OnXbJ+DmtVRrusG5T90E/RjFJjA8HRnx7oJ/zqpnB3GFIyW/6kvGdbstJKN/afzzEFA
 8ZQquLpH72QhdoFm50ko1yOKgTUU4DEB2K1R7vTk+f88cCsUzNzUVWFAFVuEr7msmc2x
 4OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iA0ePG/LyXWMj1HoCxSdhzXRV/vZBN9smpyyTyM9Sgc=;
 b=G2+WT5qLEj+FrXrCX5wmyN2TlPEw2QwgI6o4BydhLhYVKVIOxKieglgmHj8/wtjJch
 wgJT2WsPXl/MRy6I0u/Q50LoK8WjmIwbdHGB2zuyeZftzZQtbuf95otrKKLc9mgYpFg8
 WXS/AZwR8CRpR6+VGZn4v+1KvmgTH4nvZ/BaQvTO4dH3q4b/w+wuzSdCNqNgQOSIIH6W
 Ju2PNyyDRq+64rPZL9FG4IsV2MQKNxlmYw/7I0CLkIXZ3zNrDe3bSWVnJAxulallV+3k
 ZEx2/DUhPSfau/N6RlkW9eQEPNUv3guCWDXft91ZdhL0wrjhLb3yHCz04Pk2H75eJ8q+
 NGVw==
X-Gm-Message-State: AOAM531C+C/BG9UokIfZcXXp5ZC/V8ooj+PogmxlbzcorIgrXa9Xw8jQ
 lQoLo2J4yPWMCTkjx7WGapw=
X-Google-Smtp-Source: ABdhPJzyoGuBk1IihaQyeqkhSCk0j//a6bocCS6Xx/EbK1u2xCLrwyl3TkxnEn5kB/r2owhOmnzZHw==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr3939280wrj.162.1606829315358; 
 Tue, 01 Dec 2020 05:28:35 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id k11sm3123200wrv.88.2020.12.01.05.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:28:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/3] target/mips: Explicit Release 6 MMU types
Date: Tue,  1 Dec 2020 14:28:17 +0100
Message-Id: <20201201132817.2863301-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201132817.2863301-1-f4bug@amsat.org>
References: <20201201132817.2863301-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of Release 6, MMU type 4 is assigned to "Dual Variable-Page-Size
and Fixed-Page-Size TLBs" and type 2 to "Block Address Translation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index dd8a7809b64..d290c1afe30 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -15,10 +15,11 @@
  * CP0C0_MT field.
  */
 enum mips_mmu_types {
-    MMU_TYPE_NONE,
-    MMU_TYPE_R4000,
-    MMU_TYPE_RESERVED,
-    MMU_TYPE_FMT,
+    MMU_TYPE_NONE       = 0,
+    MMU_TYPE_R4000      = 1,    /* Standard TLB */
+    MMU_TYPE_BAT        = 2,    /* Block Address Translation */
+    MMU_TYPE_FMT        = 3,    /* Fixed Mapping */
+    MMU_TYPE_DVF        = 4,    /* Dual VTLB and FTLB */
     MMU_TYPE_R3000,
     MMU_TYPE_R6000,
     MMU_TYPE_R8000
-- 
2.26.2


