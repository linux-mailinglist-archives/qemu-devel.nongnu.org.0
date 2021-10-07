Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9C4257E0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:25:08 +0200 (CEST)
Received: from localhost ([::1]:56592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWCh-00014M-NB
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW68-0004yg-EG
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW65-0005Ba-T6
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMQ6iAvCxwnURglpVB4IW0fu5BXcN7B4HeGKo8BxsN0=;
 b=BylBhbZXgIRTpXQRTHLDpkyXj2/B+Tos0ufFj0PNtstPew9RP/7uMBTw6NKRwOEnsJC1/9
 G3Ln5/y0TF3uqMmaJgO77tezYRaySPKbEbw7qWL1Fu4WhFkooJ0cFq1IdraWfsBIxpwB4x
 RZoUxfB08octcOk9TZx0/8683igJ7no=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-44n72tAtPN26h7kgkKYZ9A-1; Thu, 07 Oct 2021 12:18:16 -0400
X-MC-Unique: 44n72tAtPN26h7kgkKYZ9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so5119066wrb.14
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMQ6iAvCxwnURglpVB4IW0fu5BXcN7B4HeGKo8BxsN0=;
 b=pbERvTaeu6m8sCaHyjc52etKCFPCEFn0q7gx8SaRxKD5/lsEFZD69ImZ0yG4CbsJpS
 fbZL+hq0yVQ647kfmVclApMp7uuHNRPNQhhb/Y+B2BLhLmtdjiydGNd9oHLnQfHkEgU6
 t7hhUOUkyBQThtWbdRX9ZBdP1g0bp83SqZYhnKYN5vdmrYxkYctfcPmD/HnM4aj/I0Y7
 ySYowGZjEHIP+Ii1z185pphEzQTnIyxdSY0zCwaeOPIO6iFwuF/wzTtYqoMttXuT/RXj
 ApSq9lfzjDmsobC/I94E5/2+/0BhQfp3Gcplz4ipKZQDI+RSi86zrj4rqXTs+rjoyHDI
 fpOw==
X-Gm-Message-State: AOAM531Bp7DVOTUSDDySpskeKsTKDAP5esxaeRNBdou4xkG5XwJcIbgw
 6SPennB5ap7QHA1V36RHz2HCvrRwQ/eAA6Hm1XCTfd4lIAGb9CR1KLYClasEoP4CrkvnxFXzaM1
 bKX1j8tzq1p2umbMXXW40+NCYosat62W7bIMV/QGvtGwp+NIOgb1vcQXEF8uvEW6H
X-Received: by 2002:a1c:9857:: with SMTP id a84mr17228558wme.28.1633623493662; 
 Thu, 07 Oct 2021 09:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8ZfB3bnXzEPGWYDhd6PuaST01yQ2MZwVDhjZw+EgLXq2/Mov1UPnSHQG5FosvLqV9SCfneQ==
X-Received: by 2002:a1c:9857:: with SMTP id a84mr17228508wme.28.1633623493502; 
 Thu, 07 Oct 2021 09:18:13 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 1sm9454040wmb.24.2021.10.07.09.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/23] target/i386/sev: Use g_autofree in
 sev_launch_get_measure()
Date: Thu,  7 Oct 2021 18:17:05 +0200
Message-Id: <20211007161716.453984-13-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use g_autofree to remove a pair of g_free/goto.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 3a30ba6d94a..5cbbcf0bb93 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -685,8 +685,8 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
 {
     SevGuestState *sev = sev_guest;
     int ret, error;
-    guchar *data;
-    struct kvm_sev_launch_measure *measurement;
+    g_autofree guchar *data = NULL;
+    g_autofree struct kvm_sev_launch_measure *measurement = NULL;
 
     if (!sev_check_state(sev, SEV_STATE_LAUNCH_UPDATE)) {
         return;
@@ -708,7 +708,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     if (!measurement->len) {
         error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
                      __func__, ret, error, fw_error_to_str(errno));
-        goto free_measurement;
+        return;
     }
 
     data = g_new0(guchar, measurement->len);
@@ -720,7 +720,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     if (ret) {
         error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
                      __func__, ret, error, fw_error_to_str(errno));
-        goto free_data;
+        return;
     }
 
     sev_set_guest_state(sev, SEV_STATE_LAUNCH_SECRET);
@@ -728,11 +728,6 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     /* encode the measurement value and emit the event */
     sev->measurement = g_base64_encode(data, measurement->len);
     trace_kvm_sev_launch_measurement(sev->measurement);
-
-free_data:
-    g_free(data);
-free_measurement:
-    g_free(measurement);
 }
 
 char *
-- 
2.31.1


