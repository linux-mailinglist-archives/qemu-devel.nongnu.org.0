Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6E8689C68
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:58:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxTz-0001zP-AJ; Fri, 03 Feb 2023 09:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTv-0001vF-Ue
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:04 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTt-0005qt-OG
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id q5so4929998wrv.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1jZnXzDBv6AIc7zb/xF5HP075z2PTTEUA4j1SOMKA0=;
 b=migsbNglUZNbUMbZsnqOnYplVzxov4rWnz/3LbovPpI3xN/b+/3PAfZCyXKzrPcsEg
 NTdiQmEITsLr5bClFauNa5rEOY+oQ+oh0KnKFOWliMz/iyNJSCIceYPYU6QWmn7jOCgn
 lfrvAEJT4rD20uEijSwWtS/0vsjwZCG1jSl8hbwu6oIn2LF4yq2dBqcjoYBAZX59z6DO
 nDyUV3COuPPq2Dw9S3hTYSX2PvUpgMVb6y4CvQKAtfTimWA6rwQNQuMsocGZZeZYZK+4
 RVlXiwjSA0PlAIpsSCBABwChj+1ybm01+ozYJUOe2++kKF9WyddpVBUefIXZLLgneQnA
 hW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b1jZnXzDBv6AIc7zb/xF5HP075z2PTTEUA4j1SOMKA0=;
 b=AVNL/W9nkDt1F90hj2zN1KZz1eoqAo2Wy4JI1RGXzrjmKn1CqSuXsK93dj3YAE90E8
 TKcxR6TWzLTzd/LF4F/Z6RPBNVjYbz56tnwzw5+m6dWC5aENXBp3cbM05Qz8VYckqmlw
 ukJljVB3CCB9ZR2VLFQphP9kVzX0qlAU4DhnPqIGoTjGljZ5EF7Fql71/GJ13JKmEeU+
 QR6AqjusDuTE/sF132w3wxjTBtaWbq1U2T5yCsIvUAaTBV+weUD0AxcatlWQgYIVLE8M
 CPCago1VL6zpWcTPVp9F5ky08t+9kzVvRsIggpw8EhDOL6GlNQHA9eDYzva4mzVJPxpB
 lPZg==
X-Gm-Message-State: AO0yUKVU8lCqxk8cqCYwxS0aMhGIZfXP8nclDsAZrE3gPitZyGj7sgYN
 kXyyXAriBt9ybHjV284oiaQyPjEjnyqRC5Wc
X-Google-Smtp-Source: AK7set81V4JsTk3hDaKcd7btY3p6hXdEw5odlJaAUf6EDWsTXD6nYxLHtu4+YFfaFhC8AdAYBYUd4Q==
X-Received: by 2002:a05:6000:1005:b0:2bf:b35d:2797 with SMTP id
 a5-20020a056000100500b002bfb35d2797mr8819725wrx.11.1675436158914; 
 Fri, 03 Feb 2023 06:55:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adf8b41000000b002be505ab59asm2248695wra.97.2023.02.03.06.55.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:55:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 04/15] hw/pci/pcie_sriov: Do not open-code
 qdev_unrealize_and_unref()
Date: Fri,  3 Feb 2023 15:55:25 +0100
Message-Id: <20230203145536.17585-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

(See commits dc3edf8d8a "Convert to qdev_unrealize() manually"
 and 981c3dcd94 "Convert to qdev_unrealize() with Coccinelle").

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pcie_sriov.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 93b0624599..0b6101302b 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -204,11 +204,10 @@ static void unregister_vfs(PCIDevice *dev)
     for (i = 0; i < num_vfs; i++) {
         Error *errp = NULL;
         PCIDevice *vf = dev->exp.sriov_pf.vf[i];
-        object_property_set_bool(OBJECT(vf), "realized", false, &errp);
-        if (errp) {
+
+        if (!qdev_unrealize_and_unref(DEVICE(vf), &errp)) {
             warn_reportf_err(errp, "Failed to unplug: ");
         }
-        object_unparent(OBJECT(vf));
     }
     g_free(dev->exp.sriov_pf.vf);
     dev->exp.sriov_pf.vf = NULL;
-- 
2.38.1


