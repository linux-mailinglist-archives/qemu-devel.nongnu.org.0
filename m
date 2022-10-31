Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E36134F9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTMz-0004ux-Ms; Mon, 31 Oct 2022 07:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTMx-0004rU-F1
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTMv-00055b-Sn
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v1so15591136wrt.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=37rpDi9RI9hPWc9AWLWhs9sb9dymPc7fADlcHGCKa94=;
 b=nyUvbVm5gbNI6MfmRQLdedJW6ffvOYyA4xIkbOTQx15Vz/V6jKQhpXfec+ciZbLnNe
 fLTCxJOBUu+ytYVOAVlf+YDHlHH/fQXWGLl/N0HkPdJsnmh41862VL1IFt55CjlqEcV9
 p4fCom4Nf96T6UV/tS4aIqV25pEP1ruLL34RHGP33ULEkdB7A0LOSm6A3APPO2WIpEnt
 qMfh8XG+BXqyv8Sj55683jNuyFCe1U0ksCVNwbXnG9f+HzeIOOtrE6kOKFOndxHyDo7E
 neY5TvrJOw8aoMqndQ7r7eXV8jFdBEtGZ2gLQQu7pyzpF+yI5mu1dGjoYCZhBLEG5eAv
 yjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37rpDi9RI9hPWc9AWLWhs9sb9dymPc7fADlcHGCKa94=;
 b=WJZSnwIDLXC5Ru8RMm/paM0J9p2e8KR+lIRtuvtBL3IJTHsbK+wgqAXtGaBtR+Ou0B
 KKmZHcanqVfzCV+YaeB8PTUQFn+RcB64dTdUJCbX3IViZgT1PZoFL4ZiVPea98gQNWJz
 drZLbLU5AmCdCfkqSzOR+B3/FueqIMpi+1ZM7Lt9Ukb52JLxzKOZc99vIoNfc7JAXcTp
 EjES+LJH2XwpfMT1NBvFS3YUxDhn4nU3uT2pjFzSAU4wMjVKT1zJ1cQYUNzOd/+Ef5kT
 JGU2STCFo3GrBE9bR0xuGV0hv0v0DUxVpJBZEbJ6GHSDKWW4g+vWbOTqElygJIdlQp4J
 a0uA==
X-Gm-Message-State: ACrzQf2ZqsdO+pDZN3JogEbJHiMHXBoCCENyhD55bbwgiVm7s3t0rC1n
 wen1Y6Ll20G2uaCh51qAJJqr/fFmimETyA==
X-Google-Smtp-Source: AMsMyM5Wviqac6oCue0JwKDxxZ4Rzu0BbRzxnZIL3dmvOYrhp3/Xs4dk7R22kEOvK536pkKJzCxjDA==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr7828685wrz.690.1667217256025; 
 Mon, 31 Oct 2022 04:54:16 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fc6-20020a05600c524600b003c6bbe910fdsm8260671wmb.9.2022.10.31.04.54.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Oct 2022 04:54:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v5 2/6] hw/sd/sdhci: Map host controller interface in host
 endianess
Date: Mon, 31 Oct 2022 12:53:58 +0100
Message-Id: <20221031115402.91912-3-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221031115402.91912-1-philmd@linaro.org>
References: <20221031115402.91912-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f9c5b58e6d..40f37694d5 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1341,7 +1341,7 @@ static const MemoryRegionOps sdhci_mmio_ops = {
         .max_access_size = 4,
         .unaligned = false
     },
-    .endianness = DEVICE_LITTLE_ENDIAN,
+    .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
-- 
2.37.3


