Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23613A24D0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:54:35 +0200 (CEST)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEaI-0004uO-Py
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrEST-0007hh-Qq
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESS-0005Mt-89
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGa9GgRsKFPGgrQdxnus+fnHfkZl38eP+21GVfWY47E=;
 b=B5WCKoLf1/2etqlE9Ez5CA7GEiVkKKTZTvbRSKza14Mg+yYlESjxgcGbNSp5DgkuA6Tc5N
 Xcr2EADfHJghkHU29yLtBbV2OjAlYFQ91ztDj2uvECADODnp6gl9fLZuQbw/LQw0nLdkDT
 Gx9NoGU4DkxW3tCtGrmgLQ618XeOYec=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-nsvoEDeANWaoLYgqhMg3pA-1; Thu, 10 Jun 2021 02:46:26 -0400
X-MC-Unique: nsvoEDeANWaoLYgqhMg3pA-1
Received: by mail-wr1-f69.google.com with SMTP id
 h10-20020a5d688a0000b0290119c2ce2499so403242wru.19
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iGa9GgRsKFPGgrQdxnus+fnHfkZl38eP+21GVfWY47E=;
 b=f10Ng8I1WUWGRQ4uaJPKOy6FY/kWRT5T2ERknWolOsb79E4NKKArnrAFc9GNWOjhNe
 gSAWliBEDq31H+25J8PYc1n1DcdXhwzeipe/JECpYix/TQkEZYJlpf2GM2HdIhwKagTe
 KIlcikYGbe7m/Havh6b2cpp3UV7lsuzwMnl/BB1PNfh72mA2EHUKVRDIAD1z1gpoMZux
 WFP0Mengz4s2jY9wtoZkJVIovNVj/K08pKyA5bq28QhadUJaHORMQ5uCATp2qoUhxLNc
 pMyQCqSkrxkNk5NnLp+9ba+XClN1orSdYm7rUKdd1V4b9dWxOYpFTZZMgNfD3+IbnOrP
 zYDQ==
X-Gm-Message-State: AOAM531zhqjEBe9M0Gh/HajC6YKLUWawI+goRQ7JSbRNSileOEqSogYm
 32rytAqW64kz/uzyXu1JSHDtH47+/owUtLRN4QugilZxJTC+zQnEoMSEHNaTpJUSB1TYgBlnG8v
 AZ3+CI9AzuDPl6uY5Fyc1zM7cZUDt/GRwFh/nnMr6GBWL3ABFYTDB6WGeokdBUjHn
X-Received: by 2002:a05:600c:3789:: with SMTP id
 o9mr13642800wmr.78.1623307584703; 
 Wed, 09 Jun 2021 23:46:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj9bOSjIIpn4Htpr0eoyArki2BLxHFaXvkWyCmUG4eX2ivVlAKyW+ufFNGjDx6sGaAtVtHsw==
X-Received: by 2002:a05:600c:3789:: with SMTP id
 o9mr13642779wmr.78.1623307584527; 
 Wed, 09 Jun 2021 23:46:24 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id o18sm8036094wmq.23.2021.06.09.23.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] target/i386/sev: Remove sev_get_me_mask()
Date: Thu, 10 Jun 2021 08:45:51 +0200
Message-Id: <20210610064556.1421620-7-philmd@redhat.com>
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unused dead code makes review harder, so remove it.

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


