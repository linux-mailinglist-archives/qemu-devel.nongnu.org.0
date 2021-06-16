Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7973AA5B2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:54:31 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcYR-0005RD-0a
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOk-0002BL-N2
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOh-0000uW-VJ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDwwyP6lYjqDrcaWITpcvIceEJU79Gyjn65Ig5GC5tE=;
 b=YoNXnAwqiaeCa2wyAiDXNnI7rBKQSOe+amg6QmaPT+lCDxf9nMyQhzfKZs0Ih/PIjN8NFA
 mF0Dv+jlT5GzSRbMRQSqFTxG4jomiJN5dmt53QN9VcqjnEqRatLtwcBP1PJn/0sCRsORq5
 0FdYha7Zmoq74PhGt9npHN5ybUWtqzA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-neNSTVzkMSCbdtusoVbrYg-1; Wed, 16 Jun 2021 16:44:26 -0400
X-MC-Unique: neNSTVzkMSCbdtusoVbrYg-1
Received: by mail-wm1-f72.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so1517372wmq.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDwwyP6lYjqDrcaWITpcvIceEJU79Gyjn65Ig5GC5tE=;
 b=V88EHrx5LffBdBrnylyBduc9NpnHsgHOCSiWSmr/TS5yOTVGpvhWkgp5N60IITB1dM
 MP4qEpkiMX/3XBV1ZXdORyPY0hRAgKmqZl8WncWrYsyPWnEBG93POfiPeVGv3VR9iqKg
 FoR7DXjK6V1+OvY54Y/6bIJ16pyVuPKTOk33iha4Vgb7Lq30xGL/ZMpzfd7HhvOu8nDm
 g6pJ+Gn9Xuvbkgfjq62eSxOPhn0ry43y3XFNtltgeH7sboo7+w3Ct5MIBKGFrYmOYgSO
 IHyYlqrZqE08MgCj6Yp6zofIzQTOO1F18dJJlur3B0cDzEWuMhmTbi1Lu7EB14vIQMvL
 Y8Xw==
X-Gm-Message-State: AOAM533io2CgEn++GIRh+kEDUCcWyyC6OG4UI49oTB1tlSsimCREhFMZ
 IVVNB6mQiM/ouApVvlZw1Y/+6EUKZQS6TLRuaAKyZwFl4XBatuQ6KBTQbsnu8djJPfb2V3/bLE+
 9YJHhF1Y/ZilHs0p+g6o9UQ4VeEvh8jdVXKdRY43XBgqEK3V8gMvjd2S+AmmymKtr
X-Received: by 2002:adf:efc3:: with SMTP id i3mr1174630wrp.356.1623876265104; 
 Wed, 16 Jun 2021 13:44:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3PqYcrrqPsLKDnRRXq3vXJrVRnLpbTpFOE+h4u5jWkRmc9vkGMmrzbFL5ov587c4rEpv0Eg==
X-Received: by 2002:adf:efc3:: with SMTP id i3mr1174594wrp.356.1623876264901; 
 Wed, 16 Jun 2021 13:44:24 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k16sm3242227wrn.96.2021.06.16.13.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/23] target/i386/sev: sev_get_attestation_report use
 g_autofree
Date: Wed, 16 Jun 2021 22:43:14 +0200
Message-Id: <20210616204328.2611406-10-philmd@redhat.com>
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Removes a whole bunch of g_free's and a goto.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Brijesh Singh <brijesh.singh@amd.com>
Message-Id: <20210603113017.34922-1-dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 0a36e81f66c..791804954e9 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -493,8 +493,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     struct kvm_sev_attestation_report input = {};
     SevAttestationReport *report = NULL;
     SevGuestState *sev = sev_guest;
-    guchar *data;
-    guchar *buf;
+    g_autofree guchar *data = NULL;
+    g_autofree guchar *buf = NULL;
     gsize len;
     int err = 0, ret;
 
@@ -514,7 +514,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     if (len != sizeof(input.mnonce)) {
         error_setg(errp, "SEV: mnonce must be %zu bytes (got %" G_GSIZE_FORMAT ")",
                 sizeof(input.mnonce), len);
-        g_free(buf);
         return NULL;
     }
 
@@ -525,7 +524,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
         if (err != SEV_RET_INVALID_LEN) {
             error_setg(errp, "failed to query the attestation report length "
                     "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
-            g_free(buf);
             return NULL;
         }
     }
@@ -540,7 +538,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     if (ret) {
         error_setg_errno(errp, errno, "Failed to get attestation report"
                 " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
-        goto e_free_data;
+        return NULL;
     }
 
     report = g_new0(SevAttestationReport, 1);
@@ -548,9 +546,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
 
     trace_kvm_sev_attestation_report(mnonce, report->data);
 
-e_free_data:
-    g_free(data);
-    g_free(buf);
     return report;
 }
 
-- 
2.31.1


