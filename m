Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC9668A140
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:10:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0VP-000796-B3; Fri, 03 Feb 2023 13:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VN-00078n-81
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:45 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VL-0008Ed-Pe
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:45 -0500
Received: by mail-wr1-x436.google.com with SMTP id a2so5116401wrd.6
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7hpzOoatAaR1sv90A1kGZcFCN2UpEoRoocI+6JRu0E=;
 b=z6eTEeWHfQXgqllooKcV4N3zoNYO15jzWZdtIsI/zQXKfW4kKTCVtgnUybmZOXl1gw
 sB7bBMD5AcXW7wkfOyQNIJVWUR8/n8BSUvffXvYyH0yGiS5/axnZ2hCz+gkySmfTrdPZ
 S2hs6bu03Nq2hTPEmCqqVEbP1bgaXvk1NxfSaf//6Hs8E9ZTrHJewvdHsKuIQwUtNWTG
 PEdkuQyhc+7LritXI3ro0aO4hUQXNrfjkmJ+cqKEO05cjLQZN4sXmdQ0y8B0k5ndkJSE
 YVZO2yPPE1bHW1tofInIfuiT5KTWWpBhceySQSjmnBr76EuR8CDCn07FsVIYaCEE+nbE
 Qh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7hpzOoatAaR1sv90A1kGZcFCN2UpEoRoocI+6JRu0E=;
 b=z4AOcQAk9m/7snxuQ5ZuPH6oX1F6Kahfsc2bEzaKMSURrh5Tl/gNsl9hXo6n0LH+RS
 2pwr1BUdmXMPiJoedY0LhfobmlV867lG1kwyAfNvdISa0XVNoUUmk8qTqDB6wt3WRcPb
 6jjl9XCjHwAN2JuU2i5Cibp/5995mIaaMEEHSxdYeG4PGWfB5YPSVNgk1V3sELfaXkAi
 aB34mcv4MuqZiHn2m9OLCuAnJX2hXe1aZ699V1BnCOVyEOFbjHkwiFUOarFSb2oBxrKH
 mOrvo9BF1OZn6OUHjXsW0qIVtYX4QgKfSTKEBDSiWziu2ZmlwTKPnoqhYrnIA7kasWFN
 Aetg==
X-Gm-Message-State: AO0yUKVcFk/w2QCxfB6H0YLmKMJj32GiCp/hWsNvEHQACNEHdaMfogwY
 F2cRZk9rt8/yrgbFmYAmI1x5O5xezC1QLKer
X-Google-Smtp-Source: AK7set9h1pM9y6+9JL71LzPkRvb/PkieO5maklRzQZSGIassxnuHWquoddyOkdADO+BLKe+AZ3HIWg==
X-Received: by 2002:adf:fc88:0:b0:2bf:d940:29b6 with SMTP id
 g8-20020adffc88000000b002bfd94029b6mr9838575wrr.54.1675447782284; 
 Fri, 03 Feb 2023 10:09:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d65cf000000b002bfc0558ecdsm2513920wrw.113.2023.02.03.10.09.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [RFC PATCH 05/19] hw/core/numa: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:00 +0100
Message-Id: <20230203180914.49112-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index d8d36b16d8..9b6f9848e3 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -34,6 +34,7 @@
 #include "qapi/opts-visitor.h"
 #include "qapi/qapi-visit-machine.h"
 #include "sysemu/qtest.h"
+#include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
 #include "hw/mem/pc-dimm.h"
 #include "migration/vmstate.h"
@@ -740,8 +741,7 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
         /* due to bug in libvirt, it doesn't pass node-id from props on
          * device_add as expected, so we have to fix it up here */
         if (slot->props.has_node_id) {
-            object_property_set_int(OBJECT(dev), "node-id",
-                                    slot->props.node_id, errp);
+            qdev_prop_set_int32(dev, "node-id", slot->props.node_id);
         }
     } else if (node_id != slot->props.node_id) {
         error_setg(errp, "invalid node-id, must be %"PRId64,
-- 
2.38.1


