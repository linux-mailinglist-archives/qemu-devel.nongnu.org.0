Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC9662652
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxn-0008WR-1B; Mon, 09 Jan 2023 07:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxH-0008Op-OM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:08:47 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxG-0005s9-6u
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:08:43 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8818941wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUbM2ZYO9/VNz+sUlf1XOfM6SSTREiXg498MIdZvH+I=;
 b=TSBcAgGElrJTYkLT7iFpTJyC91qVcc7sPoO37GgSZ73dKuLXiIGsiP+gGqij0nX+iS
 Cl1w/wqOAjjshH8IDhCXXID+xTxLhgJY/8E5VJN+VDOv/LEbR9pRpnYwtU4eHWqZTRik
 ntub4zfRP88Is82oeBOjfJwx4ZOFYWdb7ARtWX9DGmji5ybvVAgbAaq88BctOVmbwt/d
 WF5mFyh5vjYi4e0OOkfa6peeWBI5BmuFpP6K2gWUxv3ncSu2aYaUzEB/HZYy90SnjUE1
 F0FGquKBEtfqBCg9on2A96Lo5sKaGPc08jCe7+63zKYgEyFdVgRtU5EQ2mASDXWqmfuu
 SbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUbM2ZYO9/VNz+sUlf1XOfM6SSTREiXg498MIdZvH+I=;
 b=enhJhd+2DcL32sHl/x9dlMrLbzedM5PRJmIZd1DwG68VDN44xSUlu8fl4OuBTE/W/m
 oazdGMEvQJ5aPtE+5JK4KZYfD3uqd1yd46IM/E1GUPVNjLf2VO2ecu21TSTg9MiHRaX9
 ytIR/9qP3N8muVFRW75Sb1cHIheT83GfFAchCPU7aWM+vyBk8CnUCin9vC/T8+qTqmN+
 pA0S5wzeeIC9sCNG35WSB1uaTFz+LI0JNkZruzgLdgZH2mJnJpOpi58o4RfKEde0bzWr
 Nx9egi8KaXdc7ZSIivmZaZg9l+TZ5QXwJiGszHVIyzghhiyjvDXo0hWyTw5pMhuKW8xu
 f0bw==
X-Gm-Message-State: AFqh2krqEJc2wV+vfbpijRkZasVNsTkGj4YBhfnDl4jd0N58xvXp/36p
 P1///S4/CDNphilbZuM3IkCPxjaN8NLlTlXS
X-Google-Smtp-Source: AMrXdXumQ1nbutIzzZIvXMZZAK9F6PUQWv68c46TGh6CjPK357/nN9aP2yk8zjQYS7EdvnHxVS5PQw==
X-Received: by 2002:a05:600c:556f:b0:3d2:2a74:3a90 with SMTP id
 ja15-20020a05600c556f00b003d22a743a90mr48545553wmb.22.1673266120233; 
 Mon, 09 Jan 2023 04:08:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003b492753826sm10622105wme.43.2023.01.09.04.08.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:08:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width' property
 as 'device-width'
Date: Mon,  9 Jan 2023 13:08:13 +0100
Message-Id: <20230109120833.3330-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Use the same property name than the TYPE_PFLASH_CFI01 model.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..55ddd0916c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -949,7 +949,7 @@ static Property pflash_cfi02_properties[] = {
     DEFINE_PROP_UINT32("sector-length2", PFlashCFI02, sector_len[2], 0),
     DEFINE_PROP_UINT32("num-blocks3", PFlashCFI02, nb_blocs[3], 0),
     DEFINE_PROP_UINT32("sector-length3", PFlashCFI02, sector_len[3], 0),
-    DEFINE_PROP_UINT8("width", PFlashCFI02, width, 0),
+    DEFINE_PROP_UINT8("device-width", PFlashCFI02, width, 0),
     DEFINE_PROP_UINT8("mappings", PFlashCFI02, mappings, 0),
     DEFINE_PROP_UINT8("big-endian", PFlashCFI02, be, 0),
     DEFINE_PROP_UINT16("id0", PFlashCFI02, ident0, 0),
@@ -1014,7 +1014,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
     assert(QEMU_IS_ALIGNED(size, sector_len));
     qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
     qdev_prop_set_uint32(dev, "sector-length", sector_len);
-    qdev_prop_set_uint8(dev, "width", width);
+    qdev_prop_set_uint8(dev, "device-width", width);
     qdev_prop_set_uint8(dev, "mappings", nb_mappings);
     qdev_prop_set_uint8(dev, "big-endian", !!be);
     qdev_prop_set_uint16(dev, "id0", id0);
-- 
2.38.1


