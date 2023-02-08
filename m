Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDD68F994
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrkL-0000la-I3; Wed, 08 Feb 2023 16:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkJ-0000lG-Tt
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:12:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkI-0007t3-DY
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675890769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkQ9oa8tr+jHC1q9KvAdYJxLnDHRifzn1f10j1QSqk4=;
 b=Bug832DrRjZTvP1h7B2hT8f+Lf6NN9OUB+kY9VFeGiDxDwLLPRl4AEt7UOXFObJl76fhL+
 Y3km8kjKFbqLFrrQvDIZynN6b6S9H2hN3WKZA5ZlvNsYfA/lzsHfd+bDKOiAikuqJU0F8y
 k25UEHqVFAry/UHpxG3IeuBnnyj+yhA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-ioKn2miyOhS3VLCPQ3JoPg-1; Wed, 08 Feb 2023 16:12:48 -0500
X-MC-Unique: ioKn2miyOhS3VLCPQ3JoPg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e38-20020a05600c4ba600b003dc434dabbdso1741701wmp.6
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tkQ9oa8tr+jHC1q9KvAdYJxLnDHRifzn1f10j1QSqk4=;
 b=NlFBljjrJa6Qo/WieXCu/S+VbuB6C9I31uVwIJHGlA73cPZ5It54BxOmcu6vsPqxcW
 s4HqqDUWV2jtS7QLpXt25y+8IPrAZXFI/MtBXWRXrwaqX1z++garC9UyNmNq7M8YUWvi
 3Qhg1kmFYcyjvtqjhNo3k8eaAn0Lhdm9cKc467HUSI0r8y1hc4jVmzJR0llOTS3ri5KN
 ob3s2iN7kb9J/jtz+TLEFbyLHaAh1/UOjLK98lULyj3rw84IPHWvsYD/xmeaUClCS5t8
 A4uhsyblYhZjQZCEyAGprBHhoDvsBGHtSb3a4FE2O9YkrvQA9CqPFehqsWPBFxtjZIVg
 B3LA==
X-Gm-Message-State: AO0yUKWtMIspdiX9BjGGPTBOMJji8p0N22hEt4z9NWp0ii13jbB6EjBA
 urOw63biKZxHYKF0dK6a7StYYBJs7V5mCoTIpHTL+qGl5/OpYW4JrWDqsQ5wpUuvuLg/JJC5sfc
 9uYIIYsNesAqTyXU3cso+G0hFcUcovSdavwOXMIem0lbceMKCF+KxbSoLYoZql+Dtclwc
X-Received: by 2002:a05:600c:3596:b0:3df:d431:cf64 with SMTP id
 p22-20020a05600c359600b003dfd431cf64mr7731435wmq.39.1675890766806; 
 Wed, 08 Feb 2023 13:12:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8kNfnMKSwUT4zsOirgkb5KdNoSpzPeol3XSoJfqBxaPj4EX7PG3krQuGAKichXMOAacj8Caw==
X-Received: by 2002:a05:600c:3596:b0:3df:d431:cf64 with SMTP id
 p22-20020a05600c359600b003dfd431cf64mr7731407wmq.39.1675890766594; 
 Wed, 08 Feb 2023 13:12:46 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm2916208wms.22.2023.02.08.13.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 13:12:46 -0800 (PST)
Date: Wed, 8 Feb 2023 16:12:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH RFC 4/7] Revert "x86: reinitialize RNG seed on system reboot"
Message-ID: <20230208211212.41951-5-mst@redhat.com>
References: <20230208211212.41951-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208211212.41951-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This reverts commit 763a2828bf313ed55878b09759dc435355035f2e.

Fixes: 763a2828bf ("x86: reinitialize RNG seed on system reboot")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/x86.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index e1a5f244a9..32f37ab7c2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -787,12 +787,6 @@ static void reset_setup_data(void *opaque)
     stq_p(fixup->pos, fixup->orig_val);
 }
 
-static void reset_rng_seed(void *opaque)
-{
-    SetupData *setup_data = opaque;
-    qemu_guest_getrandom_nofail(setup_data->data, le32_to_cpu(setup_data->len));
-}
-
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -1115,7 +1109,6 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-        qemu_register_reset(reset_rng_seed, setup_data);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-- 
MST


