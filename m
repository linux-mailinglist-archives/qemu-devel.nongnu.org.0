Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546041FBFF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:00:18 +0200 (CEST)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWecj-0001Ai-3N
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWi-0001Tq-36
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWg-0000lB-FN
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2JOuakDg9TjNTLsEL31Gb5qf2swMU1YyZ5LrMCCfA9Y=;
 b=RLz1lftkN0cwduFVWn3Hd0KYMtIWUddsKY5C053ou5kVGwAJwkQyEX3eiBQeyRN1gIIoLJ
 VOHBVxMdhOpSsQ/K52Jv4TRxcMVBj+gXXDuVjbXVtReO6vV9IrGf9TrxwFT3iLG8IMVStG
 fcO9p6vwsNJQndGmaoobvnVOBT1HXZs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-kRMw81yOMJei9Y25zsL99w-1; Sat, 02 Oct 2021 08:53:57 -0400
X-MC-Unique: kRMw81yOMJei9Y25zsL99w-1
Received: by mail-wm1-f69.google.com with SMTP id
 h24-20020a7bc938000000b0030d400be5b5so3358243wml.0
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2JOuakDg9TjNTLsEL31Gb5qf2swMU1YyZ5LrMCCfA9Y=;
 b=qiJBHSsUNcFIhQVnTCOyPle53DhqrnqZNcLJfUQ1XCV1SfA4sCmfwOcTICpudH3s4c
 EbsMjWXdb3IMFJv3zy30CH0adl97AGyEQ6p9FkXg8ncL/hOm0U8jot0mC4hn0KPIE+hl
 Ag9wXr1fmmmPj10pgU2RG5AzDcdFubJofZIrhm0sJHwg/r36qsSKfHDE/N6igjLtDdHa
 jv3AiJyocc4/h4lnsAkuv/DNGfmlM4poAkyafLAdPHhk93zcToasT9GaZfU07kC8ld15
 r/HotF5JJ8AxZruhgTU+7zHc6/1AidvgbbaNeUXl1cELfS97qgEyYGC2R8agmiEKTYFM
 Thkw==
X-Gm-Message-State: AOAM533zoUtZWPax8cVbWaEhg/dTcTkhGE10wUPKkxI6jcT5gD6UZ4+L
 SfJOK4fAP8R8AEOlq+S4T+GyYecED1/w4LEMw1gQxqA6UyQ6RF65xoD/f5+o4SbHlrGWYbydV1z
 2j82ICwR71BxeJlpPatK5aswF4J1wFdtX+wr8LciZcrrWTzXdgNxnUxgGYvCB1x0q
X-Received: by 2002:adf:a18d:: with SMTP id u13mr3366730wru.275.1633179235495; 
 Sat, 02 Oct 2021 05:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3pw9/64lGQcYsWkhaqchQbJCRGpJ8vrpRflv453uN3gfkMzMibGa3diRsytvz2Ljjr0eAUQ==
X-Received: by 2002:adf:a18d:: with SMTP id u13mr3366709wru.275.1633179235309; 
 Sat, 02 Oct 2021 05:53:55 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o12sm8849678wms.15.2021.10.02.05.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/22] target/i386/sev: Remove sev_get_me_mask()
Date: Sat,  2 Oct 2021 14:53:03 +0200
Message-Id: <20211002125317.3418648-9-philmd@redhat.com>
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

Unused dead code makes review harder, so remove it.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev_i386.h | 1 -
 target/i386/sev-stub.c | 5 -----
 target/i386/sev.c      | 9 ---------
 3 files changed, 15 deletions(-)

diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index f4223f1febf..afa19a0a161 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -25,7 +25,6 @@
 #define SEV_POLICY_SEV          0x20
 
 extern bool sev_es_enabled(void);
-extern uint64_t sev_get_me_mask(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index d91c2ece784..eb0c89bf2be 100644
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
index fa7210473a6..c88cd808410 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -64,7 +64,6 @@ struct SevGuestState {
     uint8_t api_major;
     uint8_t api_minor;
     uint8_t build_id;
-    uint64_t me_mask;
     int sev_fd;
     SevState state;
     gchar *measurement;
@@ -362,12 +361,6 @@ sev_es_enabled(void)
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
@@ -804,8 +797,6 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         goto err;
     }
 
-    sev->me_mask = ~(1UL << sev->cbitpos);
-
     devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
     sev->sev_fd = open(devname, O_RDWR);
     if (sev->sev_fd < 0) {
-- 
2.31.1


