Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29E41FC1C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:12:17 +0200 (CEST)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeoL-0003SV-2P
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXJ-0002AA-6v
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeXH-0000yb-3U
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nKTjzIKPyPIMBpHVM/tD1diKI5Lwbe51EbfE5s5an0=;
 b=D8Qn+KgffYy5o7SjXAfU6hwJce5qS9uGRGHo/Y09Gl20tbCOW32GfGVu9Pp4Ath0RJYGBK
 SF8SoHev4t28BRtLG7MMajx3oeZFPZHeRV/IM03+F9qAu8x7LxkXhKBW/eVH+SjNpzxDtM
 DsFRQU5wbZAlxoS5XKgfLDXi7KqCoqs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-B_Iz9WPBP5acuEURJf-ksA-1; Sat, 02 Oct 2021 08:54:37 -0400
X-MC-Unique: B_Iz9WPBP5acuEURJf-ksA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r66-20020a1c4445000000b0030cf0c97157so6085499wma.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0nKTjzIKPyPIMBpHVM/tD1diKI5Lwbe51EbfE5s5an0=;
 b=u8flLCi26RmZXcBb8AF62iBZuQFlmvc4eLI9Z7+zEvhxMlsYoSUqRjzLehXfWoAr+C
 EsTEG4E6HB7PM+sXgStZFIUGXWjEWQuGpjsvx/BRd1EHEPkndCkz1UWmQbvg8vJKvipG
 hv9f3SFJeIde6+cUNv8M6/RyC1gm2ZR6XrvX47Fq4Lo9FLa48S/cvBnOGS4fE3K7jwfa
 +dWxO7gCU4gFXYr9yIOB1ZXN+Va8NEpgcqNU9USoqHLV3d/VhR6ezMWsmu0AWVCuiTJ6
 9LeR9WJbQlo5AXZ51Ll+aUPPOvrHUZhbFEx2yMoydUhckjQmujAHMy8r6sk3N+65AVp8
 SIug==
X-Gm-Message-State: AOAM532AkDtFWIFPcemb/PsQVg5hoZtvdNyan03rg6Idgq6E+So3fdLp
 /8N6meLvLJzHQ7xuQ5thjYuHtpz0U8H3tpqYRomhw9i09wcbbrf3Pzl1boovCwxyx3JSZkWXP8i
 pmYuyo/khNHhKrIKIqxNocxQYy3D2JV1BcRG0JmWSgD5wTfHEHkC/DiRArNr4HrNT
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr3355724wrb.56.1633179276073; 
 Sat, 02 Oct 2021 05:54:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE7Ld4d7xRxNwNhximLYRSqvfEbRdkNWVwkt+fYHrToiPZNRg70XquUCHdmcVJ53wdpAfvzQ==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr3355700wrb.56.1633179275866; 
 Sat, 02 Oct 2021 05:54:35 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 y15sm1796812wrp.44.2021.10.02.05.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/22] target/i386/sev: Move qmp_query_sev_launch_measure()
 to sev.c
Date: Sat,  2 Oct 2021 14:53:12 +0200
Message-Id: <20211002125317.3418648-18-philmd@redhat.com>
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

Move qmp_query_sev_launch_measure() from monitor.c to sev.c
and make sev_get_launch_measurement() static. We don't need the
stub anymore, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h        |  1 -
 target/i386/monitor.c         | 17 -----------------
 target/i386/sev-sysemu-stub.c |  3 ++-
 target/i386/sev.c             | 20 ++++++++++++++++++--
 4 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 8d9388d8c5c..1699376ad87 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -25,7 +25,6 @@
 #define SEV_POLICY_SEV          0x20
 
 extern SevInfo *sev_get_info(void);
-extern char *sev_get_launch_measurement(void);
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index da36522fa15..0b38e970c73 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -711,23 +711,6 @@ void hmp_info_sev(Monitor *mon, const QDict *qdict)
     qapi_free_SevInfo(info);
 }
 
-SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
-{
-    char *data;
-    SevLaunchMeasureInfo *info;
-
-    data = sev_get_launch_measurement();
-    if (!data) {
-        error_setg(errp, "Measurement is not available");
-        return NULL;
-    }
-
-    info = g_malloc0(sizeof(*info));
-    info->data = data;
-
-    return info;
-}
-
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     return sgx_get_info(errp);
diff --git a/target/i386/sev-sysemu-stub.c b/target/i386/sev-sysemu-stub.c
index cc486a1afbe..355391c16c4 100644
--- a/target/i386/sev-sysemu-stub.c
+++ b/target/i386/sev-sysemu-stub.c
@@ -22,8 +22,9 @@ SevInfo *sev_get_info(void)
     return NULL;
 }
 
-char *sev_get_launch_measurement(void)
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 {
+    error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index fce007d6749..8e9cce62196 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -718,8 +718,7 @@ free_measurement:
     g_free(measurement);
 }
 
-char *
-sev_get_launch_measurement(void)
+static char *sev_get_launch_measurement(void)
 {
     if (sev_guest &&
         sev_guest->state >= SEV_STATE_LAUNCH_SECRET) {
@@ -729,6 +728,23 @@ sev_get_launch_measurement(void)
     return NULL;
 }
 
+SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
+{
+    char *data;
+    SevLaunchMeasureInfo *info;
+
+    data = sev_get_launch_measurement();
+    if (!data) {
+        error_setg(errp, "Measurement is not available");
+        return NULL;
+    }
+
+    info = g_malloc0(sizeof(*info));
+    info->data = data;
+
+    return info;
+}
+
 static Notifier sev_machine_done_notify = {
     .notify = sev_launch_get_measure,
 };
-- 
2.31.1


