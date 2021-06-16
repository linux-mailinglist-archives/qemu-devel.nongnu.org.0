Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17CB3AA597
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:49:42 +0200 (CEST)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcTl-0002Tn-TF
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOZ-00024z-42
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOX-0000op-DY
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyEuGJyDY/iwrGffQi3EPfdZgXrWvKYQavNdAaLhpEs=;
 b=Q/sZoWC8xEmu8EN5h2hnDHd+pF+AZnFsS4vY0l8T1UnVdMNF7gGu8DnujCM0JxFOlNBCw/
 VJeA94hUeyNiGd2XDnODze/ZlAg93FRgiahSIEd938z7Hin+LjF9ZAu8BFdqRvc6NrZeSE
 jKSK/rxx+tosdwtuFMW6gB1xsRelD4k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-lmban89-PAug5ZElxNiMbA-1; Wed, 16 Jun 2021 16:44:15 -0400
X-MC-Unique: lmban89-PAug5ZElxNiMbA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l2-20020adfe5820000b029011a64161d6aso1876505wrm.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyEuGJyDY/iwrGffQi3EPfdZgXrWvKYQavNdAaLhpEs=;
 b=n6tF/zbwXpfUHNy3tlQezaSBuDpNSna7zfGazJj7W8Grx91BYJ/zTwP60uMijUpMFi
 1u6UT4DVJZQ501v63fIOBjwJqviI/Bg2GhYpZ1GBoWQGYMeJ2g3I7bgvwSlongmCLW9l
 IxsiYP4X4Y4XwFzQYfPu/KIQWgt6uAReGLa/mk3fiZfHq/B7Whc8QEsXVMKom6C7iIho
 +x+JU0q4l5Ce/YayVsycWbm05hN/U7Np12a3WYP1PBG/0taf7UDzBwa3isYgyofTLW/m
 GTNjiJl9IFyEHSBLGK5+WiEffe9dIMaAz54lD6X3vQbPc62H1eEdCZjTRPurmMD+fz+H
 oYpg==
X-Gm-Message-State: AOAM532LA8HFQvo/0qLVlti8TI2HTCNDYk6ccS7VQXBjXZyB5E6Q/H5j
 ZKel6jJLqmoybE4blq0RFx8zd4n8lU4gBz2Vf7Jr6H0JM7BPGKBGuHNaeeskKncstNH7cUa1Rgt
 8bF3vMh4XVcMdj6LHfCHjO0qJs3WZkjYCNOgKPX6V5LBK+oEVlw2UM/Tn4FOUl2Bs
X-Received: by 2002:a05:6000:cb:: with SMTP id
 q11mr1224049wrx.72.1623876253989; 
 Wed, 16 Jun 2021 13:44:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg/i1kUfPCSrh0kRNDAN6fwmslSTeKFy3ltDKkdCVocLvH+ZDAGrnTtDljT1hpxmWsb0QFBQ==
X-Received: by 2002:a05:6000:cb:: with SMTP id
 q11mr1224022wrx.72.1623876253788; 
 Wed, 16 Jun 2021 13:44:13 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r18sm3098709wro.62.2021.06.16.13.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/23] target/i386/sev: Remove sev_get_me_mask()
Date: Wed, 16 Jun 2021 22:43:12 +0200
Message-Id: <20210616204328.2611406-8-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
index 83df8c09f6a..0a36e81f66c 100644
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
@@ -810,8 +803,6 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         goto err;
     }
 
-    sev->me_mask = ~(1UL << sev->cbitpos);
-
     devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
     sev->sev_fd = open(devname, O_RDWR);
     if (sev->sev_fd < 0) {
-- 
2.31.1


