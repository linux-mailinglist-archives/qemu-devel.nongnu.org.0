Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C133AA5AA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:52:25 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcWN-0008IV-LS
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOg-0002Ag-Nv
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOc-0000r2-75
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJdW6m0Ma56hwzjCy1teOEHrEH20tchf6AQogJnEfxU=;
 b=fRo3bgKGTolBWeIEhc+TuMjbpq2dB2oNwzZjNj2tQIdiPcgOvB/sdc0SCi37Og/irRmAQL
 0PI/lYbNz+sxS7Jx5os1l0dd635qJcUjO5sS++x1P65EeBBH58zol8auupTPHHUS/+k5SO
 xQFwx40YhAisLfEPOOwusjtnTVxv07U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-FfnR7SPGMZ2UfQiPZvrDPg-1; Wed, 16 Jun 2021 16:44:20 -0400
X-MC-Unique: FfnR7SPGMZ2UfQiPZvrDPg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so1857914wrd.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KJdW6m0Ma56hwzjCy1teOEHrEH20tchf6AQogJnEfxU=;
 b=NEa5+lTeB0atFSusgaWzmTWIB/sNm1eFQwKWt55sYLwJvlwcoyWlo5UpsuHVoMjYYj
 Id9ttXOakeAaXjuh70qWkiC7YTzhbklChgnxuEIc4207VbJ56JolmZ+01Sz/cc4NG9pO
 QixAt5CYr7jjKtiAtOd/powNXUYGi3+G/hOt6D+HqeE3a0WRwvVOuja+U6aUO2ajBOzj
 sB9ECzSS11iUZpxMhxhVItOOH51UdA3YLii6VRi0aitdjh/wVcmgsVJjARlAE1YYdWOw
 Q4ZdY/CbhoUTfpkmxDfSCb3ifUMYVKJWvD6ZwBSmhkNDEBlDrcXpdub9ZbMyTXxfrWOi
 yhNw==
X-Gm-Message-State: AOAM530YPQQXTWVClMYw8xzindhUARflYqHY4ASOBIomiB6nyX7leBfy
 cniPO6AZbPkhlwChxqEodmDxz5M0JiIh9YN4x5QtxvW8X5LbpaVYD4Iqq4LrWSaGseR4TAwwKXo
 F6tr9fAtnOA5IoULXjtweZkAzwndHbv5zSPb6OoxeVP62aICi9PFrTJkTEF3L+UpR
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr1208711wrt.382.1623876259424; 
 Wed, 16 Jun 2021 13:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyixwQR7l27UKVWaZuT5XHYcGzirQFtRhxb+W0+ewb+ZpkQ+NgluuvAJoiytEWi2zigltASA==
X-Received: by 2002:a5d:60c8:: with SMTP id x8mr1208682wrt.382.1623876259297; 
 Wed, 16 Jun 2021 13:44:19 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b8sm6048742wmd.35.2021.06.16.13.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/23] target/i386/sev: Mark unreachable code with
 g_assert_not_reached()
Date: Wed, 16 Jun 2021 22:43:13 +0200
Message-Id: <20210616204328.2611406-9-philmd@redhat.com>
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

The unique sev_encrypt_flash() invocation (in pc_system_flash_map)
is protected by the "if (sev_enabled())" check, so is not
reacheable.
Replace the abort() call in sev_es_save_reset_vector() by
g_assert_not_reached() which meaning is clearer.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev-stub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index eb0c89bf2be..4668365fd3e 100644
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


