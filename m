Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719253AA5CD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:58:55 +0200 (CEST)
Received: from localhost ([::1]:43750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltccg-0006Xp-FZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOu-0002Kq-Ug
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOs-000127-Vw
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INPj6wpcOgYFSeBtjomYW3KmRr5tUwX7C5l9vqP5JIA=;
 b=MPoO3CUjPgWWMJT8vs/y4iVKfPkyV4K9+z67M+PyujUxE0xTb+rbWg9mXKJftCHbJBi4v/
 MeT6wYRjitkr56yfGr76v0wpLCb0tvqYbkSzAgLmDZ2/i8gvxb9rMRQ9v/U4nRuVq5YcnE
 JIRm58ZL+X3LVDa3aYe3OquJr3hWdAk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-2HBpgrI4N3akef6aqFDxFA-1; Wed, 16 Jun 2021 16:44:37 -0400
X-MC-Unique: 2HBpgrI4N3akef6aqFDxFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r4-20020a7bc0840000b02901b7cb5713ecso1573412wmh.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=INPj6wpcOgYFSeBtjomYW3KmRr5tUwX7C5l9vqP5JIA=;
 b=GpeHdjUnZ4WF9zTE2Kg4LEhsAHMxPB/k0aOk5rrUvV/8vOqOAZvbhxReTKz6ibtMT9
 NPWBsOISHkunH0eBLhpR59f/xCDYRe05rpBWrzGzQInywInCy4g5GPU8jpqjq/SK8UKs
 y8zjHd08L0O0ollIiWT8hURRSgA249g+8hBUe6s2tbPWhqCA/QMbaBX1Dko//ZCcabna
 oM5SB4Nr4u9NhBcby4Nm5YRFzqo4/3t+k2Q4p48/jHCtJbRhLpyQC6VYVLXXRRolbsK7
 Dnzow33StHRISI6xvDugYCAo0egYaV/qHO+XcEoWFdxKEVq/5kK1ivnGer/w/5TovKZm
 tQwg==
X-Gm-Message-State: AOAM531kCOeH+a2YglgkhdS+4l9Bf0rhXkpEozTIYffMl1waVq4J71uK
 EoZQ095c/BUVqkUEv2WT01nRPCc2zn7n5L30lpbZeQ0A4lSEzjQbrZ4Vv5mkQoRTe6+BH/UIX2I
 FWW0homQZzdidZCZ0Q9jhoOaonHIKQfyQDBY0sdq3cJl+17slYnabk72izKBu15A2
X-Received: by 2002:adf:c3d4:: with SMTP id d20mr1137026wrg.183.1623876275928; 
 Wed, 16 Jun 2021 13:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKOVUAhCAMFG+cpVVIYhc1tW4j/mspmrfRWcWRUchw+dJOK5+j4msRliRG32VTnIFXrzX6zg==
X-Received: by 2002:adf:c3d4:: with SMTP id d20mr1136993wrg.183.1623876275629; 
 Wed, 16 Jun 2021 13:44:35 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k8sm6269653wmo.18.2021.06.16.13.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/23] target/i386/sev: Move
 qmp_query_sev_attestation_report() to sev.c
Date: Wed, 16 Jun 2021 22:43:16 +0200
Message-Id: <20210616204328.2611406-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qmp_query_sev_attestation_report() from monitor.c to sev.c
and make sev_get_attestation_report() static. We don't need the
stub anymore, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h        |  2 --
 target/i386/monitor.c         |  6 ------
 target/i386/sev-sysemu-stub.c |  6 +++---
 target/i386/sev.c             | 12 ++++++++++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index afa19a0a161..cb5702a2397 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -30,7 +30,5 @@ extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 extern char *sev_get_launch_measurement(void);
 extern SevCapability *sev_get_capabilities(Error **errp);
-extern SevAttestationReport *
-sev_get_attestation_report(const char *mnonce, Error **errp);
 
 #endif
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index c83cca80dc2..eb4539bf88b 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -762,9 +762,3 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
 
     sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
 }
-
-SevAttestationReport *
-qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
-{
-    return sev_get_attestation_report(mnonce, errp);
-}
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index d556b4f091f..1f7573ad528 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
 #include "qapi/error.h"
 #include "sev_i386.h"
 
@@ -52,9 +53,8 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
     g_assert_not_reached();
 }
 
-SevAttestationReport *sev_get_attestation_report(const char *mnonce,
-                                                 Error **errp)
+SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
 {
-    error_setg(errp, "SEV is not available in this QEMU");
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 791804954e9..809054a84f2 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -31,6 +31,8 @@
 #include "migration/blocker.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
+#include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qerror.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/i386/pc.h"
 
@@ -487,8 +489,8 @@ out:
     return cap;
 }
 
-SevAttestationReport *
-sev_get_attestation_report(const char *mnonce, Error **errp)
+static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
+                                                        Error **errp)
 {
     struct kvm_sev_attestation_report input = {};
     SevAttestationReport *report = NULL;
@@ -549,6 +551,12 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
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


