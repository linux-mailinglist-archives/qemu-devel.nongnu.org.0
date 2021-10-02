Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E641FBFA
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 14:57:26 +0200 (CEST)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeZx-0005VU-B6
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 08:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeX0-0001pH-WF
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWw-0000qB-A6
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLN18Kg90p6yE/kKbVk7ZeNbapKw0JC8XYHCCSL7Hxc=;
 b=G2SlhV2eoghm0rtn0L01sKnYP5pk49hGqs8TOctLQ7fvVxzpIJfOv+XwbTWbN95BF+6gZG
 7WefoN+Bvo5xGWG+EUN8H3O5oS1JfkhxOX82or6G+6ONN9BnBlH+npKb9AVZmge11q+0xV
 CN0ADzEVNLlj54gOWWHoZweWS+m+F+4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-EFnRYPv0PbmRt9G-1OjJwQ-1; Sat, 02 Oct 2021 08:54:15 -0400
X-MC-Unique: EFnRYPv0PbmRt9G-1OjJwQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j21-20020a05600c1c1500b0030ccce95837so3789266wms.3
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PLN18Kg90p6yE/kKbVk7ZeNbapKw0JC8XYHCCSL7Hxc=;
 b=h4VmvKhqrDkT+PKnUDr0gigCBMeO5iKcHpt4uokmg5yDbThfIhVvWwhwLpaHLOZZs5
 Lf8IznzF1ujY1XqxhJyjvjGrYx8FLILrN8KMPQU/vEapTcQSV/r93PS+jtSkoaq7WIYm
 jZzsNOG2MqkRkdq4EdA4NjrPMTjmGBgdJu4WvrgBMsj0xPLmT5ciqM0kUnq/KO+JvpU5
 0B5gEMxj1eIYPaAJdwsTGCIovQTGNNTeE4cKQC8pYKGJImWquvQ+7od89rqZZpUuW1ZV
 Xm0T2kBF/qXCrHHqRyS9GKmPNqdiO3/zUGOVlOXYZUT7uRweEXi+fhPq0+7Kz3g7QiTm
 BYMw==
X-Gm-Message-State: AOAM5307OmXRUZ7rLDSxEVPgMGa0teo993HjHYqSN+H5n9eapV3fh4Ut
 oSAgsm3qKPytuOc9D+gSLsV3QRdWdr4Mvw3D12h4kS5KrXbbGKe5PxX6OgNCqy4UnoBYsRUz0iN
 4EQW/qWlpjLarWG4hFHqLXDW7xvzwxk2jv13vTlpkcJWGL7lcE1Efy0qrtb0+ONyA
X-Received: by 2002:a1c:451:: with SMTP id 78mr9420885wme.158.1633179253688;
 Sat, 02 Oct 2021 05:54:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvcuP74ApKFXkJudhkd8SG4XnSX9kLVw5i9VtVFVZpVk56S2QPWclGVjksHGgaC8beyVsBGA==
X-Received: by 2002:a1c:451:: with SMTP id 78mr9420859wme.158.1633179253445;
 Sat, 02 Oct 2021 05:54:13 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f3sm4714202wmb.12.2021.10.02.05.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/22] target/i386/sev: Declare system-specific functions
 in 'sev_i386.h'
Date: Sat,  2 Oct 2021 14:53:07 +0200
Message-Id: <20211002125317.3418648-13-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While prefixed with sysemu, 'sysemu/sev.h' contains the architecture
specific declarations. The system specific parts are declared in
'sev_i386.h'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/sev.h   | 6 ------
 target/i386/sev_i386.h | 7 +++++++
 hw/i386/pc_sysfw.c     | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 94d821d737c..a329ed75c1c 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -18,11 +18,5 @@
 
 bool sev_enabled(void);
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
-int sev_inject_launch_secret(const char *hdr, const char *secret,
-                             uint64_t gpa, Error **errp);
-
-int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
-void sev_es_set_reset_vector(CPUState *cpu);
 
 #endif
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index afa19a0a161..0798ab3519a 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -33,4 +33,11 @@ extern SevCapability *sev_get_capabilities(Error **errp);
 extern SevAttestationReport *
 sev_get_attestation_report(const char *mnonce, Error **errp);
 
+int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa, Error **errp);
+
+int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
+void sev_es_set_reset_vector(CPUState *cpu);
+
 #endif
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 68d6b1f783e..0b202138b66 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -37,7 +37,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
+#include "sev_i386.h"
 
 #define FLASH_SECTOR_SIZE 4096
 
-- 
2.31.1


