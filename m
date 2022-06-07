Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31051541EC5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:34:33 +0200 (CEST)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhmS-0007Mv-9l
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5p-0007J5-2X
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:25 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5n-0001Rb-Hd
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:24 -0400
Received: by mail-pf1-x432.google.com with SMTP id c196so16548579pfb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EuRn4zS6JF83w7ZKExtBXrrlNlKkOsGtWU334MtZYfk=;
 b=SW5hHhPczZVFvnyL8PFr7Vd8VWT8xJgHFuGBlrh/6vOl/oCFm5D63BZ7xgGs2SNHsE
 jS/aCWl8IcpiqbWvwpVfjWesEoWpyz/YO9PU1/Ni2tna5FDwpSmf8PLvquLom/OOwUQQ
 u3MSRguA0GEknjKxcWvQxb8mTutqRBoXSSaiDnD4cswXm4LGc84VCazbBFo9U3P799ua
 3ZPfwbvACw1jl+btWXLd7RUHm1MOxhpXbhkig/awsO8//QM/XKe0hxoQZmXNClY9+xPG
 UXk3YJ5t1SGg6Hj8/W/Ehh8Z0VRNBvR3XjHJQ//PQEw7MvbwkNBZ/9G8nnI4jHvA8jL3
 ADEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuRn4zS6JF83w7ZKExtBXrrlNlKkOsGtWU334MtZYfk=;
 b=vYIFzVMk8KDKR527P5lFMZx7STPLrWvf7gM0+iQeaofec4NSqgkO/Yg6nApza2sMT5
 Iu9sfgNFAXcm84tqCUHLpOfjsCsfkrNJ3E3ZIm9LmvQk7iC04cCaY4NmsCVO63Z6/Vp/
 xqN1uXNzqhR9Us0WXQZMwDUssaV/CEDWgzV2o9aAyPzF3gg8WhI0pXrieHM0McwPIKxu
 nbHhopM/zV2eTSmhpy7nNQiSNkKJ7R24ZK0Br6XzDIFNRPYyCbNN44TZhg+wgCtGZhrs
 cRDh80pvruHL0lLoL4KQT2oR5qKNQ1sdK3KIFlXkrbmAIOfsIayj3WrTq0L0F7N4mNrH
 sYPg==
X-Gm-Message-State: AOAM533/3yHQjIbNNHMAagBIjlaAAIWQ5gVoCBYnbjlZ5uwe4hlSrMfs
 XXLomqj9u402FrdYAcHGCoZb+cHUrcOcsA==
X-Google-Smtp-Source: ABdhPJzLWFJ28C92EclgzSgogRjyvDQ2zl+BclQoR+duZcOSFwzxLGGRjTsv9ZIWtEAdGzDiK2nlPA==
X-Received: by 2002:a63:e018:0:b0:3fd:94e9:aa0 with SMTP id
 e24-20020a63e018000000b003fd94e90aa0mr13095613pgh.618.1654634781849; 
 Tue, 07 Jun 2022 13:46:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/53] semihosting: Use env more often in
 do_common_semihosting
Date: Tue,  7 Jun 2022 13:45:29 -0700
Message-Id: <20220607204557.658541-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

We've already loaded cs->env_ptr into a local variable; use it.
Since env is unconditionally used, we don't need a dummy use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5e442e549d..adb4e5b581 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -553,7 +553,6 @@ void do_common_semihosting(CPUState *cs)
     GuestFD *gf;
     int64_t elapsed;
 
-    (void) env; /* Used implicitly by arm lock_user macro */
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
     args = common_semi_arg(cs, 1);
 
@@ -636,12 +635,12 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(cs->env_ptr, args);
+        qemu_semihosting_console_outc(env, args);
         common_semi_set_ret(cs, 0xdeadbeef);
         break;
 
     case TARGET_SYS_WRITE0:
-        ret = qemu_semihosting_console_outs(cs->env_ptr, args);
+        ret = qemu_semihosting_console_outs(env, args);
         common_semi_set_ret(cs, ret);
         break;
 
@@ -672,7 +671,7 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        ret = qemu_semihosting_console_inc(cs->env_ptr);
+        ret = qemu_semihosting_console_inc(env);
         common_semi_set_ret(cs, ret);
         break;
 
-- 
2.34.1


