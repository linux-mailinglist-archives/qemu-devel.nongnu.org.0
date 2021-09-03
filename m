Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F6400471
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:00:37 +0200 (CEST)
Received: from localhost ([::1]:59114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDUS-000071-8m
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGP-0008FM-Uc
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGN-00016w-Dl
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuT0E6Tl+Ny+4npFTuPZzaTG6opZzVO57bTMu99Gkj8=;
 b=TcTMoLN/LjT5OgqSmYz1GXrPFd3k8kB56DCaD1RqIbiv8mGUUaKeY+4O9duMu8DoLOsutj
 4d3Hm1HWXYF85yese0q1g61p0sldcUXmy4MhyjQ6gJj4vUwFHpZNOZZkid635NokiWFBG5
 8n1i6zLeRgZpOYqLvNFLzVNoXswO91s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-7w84aotjO26uBoPBsuhvkA-1; Fri, 03 Sep 2021 13:46:01 -0400
X-MC-Unique: 7w84aotjO26uBoPBsuhvkA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so60565wmc.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vuT0E6Tl+Ny+4npFTuPZzaTG6opZzVO57bTMu99Gkj8=;
 b=ZnYf0w4y217eF4RHN7n3Fng8CvCpOHcEcrDJcN7tMsdfQ9XbcqR39UtAoxc9QLv0r4
 u112T8YAo0Com++8cdmuTNkFPW9LyJxIQ5dZBGkLr5klO8IfFdUq38PSWC0Wd/gmI1KZ
 +cSAp9TFbLNCEkyZymIpb/rtUwyoaFcTLS7dVpnqGaFAQJqId6zPoH836XKmIRRVRTHU
 kb/vK6EpJWEZjQU0feBmjAzxT3bVBu9r4SKEv3pPaaHG2nX6IvlcCoMA9A/ybTn8McxQ
 4DqUwS3RaJiMg2uQEEUwAo2ECvEEdQs6UzpEEZRo6W0UPaeUvCTN7ApqExUAMZyDk6w+
 bdWw==
X-Gm-Message-State: AOAM5308XpCk6KykJyKCrskhRHTpShXgDUID+InhXaZ897t7xBIxXval
 td8hQi4HTfVtiXIlB9Kl1++y49YOt0HfDu95b+y//R8DQ1yrvBY8jCBRH53UZZ3Vzo7PpLVK8w+
 MWYyf7CZTzGUMjlmEBxwv80eyoxP55TAm51TH9RvG6VG7vHS4MSLcCCZbnjTyZ52W
X-Received: by 2002:a7b:c351:: with SMTP id l17mr36847wmj.120.1630691160225;
 Fri, 03 Sep 2021 10:46:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOfy7GndEJXUQXcty/5RLx6EqPg62DeFtIgRu/L1L+w+fM59AGQmNYo6tvuwvhSAu/jq0T8g==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr36811wmj.120.1630691159937;
 Fri, 03 Sep 2021 10:45:59 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l7sm39739wmj.9.2021.09.03.10.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/28] hw/acpi: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:51 +0200
Message-Id: <20210903174510.751630-10-philmd@redhat.com>
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
 hw/acpi/core.c       | 3 ++-
 hw/i386/acpi-build.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 1e004d0078d..50ee821aae5 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -637,7 +637,8 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
         suspend[3] = 1 | ((!disable_s3) << 7);
         suspend[4] = s4_val | ((!disable_s4) << 7);
 
-        fw_cfg_add_file(fw_cfg, "etc/system-states", g_memdup(suspend, 6), 6);
+        fw_cfg_add_file(fw_cfg, "etc/system-states",
+                        g_memdup2(suspend, 6), 6);
     }
 }
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index aa269914b49..dd5c06c8cd5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2785,7 +2785,7 @@ void acpi_setup(void)
          */
         unsigned rsdp_size = acpi_data_len(tables.rsdp);
 
-        build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
+        build_state->rsdp = g_memdup2(tables.rsdp->data, rsdp_size);
         fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
                                  acpi_build_update, NULL, build_state,
                                  build_state->rsdp, rsdp_size, true);
-- 
2.31.1


