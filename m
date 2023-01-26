Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA3667D790
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dK-00080k-VS; Thu, 26 Jan 2023 16:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d4-0007u7-Um; Thu, 26 Jan 2023 16:17:55 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d3-0007ip-Eg; Thu, 26 Jan 2023 16:17:54 -0500
Received: by mail-ej1-x634.google.com with SMTP id tz11so8804561ejc.0;
 Thu, 26 Jan 2023 13:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRj6OGg23wCeRTbA04p9tOvOWVwWcmNFfwTftypZSv0=;
 b=cCyMMM4HVPhkTKyQp0sLfNjV/+3DmI4P2MzgsuMPSInLkPqXtLt802b6CXAxtJciwI
 EA9OfUUrlKO0sTxmZITIq0WKkHxW8z07IN9dIFDhVOoo12vODDmFwWaTu3BKXSDvQpUO
 A4iUWWyUVkqVBj4Ye1N7bNamqoaaOWusYKcJ0/PgO1SVz+KMZZnaNeNns7gxBT6baxJJ
 p0vXBdOjaCIkmgKyDcvGc9wmG04Meg0PvmFGSGi6txdB0IjHgkOkQPbqNdHnI9wyvk+2
 lBt4U5eYIcp7o5wQwyInHRasv7VR58k6ChySeB3HojIJRl6uvPFY0ZOxrATJMlyCBES2
 OaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRj6OGg23wCeRTbA04p9tOvOWVwWcmNFfwTftypZSv0=;
 b=C043tkNp1/djgCw6xjh0pOMw3e7ZZQ4LcNVvSBBVXLSSfFExAprAoU+uOA0mqMn5xP
 eeiFCkScsCcG35Qb4zgi3WVw8mMNgdV+gOD86cYuX9eFyxnr2QiIWLB3/M4O+F5TjwLf
 Ea8ARZQ9rR7eaoELL2fuLUJd59CxZRI6/FcuKoZe7cfsAN9UIwm9bSW6y6Kiqdq1/vtc
 pBtRN3kGAe+E6X+F2Xy5BGqTRm1ep1KpVG3ZyNona4i72WzoLkqDmByDJLbcnTW7YfRp
 SmhMWN/+JrVizeUCtCxy5EZXMX/0Z/SmR+1xOm6XPCOM0IK0NVlhGNm81xW3ETGoQ/ni
 8rjw==
X-Gm-Message-State: AFqh2kpzMn3C9xs5e4fzL9qBgk2XT56dLFx26PUaqgClJsIyf0YoMTvz
 umKD3gvo1M+702pqgtc4EXKofa9ZMevTrw==
X-Google-Smtp-Source: AMrXdXv6lHbh4VZXtVdZ7iyKCstBM79UNytcU6EmuIcATRHOA3LsS7527fLU7yWKOi5EFyIebnYjvw==
X-Received: by 2002:a17:907:ca07:b0:7c0:a1f9:c778 with SMTP id
 uk7-20020a170907ca0700b007c0a1f9c778mr34416818ejc.13.1674767871090; 
 Thu, 26 Jan 2023 13:17:51 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:50 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 01/10] softmmu/ioport: Move portio_list_init() in front of
 portio_list_add()
Date: Thu, 26 Jan 2023 22:17:31 +0100
Message-Id: <20230126211740.66874-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a preparation for the next patch to keep its diff smaller.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 softmmu/ioport.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index cb8adb0b93..215344467b 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -113,27 +113,6 @@ uint32_t cpu_inl(uint32_t addr)
     return val;
 }
 
-void portio_list_init(PortioList *piolist,
-                      Object *owner,
-                      const MemoryRegionPortio *callbacks,
-                      void *opaque, const char *name)
-{
-    unsigned n = 0;
-
-    while (callbacks[n].size) {
-        ++n;
-    }
-
-    piolist->ports = callbacks;
-    piolist->nr = 0;
-    piolist->regions = g_new0(MemoryRegion *, n);
-    piolist->address_space = NULL;
-    piolist->opaque = opaque;
-    piolist->owner = owner;
-    piolist->name = name;
-    piolist->flush_coalesced_mmio = false;
-}
-
 void portio_list_set_flush_coalesced(PortioList *piolist)
 {
     piolist->flush_coalesced_mmio = true;
@@ -250,6 +229,26 @@ static void portio_list_add_1(PortioList *piolist,
     ++piolist->nr;
 }
 
+void portio_list_init(PortioList *piolist, Object *owner,
+                      const MemoryRegionPortio *callbacks,
+                      void *opaque, const char *name)
+{
+    unsigned n = 0;
+
+    while (callbacks[n].size) {
+        ++n;
+    }
+
+    piolist->ports = callbacks;
+    piolist->nr = 0;
+    piolist->regions = g_new0(MemoryRegion *, n);
+    piolist->address_space = NULL;
+    piolist->opaque = opaque;
+    piolist->owner = owner;
+    piolist->name = name;
+    piolist->flush_coalesced_mmio = false;
+}
+
 void portio_list_add(PortioList *piolist,
                      MemoryRegion *address_space,
                      uint32_t start)
-- 
2.39.1


