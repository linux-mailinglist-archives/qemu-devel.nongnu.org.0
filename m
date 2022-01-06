Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FD486D74
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:59:26 +0100 (CET)
Received: from localhost ([::1]:53796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5bjB-00071b-GE
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhY-000519-7Z
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:44 -0500
Received: from [2607:f8b0:4864:20::42a] (port=40600
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5bhV-0000Gh-Vs
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:57:43 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q3so3687397pfs.7
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPLXcVJRKIkGZiLXyE9cylyg96r5/ouMmhNjrQoRrLM=;
 b=MJ4hV+oeiiLSEGqzHXl7gyzqFZIfssEFmQBwN0Cy4fJjJFBP/Cp2VrCcdTS+epbuaA
 6FBUYOiO2ugSUjUx92mBCi6hSSGLzttZ7WR154lyji33WWdTkpX0+txGdch2r9UQL4aC
 wAIYzAZJ+Mi1H9F4+XStlBjF45SW/5mtWd09hKhQSShZ+p/q6tl4gsVsgpS6t32toEme
 sfP5KnkwRcZohUS3dOzJsYi+CjQu/W0FkAmwhxsP4g6ipATbM0uzLQYPdrutjCJuR/0a
 +uaBWmnQx1mm0lyoRzCmh4WE4glllr8qOpueOTPkxiIZ9nODdAbi0W5sDlzuPY6X3jNh
 4TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPLXcVJRKIkGZiLXyE9cylyg96r5/ouMmhNjrQoRrLM=;
 b=F7ZfgwMc8MqiZwAQIGbrN3IEiO0iCG5sbdxo6owE9gxmBDjyzbygUMdR/vqKM8xmwF
 NKRaSl0YOPf4hxl9hgLp2/TJXP6dGL37w3PCXcD+bIqL2MBrunXEe8Azn7wRBAFnNQqM
 HjOm5hsH3z9MjokR7MTOvtT+h6hoZ746b4Yn/jpsVAIwDyGoisIMuXnVgUvOAZuUgtHr
 tZgFuEdrmw2p48DjgAZUT5y9BNN2bWmAVKqll/n2xqtldLoGd3LuZ23N7B0smI83LQh2
 YK8e9koz0sMVnf/r1e8+UXSOnRXQwcmbALwa58ssPgPlF6leyrQFEW0+JzxXy4EGglmL
 IR+A==
X-Gm-Message-State: AOAM533IYl3nXycAm1PwksvPu9G2kZUaK/+ScXlzFWMEKHKQS23Xfj3r
 bywe0sRCF2wzz7vaPMRFcTIvGLErglkTaw==
X-Google-Smtp-Source: ABdhPJzl+kWMVfPs0qkRzbP24MOIrfMIbaXX5jzaAoOFA+bYBN8D9JRsXL3Qwxsn5YCcPXg16YfwrA==
X-Received: by 2002:a05:6a00:22c3:b0:4ba:f0a1:a9b6 with SMTP id
 f3-20020a056a0022c300b004baf0a1a9b6mr62136035pfj.36.1641509860766; 
 Thu, 06 Jan 2022 14:57:40 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id rj6sm5774687pjb.50.2022.01.06.14.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:57:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] linux-user: Map signal number in PR_GET_PDEATHSIG
Date: Thu,  6 Jan 2022 14:57:36 -0800
Message-Id: <20220106225738.103012-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106225738.103012-1-richard.henderson@linaro.org>
References: <20220106225738.103012-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the host signal number to guest signal number
before returning the value to the guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e8f9e0643e..9eb2fb2bb2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6444,7 +6444,8 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
             int deathsig;
             ret = get_errno(prctl(PR_GET_PDEATHSIG, &deathsig,
                                   arg3, arg4, arg5));
-            if (!is_error(ret) && put_user_s32(deathsig, arg2)) {
+            if (!is_error(ret) &&
+                put_user_s32(host_to_target_signal(deathsig), arg2)) {
                 return -TARGET_EFAULT;
             }
             return ret;
-- 
2.25.1


