Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60056515DD1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:46:52 +0200 (CEST)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknQx-0002tR-Fd
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAW-0004m1-Vq
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:56238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAU-0006GH-En
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id r9so9268316pjo.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mB9/XCqnXEyOKhpBk6W2/uLe4X0aD05IrrxcgIYWBfg=;
 b=ChK5vr3eOHg5pU/YPOL3rFg1JTC15gLm9KeQPS/myyU8REUWbhnS8WDWP8Ti6tYKXm
 PRfUtKpRftLaevTnosYCSDdZBsqJlQ+hv10ny6hzECh00NgMFGkDM+aDcqhlvfCsLZ9W
 C4Y98GOK/RxQ14L+Q7ILlHCv6h/tJ5lf4O4jADfr27MCUHLcZ4nW735Qton143QQugf8
 /tBLKTqeqQ8XexfUr/e0cEdTX6cgc+LtVSR1sKVE/l+MHV4DXDIl9MSPm1OPV4n6gqZY
 +8F44MBYbqd/WsxElj+FEV/fdDgGqSVR6BVrkBoihaGtsv+csYGTPc7PBFGq5H9W9MfQ
 QOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mB9/XCqnXEyOKhpBk6W2/uLe4X0aD05IrrxcgIYWBfg=;
 b=eMlFfoGjIpYWY/Ign/UNNqjZ6Ys7g3iS0elUuF7yQYCLR++O4WKnxXLtHnlqDdm1qw
 f1wZGHMJniZk9AY7p7cWW3ewDh0cfMsbgwAwWDAWwkLlZG02/ZPXkcWPLKMU1oL0KaPH
 0H2Ja4CPNSUV5ugEKYZKLnBumXUfz+oMjQXnkNNCVVELbXjx+mRZEKUqWhP6xlKr5nch
 h0QogpNAofEyksblA1Kjsjn/1UXcUW/Xx+MszYF0P4+CKhahBDo7WANVYkHq8tyWZy8m
 wkz+QmRVlDqdGziSfWKAuFJe/3vCFidrbRsM5BjEwcX+WaP49QBDi8MF/26PPydP3FL9
 +xFQ==
X-Gm-Message-State: AOAM530uRzfMOw6zGrBMzi0+3GuUT6eYt1Z4FtaNJO3VmNe+mxe4pYzh
 hZ0GadyyXEPgttUpCtpUo4UMFjRE2Ak7TQ==
X-Google-Smtp-Source: ABdhPJzlFgsGUEeZBHLAH5926m6SxRh0jgyKma9GG3oyTNwcthqvkmXPeZD7gDvSYD+gVDlTJwn+MQ==
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr3702184pls.65.1651325388263; 
 Sat, 30 Apr 2022 06:29:48 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/43] semihosting: Use struct gdb_stat in common_semi_flen_cb
Date: Sat, 30 Apr 2022 06:29:03 -0700
Message-Id: <20220430132932.324018-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use offsetof instead of an integer constant.
Load the entire 64-bit size while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index a1fc4ea039..a6c6e5baf6 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -324,12 +324,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 static void
 common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    /* The size is always stored in big-endian order, extract
-       the value. We assume the size always fit in 32 bits.  */
-    uint32_t size;
-    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
-                        (uint8_t *)&size, 4, 0);
-    size = be32_to_cpu(size);
+    /* The size is always stored in big-endian order, extract the value. */
+    uint64_t size;
+    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
+                        offsetof(struct gdb_stat, gdb_st_size),
+                        &size, 8, 0);
+    size = be64_to_cpu(size);
     common_semi_cb(cs, -1, err);
     common_semi_set_ret(cs, size);
 }
-- 
2.34.1


