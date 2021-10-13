Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B442BBA5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:31:46 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maabx-0006RQ-AT
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEp-0002Mo-Lk
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:54 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEk-0005ob-FZ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:51 -0400
Received: by mail-ed1-x531.google.com with SMTP id y12so7309338eda.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zJL8sLW6AgvhnhUvvGEi4Ld1qkJ3BqygiG806nIB4Oc=;
 b=Jq3ukb0s8gsGBublsENsjIDHLSbv5hRmzIrPa8EJ5+iiblyX/hLlSRKCB8ZLDw8Edd
 iIAtcB91NPktPrkxi+eyZL3CUO++qt59vEYG2DOIgmiTviqiZwLAAUd3FYiLgwKCPrqX
 CFFparY7Nem+eeI80lKNG1nzqo7NCtKQy8zVcNszoQjG8BvkwV3UluXT/vrjEMMcWkoK
 jesvIC7LAPqZsRTYCfxckzPUGrEdtaiBaj9q8EBlnbrxw3Hro2Ft0JA0Sgae1CsIxIKG
 eA6GZ/N0WCZU2CJJBECoXH3NO9wJv6gA4E9jUZqOb9TmA1EPH2Pufe6B/l848h/zy+4B
 TN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zJL8sLW6AgvhnhUvvGEi4Ld1qkJ3BqygiG806nIB4Oc=;
 b=XN24UkuKRZYZHP3qmlTyfFAyfWAGCK+3510WSpQ9J0M4vwzw6Oi1vl1cxS1FRvg3fn
 h8omVbq4tsNDJyxaHI0gg+ZDvq/UlG6BUu7njGGAQIaVW54BnKqd4ucoki2pscHj73eG
 wbgvxvXc3Uwz4qQSA+HQRR2LHMQQNeMke7xIu38UP/CSi4H1GN8UGUMff80dL2RmMIKB
 2dXCNtPAOnErIaj0vWNTgBkx+ZMrzdLhhLMDlGg05+eKHLliUDa8FRAPFGh3fX/JG0Sh
 xVpLEqYD4qZkcKbwcSkvEPJRFPJZikgaaFo1J2TZS0XZlWxgYFzLUyWqppXkbdKBlzNi
 Q3vw==
X-Gm-Message-State: AOAM531LKFpcxMlcmpW46zXs7MSTljPu0MPEZ7YaLY9KUPESc/I5H1SC
 dOvOkCtrTk2FD0VdFLalBMu+2piNaLE=
X-Google-Smtp-Source: ABdhPJwIonebvdf3AHGBvV+wpM2JMI9OThv2oOSchlhoMrEqoj80aS6qDDKO5c5J1rOm9YdkK2/Oew==
X-Received: by 2002:a17:907:205c:: with SMTP id
 pg28mr40357182ejb.407.1634116065233; 
 Wed, 13 Oct 2021 02:07:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/40] target/i386/sev: Move qmp_query_sev_attestation_report()
 to sev.c
Date: Wed, 13 Oct 2021 11:07:10 +0200
Message-Id: <20211013090728.309365-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Move qmp_query_sev_attestation_report() from monitor.c to sev.c
and make sev_get_attestation_report() static. We don't need the
stub anymore, remove it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-18-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/monitor.c         |  6 ------
 target/i386/sev-sysemu-stub.c |  5 +++--
 target/i386/sev.c             | 12 ++++++++++--
 target/i386/sev.h             |  2 --
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 935a8ee8ca..cf4a8a61a0 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -763,12 +763,6 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
     sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
 }
 
-SevAttestationReport *
-qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
-{
-    return sev_get_attestation_report(mnonce, errp);
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index 8082781feb..d5ec6b32e0 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
 #include "sev.h"
 
@@ -52,8 +53,8 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
     g_assert_not_reached();
 }
 
-SevAttestationReport *sev_get_attestation_report(const char *mnonce,
-                                                 Error **errp)
+SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
+                                                       Error **errp)
 {
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index e43bbf3a17..038fa56058 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -32,6 +32,8 @@
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
+#include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/i386/pc.h"
 
@@ -515,8 +517,8 @@ out:
     return cap;
 }
 
-SevAttestationReport *
-sev_get_attestation_report(const char *mnonce, Error **errp)
+static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
+                                                        Error **errp)
 {
     struct kvm_sev_attestation_report input = {};
     SevAttestationReport *report = NULL;
@@ -578,6 +580,12 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     return report;
 }
 
+SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
+                                                       Error **errp)
+{
+    return sev_get_attestation_report(mnonce, errp);
+}
+
 static int
 sev_read_file_base64(const char *filename, guchar **data, gsize *len)
 {
diff --git a/target/i386/sev.h b/target/i386/sev.h
index b6289234b0..529a54acb8 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -52,8 +52,6 @@ extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 extern char *sev_get_launch_measurement(void);
 extern SevCapability *sev_get_capabilities(Error **errp);
-extern SevAttestationReport *
-sev_get_attestation_report(const char *mnonce, Error **errp);
 extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
-- 
2.31.1



