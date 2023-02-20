Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A8C69C7A6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:28:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2S9-0008Em-9Z; Mon, 20 Feb 2023 04:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2S1-00084G-Iy
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:27:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Rz-00073w-GU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:27:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg25-20020a05600c3c9900b003e21af96703so1360965wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KRDbs92uM4wmUdpecuxlJKfatamZgZMyKqKMjmX0LIw=;
 b=jPvZIkZcJ8gdAWV6qG3DbOFkszZjapiPscRaT92GuJHw+ovKDvG9kUyHKo9D2MHTVV
 raiVn4M2EwZ2B4NjUqG1ZuCY9iLC0ihJeicw/1HJAz+CbXzvYRNVL5l+kydqQMUc2Ake
 Xe9XLnI536EEZgsdSJ8Mr0obkQSJWVZaSibCgGaicnYAd5VzuQYaL8/OsCEFwEZ5zJo8
 ki31tNEq+MHoKOEfajMsI4lhEkYyhEc0r60lGAMjzpE5se8h1ZYyKTtAaR//uwUtyd9I
 jrMtEdMeA961uwHmvrl/kNvxu6bxLwQUeHlu0VzUppBQNsnTyKzV93PjayPXDsuVNO7y
 aQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRDbs92uM4wmUdpecuxlJKfatamZgZMyKqKMjmX0LIw=;
 b=EzpHaV770/KJL/wReEuBnIL9BUWifUt145z/75wepXLHcGmYEXSGdHNEJG9FoH6VRh
 rgxOx7J/SCHamxZZcshm8Iy/YHsGh0y8oQB11XjqmN1Q2yfaOxFnr5vRWjYi/cJiydKc
 ycXR83dqubbG/UyeZXf7mYN34CMwevJadA5Edpm+5+PknvuYXN1UVpOa56XylV9FytOv
 wm8OvGRUnxd4qEfaHGZFla0AeuOpciV2llauQB5caRwY0XDvzbQms15IsfzNjUwtsaBY
 vAUUeY0Zbn+qW9k6wGuVBCsl4t6IZdLoTIZ2q8CqLFCgDL7/C5NftXNHG4IzftNHt6+1
 BSPA==
X-Gm-Message-State: AO0yUKW3+G6aaO/9z9zorSS/M4wBKfxxg6jIqmSwvHkDn0IZh86iCFER
 /jclZ2byRYGnz8Y3wjxxozLKLRMpSrnixyy9
X-Google-Smtp-Source: AK7set8pl9Ml+zJvhVflawVpr8e/yIoq8lc6l2m+q97iXgNCuiYJuKy8Rs0FokEMSm/SgpQt4ZrBew==
X-Received: by 2002:a05:600c:198e:b0:3e2:1f00:bff7 with SMTP id
 t14-20020a05600c198e00b003e21f00bff7mr325096wmq.12.1676885229384; 
 Mon, 20 Feb 2023 01:27:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b003e21f20b646sm444874wmq.21.2023.02.20.01.27.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:27:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] hw/i386/xen: Remove unused 'hw/ide.h' include from header
Date: Mon, 20 Feb 2023 10:27:07 +0100
Message-Id: <20230220092707.22584-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen_platform.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 66e6de31a6..3795a203d4 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "hw/xen/xen_common.h"
-- 
2.38.1


