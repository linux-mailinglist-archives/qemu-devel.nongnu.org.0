Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD2269CA54
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:52:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4iF-0002M9-Ra; Mon, 20 Feb 2023 06:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4i2-00021v-Vo
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:56 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4i1-0005AN-Fg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id bg28so727433wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MXysM/hMTBAFKZjBf1cYIe3OiZof2SNZO7F3Jiq7Aw=;
 b=jrLm4UdfOzZSGHl9uxIUnnmfm5FRCSOw1Xj/LSvbkugmpLqKSO+rVRehy7U/bvxHXM
 f6EGPE7ZnSMIAV0eDO+DCGqTdW2VBzew1bjHKt125zd+lWQM3DQ6Iu02XxfyYlSS/8lc
 R7HwC+hFygG/ECC8ikH6pIFCmx557zfLZWTcOZu177CQiv1QTatE7+mBUJWm7PujffSU
 FyN3GMNRmkcTGEUmtzjxl+EBJ2uxRYX17aeB4KOWxNWmmEQz5PeBR5W50AYL9fmbWZI9
 Y0vBXaNQN/dt8lIH54ozPm2eFdOkjWQz5KmLEfZvbNwLktV8ToZc6FoWy4hH83Hgo/6c
 QfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2MXysM/hMTBAFKZjBf1cYIe3OiZof2SNZO7F3Jiq7Aw=;
 b=OwB9YZITvHNBDTRbiYPfpJvYlYvizOXKnrWzuvVAKXq0xNJHNFB+oTuO5DENjDESZb
 dIVwuSgt7SQ2zk38/NPpEP/pp+Ree9GkbzRS8M585k0ADDrSDAdQAv8N+eT+EUvvKeqv
 Q3H/Xw/wNs5lFbTKI6omIEpRtUONgtt3+6mJfABsEBWWZ+iaJ9t12xnCQoglSnd2IpFH
 p51wrbQ8xbaQWR9TqEjzAH71rt/mPpqE00GeZcgEFuLk8b7saB0t9p/FK9VlaV6B9ULl
 5uoWCzsoBrw25iMaFHOjxqB8BpjdR2VG5gEiM5XD7BU5ym0VOInt7SghyWP28O0YaygB
 tJqQ==
X-Gm-Message-State: AO0yUKXZDIcLXd4iOe4ZDegz/BLiJq+QUypEK5CM5z7KPcxMX7ni8SOZ
 FUfpw2EdnLXoxfnVuda/wQJrBSmpn4znfgwT
X-Google-Smtp-Source: AK7set9B1ua+LHoiBQwEl32Qhnw3l8ubuAL4Z9LsRBV+13R8vM81a8upJIIgWoU6C/O0gwRvOq34wQ==
X-Received: by 2002:a05:600c:331b:b0:3df:e4b4:de69 with SMTP id
 q27-20020a05600c331b00b003dfe4b4de69mr250510wmp.27.1676893912035; 
 Mon, 20 Feb 2023 03:51:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e2052bad94sm11464997wmq.33.2023.02.20.03.51.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/8] hw/timer/cmsdk-apb-timer: Remove unused
 'qdev-properties.h' header
Date: Mon, 20 Feb 2023 12:51:13 +0100
Message-Id: <20230220115114.25237-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/timer/cmsdk-apb-timer.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index c4c7eae849..2dd615d1be 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -12,7 +12,6 @@
 #ifndef CMSDK_APB_TIMER_H
 #define CMSDK_APB_TIMER_H
 
-#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
 #include "hw/clock.h"
-- 
2.38.1


