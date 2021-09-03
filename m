Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6B0400488
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:08:45 +0200 (CEST)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDcK-0000U8-Hh
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGt-0000N2-07
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGq-0001bf-8t
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGrkYkWYoLzH5iMc48eZuN5QzKFZuweWVF3z5URSivI=;
 b=H4awcQLfaDuBGcrO8nZyKq/jb9ddDrdpx1aVfAWb9rWYQa8hIG+4j4HbqF3Ef5kR/emK8C
 W21fKMzpXB/P47A9hU9XC//JwfXYAIfAboBJ1a+vZqt3ynGV+aE2SbZt5JPGPXzrcCKZCj
 Ju/d5R9MdikYHHozmhXnSJPO6ZHRsbs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-K6SBTpEJNqmKYOz-sYrYrg-1; Fri, 03 Sep 2021 13:46:30 -0400
X-MC-Unique: K6SBTpEJNqmKYOz-sYrYrg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p11-20020a05600c204b00b002f05aff1663so52065wmg.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGrkYkWYoLzH5iMc48eZuN5QzKFZuweWVF3z5URSivI=;
 b=mjvcDfN7Sve6r+QLHbmV9ljo5LnZrOMPMFlap8DjgQOX+MDVjIJd/KqsvPT1W6zuL6
 DAl1aVNSshRkYZRR96zz+/pnW8+ox805TkTZxiBXj1IIblVbCjY5Y01uroCKWtGlkmTw
 qjpAQvbh1Budspyn8YSa4vTUvFTUDARzwr5x4s9fEt9sZgwHtPGqyl5yNA6Px98Of7fi
 2S6a6cb/8IMhMg2NvJnWu97MsDH01GffyW9KN4t1d/35S54GQRXQJLmv/tTUs2vfBqjR
 FePFNnP2Hw5aRcAyCyA/YzjmwZVvPE3SrgVStUfEuXagY/vjCXBPMdfOO8eWkxEOmAAV
 iVrQ==
X-Gm-Message-State: AOAM530mLxT/vdCkacZKirt9Op4yMwc4g+WugiwkWfXf4nZ4wKfe1jnM
 vzUXQKnfAzuH2HR1xhLTCwg6N2NLvS2GHGtTxB5OCM2wLW0a2Iq2CjOBNnHevktKujld6pEL3Iw
 A6ZiXV7IvAgF8xMEL5qesTN9Lul7e/8/laZMOeZ1PMlORS0qlyie5Vzi+CdtLTxms
X-Received: by 2002:a5d:548e:: with SMTP id h14mr272664wrv.7.1630691189155;
 Fri, 03 Sep 2021 10:46:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPe8oY+g0m15Fyl8eQQA1m4+jvAHKdDzW8237kXkmm3QKvsfVssWG5DJZ+wBMXydsZMq9/dg==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr272621wrv.7.1630691188926;
 Fri, 03 Sep 2021 10:46:28 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id w9sm5295828wrs.7.2021.09.03.10.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/28] hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:56 +0200
Message-Id: <20210903174510.751630-15-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b8dcca4ead..0c3cfa8a41e 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -205,7 +205,8 @@ static void fw_cfg_bootsplash(FWCfgState *s)
         /* use little endian format */
         bst_le16 = cpu_to_le16(bst_val);
         fw_cfg_add_file(s, "etc/boot-menu-wait",
-                        g_memdup(&bst_le16, sizeof bst_le16), sizeof bst_le16);
+                        g_memdup2(&bst_le16, sizeof bst_le16),
+                        sizeof bst_le16);
     }
 
     /* insert splash file if user configurated */
@@ -260,7 +261,7 @@ static void fw_cfg_reboot(FWCfgState *s)
     }
 
     rt_le32 = cpu_to_le32(rt_val);
-    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup(&rt_le32, 4), 4);
+    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup2(&rt_le32, 4), 4);
 }
 
 static void fw_cfg_write(FWCfgState *s, uint8_t value)
@@ -755,7 +756,7 @@ void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
     size_t sz = strlen(value) + 1;
 
     trace_fw_cfg_add_string(key, trace_key_name(key), value);
-    fw_cfg_add_bytes(s, key, g_memdup(value, sz), sz);
+    fw_cfg_add_bytes(s, key, g_memdup2(value, sz), sz);
 }
 
 void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value)
@@ -763,7 +764,7 @@ void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value)
     size_t sz = strlen(value) + 1;
     char *old;
 
-    old = fw_cfg_modify_bytes_read(s, key, g_memdup(value, sz), sz);
+    old = fw_cfg_modify_bytes_read(s, key, g_memdup2(value, sz), sz);
     g_free(old);
 }
 
-- 
2.31.1


