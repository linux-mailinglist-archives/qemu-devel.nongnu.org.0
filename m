Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B414257FB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:31:01 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWIO-0001Dg-7J
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5z-0004ku-9l
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5x-000550-Hy
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yu0i8hmAoNBqKA56xVa0FWOHuPb3wa3Ay0pPJ2J6oOs=;
 b=HkyFXvC/TGng8TPcoJfsfVfXvBkSuPU5ytzQ4UHqUavtm5a29TieoY44UddczDQBEEYasy
 3qT8aJ3W4c7RxlnGgBO6YEsv4tNdMk7zj6NrzerCsWxEff1YE2vZfWSCtbBYerdu/rEsL2
 qzHvespJkWO8kHxpeXl6NzQnTzXKOA4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-QZW7TtxNPX-oonVk5gjHKA-1; Thu, 07 Oct 2021 12:18:06 -0400
X-MC-Unique: QZW7TtxNPX-oonVk5gjHKA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so4943069wrb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yu0i8hmAoNBqKA56xVa0FWOHuPb3wa3Ay0pPJ2J6oOs=;
 b=2JOXi4MpxFAFxaVSgJWrCCIWKonUMqL8QLOdNDpaj60mW4tsqEYoAPTUEeEdo4e9Hk
 2oNWslQxhBGt6O6+3B20XWiWTYgr17XI5HrXc7QNvM44EgUOYfltIk/mjFpTiO/S5IoH
 M6pg9YqhtS5hNLE208wep5McRRT23UaiPWat7DJjqxEcRtIYB/M5u/pEUPHJXD5xpiaK
 2o0Q1OKUEVE5jiEynMRxwkXDd9tS4hmaybmIsb9rWbqe2UlKCABYd+AZTPcYs2zbRKHF
 PBeMsij4kd5JmjuhyHNCVl+H9ay9oefDw1F3lv7oHJH0E+aESIoNzz5rW3uPFLoLaGyt
 evcQ==
X-Gm-Message-State: AOAM531tz15kyX2dJrF4hk/nyZrAs4Y7ibkou6dljBsVphXRHLvixhUG
 79bkYX3jtRXYzJDOErJeABdnbUTkIZCnlH3cp+/OhnejTameZmfXXNiG+SNB74nsiN5EmZUWhnw
 /f2DhBlBXk07mIvGgvvZbdZj0iJt5mGr5thl1zuUq6mTyF32JLUaj9jvZFCUqbhPW
X-Received: by 2002:adf:bb08:: with SMTP id r8mr6741312wrg.247.1633623484758; 
 Thu, 07 Oct 2021 09:18:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1j54x6mkDDT5G+p886ML0TNkhiqQSJ77tctklrBToCqo96VSPVZB4HfWC67SFWx8EPKXHSw==
X-Received: by 2002:adf:bb08:: with SMTP id r8mr6741267wrg.247.1633623484503; 
 Thu, 07 Oct 2021 09:18:04 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id u1sm8426658wmc.29.2021.10.07.09.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/23] target/i386/sev: Mark unreachable code with
 g_assert_not_reached()
Date: Thu,  7 Oct 2021 18:17:03 +0200
Message-Id: <20211007161716.453984-11-philmd@redhat.com>
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
 Dov Murik <dovmurik@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unique sev_encrypt_flash() invocation (in pc_system_flash_map)
is protected by the "if (sev_enabled())" check, so is not
reacheable.
Replace the abort() call in sev_es_save_reset_vector() by
g_assert_not_reached() which meaning is clearer.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev-stub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 20b1e18ec1b..55f1ec74196 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -54,7 +54,7 @@ int sev_inject_launch_secret(const char *hdr, const char *secret,
 
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
 {
-    return 0;
+    g_assert_not_reached();
 }
 
 bool sev_es_enabled(void)
@@ -68,7 +68,7 @@ void sev_es_set_reset_vector(CPUState *cpu)
 
 int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
 {
-    abort();
+    g_assert_not_reached();
 }
 
 SevAttestationReport *
-- 
2.31.1


