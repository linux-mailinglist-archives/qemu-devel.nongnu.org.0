Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA933D4D62
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:29:49 +0200 (CEST)
Received: from localhost ([::1]:55288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dGO-0005Rt-I9
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBH-0000mr-QP
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBG-0003oq-3Z
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:31 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso10516334pjb.0
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxBjgCMLIKAw85vE8mpb69QJsoP7x3luF33C4fQ6fGY=;
 b=dc8UfeWSgIKb1HefXC0VyHkMikz/9soVWErK9termVgqLKQTWcuqRk0abkp1ej8tXU
 BiIGlVPWMYU6lnnl0c3k8eRYVIGj4b4nySAQWv3oKR0KYDJ2adyMLCyYsqpCTj+wPoM0
 ZGHYW6uADUKMDJwe6hDeG9nYp1KzNBwvl2ead4Q1GKS1xUeS6+b/2WtGu/q/MbE1CdtE
 tHwmRQYpL/cruBh+WzlI9/PcDb4AlQof+Vn1Lvt3GlOIV6T5G1WIg1aGuy0Ytp32n0OA
 SenfQPm0GGmuX1xhfAZfqLZNLb7fzXl4DfHTNU+DqXtqJ2MDYlBhAvRIOCJEaJrIpIQX
 R4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QxBjgCMLIKAw85vE8mpb69QJsoP7x3luF33C4fQ6fGY=;
 b=bsteiTZVHbM/O7gBYIG4nc3M1mRJBxnoQSXsbXOoCOkhFCxyKGENNRLFOu0vPMHV+W
 PyttG8GKTLMCjBVcjV3kKfaX8h9lzTFe0iLNJkkzAJTwxoAUHyErNuVQW0IdsSIpsZPc
 Wo0B4M3GwT2wmDgyCSZ049/00vm5+76uejmtWtzeD6ykFU/TXlOAoUVtJmw5qvqMfJ+U
 QZkiL8WhU7RhT/++rPyN5JQGt9opS8cVpqtk/9ueqmf0sufFBrYhaKmJG+Jg2GL7deR7
 NFA5TYT/jPbP9DO3IbEeL2pfxyfpZfMtIrbcQl/ntxOEeuyz1VW7KiUPLGw4qRMlolWp
 vDMQ==
X-Gm-Message-State: AOAM531U/Vwtcu1tQAF+tFsdgheFnQlNu/RXPDun+jniAtrznNIGzAE9
 IwbmUPx0y4n8vAWX21KQL3LFb7fChjnsGw==
X-Google-Smtp-Source: ABdhPJx4qIShfWZ4SQMEVYv79mV6Jg6RFXyieubeUEUK4opYbS06vWL3EN1+6zdg6fJtWZtJRVbfzA==
X-Received: by 2002:aa7:8a07:0:b029:332:958b:7f07 with SMTP id
 m7-20020aa78a070000b0290332958b7f07mr13174289pfa.70.1627215868820; 
 Sun, 25 Jul 2021 05:24:28 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 9/9] tests/unit: Remove unused variable from
 test_io
Date: Sun, 25 Jul 2021 02:24:16 -1000
Message-Id: <20210725122416.1391332-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
tests/unit/test-iov.c:161:26: error: variable 't' set but not used \
    [-Werror,-Wunused-but-set-variable]

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/unit/test-iov.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 9c415e2f1f..5371066fb6 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -158,7 +158,7 @@ static void test_io(void)
 
     int sv[2];
     int r;
-    unsigned i, j, k, s, t;
+    unsigned i, j, k, s;
     fd_set fds;
     unsigned niov;
     struct iovec *iov, *siov;
@@ -182,7 +182,6 @@ static void test_io(void)
 
     FD_ZERO(&fds);
 
-    t = 0;
     if (fork() == 0) {
        /* writer */
 
@@ -201,7 +200,6 @@ static void test_io(void)
                    g_assert(memcmp(iov, siov, sizeof(*iov)*niov) == 0);
                    if (r >= 0) {
                        k += r;
-                       t += r;
                        usleep(g_test_rand_int_range(0, 30));
                    } else if (errno == EAGAIN) {
                        select(sv[1]+1, NULL, &fds, NULL, NULL);
@@ -238,7 +236,6 @@ static void test_io(void)
                    g_assert(memcmp(iov, siov, sizeof(*iov)*niov) == 0);
                    if (r > 0) {
                        k += r;
-                       t += r;
                    } else if (!r) {
                        if (s) {
                            break;
-- 
2.25.1


