Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6359541F3C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:54:40 +0200 (CEST)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi5v-0006pm-Cc
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0005hO-Vs
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:48 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg92-0001pQ-A8
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id 187so16522924pfu.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XuRf9bJf1hNLRNL4iGsT+A0xXkRPFyPz8HZJ2puRP7Q=;
 b=qekqq+PqXFkc5xBfMWWLfcwmRU6DjJUw9x9T12bxrBM8Bd7s+5Fvr5lewr8DNONU3J
 y+RuFJDt1fyMRPf7+qlUv1ETqBT4qU9FJDBZy9mp9bOLnFjkP1gjVqD2XaiD2Fn4D+DE
 5EvbukDxu4WaKjGSV1+z2RMQ971F9xxiXTpLkNefEYvUdgSVt/bMHwhF9cOWM87Pguzr
 A/lyuO4yXl+fqmT7O7UKXUgkZ8Y7kNDxqzPCjMRnL+JdQDp/OOAD0zZczOXkYgbLoK2t
 MGr0Rsa98V5DcmZvdmx5Z9JlxmXk/ZrnSkNTdgZeggkskAWuvRHIgh8HjcfTHrd7NmQE
 g1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuRf9bJf1hNLRNL4iGsT+A0xXkRPFyPz8HZJ2puRP7Q=;
 b=nQY4SuK2zk8NBAQSgXvSm5CEFSQbtcMyyTuhO5DgQdHquAcha1G1U33fmRV2lRjcYG
 Ntj/V9OGhWAZOscMXDM5RxgEco1HXTYfWkY1GtfgizD9zgd4vi8RepRoBFhSwWzNjTTj
 w7l/l3ABRdQJubEahj3KzmvE+DtmkRIVyJaemVEFMSy2e7K3JfkAmGCUTbs9983qOZLS
 Z7urGchmRifjHV4dIUZHOehNonLOr70H0Elr9jGWnUTtKYwFh0n7BIou5lm8AuvjP3VC
 OkXtT3JVN2GoF1BGaCXBBHEN2rMRE0iNcJ6M7Ef+iA5S8NXIRXiNotTvYYKnyDSgwzsj
 Br/w==
X-Gm-Message-State: AOAM5300yKrG5IJglDVDCtU8CE3vficNrV9wN72WGYCBkjcSEHiWB7jI
 6xe+YNhRKsBGXCe9WWmPj7aNIAqBClLEMQ==
X-Google-Smtp-Source: ABdhPJwU05xV6Njm/oIx+kLgDoWH/dY28zq/u1cGkR2rZdL4ZfJ62fOHhAFvQmFbkumxT1kYTvB92Q==
X-Received: by 2002:a65:5188:0:b0:3fa:6081:7393 with SMTP id
 h8-20020a655188000000b003fa60817393mr26561690pgq.72.1654634982108; 
 Tue, 07 Jun 2022 13:49:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 48/53] semihosting: Use console_in_gf for SYS_READC
Date: Tue,  7 Jun 2022 13:45:52 -0700
Message-Id: <20220607204557.658541-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 20e99cdcc0..4c8932ad54 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -302,6 +302,22 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
     common_semi_cb(cs, ret, err);
 }
 
+static void
+common_semi_readc_cb(CPUState *cs, uint64_t ret, int err)
+{
+    if (!err) {
+        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+        uint8_t ch;
+
+        if (get_user_u8(ch, common_semi_stack_bottom(cs) - 1)) {
+            ret = -1, err = EFAULT;
+        } else {
+            ret = ch;
+        }
+    }
+    common_semi_cb(cs, ret, err);
+}
+
 #define SHFB_MAGIC_0 0x53
 #define SHFB_MAGIC_1 0x48
 #define SHFB_MAGIC_2 0x46
@@ -427,15 +443,8 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        {
-            uint8_t ch;
-            int ret = qemu_semihosting_console_read(cs, &ch, 1);
-            if (ret == 1) {
-                common_semi_cb(cs, ch, 0);
-            } else {
-                common_semi_cb(cs, -1, EIO);
-            }
-        }
+        semihost_sys_read_gf(cs, common_semi_readc_cb, &console_in_gf,
+                             common_semi_stack_bottom(cs) - 1, 1);
         break;
 
     case TARGET_SYS_ISERROR:
-- 
2.34.1


