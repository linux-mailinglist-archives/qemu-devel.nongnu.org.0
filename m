Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C386368F98F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 22:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrkE-0000aN-Tm; Wed, 08 Feb 2023 16:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkC-0000U8-Qw
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:12:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrkB-0007qs-Do
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 16:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675890762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pyB2eX4BrxplsV/cU4fgKDTd3hh497IDhiUSXuPJBb8=;
 b=jA/43WkzesejjPQUNHCQXKDpj7rKpHf5aPojT/l4ql/bR0QREWD/KyCB5WBsnS1l3a8q+t
 ElILnAucgWtrN05HTc9YsXnARQJPuHHlWl7435ZE2hRfAgU8MX5F7FmBzLXjirHr+R3LHU
 8J3AQ+GSATpe+lC2BoK+yJhkvACzwb8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-JvqLPPrcNu-qSqY1EDpTWw-1; Wed, 08 Feb 2023 16:12:41 -0500
X-MC-Unique: JvqLPPrcNu-qSqY1EDpTWw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v5-20020adf8b45000000b002bde0366b11so3256105wra.7
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 13:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pyB2eX4BrxplsV/cU4fgKDTd3hh497IDhiUSXuPJBb8=;
 b=u1k+E6NxiSXs/KF5F6Q4OiUt28aTBU2fG6gwZyoAhkKjRa/OIPMLg4iFQ4uOCaLLhl
 RQ4odA7jUqrMZgf3+MgSw4XZMQstLO3M3jO/s5fxNJff/2IIvkN8Pn/OkMRR9fD2WSOm
 d1eYBd7A3zIkeOLnEOqtd1DruJ9KzRD5Wouh4Ei8R55bapDe/+yXbR/SxDy7YKMuDuAZ
 tBCjZkn6GJXWksQH9PfrXUocNZS0DAzupv4o59IWu9Bq+AbWqq1bVxuUxUUPfxVFDeVI
 r9KFhbZ2VnjVRYN3Yauyg2M+Ad9slwKiJE3rrVXZqwQCrY1LdnSsiLbji4tN2ZcDHgR0
 Fu7A==
X-Gm-Message-State: AO0yUKUC+RZfnxbhwJ3VyL3158G2KSXWewmJ2Ua9qmkFeR8hvnfbqlWu
 eBWNErPnfCLLFCFvRy7OIq8JwErv2e21cJGnUg2FhdzdNXQtDVNMGW/+osVYz9JwnC76wc33LJ5
 bKvlDF30/rpGSGhHOEczdyc7Mgoxkbe3mSRrDnlnjP54qAkdCnXhQSsA/esXYNa5lUVNe
X-Received: by 2002:adf:e607:0:b0:2c4:5de:2d3e with SMTP id
 p7-20020adfe607000000b002c405de2d3emr1747045wrm.41.1675890757427; 
 Wed, 08 Feb 2023 13:12:37 -0800 (PST)
X-Google-Smtp-Source: AK7set838VaFDlxa9uadyGE5Hk1bmbh3K276tSM5JtsHQY0vUmJXrZ16/41fZCphaQYDSIClM32nOA==
X-Received: by 2002:adf:e607:0:b0:2c4:5de:2d3e with SMTP id
 p7-20020adfe607000000b002c405de2d3emr1747022wrm.41.1675890757189; 
 Wed, 08 Feb 2023 13:12:37 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 y5-20020adfee05000000b002c3f6d7d5fesm4398119wrn.44.2023.02.08.13.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 13:12:36 -0800 (PST)
Date: Wed, 8 Feb 2023 16:12:31 -0500
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
Subject: [PATCH RFC 2/7] Revert "x86: do not re-randomize RNG seed on
 snapshot load"
Message-ID: <20230208211212.41951-3-mst@redhat.com>
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

This reverts commit 14b29fea742034186403914b4d013d0e83f19e78.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: 14b29fea74 ("x86: do not re-randomize RNG seed on snapshot load")
---
 hw/i386/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78cc131926..7984f65352 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1115,7 +1115,7 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-        qemu_register_reset_nosnapshotload(reset_rng_seed, setup_data);
+        qemu_register_reset(reset_rng_seed, setup_data);
         fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
                                   setup_data, kernel, kernel_size, true);
     } else {
-- 
MST


