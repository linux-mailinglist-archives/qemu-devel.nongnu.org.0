Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A69609854
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:50:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhS3-0007vl-MH
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5X-0007JW-QN; Sat, 22 Oct 2022 11:07:03 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5W-0002Jg-DZ; Sat, 22 Oct 2022 11:07:03 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b12so16124302edd.6;
 Sat, 22 Oct 2022 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STc5qgjx2CTZ7JUCB0uBU7UGimBQ1+QlUxUSOdGsJkE=;
 b=EDt80fVllsxnFAZ/wNHzaznsgOLI6ptoqFgLRVBPxI5kjrK8ycxHuaAv1AlibZPwgU
 6S+iK7EEl+Jbi3lAahXy/SmMlWG13kkyc4dT1rbjZzLMNe3hFwWNvP+FCCkFqIah4AnC
 0QJjQVfdOc7EIWzKqyu94QAhRB5k2d3LmV65iyLpyRp1V0YARzuWn0TUbMk4w0uVqD+o
 H7E0RBUt3EQMpjt2Q7znGNg9FuclN6LhqgDY9EK82ADyQMUDi32uR6kDZ1cLPldTTTcm
 FEX6nRhFXAFNb/gkix7gs/nnm+7qvDSlLjAMzrrQRibdf1QLk0/sowGA5V1k6vYYcOof
 eWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STc5qgjx2CTZ7JUCB0uBU7UGimBQ1+QlUxUSOdGsJkE=;
 b=qRbzkIoQYioHztfAMy2uLvYYXLNsDGkHbfRSIqpcO+PEOKrzoHmjB6nGxNSSUu4ftQ
 WOl7KOyd/32f0ZovjSeazcsFbTh8Dz05MXrY8mae4QMaFxdZjuE8m2INIXX1nUQmS2Ir
 I9dbNnT3Pr8rVQMV2f0kaoEUMTkKyPbYfuoTtRYTMyZI0FmbSZ1A9u0DRHjscKa0jxzC
 Qvehcq1DeVgUvwCFQNpooV2siwHDnCmQ/zQfbk+dREA5T8CNbQmiM67tIg6QGloB28GA
 tZVrVrcciXSw4Y1m+Ls4XMz8Flvd4YU00mCJEBUkj9fpC3kMKrQw59FSh+3SUa0+xrHl
 b6HQ==
X-Gm-Message-State: ACrzQf0w4p1/ktSTwhEei1Lukud0/8ukyJNx5ONkRo9jDgGwBcVCRba4
 Mo7NfwJeVUOOrdYmT2/+czcreNYfGUhgRQ==
X-Google-Smtp-Source: AMsMyM4DVnmzkl99vn4ljzTKfTvSgymBK25d2zqH+yDdrCuLWhj/sFth9LZUGG6ZGELyYOx3+d8yig==
X-Received: by 2002:a17:907:d9e:b0:78e:2ff7:72f4 with SMTP id
 go30-20020a1709070d9e00b0078e2ff772f4mr19387647ejc.608.1666451220312; 
 Sat, 22 Oct 2022 08:07:00 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 27/43] hw/isa/piix4: Add missing initialization
Date: Sat, 22 Oct 2022 17:04:52 +0200
Message-Id: <20221022150508.26830-28-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PIIX3 clears its reset control register, so do the same in PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 83b50c3a9b..4b8dece257 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -140,6 +140,8 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xab] = 0x00;
     pci_conf[0xac] = 0x00;
     pci_conf[0xae] = 0x00;
+
+    d->rcr = 0;
 }
 
 static int piix4_post_load(void *opaque, int version_id)
-- 
2.38.1


