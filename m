Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E1663470
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF12N-0004tt-Bn; Mon, 09 Jan 2023 17:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12K-0004nA-V3
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF12I-0007jB-9a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:54:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so8465065wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEIyfTZu5Mi/i+A1aDFcrn/cc8NYJ3wg49JfcYmsmDE=;
 b=HRpR2jNZdY5XRSuS9ewBPJgZWnUTfB4+X7CL7Wjorn0m9hjGS+ybnj6+y1aaGN1/on
 XttWwAu4n+dMXqBcGV30NcDYylXasFl3jFD2O54JMN0Tzj0ZL3Q0/q0sgJw9vhfRQgNm
 Q6QlS1DSO898Bl1sl7DPWincv85QzOBjgb9kOPvebGCXlPA2Wu5qmVGc9AkrU06BNgKK
 6tSeDgTlK6q8fJw/jAyx7glmEDfKI2F3gSdvJfG3Id1wEUVeBoPuSSlcO+IjfFuZB6zI
 esnuw602lJzOIEQwbtvadyU5iQTP4ApZnHn4GUWcykOiOsCfb1Ea+4t6cnT1AN70B8Yg
 K1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEIyfTZu5Mi/i+A1aDFcrn/cc8NYJ3wg49JfcYmsmDE=;
 b=y4+mhGiasIk3wYspYvTumtUKRKnZYsQzViUmeO4i1zJkd+RCMC5DkYwrvJ5QFh0O4g
 kxY8q2oOE/A6HJrNtWUXVADdhHb/SR/kIrlVHHRlrE++0+eE2ko3B8CgZYOpkzwOvKA6
 nwDxRyVDPd+gAiUSfaWpyFdb1Qtd6Jita/lM7y13NHqVlsLfZDApK5Prdss/IAhNrqnm
 HqWA2sariBmZfgCbnL2xHjSviK1YfqQw80gDHpWr7d+UJjZ1oXxWbQxCCGhNvHPNS8EX
 D+dNt9PU6yheI6/2m6y0W9XXtB7zN9KvJsSUMiPQPZVS8eguj0hoqYDdtcSiMe7AjgY8
 60sg==
X-Gm-Message-State: AFqh2krcrsuUWWfYfEnNb+8QN4QZ3lAMJ8jqNr9Y9YGjrImoomRaNrAW
 VRHyvrC4O51skomZNza2QMn6qxG106l8ZpNp
X-Google-Smtp-Source: AMrXdXtcqYFauBKrqFI1URfmJh1PJVo0GZ01N/0aVvbSt/0ZSUIYVDbK5LVZ6tgSqA4cyE+X2OcIgA==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr50942726wmq.32.1673304872811; 
 Mon, 09 Jan 2023 14:54:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm9273003wmq.9.2023.01.09.14.54.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 14:54:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [RFC PATCH 2/4] hw/block: Rename TYPE_PFLASH_CFI02 'width' property
 as 'device-width'
Date: Mon,  9 Jan 2023 23:54:17 +0100
Message-Id: <20230109225419.22621-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109225419.22621-1-philmd@linaro.org>
References: <20230109225419.22621-1-philmd@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the same property name than the TYPE_PFLASH_CFI01 model.

Deprecate the current 'width' property and add the 'device-width'
property pointing to the same field in PFlashCFI02.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi02.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..bbf78ad1e4 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -950,6 +950,7 @@ static Property pflash_cfi02_properties[] = {
     DEFINE_PROP_UINT32("num-blocks3", PFlashCFI02, nb_blocs[3], 0),
     DEFINE_PROP_UINT32("sector-length3", PFlashCFI02, sector_len[3], 0),
     DEFINE_PROP_UINT8("width", PFlashCFI02, width, 0),
+    DEFINE_PROP_UINT8("device-width", PFlashCFI02, width, 0),
     DEFINE_PROP_UINT8("mappings", PFlashCFI02, mappings, 0),
     DEFINE_PROP_UINT8("big-endian", PFlashCFI02, be, 0),
     DEFINE_PROP_UINT16("id0", PFlashCFI02, ident0, 0),
@@ -978,6 +979,11 @@ static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
     dc->unrealize = pflash_cfi02_unrealize;
     device_class_set_props(dc, pflash_cfi02_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+
+    object_class_property_deprecate(klass, "width",
+                                    "renamed as '"
+                                    TYPE_PFLASH_CFI02 ".device-width'",
+                                    8, 0);
 }
 
 static const TypeInfo pflash_cfi02_info = {
@@ -1014,7 +1020,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
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


