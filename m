Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A831741FC0B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:05:57 +0200 (CEST)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeiC-000762-GS
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWn-0001fZ-O5
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWm-0000nA-4M
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAj3BwaM+hRNB5Zlp17fWtjr58QjWY/+pHTXgMu/M3k=;
 b=RcnkKbOx/1oesT3+9rc8XkqyjFbbhFU+aU134LPqBv1M+Nzltn3lpSYQrOv5Bzkw1OB+0t
 yGHAUXzwQEaP9IKs1FyrjpR+253NeMQ233HG5LJyoqlUpdeJVrmUKUb0cvLjP65WU2TLcu
 GYYEH25RzQliPofg6zXWjv3ZdRkOw44=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-jt926YsCNEyMxUzM2TOaww-1; Sat, 02 Oct 2021 08:54:06 -0400
X-MC-Unique: jt926YsCNEyMxUzM2TOaww-1
Received: by mail-wm1-f72.google.com with SMTP id
 z22-20020a7bc7d6000000b0030d5c26120fso222416wmk.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAj3BwaM+hRNB5Zlp17fWtjr58QjWY/+pHTXgMu/M3k=;
 b=jbgj1otzT7JoGXmOqmDUqb5VgucekqdrYcFPok2gzwhNSRL9k3061E+DyledjaPWK4
 0hp9EAz409rQexISTC/MxpYZfrp1BSwg0y0EHb7lIztYJwZ6aIbcl+YviUMxcG3mSvKi
 trrEIC5tMnUJsaLgQXfUXOW7Y/bpPd3MV16OHeH02Cnqdf7y8YtkZN4PVMKuM1NOUFwx
 5rwdJ4cdxoOYapwzGKz/LG5esLMzmou+LmiSaK2hGM7JLKIPJDkyrDWlXWWPtewAjuCG
 j8V2ydtLVMA/8zVLv1Xx1qWEt8JkT34gAdWWJIaTRAFTwzf4yhKtsX6B1yOvcBTAj/Xr
 BKog==
X-Gm-Message-State: AOAM53012qP9+VoL31yZZjz1DWpPh8mUOE/6OvaKTQplQcaVLHtyNszK
 iYsjvQ6LgQ3ddgLWOV9c43a4vWn2sRmaSJUBoRUP99uhIgLNoOu/62xWSEB/iC2zPBY7VPfMLof
 ZivMlPF0Ea3dt/u11t+yNLgqLQfU69ZiteWw1ekAJMNYvzvsDYHCX/eZOwfCuVXk2
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr3236693wri.284.1633179244658; 
 Sat, 02 Oct 2021 05:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgDxwlX5HGT9dZoGs+v2dDhfLDMjbUmMV+tcfi8guLt6V72knTXRGXTjkGozRRcnhuV3Vi0Q==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr3236665wri.284.1633179244437; 
 Sat, 02 Oct 2021 05:54:04 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i7sm8530172wrp.5.2021.10.02.05.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:54:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/22] target/i386/sev: sev_get_attestation_report use
 g_autofree
Date: Sat,  2 Oct 2021 14:53:05 +0200
Message-Id: <20211002125317.3418648-11-philmd@redhat.com>
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
 Sergio Lopez <slp@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
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
index c88cd808410..aefbef4bb63 100644
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


