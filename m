Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9211050DB79
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:43:46 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuJt-000536-6j
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu08-0006V5-2G
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu03-0002gU-8n
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZepi0m5BVgKJx/HPDJyrJ5ZvGt/JKxiUh6H4LwnwPg=;
 b=cIkucddEBbYJaLLYHnt96ElDY1qprhm8qXvpPbFL4Qqlv2iEcRcE527oEx/ZlXAfOz0udJ
 aSbmTy+dGDMH6DJWqlBUY3oTb2ztLXB2S0M98iSQzfEW7eGtg6upOaFAHU1Zg0/9GpIolF
 FHGpkBTRALSQUJC9/ksxqNEMsuUtdm8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-jisiurINOx-zymX68PMyXQ-1; Mon, 25 Apr 2022 04:22:06 -0400
X-MC-Unique: jisiurINOx-zymX68PMyXQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l7-20020adfbd87000000b0020ac0a4d23dso2389288wrh.17
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZepi0m5BVgKJx/HPDJyrJ5ZvGt/JKxiUh6H4LwnwPg=;
 b=DpC2u4sNdyLLs8xPc/hQsasKRj8YzhdOwyp5QbjyreeMV8wNU86uFRe0sya+ZxEaHa
 mb57aQHkZJaZ1lhC9q/dF+icpKEQAelwRYyvxeo+LpRh0WszZuZS9hZcBqGZ7EZCmv9D
 3qhSAipy1zztuh+i5b1QkTXMiXtkzBjcq2/HUlQf0cqfpVR7SmJyWycSvdRTmW8Gq5zs
 gdV71UCBMrAa6wOS47ODo6qEN7+doDflHk8RJkcKbdt0iqRdMhje4RJkFuppOW7aVsTP
 HGLRFbvPjBfHhuKuCBA+Rq7HF3QM6bJPq3CtLLA4nvZHlrhMOt4hhldCehnYKHD3wPul
 qhkQ==
X-Gm-Message-State: AOAM531frBFnfryKFPvBNNai2pX3z3U7OJtkNcmT+X26xjwoz684fShg
 +MDiyxkrv2SFQ3XjmbaikoVRHe0ORQ7KPUeG37UKQhLXnIekig1f8ftApYYwQzA9Rmi8mV6J/lp
 AD4sALg4+OQsjbTM=
X-Received: by 2002:a7b:c8d5:0:b0:392:b12e:fd11 with SMTP id
 f21-20020a7bc8d5000000b00392b12efd11mr15517517wml.96.1650874925077; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUahLQt6GhA+0msQeYylE6Fv6b6MYTVsGx0uQ2lBLi4J52QheCVTnDPzDtU109D1faST8FXQ==
X-Received: by 2002:a7b:c8d5:0:b0:392:b12e:fd11 with SMTP id
 f21-20020a7bc8d5000000b00392b12efd11mr15517503wml.96.1650874924883; 
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c4ecd00b00393ec8be5cfsm1755054wmq.24.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 3F2DC67B1B5C;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/18] Introduce machine's default-audiodev property
Date: Mon, 25 Apr 2022 10:21:50 +0200
Message-Id: <49192ccd62fc98c474bb0b627a22cc28a634e8b8.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many machine types have default audio devices with no way to set the underlying
audiodev.  Instead of adding an option for each and every one of them this new
property can be used as a default during machine initialisation when creating
such devices.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 hw/core/machine.c   | 23 +++++++++++++++++++++++
 include/hw/boards.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index cb9bbc844d24..d055a126d398 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -596,6 +596,22 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
     ms->ram_memdev_id = g_strdup(value);
 }
 
+static char *machine_get_default_audiodev(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return g_strdup(ms->default_audiodev);
+}
+
+static void machine_set_default_audiodev(Object *obj, const char *value,
+                                         Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    g_free(ms->default_audiodev);
+    ms->default_audiodev = g_strdup(value);
+}
+
 HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 {
     int i;
@@ -867,6 +883,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "confidential-guest-support",
                                           "Set confidential guest scheme to support");
 
+    object_class_property_add_str(oc, "default-audiodev",
+                                  machine_get_default_audiodev,
+                                  machine_set_default_audiodev);
+    object_class_property_set_description(oc, "default-audiodev",
+                                          "Audiodev to use for default machine devices");
+
     /* For compatibility */
     object_class_property_add_str(oc, "memory-encryption",
         machine_get_memory_encryption, machine_set_memory_encryption);
@@ -961,6 +983,7 @@ static void machine_finalize(Object *obj)
     g_free(ms->device_memory);
     g_free(ms->nvdimms_state);
     g_free(ms->numa_state);
+    g_free(ms->default_audiodev);
 }
 
 bool machine_usb(MachineState *machine)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index d64b5481e834..5be1de50af03 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -346,6 +346,7 @@ struct MachineState {
      */
     MemoryRegion *ram;
     DeviceMemoryState *device_memory;
+    char *default_audiodev;
 
     ram_addr_t ram_size;
     ram_addr_t maxram_size;
-- 
2.35.1


