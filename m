Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B77068F98E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrkI-0000ir-5T; Wed, 08 Feb 2023 16:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkF-0000dB-Js
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkE-0007rP-2K
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675890765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NERecKdHLUqwMZWLwJADWmbTJLbslnFnPSfMbqlvP3U=;
 b=UePe9jeuleEU13xO8pLyOB0TvKEjaZXL5FcaG2tL0PFzS6rDSowyuwcxnfTa0grFF2XX5A
 PeckehzsxVQu9DHi3IUdvInkkLC4OJxhrADselCuXc6Ke4YN9OhjCUS7TcdTjaqmalwQcg
 3sMPR9LJJfUUpH0XimlQhD/P7IJzt1A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-HZYRJkQxMuCU0DgI_3dnpQ-1; Wed, 08 Feb 2023 16:12:44 -0500
X-MC-Unique: HZYRJkQxMuCU0DgI_3dnpQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h5-20020adff185000000b002c3e68f9d6fso2194758wro.10
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NERecKdHLUqwMZWLwJADWmbTJLbslnFnPSfMbqlvP3U=;
 b=W4lDKxoq5sK4rp2CgtarhCyZ97oaBiQ/Yh1FNtJehVV04w7C5WgFot/BbJ1IJAXDDn
 Sv/X8h9hLPRAaSfxd8WboCpFoGaaxZzt3ELSEh2WNQpN5f9HHMFScGpcK7MrkceZGw5X
 0T8A0rXVQ9jyhgVxK42+hsJoznU1Dk5/tuYM/oAPCWXMbY3N8wbAQnKgGrYMzCCDqxkT
 X1ZPs3h3zJiRYjcZhg3Ucru0Y4VNnAjMBoeTwTDxLwi0soVnMwgsaTEg7c4VGScYKwqt
 Ai/rzVVxE63uYwLiw9BgZbJgusEvvkHA28Iy/3nh57/crOIdBQtaxPTsnICI8rQrkC29
 Facg==
X-Gm-Message-State: AO0yUKVzWzALik7DCtKT5eQwLNsEJAbesUWqWky3vW0OGpl9Oi5p91UP
 BSg8gGZw7OCmBJcgC3QnFdyoMQLJNlK0DQ77sbuEguLdSEm/6nMTevw1Gc4QOuVydScUY2a6Qze
 jsiA/3pcXN3g7/pjhcitY6Xy9/GUBUSC1GI5RlK9I5T4l1R29Fa3rN3/ZfIhJNOiCJGkZ
X-Received: by 2002:a05:6000:1d1:b0:2c3:ba99:44bc with SMTP id
 t17-20020a05600001d100b002c3ba9944bcmr8345856wrx.68.1675890762575; 
 Wed, 08 Feb 2023 13:12:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9hJ/RtQuMOQNR+s++VE21Jk7JmDAqkt+dsnQdLd0krrCQM6jyPXo7PC5NSAGcU94PVU+QKKw==
X-Received: by 2002:a05:6000:1d1:b0:2c3:ba99:44bc with SMTP id
 t17-20020a05600001d100b002c3ba9944bcmr8345830wrx.68.1675890762340; 
 Wed, 08 Feb 2023 13:12:42 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4ccc000000b002bddac15b3dsm14220412wrt.33.2023.02.08.13.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 13:12:41 -0800 (PST)
Date: Wed, 8 Feb 2023 16:12:37 -0500
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH RFC 3/7] Revert "x86: re-initialize RNG seed when selecting
 kernel"
Message-ID: <20230208211212.41951-4-mst@redhat.com>
References: <20230208211212.41951-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208211212.41951-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

This reverts commit cc63374a5a7c240b7d3be734ef589dabbefc7527.

Fixes: cc63374a5a ("x86: re-initialize RNG seed when selecting kernel")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/x86.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 7984f65352..e1a5f244a9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1116,14 +1116,11 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
         qemu_register_reset(reset_rng_seed, setup_data);
-        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
-                                  setup_data, kernel, kernel_size, true);
-    } else {
-        fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     sev_load_ctx.kernel_data = (char *)kernel;
     sev_load_ctx.kernel_size = kernel_size;
 
-- 
MST


