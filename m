Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3834E8125
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:42:29 +0100 (CET)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6gW-0007ca-6Z
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:42:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qv-0007VG-84
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:22 -0400
Received: from [2607:f8b0:4864:20::22d] (port=34575
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qs-0005V3-Vt
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:20 -0400
Received: by mail-oi1-x22d.google.com with SMTP id v75so11116007oie.1
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L2qbFaN7OaGfKK0O5CG7ZbPVEQZ58wXHUVGPEOy9UfM=;
 b=oHKAD+8lhiXdJD4nu6JXyrx/7AnFLCmFzjhSIJzeSxlijFVfN/hPIvIsoUCBiZT22k
 rRXSctSUD8wmr2lkJqk8Y3sK0zUIfL+WwfRDdlIoU4Pn5jYzrZLPUcK+MIxhUDvL9TtV
 wsJ3fe/JHBDUytggjSlo5J74imcEKkcULPgrK56Vw77JCAeIRC/M7+D6DElHZNMrdvj0
 SmoMfr9KKxq8gxtaxvq5FXx+3D8N06EGOBjMwMpz5dtMXy2c83a8h7HcvHpFkQtStRfz
 E/NaJfRJ4erC36qJahK16MH6U/P8FPL0gDiVeygXjwd83315TqSyaSNmuc96Q0GZPyK7
 Jriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L2qbFaN7OaGfKK0O5CG7ZbPVEQZ58wXHUVGPEOy9UfM=;
 b=mr4bdvFZoFRmIyLwrCC5FqDeDYcovANTLl9FxzZuLlliUDX08SSQg005TFA0MBHGlS
 K/ymnPKJFM0US2ilapzKr4pk/tN6CnI5k3RLFCTNdRJTegl4oFtV0dij3wwVeczmW9il
 nV/y9KSraxHmOJKi2u9v58Rv4W4DQf3WmfSS5BJZQEp7NpJRWo1uPQ7zl59t04iyUgwN
 VHnnpC3AXWwPNy1mIkOfcHbxmjSGhMRER6EafYqglVRn9vUrasGFyDeaNzsX9gSNS1cw
 t60KAntc24X49hvEWFsdHz2gNidxMc2xMRfRjO9pmIVis2IEcEbW/GM5fqEvE+D6vHiZ
 FgpA==
X-Gm-Message-State: AOAM531Y1epzPdWNxiP0qdHKSM7b2A7l551mWgpM844ly1VlqJorKMmM
 gS38EHZdL3xtoRQQ1ZcpqDU4m+iUtTU0UudB
X-Google-Smtp-Source: ABdhPJwXjwERuAvQzv4rGTuykg1OyiEz3bXhBawnnZBKkcganR42d4vNxnhgRV4fCxKwqN3QyWxcOw==
X-Received: by 2002:a05:6808:1183:b0:2d4:5eeb:1ca3 with SMTP id
 j3-20020a056808118300b002d45eeb1ca3mr7997460oil.8.1648301173377; 
 Sat, 26 Mar 2022 06:26:13 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/39] accel/tcg: Use cpu_dump_state between
 qemu_log_trylock/unlock
Date: Sat, 26 Mar 2022 07:25:09 -0600
Message-Id: <20220326132534.543738-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inside log_cpu_state, we perform qemu_log_trylock/unlock, which need
not be done if we have already performed the lock beforehand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8a896e772d..931643a510 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -225,7 +225,7 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 #if defined(TARGET_I386)
                 flags |= CPU_DUMP_CCOP;
 #endif
-                log_cpu_state(cpu, flags);
+                cpu_dump_state(cpu, logfile, flags);
                 qemu_log_unlock(logfile);
             }
         }
-- 
2.25.1


