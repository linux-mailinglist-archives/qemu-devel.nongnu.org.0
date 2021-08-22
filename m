Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1273F3D62
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:02:41 +0200 (CEST)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHegy-0004tV-G4
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaJ-0007oV-VY
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:48 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaI-0000dH-Hh
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id mq3so9789104pjb.5
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZSv5B26XxDivA72RLN37D0Ox9MVhtWDMvhKjh5v96B0=;
 b=ML8S0l2Hio8vpNRfx8XETWrB3AouCdXVXAbkTjM/xFinjCqwFb8hbS9ScROBRr2OFX
 GSPP+aZTEEZErNzZeQ6PFjngAVaobpr+9Alh0m35sa9Yh3grdI1kEokC5aaSq9wDDYKB
 H8YI9D73M1wyxXcV+2SMgzX+UBSLEeU19QSWlrqV5DREeybEcPjwfcgg6RrKdGAd50C1
 4RqGpCIIC1u334KhyZ544AqS5G+/zN1/yv5BZF6cXlkEzPJaXUpcrmX9Y13mMzf+DS+K
 PwkiWDboKuJU3xBdUjQRBCFQjILw1EYoGwXNht4b67HWoyFbuIKXJhbVppQVhP5DYSji
 tJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZSv5B26XxDivA72RLN37D0Ox9MVhtWDMvhKjh5v96B0=;
 b=SBWDHx5JOEmh9TZS9PpPxfHXrtYtHjs+cvFO2nyKAXbavLhc5jGs0lUIX2eOiNzM6c
 pLu++cB/LonYIDvcCkdg86wrHn3EMFdq3HuLArnFnn8X4SJp+DYD4chjvNnKIBI/GGQ4
 CkXaTSD3cO61PiF9+FWytFApNQmQLVef6WdVMD3VM7W6y4I7J9gGchX15XChHWZHWua2
 0sJ+WQBPOi8dnG6NOirTF//rYR0S43tPpWO5oFfJmLIuXnKjAHVW2IaNe4MLecqzhrYZ
 7yDcpFbxhrKzgSaNMiV7qd4AdVwXIz228SqHvukiaqJofOe3jnG+Pp7qulB/La+nrwv4
 q4FA==
X-Gm-Message-State: AOAM533+3UDdH73MQzgn6RR5xr7bX6+CUG3+P62i4DItA2Hoxm3Qkv47
 t21kW7BhDqll0xrJQszXqEtOlat8S2BgdA==
X-Google-Smtp-Source: ABdhPJxdg0cBuugwUq76Q0VQVOhrukk7gkBmLz6MrqxOXEjV/x10oMzTmdlMaEgHL+uJg561BIK18A==
X-Received: by 2002:a17:90b:4b0b:: with SMTP id
 lx11mr13141355pjb.70.1629604545417; 
 Sat, 21 Aug 2021 20:55:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/30] linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
Date: Sat, 21 Aug 2021 20:55:17 -0700
Message-Id: <20210822035537.283193-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 4cc13e4f6d441, for linux 4.17.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index b2e9503c50..e5f78a439a 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -164,7 +164,7 @@ void cpu_loop(CPUAlphaState *env)
                     info.si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = 0;
+                    info.si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-- 
2.25.1


