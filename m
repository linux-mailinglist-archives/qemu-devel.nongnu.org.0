Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335463B9406
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:35:02 +0200 (CEST)
Received: from localhost ([::1]:32936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyyiT-00060K-6g
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZk-0004eH-6w
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZW-0008Ez-Gx
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:59 -0400
Received: by mail-pl1-x634.google.com with SMTP id s13so739598plg.12
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXN13A+EVZfIbPM/1TIJvsr4KsfxBAPJnkVnda2aJXw=;
 b=HLk2AkTtwOsBTpKS3AyU1e0Nt6/vo5MQWvVc+6vyABvk0vMZX6Gi6zJ74qZrL09CYT
 6QRUIDFnIu7rCdRYGwn8/Enrj4qXPlrZqQoeuE8bZCge6UH47F9HhBma9KOgHKbx6Zo/
 5+0Naw/GPvX3Pp0GG2xx6S+zeDnZjmbxHHHOiXvq/ESKzpJGjGOQumU18TZiAg40P4zp
 MkMEhoG3V6DeoY2IzqVaE+Zy8ar1FAns0UZyu+O89l82Y/JDWfRbmkiZPeq7vqcc3yTI
 4w5uGIEmLQZtHGLvyZWo4UAI/7OyOK3ZC88T9KkD2TgpxigWma0d0FBH8ao8LmDJH0mF
 i5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXN13A+EVZfIbPM/1TIJvsr4KsfxBAPJnkVnda2aJXw=;
 b=o378D1Ag5Cb7RUuMQ0qmsVsE9kPnG5TqW6sbxHlTw4M815adyh1hCGnnagL123ZJ7R
 mc8I/jffLhQhxK0AsZlHEvTY8PL+6FDJtXx3Zif7lmbpE+HhGNCpK9+pfKX1S4HFb7N7
 T4Ct7xIKKWYbLdXaGX6pcH1/kg0DeFwlsIA6TezcIs67G4qUzyE/+DWyWDZtePiXpRhT
 H3Gf2JaksnGLp7Br1CG9PG+mHBLXvclmafwblVWPozgDoo4mLAvrNE5MpNaSL5dHLWrv
 z44l7I5idMUTDmmSJvCip7vZuzt5zC5y0q9tc5zMCRq7/guhOO5rg6whJhBatLP+5GPe
 cNCA==
X-Gm-Message-State: AOAM531O+U4OmHE/ltoexUanIECl6Pi4GnrV5llb0HjC/cp5/+zVWHA0
 2yETbSIxqETJnFv96CuN1BjtcfpdlqZp9Q==
X-Google-Smtp-Source: ABdhPJx4vhbB/4OIypggMWdRdOdsQAp64viw4Zk/ht1wdrjSEuPu83mIkgFfr94TdtxUKAOqFhj3tw==
X-Received: by 2002:a17:90a:9205:: with SMTP id
 m5mr10628081pjo.172.1625153144640; 
 Thu, 01 Jul 2021 08:25:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/17] accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
Date: Thu,  1 Jul 2021 08:25:30 -0700
Message-Id: <20210701152537.3330420-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of suppressing goto_ptr from -d nochain had been
to return to the main loop so that -d cpu would be recognized.
But we now include -d cpu logging in helper_lookup_tb_ptr so
there is no need to exclude goto_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d3232d5764..70ea3c7d68 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -150,7 +150,7 @@ uint32_t curr_cflags(CPUState *cpu)
     uint32_t cflags = cpu->tcg_cflags;
 
     if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
+        cflags |= CF_NO_GOTO_TB;
     }
 
     return cflags;
-- 
2.25.1


