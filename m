Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852366464DA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 00:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p33aw-0005mQ-CQ; Wed, 07 Dec 2022 18:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33at-0005lH-SZ
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:51 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p33as-0003VE-3A
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 18:12:51 -0500
Received: by mail-ed1-x536.google.com with SMTP id i15so18842585edf.2
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 15:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xF24NYxJq1DgMM7z5X76nfJmSnQrTfSUFnB/Og4Rdk0=;
 b=m1pQLi3baY9jue5dINvWpyxESEw2ZBIsAdb1hwIKACYD114qKwhGh8gwpQu88ny71Y
 VuYuTAzFf5YnNVxCpFpjasWUzik53fHaypoosg6o5DUP35i7ODADdJhR3OKKCASlJXTt
 3lrqu8aBDl5ve+KNsAouZ/hAUs+Rke6NzrkGU1fQBFoc9aqR3NPM3EaeTQVOav2x9dEf
 R2LASplan3IW6Z6Al5bIfFGisKXBQWNaxLYraaQE6Nygx1q1I95MO0Jwp/TQ9a/8x5ya
 fdgVip6ODcJP4uCH+P70C2YMhmPskfrsVg4ZHLDz9mCIfkBU0aiQDWGEDCxWrLrUKZIp
 Wn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xF24NYxJq1DgMM7z5X76nfJmSnQrTfSUFnB/Og4Rdk0=;
 b=T6rsOikwifANwCWhi2xcvhGJEZiUGB0Y0Gz8oAC2ZHgm8X1eVmgZ00isdUfieXdDnv
 Vbm5sEiilhL5m8HlhoZrj8fGWKTvDa4C9pBXPC8/Yizj/sroa+oeN/d0Q5apJ1fEZsmv
 FDCCH9Dtb9mC+/mra3sfzG++LU7EvWU4uRrkaRdmlGQJkowUzJgt3XTE4PF+cyy4ODE7
 5Da4v43hYnZGS0+6FhnO4gy6CxwGIHtzwUDM+xNH4l+LieaqzjjoqQJ4ulZk1chDZUPT
 8ae75Yfkg6Lcix7+YsGtNnA5SraAgWuxbw5+rqFOprtsX9IOxzbJcy1j4jCW1vGSDycU
 FgrQ==
X-Gm-Message-State: ANoB5pl+YuvXTWB1D/jefT6bmFrPzweHsZ87QDkHoR0jQ8YefPiqjZ9O
 AHn2YgXBS+y+MwIkCWVZMWmLFwiYU4Y=
X-Google-Smtp-Source: AA0mqf6O/HYROeisvBcHDLJypuAnM7VojE3YcSAl5VJZWB5+VRHHpvkbcOJAGo7u4Szxxyf//WNn9A==
X-Received: by 2002:a05:6402:159:b0:461:22bb:1ae4 with SMTP id
 s25-20020a056402015900b0046122bb1ae4mr1123963edu.17.1670454767339; 
 Wed, 07 Dec 2022 15:12:47 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-181-051.77.11.pool.telefonica.de. [77.11.181.51])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b004587f9d3ce8sm2732367edh.56.2022.12.07.15.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 15:12:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/5] hw/isa/Kconfig: Add missing dependency to VT82C686
Date: Thu,  8 Dec 2022 00:12:04 +0100
Message-Id: <20221207231205.1106381-5-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207231205.1106381-1-shentey@gmail.com>
References: <20221207231205.1106381-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Both ACPI_PIIX4 (directly) and ACPI_ICH9 (indirectly) require ACPI to be
selected. Require it for VT82C686's ACPI controller too for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 0a6a04947c..bc2e3ecf02 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -63,6 +63,7 @@ config VT82C686
     select IDE_VIA
     select MC146818RTC
     select PARALLEL
+    depends on ACPI
 
 config SMC37C669
     bool
-- 
2.38.1


