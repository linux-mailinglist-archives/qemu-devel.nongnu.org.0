Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1B4257D4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:22:59 +0200 (CEST)
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWAc-0003oE-8M
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5w-0004cV-RR
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5u-000528-4O
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSsWEPfIasNtfedQFCfGwO+jHWqTcMPZG0w8furmgm0=;
 b=Igs+Y0C7Zh7F5iOckiaLfAqhkK1TxFUjkNn1jjC/Rs4SplfxhpkXKKgdTxJz8t7DorrYK+
 KeB4lPX6OtuyrDdyd8Da7IC3z9IXSV41IQ3hpQGIxfArJCjOcUkk1wbmcXr7mOVVFWMfZN
 26o4gRBqgPHB5lgezCsKuTQeUwYq/XA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-mjlOx0tEOSuEUb-Hx6oMXQ-1; Thu, 07 Oct 2021 12:18:02 -0400
X-MC-Unique: mjlOx0tEOSuEUb-Hx6oMXQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso5115356wrg.1
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sSsWEPfIasNtfedQFCfGwO+jHWqTcMPZG0w8furmgm0=;
 b=zLvoJKoneriofS00+b1Eb6y7hrB6sPw0fceSpPoCV4Qp2futv7IFl+qlDGHbVCi3r9
 oZgtYBmAWs/yoM2GFyO0z5uknOOoNOBn/K2pSSEU7AlAQmyy5OtVMT7rtvV/VaD2epJO
 eE711u50HZ1UnU7ilxS2Xxj2cxURY1b3iVYIpY4ArXlafWj1lJJem6I9w9ghVqBMMZAN
 C2UXCaJEY44NFKxMuKeDxoA3/TaIogPbjaSgVYIYgnMH2bi82B7CsIZuFLIBsbsocOWy
 bvNV5OBr4FGJECaS3itBq4wJ82U9E2sAmvTfUHvgFj0ZG7fdgktAkasw784jfsvV32Qg
 MpAA==
X-Gm-Message-State: AOAM5322aT2mDo12hQnGqxyP6ziVilrnZH/n673py3ZlPeuRs85JrgSb
 cvROHV1tyGUK8VBDO4fmxpWoLJtGMcf3M9m7mw7slH57giyrNXDifE1RcevXa3lpLNkPe0Bux+9
 5IHG74JsXu7Jpvc8FQzCG2qp/0U/uPfNDEDbAkEydJw+rxS752qc+QGz0NCaJy70d
X-Received: by 2002:a1c:21c3:: with SMTP id
 h186mr17261161wmh.107.1633623480347; 
 Thu, 07 Oct 2021 09:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjsy2gU1mGBwP4i99ZbwNtks5RgQrT2oIJ/6iZksWTWx6vPIaxi9q5gezQizl94gxn/Bm+vw==
X-Received: by 2002:a1c:21c3:: with SMTP id
 h186mr17261120wmh.107.1633623480062; 
 Thu, 07 Oct 2021 09:18:00 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id a25sm8734142wmj.34.2021.10.07.09.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/23] target/i386/sev: Remove sev_get_me_mask()
Date: Thu,  7 Oct 2021 18:17:02 +0200
Message-Id: <20211007161716.453984-10-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 Dov Murik <dovmurik@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unused dead code makes review harder, so remove it.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h | 1 -
 target/i386/sev-stub.c | 5 -----
 target/i386/sev.c      | 9 ---------
 3 files changed, 15 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 9bf6cd18789..d83428fa265 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -36,7 +36,6 @@ typedef struct SevKernelLoaderContext {
 } SevKernelLoaderContext;
 
 extern bool sev_es_enabled(void);
-extern uint64_t sev_get_me_mask(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 408441768dc..20b1e18ec1b 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -25,11 +25,6 @@ bool sev_enabled(void)
     return false;
 }
 
-uint64_t sev_get_me_mask(void)
-{
-    return ~0;
-}
-
 uint32_t sev_get_cbit_position(void)
 {
     return 0;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 4f1952cd32f..9e3f2ec8dd3 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -65,7 +65,6 @@ struct SevGuestState {
     uint8_t api_major;
     uint8_t api_minor;
     uint8_t build_id;
-    uint64_t me_mask;
     int sev_fd;
     SevState state;
     gchar *measurement;
@@ -389,12 +388,6 @@ sev_es_enabled(void)
     return sev_enabled() && (sev_guest->policy & SEV_POLICY_ES);
 }
 
-uint64_t
-sev_get_me_mask(void)
-{
-    return sev_guest ? sev_guest->me_mask : ~0;
-}
-
 uint32_t
 sev_get_cbit_position(void)
 {
@@ -833,8 +826,6 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         goto err;
     }
 
-    sev->me_mask = ~(1UL << sev->cbitpos);
-
     devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
     sev->sev_fd = open(devname, O_RDWR);
     if (sev->sev_fd < 0) {
-- 
2.31.1


