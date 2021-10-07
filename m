Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E79D425800
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:31:58 +0200 (CEST)
Received: from localhost ([::1]:43130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWJJ-0002aJ-Hh
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6T-0005dX-Ct
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6R-0005TY-Hl
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zEBwyEs4hdAqxlobZpOUbNIVzNsUZbf4HLNIwXUpoo=;
 b=KFHC5yobkcZSH+KWM9hze+AtQr3HnfVJUrx4W5uwPHqc9BGTjVqEL+YiHv8nRcValYEOEB
 +1QABn5ELGnV2tXcLcVORqCUA7+esuLcF9Jj2ybmLNEnDoCAET6tPT0TsUsJLCFFb1yGHz
 Z5PEqfSplJMFwRTelDm5slKA17tHRmM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-kuoGVhMgPZC03cfPQd_8Tw-1; Thu, 07 Oct 2021 12:18:37 -0400
X-MC-Unique: kuoGVhMgPZC03cfPQd_8Tw-1
Received: by mail-wr1-f72.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so5121651wrr.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zEBwyEs4hdAqxlobZpOUbNIVzNsUZbf4HLNIwXUpoo=;
 b=gjhwm5540tzQSpYc93RCZRqYes5VqhcnNCP4ibtbJBciq8D2YknWN8wzf5qJVYHSi4
 ok+lY7nTBafDoWxJIy7Z19AMekoSzvRO4gmmz/9ciRicVxGMAVsc4fguVCZu+LOOqSwA
 AhiF2doQqBpgnjEbl19DtGe6ci89JfKOJI2Tz3iN+668jR5cVNOoeIPNtaMh+F75GUQe
 zd7I1kiDw5JOdRY0mjR9QRAhYf/YLoe7bNvcx4OqfyqvqL2aj6FUHgJveYa8hxBT7fl5
 N/AKFhHQoP+Jbs1HdPyTr2CZcrFzBFjuH/qbtpmNBxIHV90mDPzkNtTZShBKF2GAM91p
 gxZw==
X-Gm-Message-State: AOAM531sTUkA5VgB7RnxRo+zdIM0VVok/grl17mLaoDRhDgTDatpXk6R
 5JR2n6ErRGmCGzbIZeVC7uCUQGe8BBP4+3MrWQlcOTcBehTrHzizBKjwD5W7Gofqe/3N9fhL1Rz
 O7T0DEPTSQwxQ+mJXOh1sj5J17Ff1MZOLr0Wldld/k6qT/chyTnfXH63lkTJaFx80
X-Received: by 2002:a1c:1b4a:: with SMTP id b71mr5629413wmb.33.1633623516238; 
 Thu, 07 Oct 2021 09:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRFIgrsHBHYJZN3sLOY8LrmO2MjqtYTxSRTA/ArKRINNK0kYWiSnReEM//lqCoEZRskTcw5A==
X-Received: by 2002:a1c:1b4a:: with SMTP id b71mr5629375wmb.33.1633623515998; 
 Thu, 07 Oct 2021 09:18:35 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k18sm48278wrn.81.2021.10.07.09.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/23] target/i386/sev: Move
 qmp_query_sev_attestation_report() to sev.c
Date: Thu,  7 Oct 2021 18:17:10 +0200
Message-Id: <20211007161716.453984-18-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev_attestation_report() from monitor.c to sev.c
and make sev_get_attestation_report() static. We don't need the
stub anymore, remove it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.h             |  2 --
 target/i386/monitor.c         |  6 ------
 target/i386/sev-sysemu-stub.c |  5 +++--
 target/i386/sev.c             | 12 ++++++++++--
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/i386/sev.h b/target/i386/sev.h
index d9548e3e642..2e90c05fc3f 100644
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
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 935a8ee8ca4..cf4a8a61a02 100644
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
index 8082781febf..d5ec6b32e0a 100644
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
index e43bbf3a17d..038fa560588 100644
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
-- 
2.31.1


