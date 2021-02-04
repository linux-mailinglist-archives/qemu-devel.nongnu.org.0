Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885A30E994
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:49:02 +0100 (CET)
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7TlU-0006mk-Ra
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Thw-0004VD-PY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:20 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Thv-0003WU-6H
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:20 -0500
Received: by mail-pj1-x102e.google.com with SMTP id d2so818468pjs.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTk7Zu1K9am+nHTK4Qgzw1qdbWz4Og49PpMunTWLZww=;
 b=L+vMsTdHO+F+rWu2A8IcnDBW63zUfluuYsThUOtUy1nn1H/N21XLlrqEk6Hfdcn2K0
 UH5iIBiHBNkXe4Uhd5JUuRKx5GDWIA5qUFSnRNGmxXsVHQOOghVYMsHDiZC0XacpWjWB
 PbB8y9/38/Bwl5DNpYyPHgk8xsgMULnpG5PwvU0ilUNOyZm5HYG6OQL2jB0aNpXmkrqV
 +SdeQ2zPytUBoyArIB2y2tWaL8Y1cwmdk3FMhQ9+TegaUQH5GHh6u4DMb3+iXr+EhQvt
 sWwM6mcsAb/rlCS1pDCDWcqkPQ1wPVk2NNIc74619CXvZ0FjZzl1dKZPhCa+LsOKVz96
 UuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTk7Zu1K9am+nHTK4Qgzw1qdbWz4Og49PpMunTWLZww=;
 b=iAFJVYFkrRqKLukr5jU7lWt3k+qkz9slZ4Wx41NV3ZWv8cRfIH/0Vbmnu07lZSMHZg
 WwvSFSjnW/hpKDltGkqB5umtcWh2wVzHtAmSIDoFtHcsiiqoTC1sMKyh5oEgXBXD+Nct
 gOOnaMeZQnwVKmqvBDbRwNMZ+IhoDZcFqF5O511hy5P7eIjmFkVplN39olzLS4UdxTe7
 jikNeRBGMg3YCmtttvhvZt1SrITpEmNf3cPRq1XHnEx0IiZTT0BAQqHowPHlJbgdxc6a
 tXqAwyc1OHj7UoqwYR9zlhH3BpvKN/On6eY6ARBdV04xJ4KmNTZiSfVurO2l+WDH6E5T
 8Ejg==
X-Gm-Message-State: AOAM532w3zY5uWWJIRFb6olxh8xF0hUbT/vedWT3EfldRUD20dEe8ci6
 N4qlmRwFrYILgZx+hynRhg68QIglfT1fhw39
X-Google-Smtp-Source: ABdhPJwWneJQAsKF2/LryP/2pTcpuRQg1iOmdJPzPb3LkbuvZedSj0AvWKPgScQ5ebqD9OZamJTi5Q==
X-Received: by 2002:a17:90b:1996:: with SMTP id
 mv22mr5867676pjb.121.1612403117725; 
 Wed, 03 Feb 2021 17:45:17 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/93] tcg: Split out tcg_raise_tb_overflow
Date: Wed,  3 Feb 2021 15:43:38 -1000
Message-Id: <20210204014509.882821-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Allow other places in tcg to restart with a smaller tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 63a12b197b..bbe3dcee03 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -346,6 +346,12 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
     s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
+/* Signal overflow, starting over with fewer guest insns. */
+static void QEMU_NORETURN tcg_raise_tb_overflow(TCGContext *s)
+{
+    siglongjmp(s->jmp_trans, -2);
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
@@ -1310,8 +1316,7 @@ static TCGTemp *tcg_temp_alloc(TCGContext *s)
     int n = s->nb_temps++;
 
     if (n >= TCG_MAX_TEMPS) {
-        /* Signal overflow, starting over with fewer guest insns. */
-        siglongjmp(s->jmp_trans, -2);
+        tcg_raise_tb_overflow(s);
     }
     return memset(&s->temps[n], 0, sizeof(TCGTemp));
 }
-- 
2.25.1


