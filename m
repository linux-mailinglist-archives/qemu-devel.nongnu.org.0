Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5004405A6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:04:19 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgav5-00005E-0d
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgat0-0005eM-DR
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgasy-0006vA-CE
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635548527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2fDFAc7gOIKhashE6Z5lpWxdStHb3k+AZEzvZL+GxU=;
 b=MYWHDBg+0ADWAXqpwgqgeGdtdTh9WdCY9IKupfWOBhXIYWu9pOHTmfnfB0ekYjGFGL80po
 xmcFbno30LUdVSPRxK+PxURe8sByDEgPZC16NYlc7vKyuvAojUcK8WVfYzBS6eKdUEHVnf
 S/9TovVhzUss2c/rpfgxGR4Pa8vFoPg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-hwqUgkNWM0yM9koCVacpXg-1; Fri, 29 Oct 2021 19:02:04 -0400
X-MC-Unique: hwqUgkNWM0yM9koCVacpXg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso4146391wrc.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q2fDFAc7gOIKhashE6Z5lpWxdStHb3k+AZEzvZL+GxU=;
 b=4nm+NXrswYQqVSY0XPDjEVhCSZy0oBQBafkmqDNq3H5sP+DBBH4XPM2zOosdFaWuv6
 +axHy2VDBXBIaaqV80tzLYxxMM3NUqb3OeM5fFSYRVr33DDzVpt5ke1erNWF3VLLH5X7
 hlJ17/8CUGupC3h6gF7+Jnd5ojdeI+MzqqKk20o2vP5zowkuO3aPI4hHP3UptGE8ISHr
 elPjGiVHTry55OM5Qeu7HqOt6AnpHi1lA/lzQfMMZuhfaNiotLhzbHKLPTfNLcGXIkrA
 i5EA+NJ1hNzS/lSVOFVNFyBxsmEUnssdNiYjILrHxB5KZTuS5Lb2w0C1aAupkp3vjKVS
 bHOw==
X-Gm-Message-State: AOAM532xkDU0Ree99IIJ/VXNtm3mThQITwHo0KlyDFegY1vjsD5SD04j
 rF95TpwptOcYiiTbsiisSdtiepFrv8VZexRAHnEIe6tfFht48W97v+J1qJ1PKh4Rt6BH5HkZP8k
 OoMsSZuU8syUw3KTn2HybeHC1TJIIZXDRwlFHfvKgpr+kaghspBtSih4eSUKuXcCu
X-Received: by 2002:a1c:9a16:: with SMTP id c22mr7459178wme.160.1635548523069; 
 Fri, 29 Oct 2021 16:02:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQG9w/QB44HVwDMNYUNEl0fIIEo3NlqkQGCmSiNb0t7Twi0YKWXHqfiI67mdWPjqij9YdvKw==
X-Received: by 2002:a1c:9a16:: with SMTP id c22mr7459151wme.160.1635548522811; 
 Fri, 29 Oct 2021 16:02:02 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m34sm5465765wms.25.2021.10.29.16.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:02:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/core: Remove uses of QERR_DEVICE_NO_HOTPLUG
Date: Sat, 30 Oct 2021 01:01:45 +0200
Message-Id: <20211029230147.2465055-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029230147.2465055-1-philmd@redhat.com>
References: <20211029230147.2465055-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QERR_DEVICE_NO_HOTPLUG definition is obsolete since 2015 (commit
4629ed1e989, "qerror: Finally unused, clean up"). Replace the two
uses and drop the definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qapi/qmp/qerror.h | 3 ---
 hw/core/qdev.c            | 3 ++-
 softmmu/qdev-monitor.c    | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 596fce0c54e..f49ae01cdb0 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -26,9 +26,6 @@
 #define QERR_DEVICE_IN_USE \
     "Device '%s' is in use"
 
-#define QERR_DEVICE_NO_HOTPLUG \
-    "Device '%s' does not support hotplugging"
-
 #define QERR_FEATURE_DISABLED \
     "The feature '%s' is not enabled"
 
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 7f06403752d..14375861c36 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -734,7 +734,8 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
     static int unattached_count;
 
     if (dev->hotplugged && !dc->hotpluggable) {
-        error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
+        error_setg(errp, "Device '%s' does not support hotplugging",
+                   object_get_typename(obj));
         return;
     }
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4851de51a5c..35a885a6623 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -896,7 +896,7 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     }
 
     if (!dc->hotpluggable) {
-        error_setg(errp, QERR_DEVICE_NO_HOTPLUG,
+        error_setg(errp, "Device '%s' does not support hotplugging",
                    object_get_typename(OBJECT(dev)));
         return;
     }
-- 
2.31.1


