Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444249666D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:40:41 +0100 (CET)
Received: from localhost ([::1]:37502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0i8-0005Uu-97
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:40:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nB0Z3-0005Qv-GD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:17 -0500
Received: from [2607:f8b0:4864:20::335] (port=33593
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nB0Yz-0003LK-B2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:16 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 y11-20020a0568302a0b00b0059a54d66106so13290459otu.0
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 12:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rM2PKadQThG9wWlP2b+s8gBO2tbsxFmmpRZ8OjzGb6c=;
 b=Tm1p/21lE2599Yq5+Px472k6KfKK41gQwLQgYH2c5Zi1BxULSAR0r7LrRZCrjcFDu9
 w+jHT1iCxAx8n1BHwnQLUYLxhNBxqpug/RwoxpBwobYmwunTJfnKLCgwuxLk0Jfipbb4
 pKhEbbKU2mCivPaDV2UTJR9bGNACy2ntuE8PccCgPJCzJJLB3C7P4Fe0297ieptgCIdE
 wptTmggbFwj5431Hj957RShorse/d/4QU537Qme0NrObk1zlP+43lBQdVIcIGcb6bE1v
 iJ/5QaPHd/HVqiucenp8Yxx2BnvX5dRX6wTloBuaPF1R5TgCvdx9TgVmRznfU46gvOOh
 OQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rM2PKadQThG9wWlP2b+s8gBO2tbsxFmmpRZ8OjzGb6c=;
 b=EdRCUGFNQvyneS3HccfoBQMbS4hEgegsNExl8ONTKhx8qm9AOAL2ZBIW2Ub2v1pUIl
 abWJwgaa20KvC9Dpb8s60quppXEkNGDLrGZ5VZtLu6JoYhZoal0appfNRMbKCeLgo/0B
 nfSVKydGPoTCWxzAnjhdAtKEAqnsZ0Ric6V+Zq2PqkGUO0TrvAKXR2BsM385m+8IPL1l
 2MKjk7rXNA+1WZzU9ig8VMEn6/9JoQMb5DWpq0UxWGEWQyIRCQkEhzFg0/y0BQWFRS3c
 ZmG5Lm1h5t3gxC+FmXLlP3QEKZxmBV+1VTeDMUy+BpsE/VNwGtrK1x5Zqv53WAalpNMU
 v5cw==
X-Gm-Message-State: AOAM530nue3mk5bxQNmqrBpm8Uv3XA3Kis4rcGmtfa3BiT/08Gb+BfrZ
 iucVU2zaVLcJneHq2ZW53lY9hax3j28=
X-Google-Smtp-Source: ABdhPJxAxfexSjQzv0uKeYYrvxhgThGfecW7N/EkfFtj9CqW+AITJuRaVN+1VGggo5AjDZf4/qlHhQ==
X-Received: by 2002:a9d:6e83:: with SMTP id a3mr3871777otr.307.1642797011079; 
 Fri, 21 Jan 2022 12:30:11 -0800 (PST)
Received: from rekt.ibmuc.com ([191.8.61.226])
 by smtp.gmail.com with ESMTPSA id ay14sm1908822oib.5.2022.01.21.12.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 12:30:10 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/core/fw-path-provider.c: open code
 fw_path_provider_get_dev_path()
Date: Fri, 21 Jan 2022 17:29:52 -0300
Message-Id: <20220121202952.24763-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121202952.24763-1-danielhb413@gmail.com>
References: <20220121202952.24763-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, pbonzini@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fw_path_provider_get_dev_path() is 2 lines long and it's used only by
fw_path_provider_try_get_dev_path(), which checks if FWPathProvider is
not NULL before calling it.

Open coding fw_path_provider_get_dev_path() into
fw_path_provider_try_get_dev_path() simplifies the code inside
fw-path-provider.c and make it easier to grep our way into finding the
callers of the FWPathProviderClass::get_dev_path() interface.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/core/fw-path-provider.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/hw/core/fw-path-provider.c b/hw/core/fw-path-provider.c
index 4bcf4e7e34..b8fa649fe2 100644
--- a/hw/core/fw-path-provider.c
+++ b/hw/core/fw-path-provider.c
@@ -19,25 +19,17 @@
 #include "hw/fw-path-provider.h"
 #include "qemu/module.h"
 
-static char *fw_path_provider_get_dev_path(FWPathProvider *p, BusState *bus,
-                                           DeviceState *dev)
-{
-    FWPathProviderClass *k = FW_PATH_PROVIDER_GET_CLASS(p);
-
-    return k->get_dev_path(p, bus, dev);
-}
-
 char *fw_path_provider_try_get_dev_path(Object *o, BusState *bus,
                                         DeviceState *dev)
 {
     FWPathProvider *p = (FWPathProvider *)
         object_dynamic_cast(o, TYPE_FW_PATH_PROVIDER);
 
-    if (p) {
-        return fw_path_provider_get_dev_path(p, bus, dev);
+    if (!p) {
+        return NULL;
     }
 
-    return NULL;
+    return FW_PATH_PROVIDER_GET_CLASS(p)->get_dev_path(p, bus, dev);
 }
 
 static const TypeInfo fw_path_provider_info = {
-- 
2.34.1


