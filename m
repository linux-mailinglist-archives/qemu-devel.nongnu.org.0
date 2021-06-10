Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE493A24D1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:54:38 +0200 (CEST)
Received: from localhost ([::1]:49044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEaL-0004wq-JO
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESh-00087c-Dw
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESa-0005Rc-0a
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDwwyP6lYjqDrcaWITpcvIceEJU79Gyjn65Ig5GC5tE=;
 b=c28KtHkk6Iy348dyBPUm0WyBL5miM3twH93E9mkl6Nrlko3g2W+OcgKIjk7+r+6ltVObt7
 GRvUtfCJGpKe8T7s7zStOn8tplpfgtnRUlu7JYOwNZqqseXQ49c/xHdtrlrDN2h5nMO/zL
 sx8XpQzIG8vOTanoYYWGW665Jxzm4ko=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-EnCPmFirMiW9azVCPinquw-1; Thu, 10 Jun 2021 02:46:34 -0400
X-MC-Unique: EnCPmFirMiW9azVCPinquw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1906b029019e9c982271so3492259wmq.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDwwyP6lYjqDrcaWITpcvIceEJU79Gyjn65Ig5GC5tE=;
 b=MpN3lrJ9LWLLdTe+EPQqZCg7T1FrGUFh/15YVr3CihCt8ShsHiVC1L3D3I/TzG8GA8
 jH8OtFHs/YYKUesFu2itoEaW3Xb1ebst2sgdvP3uqg6az8k6wej4AYJyX6LlWfEaZoYC
 KLTTnhU5MGCPeZ/KOKIgtroUNMX1xlqMNjo6xtEdUxLN247JyChoxhJtxvinrGjlkgWy
 5Fqv+QhCD33b20KgUFRqBQBbjaDYe7hh6ImkFPcbJGZb+f5uvYTsLuUxINp1llSbrIb2
 JFdpEoULSVyd0IsuPI23KXY7dynJ6HIV3elombM4tvO0xt93FN8h2++J1LJ5lAawyb5k
 Qxyg==
X-Gm-Message-State: AOAM533rDLis7EHEscVqDXv01qjw3lz1SJ2K37qKFqH2v2o64GomGrIh
 Nv0ywNvSuGsO13+MlLDF3SWd4p1CEAr/Jp8lbobSPeDqAb3yCsgL68peNEgN4kCoUeznrOF2xk5
 SGQJGuIn+abtjAuy/mIYaIfG7YBQud7H4PICum653RiTnN3YeMo6TnV4cNfRKkMir
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr13475426wmc.96.1623307593225; 
 Wed, 09 Jun 2021 23:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq430EH3zL9NUHu9SOQcza1M/2b3f3T8rGuv0jhve740X/XdxN6xQ6G+p0Qc6mMw6eT/oihw==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr13475404wmc.96.1623307593078; 
 Wed, 09 Jun 2021 23:46:33 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id n1sm1912293wms.18.2021.06.09.23.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] target/i386/sev: sev_get_attestation_report use
 g_autofree
Date: Thu, 10 Jun 2021 08:45:53 +0200
Message-Id: <20210610064556.1421620-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
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


