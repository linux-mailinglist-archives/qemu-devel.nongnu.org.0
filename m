Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E1664827
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:07:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHku-0004XV-MB; Tue, 10 Jan 2023 11:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkQ-0004CS-BY
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:18 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkO-0006Ru-3q
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bs20so12432008wrb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tBrKZ6IbVMGWAXp461rKXQbFtVaeFBCzeTvYCck8So=;
 b=tMNGBOepFtBHU/QxxjREv7FmcoA5ZHiUMhJCWI8WAFSYySpQVEykFCnN/OTjYvCYdX
 BL2yPpIrwl4ZYY+tulrF/pyVWNVfeQUuO8ufYRvovG0r1gnghnz4tHPe0l1irh/x//s8
 hlL0enOreGDKm7kXHryNerX7AzU6D/dqp51k370hAWb6Sq2/sUeY9D0qkny2x2mC3Jrp
 UyMufEIYEXqb+5TKp0qj2TzkTnKBsZEF75gt/4WSfx+YN30arCAoD/LhLBNCFd3ZJE3I
 a2wLU3DxGzfjZPNuJvMGYlvDyA8A7rvRjllEV7KbNnSnh730eXHxIiOcwizf85SBb7Kf
 qaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4tBrKZ6IbVMGWAXp461rKXQbFtVaeFBCzeTvYCck8So=;
 b=6/bB0cSaCl16otFWCUXy4BR7++WhS/BIHzu88P30IrzK6tNG9UtJCiF6rGfBYMJV4r
 /Zsm41zE1TsVLnkiH7UWkxZdnMOAbAv+JZc4dCx6pVcrMuzf6xCopSgKt2vqB3yU7T/n
 PnmVW+wBwqiF8vLkNs3md9dZtuUA3CWjQyMDzE+W49n0KKjRwHoh+sQLjmmqDFzNM2WI
 gMlTvvGgGECtvykmVP37dhaqSbIrXVapc+VyxTJssOilozmkGsunbAzn7R1Tj7Buja2U
 AU9hqd8LxZUQr+mQ6fUI2fyHDeIByUlqYqDechV9QB0mGHer60u4upEpeYuHsw31GkcF
 pQDA==
X-Gm-Message-State: AFqh2kpg4tFb6zOKGCJV98/4pyPX7VvW1McO3OgBdzp1YpJ9WoiKA3f3
 eLoTyUJVeRsOAcQeVxCIxnUNAfeE8UaMhOX0
X-Google-Smtp-Source: AMrXdXuHctpuY3NZsJE81NHFn7CwrfH1d4hKf5uzkdHZpNAdqmdR1l8iJ30CAHk7aLcC6NHP1f0WQw==
X-Received: by 2002:a5d:5b18:0:b0:28d:f043:490f with SMTP id
 bx24-20020a5d5b18000000b0028df043490fmr31167448wrb.71.1673369110657; 
 Tue, 10 Jan 2023 08:45:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adfe58d000000b00296730b5c3esm11708750wrm.102.2023.01.10.08.45.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 11/18] hw/arm/digic: Remove unnecessary target_long use
Date: Tue, 10 Jan 2023 17:43:59 +0100
Message-Id: <20230110164406.94366-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

load_image_targphys(), declared in "hw/loader.h", returns a ssize_t.

Remove the 'target_long' type which size changes per target.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/digic_boards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 4093af09cb..529d44e4e7 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -80,7 +80,7 @@ static void digic4_board_init(MachineState *machine, DigicBoard *board)
 static void digic_load_rom(DigicState *s, hwaddr addr,
                            hwaddr max_size, const char *filename)
 {
-    target_long rom_size;
+    ssize_t rom_size;
 
     if (qtest_enabled()) {
         /* qtest runs no code so don't attempt a ROM load which
-- 
2.38.1


