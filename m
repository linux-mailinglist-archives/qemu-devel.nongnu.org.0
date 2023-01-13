Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE466A0D8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:37:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMIt-0003JN-MX; Fri, 13 Jan 2023 10:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIP-0003AA-Po
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIO-0006US-7E
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q10so2141659wrs.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wPcunVg7yQ5n7dMEXY8T78bqLxi/bsTCdvYF3d+Ri0=;
 b=jW+KkVePwiHrYHqSTlutt4x5FaG7P5VF+8zgPTRy2xrgbkFebeTN09+outrrpRZwCy
 0PD/WpRH+U4v5B/XSIwDMvPSZm69pzy464Un+VrJNiwiYMXkAnatH/HlmwRqrH2SZjW4
 01AZ81S9kx9J0LcFrbeMmc2haxImNaPmCVg95wHX89uQ+7eaCzkYbdFsGlf/r1Jfpe66
 5p2L/ohI7MdLEMpj/H/t6LggoffjTzGWOAqZ6nHP57gzVR+Kneom/V8jY/A0DZ2BmH34
 LOYARYGFsL+BIii/hql6aR4y9RA+6FwX/qOQllHUndIURncGgi1jCF1hAHtiioZxMxzV
 oZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wPcunVg7yQ5n7dMEXY8T78bqLxi/bsTCdvYF3d+Ri0=;
 b=KxK3UvEUj5KWKAu45ppIbxufrOoFoju4niJdTPcY+CpwW1tjVkOoi/iiRk5S+rRbDO
 ZAIpfHUPh4w0EkKqht5uPJDtjis4OA1uSDFLf2MqL36ZFtPMnoGb/wri7vZfznEpwLtA
 B8fult5TajQhS8A45Q8e6aDpTNKaLOB9CSemyU0I0bkwfpMbDTIKpmuMGK9GPTWmIFdN
 jSV+2uDR43leNIJkz54XZSxyWxWQVmzFZk7XgGyTTEslkhihsqIOR7rWFbmdKreGpnYF
 ju1i4cs7iO95D1NnknNTf8qDVuiXkAV/zr8IrIVbiZYH0srOHzf+yhXtw1BSUQydUxBf
 8pLA==
X-Gm-Message-State: AFqh2koERY1F/iFayYUTSq3llYJtu01YNsRYNPxElrmnE1/C4GU56dRf
 +XLo9a2OvxpIzVjGM1q+canUX5Ox+yj0JLza
X-Google-Smtp-Source: AMrXdXsmDR1QDVXrmvbEsqJM4PQsnA3lEk5xrhr6pK7TQ/4aw4LkwyFR30NeD7ixesjmA2Xe2r2nxQ==
X-Received: by 2002:a5d:5b18:0:b0:2bd:db84:d663 with SMTP id
 bx24-20020a5d5b18000000b002bddb84d663mr256143wrb.5.1673624923179; 
 Fri, 13 Jan 2023 07:48:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm19251049wrq.70.2023.01.13.07.48.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 39/46] softmmu/rtc: Emit warning when using driftfix=slew on
 systems without mc146818
Date: Fri, 13 Jan 2023 16:45:25 +0100
Message-Id: <20230113154532.49979-40-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

The 'slew' lost tick policy is only available on systems with a mc146818
RTC. On other systems, "-rtc driftfix=slew" is currently silently ignored.
Let's emit at least a warning in this case to make the users aware that
there is something wrong in their command line settings.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20230110095351.611724-5-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/rtc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/softmmu/rtc.c b/softmmu/rtc.c
index 7e2956f81e..f7114bed7d 100644
--- a/softmmu/rtc.c
+++ b/softmmu/rtc.c
@@ -33,6 +33,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/rtc.h"
+#include "hw/rtc/mc146818rtc.h"
 
 static enum {
     RTC_BASE_UTC,
@@ -177,10 +178,13 @@ void configure_rtc(QemuOpts *opts)
     value = qemu_opt_get(opts, "driftfix");
     if (value) {
         if (!strcmp(value, "slew")) {
-            object_register_sugar_prop("mc146818rtc",
+            object_register_sugar_prop(TYPE_MC146818_RTC,
                                        "lost_tick_policy",
                                        "slew",
                                        false);
+            if (!object_class_by_name(TYPE_MC146818_RTC)) {
+                warn_report("driftfix 'slew' is not available with this machine");
+            }
         } else if (!strcmp(value, "none")) {
             /* discard is default */
         } else {
-- 
2.38.1


