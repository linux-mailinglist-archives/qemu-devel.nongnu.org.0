Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C816134FE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:55:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTMy-0004t9-Js; Mon, 31 Oct 2022 07:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTMw-0004oh-3Y
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTMt-00055H-EZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id y16so15571712wrt.12
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mqt78t47J2vCxiAvHYahQR0hEHA/val3YfW49MCpoMc=;
 b=nbhwO2gbJ85PCopF7SzzgNLm/X3y3SCQlinM+OqgmjO2TnuxTY9GSfM1hLyWaNqnJM
 CkkSx75xRmy6UfllRIygX/whoizI2H2fNpfnioUMNUF81bKLpnL6S2r1TAArBHC3JoLF
 Ig+BytPeb95H+9Yv5Zrw0PZUFOrPPj5vvyDtEWtpvZJt55oN4cvql3xZc41ddBQrythb
 GL44TcbQEpND8SXYKXhn1r/DNYVSkdEuCJe1nOliAnsnGe9ua1RDZmbIn1geLb5TJG9H
 sAGq43/Twfrqlj7clgMjD1OsD0InpEjKeufds0A+Goeu+aJA6P4w/7rzHM88ubNeH5a/
 BBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mqt78t47J2vCxiAvHYahQR0hEHA/val3YfW49MCpoMc=;
 b=0LqTk9PL0KcOccBwWsociA5KfDFSsEJIs0+qSZzk6zlahzDutqw0GZQbKO5xSpsPeL
 AVRhWaQqNnonHNL3ZDf6VG3FVgNomMDCw176Ku3NTjtpX0W+yc1zIiK89PfcsWXxJ/VX
 8PSSSuan/2hplxPCrg13lQpWDbK9ETnzshrjWvWFMnfA01r9um38cRGGNSLHPP55+Iaj
 ZkDVzeBSun49IjFQAjZPao8HqHK4bII8cWkriiHSWM3j6BIQXDYm+STm36YdHOzKWhKk
 6if+MbMLQClbtNEt7Q7d418EovK08Ov5ra9/9r6c6hmbw+5naIEiegtgErfAyfjRP6qA
 1x0Q==
X-Gm-Message-State: ACrzQf04sq9mkmYJRsTzTjCsoinBYO3Fa0/zEeXVyOPdvKo2te/qZdAB
 zYqMpgMdxYz2qJKjFFQ19LVZNLuK+Y8ZyQ==
X-Google-Smtp-Source: AMsMyM74KVeJT4fUeVlf+Odj6FInBjybYFm2Gawvb5LxsnK5TTSpupPxkzITwgq7EczMr1D/ao0tVg==
X-Received: by 2002:adf:e8cb:0:b0:236:7ae2:918e with SMTP id
 k11-20020adfe8cb000000b002367ae2918emr7911805wrn.613.1667217250497; 
 Mon, 31 Oct 2022 04:54:10 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003a84375d0d1sm7293751wmb.44.2022.10.31.04.54.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Oct 2022 04:54:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 1/6] hw/sd/sdhci: MMIO region is implemented in 32-bit
 accesses
Date: Mon, 31 Oct 2022 12:53:57 +0100
Message-Id: <20221031115402.91912-2-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221031115402.91912-1-philmd@linaro.org>
References: <20221031115402.91912-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
 hw/sd/sdhci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0e5e988927..f9c5b58e6d 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1332,6 +1332,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 static const MemoryRegionOps sdhci_mmio_ops = {
     .read = sdhci_read,
     .write = sdhci_write,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4,
-- 
2.37.3


