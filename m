Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388AB56BE22
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:25:11 +0200 (CEST)
Received: from localhost ([::1]:47756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qn0-0005BF-7R
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCW-0004bu-BE
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:28 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCU-0002Rb-Q1
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:28 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso2145581pjk.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0p7VBr3aZVoDI9pUwFSD+XBTDwjM0eTDqSKAizakb0=;
 b=tBZ9gPj0DZBefJt/34Pl0I6eyKEqPtgKbpHB8j1hu/pI/eH8IeNpmxNIve/MA/i0v0
 bZ6W36dIcwyZMj6iJb4Hss65t7DF9E8kPim71tWkEtBQdEkHkS/ZyTMHxXpuiofYGmRx
 GHyBTB4a1JSDNNUwJQYDVIunNQcPJxE1RrFWhNEXKYpJH2uh4CbLf9uYBfhXIu2EuDRo
 B/kZGFyv4gVxq318jo5jN9NKAL4WDYFMo6G6vjKc0B7K4TTMuNoGlBq8L0a5zeK6bxKw
 m0aOVb8TEq1ixaNeKhzgy3QfVenNYYyENp7AJMbhRQq9XxoOFv0a+2dUWIcnJxAZl5si
 xdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0p7VBr3aZVoDI9pUwFSD+XBTDwjM0eTDqSKAizakb0=;
 b=bKtclX8hKzFx3jNe8ZDmyswfNBxBKnbC29yG1IHMMav6PTo2DAMxxfZ7bIJU/ErlT1
 93G/R5SGAuLWeMuqMnFtgsrNXeWY+oEkqt+5ti7zHYOHieHwdSm0ZEDBJgFV2WASj9Mj
 9QM/NdKv4Zp1oifdyTtu0yD3PkQko0A09jAYWdrLN9Sy0LSzrT5erTskmf18p1FXaiRl
 resO4a4OZTusAxrK8ZpW8jamb/TqcJx8DVInbwdRs9hHSVGCwXkd6dBiX4rju/6elIPS
 GPNVr4prOgiq6XuR+h+30/gT83vkhLYrJBPkuxP2yMMDl8e+dv5LGijlvydRsX3vu4UG
 X9XA==
X-Gm-Message-State: AJIora/NEfduxXux2sWM8kdx0juOdGvGqwIRM6N9lAWxxkBZeY41r4DM
 Zusa698YMvRzjuM1qHu44AzMx2Zdph9LpkBn
X-Google-Smtp-Source: AGRyM1t5+nAuB4iZtxFm/R2ZRCLB2DfCr4ZUkG/ZVJsO0YGDC0CZmHkfygmqaggK3A4SxHPI3G1FKQ==
X-Received: by 2002:a17:90b:4b49:b0:1ef:a03e:b671 with SMTP id
 mi9-20020a17090b4b4900b001efa03eb671mr525032pjb.108.1657295245521; 
 Fri, 08 Jul 2022 08:47:25 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 06/29] Make some risu.c symbols static
Date: Fri,  8 Jul 2022 21:16:37 +0530
Message-Id: <20220708154700.18682-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are unused in other translation units.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/risu.c b/risu.c
index 26dc116..ab17c71 100644
--- a/risu.c
+++ b/risu.c
@@ -31,18 +31,18 @@
 void *memblock;
 
 static int comm_fd;
-bool trace;
-size_t signal_count;
+static bool trace;
+static size_t signal_count;
 
 #ifdef HAVE_ZLIB
 #include <zlib.h>
-gzFile gz_trace_file;
+static gzFile gz_trace_file;
 #define TRACE_TYPE "compressed"
 #else
 #define TRACE_TYPE "uncompressed"
 #endif
 
-sigjmp_buf jmpbuf;
+static sigjmp_buf jmpbuf;
 
 #define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
 
@@ -113,7 +113,7 @@ void respond_trace(int r)
     }
 }
 
-void master_sigill(int sig, siginfo_t *si, void *uc)
+static void master_sigill(int sig, siginfo_t *si, void *uc)
 {
     int r;
     signal_count++;
@@ -135,7 +135,7 @@ void master_sigill(int sig, siginfo_t *si, void *uc)
     }
 }
 
-void apprentice_sigill(int sig, siginfo_t *si, void *uc)
+static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
 {
     int r;
     signal_count++;
@@ -180,9 +180,9 @@ static void set_sigill_handler(void (*fn) (int, siginfo_t *, void *))
 typedef void entrypoint_fn(void);
 
 uintptr_t image_start_address;
-entrypoint_fn *image_start;
+static entrypoint_fn *image_start;
 
-void load_image(const char *imgfile)
+static void load_image(const char *imgfile)
 {
     /* Load image file into memory as executable */
     struct stat st;
@@ -214,7 +214,7 @@ void load_image(const char *imgfile)
     image_start_address = (uintptr_t) addr;
 }
 
-int master(void)
+static int master(void)
 {
     if (sigsetjmp(jmpbuf, 1)) {
 #ifdef HAVE_ZLIB
@@ -240,7 +240,7 @@ int master(void)
     return EXIT_FAILURE;
 }
 
-int apprentice(void)
+static int apprentice(void)
 {
     if (sigsetjmp(jmpbuf, 1)) {
 #ifdef HAVE_ZLIB
@@ -261,9 +261,9 @@ int apprentice(void)
     return EXIT_FAILURE;
 }
 
-int ismaster;
+static int ismaster;
 
-void usage(void)
+static void usage(void)
 {
     fprintf(stderr,
             "Usage: risu [--master] [--host <ip>] [--port <port>] <image file>"
-- 
2.34.1


