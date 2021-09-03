Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA3400484
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:06:37 +0200 (CEST)
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDaG-00030r-Dz
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGu-0000Rm-T3
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGe-0001R6-6T
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Z0QUNuHHLKTpTAzIZmgjtHARc7fEMtqBBgS6AoxAXY=;
 b=gs/UND5YOngyHDZn9I6PN8eHn+TcK3JhQTGQ/gdoNEx2W07BqW/zAxl6AM+e22S0PHi8WZ
 nJVqSTR4xI12f4Jaw3aKkNpwSghCEgoIsnNOiXquiAjNQDy+XSx9qdftIwApNA9fP1b0hR
 rXWuMLnEdB87TPwh3BG2KlL5WnmRACk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-7u51FXM8OpOh4wvWhu0uZA-1; Fri, 03 Sep 2021 13:46:18 -0400
X-MC-Unique: 7u51FXM8OpOh4wvWhu0uZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b126-20020a1c8084000000b002f152a868a2so39239wmd.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Z0QUNuHHLKTpTAzIZmgjtHARc7fEMtqBBgS6AoxAXY=;
 b=igWfMmDMI0NBv1ci+YT74evQzNDyQSWcE8b/uuPjXHTRfX5xLm5N/NAsPHxl3MJXWS
 Q5DjWzbtpltkg8nL9+NzM08RbY5/XAWWJ9ON0xHpH+FjNtgGtbmVrHleHWlb7sNFjpuu
 VKD4Mgtb/69u0hz6W8kgv62MBrEr6DF36Nbowgjo/u8sPV532JlLyw6vMU3K48Cdi1IE
 DekBhY3A7fHots9YBitStbuO5b+1zEf67GM75327BJj6rEtm0jzahFX3Tc7u0prny9FD
 JcnRC1DZvYUxDYSBRBPlulbtyI17lQMhfMDp+1lYlg6rd+YHtHUjF6tcZ0oBEUSo3oSV
 WO5g==
X-Gm-Message-State: AOAM530OGDkk9ToE7hIOzCNOrmr+uH1SHOFb2dO8zF9g6aVWcd5fESXy
 rTaeeNclTJoNGwSXryP0Ow4ZW/PgRphSjfmA/8NTMaNFvV3B808fnkcwYAOoxyQCduON8sI4fo7
 LbYi/ke5KZprpec3eXpI2IM6IJPbTkgcYarLmgZObJcS9YT4K8To3us+egUhslICj
X-Received: by 2002:a1c:791a:: with SMTP id l26mr42919wme.100.1630691177349;
 Fri, 03 Sep 2021 10:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzqcf6Hbm3oqFkT6XUTtPylEpNworI588FihIEeehShOy2CyDT2IkiButXZnCpFY4zNho+yA==
X-Received: by 2002:a1c:791a:: with SMTP id l26mr42882wme.100.1630691177104;
 Fri, 03 Sep 2021 10:46:17 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c1sm69751wml.33.2021.09.03.10.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/28] hw/i386/multiboot: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:54 +0200
Message-Id: <20210903174510.751630-13-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 hw/i386/multiboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 9e7d69d4705..754415d17f3 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -387,7 +387,7 @@ int load_multiboot(FWCfgState *fw_cfg,
     mb_debug("           mb_mods_count = %d", mbs.mb_mods_count);
 
     /* save bootinfo off the stack */
-    mb_bootinfo_data = g_memdup(bootinfo, sizeof(bootinfo));
+    mb_bootinfo_data = g_memdup2(bootinfo, sizeof(bootinfo));
 
     /* Pass variables to option rom */
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, mh_entry_addr);
-- 
2.31.1


