Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8D3669B54
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:03:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnE-00017B-0E; Fri, 13 Jan 2023 09:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmn-00014F-13
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmi-0003nJ-3j
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:00 -0500
Received: by mail-wm1-x332.google.com with SMTP id o15so15343667wmr.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FAbaJSh5m/RbxwmToLtNlRWjUwZqE/zfDC3TWOgg/dY=;
 b=E257E4N3zMA+WxrVYov8eeagXgISqCYUc7ceotZ/E3vTyufpY6f7iEJ9Izn6of/XSy
 CnZWx7+PcGKmnVvYKHntX/7Cp+b73sDWXFWxySkW1DcSUipgngsYwXBGU/P0aQfVY5/G
 3gvbTH0R6bxYSBXBbjK1Yb8z9rIbyR3pIrj1nhtMMfBQHYRZk1lcB1kqj92Yf3mz2+wD
 QLn264SOlaQFVLBIZNOdie14FvPD3BL+JtWQRRGaEtimotrqRlbX7X3o6ZAQkCdPaJ5c
 oT+xsGy/fcfGMI1jLu7RxznnYwl4q2rVWt8lO9cxg4nwR+J9nUWLV3SEQconGCauwmxx
 CIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FAbaJSh5m/RbxwmToLtNlRWjUwZqE/zfDC3TWOgg/dY=;
 b=686kDSrAGSfi7bpmFnbAsCjRCogkonuX1A0I5SJmZpr+2rfxMg/r/VmDyazW8vqe6u
 GO+g/JzaE8gYUMa8W53zEt8H59ZtgUHvC/Ywq98Yidh14R/czenUAmmpM1M9TQtlY+hR
 vTot6lqfreCtXRMv2ZTvxq2dmqKueJ21VPOZF/FwKteCkJ690JCU3nmTFw58zLEWWCKe
 cEIpirM7Rptd+patXExyzBwLIEX5Thxd7aSKm9sNMZ82QaAYzHtWm/0xfVRHoLnCdXDG
 IvUiabUInzQk3IjK+Kpg8dejHowk/nqUfD9i/Xkow3rCdGbTN4I6wx5V0dKNbOTHHDQq
 J+Wg==
X-Gm-Message-State: AFqh2kq/XtuFMWbygwNQKvy9LapA36PlGOuczDbXwc0KachU+0queBal
 MXkKBm6PeXQLHYEPcJDWl6VtORuhX9iX2gJ0
X-Google-Smtp-Source: AMrXdXuMe4ub9xA6neJYIvpo6p0hZC3en6gbW3tFb4YVluE24mSLriSVtO1tQbpFNjrGxUqxyW7XmA==
X-Received: by 2002:a05:600c:3509:b0:3c6:e60f:3f6f with SMTP id
 h9-20020a05600c350900b003c6e60f3f6fmr57675299wmq.38.1673619109403; 
 Fri, 13 Jan 2023 06:11:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/38] hw/gpio/omap_gpio: Add local variable to avoid embedded
 cast
Date: Fri, 13 Jan 2023 14:11:13 +0000
Message-Id: <20230113141126.535646-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Add a local 'struct omap_gpif_s *' variable to improve readability.
(This also eases next commit conversion).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/omap_gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index bd0841d57fe..12ec16d1b03 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -53,7 +53,8 @@ struct omap_gpif_s {
 /* General-Purpose I/O of OMAP1 */
 static void omap_gpio_set(void *opaque, int line, int level)
 {
-    struct omap_gpio_s *s = &((struct omap_gpif_s *) opaque)->omap1;
+    struct omap_gpif_s *p = opaque;
+    struct omap_gpio_s *s = &p->omap1;
     uint16_t prev = s->inputs;
 
     if (level)
-- 
2.34.1


