Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C614F425807
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:34:47 +0200 (CEST)
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWM2-00073y-Sz
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW65-0004vF-2j
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW62-00057U-BJ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEEZxUHWCMFJAaUbuJlVLcx9kbNHe4+tPDUcbMRvNgA=;
 b=C2/0brevDUV6v6RqoUi8CIOQPUSlOobQZ52RQXj4FPySnhna1uuuffbn0zyGEO7PSBgM+7
 llfKtK26v/lXrv8jMNxco6MvzdtK2h+yYc6AWBQjNZ5DAbqsw2jo3rd4bTkSW6Y34SSGhr
 9E9WDknxycTb1cvgwlMVQCQvvOd3CNk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-D4T1Ae1UPpuJa4xZnYRVEg-1; Thu, 07 Oct 2021 12:18:11 -0400
X-MC-Unique: D4T1Ae1UPpuJa4xZnYRVEg-1
Received: by mail-wr1-f71.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so5114528wrg.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEEZxUHWCMFJAaUbuJlVLcx9kbNHe4+tPDUcbMRvNgA=;
 b=6DKJ5FE29jznJQbgbAeS9TatR4MRZLGBbifTlJYYy9A/KlyU4kOFJ3ZvZMugKw0czZ
 OGVLPjZ4THCuZ+esHsNQa5We4qmPEQIiDknV8k++/WVzroNP4CRmEN8gYHKBHQjL3oU/
 UKFDmoBP0IoV2dFMTpXv7PXa4/jl8SmoSvR6K3hX4yeRCHGiynveFVU+Lg93T87iZ3U3
 CB0UlbenJjAhesq3x/DkBLh/rr/XhGjyT+AFi4xgCBJfeomsTL4sduTuGgrUxYYTfkwL
 MNzqgVSpPel5Zsrw+mzZtBIQvH5eEWIR/pOzt99qFZKiMwKqrFiFsi9dBpOAcoU769od
 7HlA==
X-Gm-Message-State: AOAM5320IC1oO+qdq2zzJ/TQbKnaDrhif+9xygKXOUlVhpFmujqqYg3W
 px6w/XlVDLQqvak0UBv4LPZrPIgpiY6BU2nr96B0nZKGyop8VMAs/2U9WaI+9xF/hbcx15Ts5zM
 tFOD1xY96Y6fwrdYo4s46+BxW7cckgi5KfY7h9EcS4rjNRprdNLcSykCOB0YdPmUo
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr5781393wmc.108.1633623489238; 
 Thu, 07 Oct 2021 09:18:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyp5Icsi0NLMXs/baHrjAWHmxKv/JAM8Pc+VahgSSp1ZOQcJVEBNNgny0Hxow6Cf8o/4Ee8g==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr5781363wmc.108.1633623489052; 
 Thu, 07 Oct 2021 09:18:09 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y23sm1025623wmj.42.2021.10.07.09.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/23] target/i386/sev: sev_get_attestation_report use
 g_autofree
Date: Thu,  7 Oct 2021 18:17:04 +0200
Message-Id: <20211007161716.453984-12-philmd@redhat.com>
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
 Dov Murik <dovmurik@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Removes a whole bunch of g_free's and a goto.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Brijesh Singh <brijesh.singh@amd.com>
Message-Id: <20210603113017.34922-1-dgilbert@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 9e3f2ec8dd3..3a30ba6d94a 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -521,8 +521,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     struct kvm_sev_attestation_report input = {};
     SevAttestationReport *report = NULL;
     SevGuestState *sev = sev_guest;
-    guchar *data;
-    guchar *buf;
+    g_autofree guchar *data = NULL;
+    g_autofree guchar *buf = NULL;
     gsize len;
     int err = 0, ret;
 
@@ -542,7 +542,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     if (len != sizeof(input.mnonce)) {
         error_setg(errp, "SEV: mnonce must be %zu bytes (got %" G_GSIZE_FORMAT ")",
                 sizeof(input.mnonce), len);
-        g_free(buf);
         return NULL;
     }
 
@@ -554,7 +553,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
             error_setg(errp, "SEV: Failed to query the attestation report"
                              " length ret=%d fw_err=%d (%s)",
                        ret, err, fw_error_to_str(err));
-            g_free(buf);
             return NULL;
         }
     }
@@ -569,7 +567,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     if (ret) {
         error_setg_errno(errp, errno, "SEV: Failed to get attestation report"
                 " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
-        goto e_free_data;
+        return NULL;
     }
 
     report = g_new0(SevAttestationReport, 1);
@@ -577,9 +575,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
 
     trace_kvm_sev_attestation_report(mnonce, report->data);
 
-e_free_data:
-    g_free(data);
-    g_free(buf);
     return report;
 }
 
-- 
2.31.1


