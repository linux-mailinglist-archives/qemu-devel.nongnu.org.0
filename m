Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C1541BE6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:56:35 +0200 (CEST)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhBj-0003CG-13
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5c-0007Cr-2P
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5Z-0001K7-LA
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:10 -0400
Received: by mail-pl1-x62b.google.com with SMTP id b5so15803937plx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p/ByxHSH2cGT1rev+93zutWkxBbbXGRHAxNMtlkHM9g=;
 b=NHJKBzLDihWDNWaYOr2MWXQCAGxmIS/LjaAL+dkaPpmGIAGSSa/wN4m6J0A3EJ+T01
 ygxYDgxIBZjtoJFjZH/VdmehIxPNnSar2B0F3uefz/q5YfID0/QEE4kGhyLXZusefuXv
 J21h+8pYzljyavTwdvC5qloljBsxaDiBMIzCpoqoHXUZo7YfMBWD1UFmzvhn0LTZtMdc
 +iD0UejCKfzQWAQgWVuLVpdVVmUEUkRXvVazmDWuoQ2WL80B+Q50lhwmEcYsolFja8ow
 CRTBVdPD68SVFGM0EZdg3lW+sUZPq9emNujXqRoVPWJmml4+Ga6p7h/a4ZOuE7etbnJC
 dBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/ByxHSH2cGT1rev+93zutWkxBbbXGRHAxNMtlkHM9g=;
 b=s3Qf/y7K3nybcRXPQ2Wy414EbzQtRegiFeF3y1DVeHyJToIWcWRV9jzxd6JzSh/YLp
 3t3gl1PNMYGVjcBquIkqYmmxqhoKAF2xtWuWHJlVD8DZvbNHiByoGk9ZnU3AmbSb2Eb8
 0xu0mINZjTVRlL+AI9FJqg7vJ9e9qpcx2+iritAz7Vurk681i+umN0CvuezvRw2s0qOM
 51t5MltsxpVdyyS+OUKrWx7M22mbkWig+008q4OCvQt+8EXqmlAW31qyeviDKLxMJ70U
 91RdLKg0eKsBUvI8BUbu/qm4Tmc0chc1aaGk1NE5wuqpEVCFeW4L3KK+zd4xGT7lGdJm
 qwLw==
X-Gm-Message-State: AOAM5327rnMAZkGmbQNvO3bPa1vEYfcMl3TL2kaWWw1DmNf23bqDGFP4
 ikkZXWLEK5YPQ2cNs+4ldXSjiX1LP1PXqg==
X-Google-Smtp-Source: ABdhPJzukC1sgK+0nMC7GzYsSYhmXgSgQYYL26Skct1AbWxPX1SzZM1w68KEv5GQ7HBUsvFHOwprig==
X-Received: by 2002:a17:903:4049:b0:167:515b:3efa with SMTP id
 n9-20020a170903404900b00167515b3efamr21558026pla.41.1654634768230; 
 Tue, 07 Jun 2022 13:46:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/53] semihosting: Adjust error checking in common_semi_cb
Date: Tue,  7 Jun 2022 13:45:14 -0700
Message-Id: <20220607204557.658541-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

The err parameter is non-zero if and only if an error occured.
Use this instead of ret == -1 for determining if we need to
update the saved errno.

This fixes the errno setting of SYS_ISTTY, which returns 0 on
error, not -1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 9d1f13ea8b..88d6bdeaf2 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -290,7 +290,7 @@ static target_ulong common_semi_syscall_len;
 
 static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    if (ret == (target_ulong)-1) {
+    if (err) {
 #ifdef CONFIG_USER_ONLY
         TaskState *ts = cs->opaque;
         ts->swi_errno = err;
-- 
2.34.1


