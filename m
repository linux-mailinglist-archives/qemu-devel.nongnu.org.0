Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23719541E18
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:26:58 +0200 (CEST)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhf7-00045D-7p
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5j-0007Gm-B3
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:21 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5h-0001MI-Qt
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:19 -0400
Received: by mail-pf1-x42c.google.com with SMTP id j6so16493793pfe.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+SUmfyQ28nnP+FCpGEWeUk9jn7QL0Ax1+bQ0aHyUN6Q=;
 b=rHTCta5iXLncsMhFb7Bkmg2PxayoLYRmlU5ineF1wvPoRBxJeM2QELlh8unW5hrg0w
 o+mbSWA1aYqmagWAy0l8FCM6CskIpDEzCu5aV3ka8chYljApPSpM+nbINE5boBrWJ/bI
 YumvnYe2jC+wkmCTxgPwJEq2vWUT7Iip2Vi53VntmLU352aJIJYTMvLFO0DFhY+Uuj7o
 XLT473yWCvLJzHgC9J69TzQE/1DCWjN9tZuaBphrcIT9wephRgJ6xQrwAvFgID98oDI9
 k21Fu1ejHeNC+IBusqaogYo4+0Sa7+1EabRNCW/IOcowVeMDVNIYcA0a3Qgtd+6kkUqy
 xp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+SUmfyQ28nnP+FCpGEWeUk9jn7QL0Ax1+bQ0aHyUN6Q=;
 b=quYOelOxOtsKxH+/WREvDvknK9MIsdPNZ35Brv/9lZFeh/QWFK3prKHb/lTDPb0qjP
 xOngjuViPbGvoUsIpn+KDw9m8rCOv4UJB3zx6N1JnW3gzllRSUaD7f8D/oqB70LqNNPZ
 K6PLr8tIgtFZqpC0isuDJ5NArj94nnztAl7/r9mq1m4M03CxnMFxMGBCi6YbCtvjWJ0+
 OcOcCr5KEeA++3RjQgJBxMPD1IGd8cFhIuN2Q9evfGV519zRa+Opyo1oFC3Wob8MR1co
 MqXbpHTtz7+lePsqCBPUDV5TpQQyCgCsKNc+Ll82PsHfAc6b7UzOPSgsFOHWf293tsZh
 splA==
X-Gm-Message-State: AOAM5325wApH1RsGMDn+cdOsf/LOzJobJrfwO3ADhfIhx/6Ba2Q9JEYf
 9O+7vKcE8099jv50YNO/9tdaVHyHZ0hYnQ==
X-Google-Smtp-Source: ABdhPJxPEHV9SRGmOQ4v3prBz7XXsPX+Y57GqgRZHSyTw+IOj3/eQUwbc5d/AMFQt10iopxqCNMF+Q==
X-Received: by 2002:a63:84c3:0:b0:3fc:87ff:cdfa with SMTP id
 k186-20020a6384c3000000b003fc87ffcdfamr26435593pgd.460.1654634776973; 
 Tue, 07 Jun 2022 13:46:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 20/53] semihosting: Use struct gdb_stat in
 common_semi_flen_cb
Date: Tue,  7 Jun 2022 13:45:24 -0700
Message-Id: <20220607204557.658541-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Load the entire 64-bit size value.  While we're at it,
use offsetof instead of an integer constant.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index abf543ce91..a9e488886a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -325,14 +325,12 @@ static void
 common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
     if (!err) {
-        /*
-         * The size is always stored in big-endian order, extract
-         * the value. We assume the size always fit in 32 bits.
-         */
-        uint32_t size;
-        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
-                            (uint8_t *)&size, 4, 0);
-        ret = be32_to_cpu(size);
+        /* The size is always stored in big-endian order, extract the value. */
+        uint64_t size;
+        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
+                            offsetof(struct gdb_stat, gdb_st_size),
+                            &size, 8, 0);
+        ret = be64_to_cpu(size);
     }
     common_semi_cb(cs, ret, err);
 }
-- 
2.34.1


