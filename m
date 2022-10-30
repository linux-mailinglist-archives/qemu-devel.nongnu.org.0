Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F37612D8F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGtu-0000yo-Gz; Sun, 30 Oct 2022 18:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsO-0004LG-9C
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsM-0000NC-Qb
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id o4so13675299wrq.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=365AgLXKeVngn2LD/McGHP2sx4vjBg7re+NZLf9MlNA=;
 b=Rb5nr8EpEpmJoqzLzOqmoX+rMf3/x2zwD9GF0hPng6h30RSj1SfY2c4z+rnq7/0a5y
 la0VIWlt4JE+7CvXh0IOqhHN62qraepsZmL8GKiSwgDefXuzwFiycYlCTB9aRAcQEqyu
 bdIcKukqWbjUcnLp41qENSjkXJ2agWFCFa+9/WM+cp0gfjmvux9Aqgs9l9tqM80ijP0x
 4RWyIVZ97IFevg9cI9vwug393alBb7OwdiAnd0UBzE6OZ/h6kaUwBXjroxlnCrkF3hjg
 1eYdQXmz3w33rArizAl9swD/afdKCxSeb7wwKs8P6UCD5BXMmW729nGrymmuieoHvIss
 NzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=365AgLXKeVngn2LD/McGHP2sx4vjBg7re+NZLf9MlNA=;
 b=cuaSq0qzqMz5QlCiEeDRGknYeNyRQqFnmgriJHl9gkpNpqUgyItD4JZz/xpEzF6bwe
 O8az7CqJdo+/GX3BF42/X9rK3SlB3OfY24L9PXz7bX2PG7Y2s04pHoJbPOlILeQOMXqa
 qiP1jIGSsFrZM62LGDhqsZNhV5j6zmJ1yfAufbiamktYfcYGy6r/KdMxg5MfB4kK8TJn
 JGpSzwoOHSTvvzVjwxJKZk5n1sDn85buxsu6pmbqviyciS0n3u/f2Xz7KdA04EuKQDKw
 ynipw3KcomG8P/zRUCVi0AzLNLamcDZmGSXjNFhvZG4M+8156ad2vDuiKRqr2JQfMyvC
 AmIg==
X-Gm-Message-State: ACrzQf2RVN0YjFqGOjHZleR/1mzRV/nuqDDK19CJZ74J2cMMvlLpAzoh
 pVGuOh6gd9kA5kygvpgXJ/JPC2bFhWi09g==
X-Google-Smtp-Source: AMsMyM4YRjLAqiD9sWkRDiVREE9ycvtJZmv6WQUesHVOqrdc4bNpkiscZSLdjsZ2jecpF6gzEqAMcg==
X-Received: by 2002:a5d:47a6:0:b0:236:7854:246d with SMTP id
 6-20020a5d47a6000000b002367854246dmr5881641wrb.300.1667169233150; 
 Sun, 30 Oct 2022 15:33:53 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f7-20020adff987000000b0022e6178bd84sm5221626wrr.8.2022.10.30.15.33.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:33:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 47/55] hw/isa/piix3: Remove unused include
Date: Sun, 30 Oct 2022 23:28:33 +0100
Message-Id: <20221030222841.42377-48-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Ammends commit 988fb613215993dd0ce642b89ca8182c479d39dd.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221022150508.26830-19-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 0bea4aefe7..808fd4eadf 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -30,7 +30,6 @@
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
-#include "sysemu/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
-- 
2.37.3


