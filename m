Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1075FDED7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:21:37 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1tn-0001cC-Vh
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj1qh-0007RO-T8
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:18:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj1qf-0005g1-SA
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:18:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so3720052wma.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UFxWRmJrq4zBwXzsWUnNv0z8VgSCJCrMWgJTtg9fkHU=;
 b=m338Pnjd0w+xiDMtRaxE5ZPJ/0IH0XeMrkLSTjyfULJ8+55c1ZvnQnWlDTIVVxJt/J
 QVxLfgZ0Goyp8OA62hWCLuSOAAZ1/yF8URUOMQEwEN1rGA4oUxP7cRHVaGJnCzqEt13t
 LmzKV6CCDg96BuIMDvc12dyRJ720mWR3Dv0bnKBRj/wIM2gX+B/uIfBITm5ScnG2Sc9G
 /v5wr18k/IuGVvLOKxYTBMV+HwYeMA8DN3pC2/qodyXmy5A02HC91MYWYDZTTY1hgVs9
 Vbp6sPTmL+6affTTLhq1DhA0FDbcfIawtDYbV81HW8WnJR61l4vT6X6kkl1LGbfXKi7I
 HfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UFxWRmJrq4zBwXzsWUnNv0z8VgSCJCrMWgJTtg9fkHU=;
 b=X7hGUaeFzJMyAou2RQICyx9BnDorKrzK9MOYpOE9Lz4PdSyk8s7iIxJ3kpDRCBRyPd
 bz1HpshXvUbOKMOgSS49xbIT2HbcBDkrvN0MduB1gbxYO+dx4jaTyLmJpcx4geKnQhdc
 DjC5p/xK5cSlrHNrm3FDli+P1oLTOvhmhqQQWnt946dXxvhm9ZPUzijAm4BlhLers1LF
 b0SqnlYbeEiJgf2MfwoGC/zFZxMoXfLFF3Z6+JWVN3ixWQe3esOKCZjbdYcL1xxMdZKf
 ylyX/UtZsz/yMr8et2cjrPlf5OaJm2xMSmDI0KSp45iOjpXIoLLMYLRq8Nk0WBLxVC0r
 ev1g==
X-Gm-Message-State: ACrzQf1kb+GeVn/wW+5dI4JgxUmmTrLS0sc0KDliqumxaQYILfkbsDz+
 T/ffk2/QGEyOp4HNpki6OjrVep9Sjmcf7g==
X-Google-Smtp-Source: AMsMyM7evREjWEwH3rOSbgjnogOCjR58GIgkxINK0AF3rggTFYD2musEesoWKNq210d0CLSNPtBp1g==
X-Received: by 2002:a05:600c:458d:b0:3c3:bf4e:5c60 with SMTP id
 r13-20020a05600c458d00b003c3bf4e5c60mr604728wmo.189.1665681500256; 
 Thu, 13 Oct 2022 10:18:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c4639ac6sm42018wmz.34.2022.10.13.10.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 10:18:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
Subject: [PATCH] hw/hyperv/hyperv.c: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Thu, 13 Oct 2022 18:18:17 +0100
Message-Id: <20221013171817.1447562-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The semantic difference between the deprecated device_legacy_reset()
function and the newer device_cold_reset() function is that the new
function resets both the device itself and any qbuses it owns,
whereas the legacy function resets just the device itself and nothing
else.  In hyperv_synic_reset() we reset a SynICState, which has no
qbuses, so for this purpose the two functions behave identically and
we can stop using the deprecated one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: tested only with 'make check' and 'make check-avocado', which
may well not exercise this.

 hw/hyperv/hyperv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 4a1b59cb9db..57b402b9561 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -157,7 +157,7 @@ void hyperv_synic_reset(CPUState *cs)
     SynICState *synic = get_synic(cs);
 
     if (synic) {
-        device_legacy_reset(DEVICE(synic));
+        device_cold_reset(DEVICE(synic));
     }
 }
 
-- 
2.25.1


