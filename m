Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095AA4E812F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:54:50 +0100 (CET)
Received: from localhost ([::1]:60706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6sT-0002aS-2k
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:54:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qy-0007XU-GO
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:24 -0400
Received: from [2001:4860:4864:20::2e] (port=43745
 helo=mail-oa1-x2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qx-0005W3-5H
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:24 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-de2cb87f6aso10702848fac.10
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i47bs5CBOE5da9L+yyKjt/bVgLDqpLar0tLDMlVsDtQ=;
 b=NAu8kTcbn09tztmTi28UI3LWvUPYTfZq37ZUq9q4LPv+l0pVnQ/KTxgivz/XmGxCty
 UaqslFrhY4pkVIWt1AVMRoBZljqKVi3RHVatcI0h63hxZPgbY76hjGXA2Omhk+OHmUo/
 jx8B7u5ym1t9T/FVK23drvT2OJhviOv6qdKU61jytJu7yPg8rLR8PdUH08Rysruabc0V
 RV3j6wE00a7E8ttpAf9quEjgKvlaxvCVOm2QEv9sw/HPmAyP/SZdYOnQFsD/mS69ZlJs
 o/rDa2N8/i+r7xTnIF8AgCYeKdKoDiU0I9yI49sBgvHQ5vEOUmiVg3olhIalCg2ERhe+
 W5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i47bs5CBOE5da9L+yyKjt/bVgLDqpLar0tLDMlVsDtQ=;
 b=DIlttt93rtG59rtg8jD1VOdQjMkVKg46ld/1FXEbIKVj9mc/G0rITZh+lWoIJIhywR
 ZZA8sPYjqxT4ZU8F7xdrFAoTjwGGiBO/Bbw3k83ieV4ldT/ImpwD4iUVvMUtSefFBj67
 hs0T7i2ykO4wzbD8sZCTsSGV4BOFZjIv8vSp4zhqSp7BhRB6k9SjEifkaxv8WTVeY2jL
 jX64papRzLkmcjASCzdzGzcnketjx/Ij73HdoxPavDM27OQfPnaRGQVKXO/1SxIDtTQK
 hENpaJfTlOwZLe8gIs0yNhX8NOzIr9T4mGFt3Q0eVM08bbeqEvkimYMmoukL6/fxrkxx
 lSLQ==
X-Gm-Message-State: AOAM532nB2/dRmyum+tjRZMzSMPaEod2lKwxV/ZgUgibLzgMew44dXTm
 Qk3BA7VCjU/Xtg25Fl9YU+8ZQGKPUd/vDl83
X-Google-Smtp-Source: ABdhPJyIChODOvIcIjEApj3Sd0DYWTSQZdfwA8pOuUreHGacrKkzUw/T011lhphfGLZdy/3dqda7Uw==
X-Received: by 2002:a05:6871:5c8:b0:de:75a7:1a45 with SMTP id
 v8-20020a05687105c800b000de75a71a45mr6907895oan.181.1648301181841; 
 Sat, 26 Mar 2022 06:26:21 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/39] util/log: Drop call to setvbuf
Date: Sat, 26 Mar 2022 07:25:15 -0600
Message-Id: <20220326132534.543738-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2e
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Now that the log buffer is flushed after every qemu_log_unlock,
which includes every call to qemu_log, we do not need to force
line buffering (or unbuffering for windows).  Block buffer the
entire loggable unit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index cab0642a7f..caa38e707b 100644
--- a/util/log.c
+++ b/util/log.c
@@ -136,12 +136,6 @@ bool qemu_set_log(int log_flags, Error **errp)
             logfile->fd = stderr;
         }
 
-#if defined(_WIN32)
-        /* Win32 doesn't support line-buffering, so use unbuffered output. */
-        setvbuf(logfile->fd, NULL, _IONBF, 0);
-#else
-        setvbuf(logfile->fd, NULL, _IOLBF, 0);
-#endif
         log_append = 1;
         qatomic_rcu_set(&qemu_logfile, logfile);
     }
-- 
2.25.1


