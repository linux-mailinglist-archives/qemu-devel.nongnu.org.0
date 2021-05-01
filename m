Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5C737088E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:55:56 +0200 (CEST)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcumQ-0001ls-7t
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuak-0008KC-Rj
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:52 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaZ-00009D-2t
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:50 -0400
Received: by mail-pf1-x436.google.com with SMTP id 10so1354367pfl.1
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZuld2Nudm5aU7AYmY0x2StLFfnXOi6CVhhsG8Zb9Hg=;
 b=ynji0CNVgDF+sgxLW3Dc1ul3iZDuVGoPEY/ZNffeWRmFqgs6dO+c3jItB4SHfzvkHn
 B/VDobmjLq1mPJkKAfEMhb07QWEg22eb+upbtNJkhRPBPWdKWOZxJYSAwOceIzB+bG0o
 HiEK56jesok2FNKDvBfceOw0Nz7nI4Qs5qRoWF7kwSWa+ph8IF4QIrH80Lowodabx5h4
 mf7wqSDy4s70rDo990UvA41Kt80PdwS/7WeUfYULVouj++9HQOj0EcBW2fg7HKUrESAK
 vi2OHPK0/gjGxaNOc+K9FFY0oreWL3EmWfHC7gvBb6+34r2QWCwDGWdZDLd0hEGg40CU
 FI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rZuld2Nudm5aU7AYmY0x2StLFfnXOi6CVhhsG8Zb9Hg=;
 b=pvk5GpS/7BveNu1e/O/tPfRmhySjn5Zf5o8frKkkBj8eN3uBeie7GwkajbpLLGFu16
 SJGWPqmNpeOWdwCoFm3Id6+1VUNxs5uCvR6eSLrxf6zDSydHgyj2Sch0P9SkaYv6kFJh
 /pIzBF3zMcF8+ZtNRn4cTTpoipBxQP4D6FEARsH1CNefHpC9yyjobIWgSNs06oyutWbt
 +PGm66FYWLT0LMrkW3paaZuoli+sb6sghY631h3oBwTpurB3knlUlFJ23Pk2+pH/OOvh
 QK63aqQB2Eoj5JBkIalq4RQYjzLDQMAAxVJyJs5IuuBye2Hy/2Q+52ILNoGAlBrqqz5d
 loDg==
X-Gm-Message-State: AOAM5327SFHUZu5yaB2Wy95Tbt7mvHWF5F+zgeqnnu+61GrXF5fb6Rko
 GexGaINK3zyezsRqkdpK+mYicJAcdvULLg==
X-Google-Smtp-Source: ABdhPJybFq2OMXE24h5MpL/lT68W3UsIXtPZP30Bi85mLSkZEe0TMnPJUv6yAa0YsoS7RdCl0LPwrA==
X-Received: by 2002:a05:6a00:c8:b029:260:f25a:f2ef with SMTP id
 e8-20020a056a0000c8b0290260f25af2efmr10602993pfj.78.1619894617645; 
 Sat, 01 May 2021 11:43:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/31] Hexagon (target/hexagon) cleanup reg_field_info
 definition
Date: Sat,  1 May 2021 11:43:12 -0700
Message-Id: <20210501184324.1338186-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Include size in declaration
Remove {0, 0} entry

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-15-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/reg_fields.h | 4 ++--
 target/hexagon/reg_fields.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/hexagon/reg_fields.h b/target/hexagon/reg_fields.h
index d3c86c942f..9e2ad5d997 100644
--- a/target/hexagon/reg_fields.h
+++ b/target/hexagon/reg_fields.h
@@ -23,8 +23,6 @@ typedef struct {
     int width;
 } RegField;
 
-extern const RegField reg_field_info[];
-
 enum {
 #define DEF_REG_FIELD(TAG, START, WIDTH) \
     TAG,
@@ -33,4 +31,6 @@ enum {
 #undef DEF_REG_FIELD
 };
 
+extern const RegField reg_field_info[NUM_REG_FIELDS];
+
 #endif
diff --git a/target/hexagon/reg_fields.c b/target/hexagon/reg_fields.c
index bdcab79428..6713203725 100644
--- a/target/hexagon/reg_fields.c
+++ b/target/hexagon/reg_fields.c
@@ -18,10 +18,9 @@
 #include "qemu/osdep.h"
 #include "reg_fields.h"
 
-const RegField reg_field_info[] = {
+const RegField reg_field_info[NUM_REG_FIELDS] = {
 #define DEF_REG_FIELD(TAG, START, WIDTH)    \
       { START, WIDTH },
 #include "reg_fields_def.h.inc"
-      { 0, 0 }
 #undef DEF_REG_FIELD
 };
-- 
2.25.1


