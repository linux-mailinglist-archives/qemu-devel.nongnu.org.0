Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D96A7C85
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:25:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFm-0002T1-Q6; Thu, 02 Mar 2023 03:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFA-00027b-Li
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeF8-0001y1-Q9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkzltoAQslA9URaPLAQaSc2HpeO+s5E1uf8WjlsvQRk=;
 b=gvIgtByCJG+DrA1WBwpc/rZ8IxiE6LqfG/DLRPO34lkSyLcLTezUWw77F0BT9KIncSQxhw
 grflYzqzf//Z+R21XX2GLI0h5WWWhwUfSLv4NSDftIwYlvYctJ6vJlKG340K1hpnYCggQS
 9lth8GyA9EDD6Jtymc1V6xhwmNBjmOo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-cLBV7qzlOZ2BYhDagim2qA-1; Thu, 02 Mar 2023 03:24:48 -0500
X-MC-Unique: cLBV7qzlOZ2BYhDagim2qA-1
Received: by mail-wm1-f69.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so925057wmb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:24:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745487;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZkzltoAQslA9URaPLAQaSc2HpeO+s5E1uf8WjlsvQRk=;
 b=1Oy0hre3i+wL3U4JJARjCwitYv2edjfWSpcTyVQDT5q64peXIYV/ZtSomd1f0u+KMq
 DSZ1bpA9jwq1BnkhaV9fsN1VXrtnUzs6dgE49polaKb8EvkLcaI+1sutTTswa9kEb6Cl
 o7WP/u8WiIU6WsUX+C99RiS0KaHXurHv1f/HwNLhZDxdrV1Oeo0g6ZKAfOQKzJVrsoCn
 NnnGa2FBgd7xIyAZCwnPNtBPYiO/vcjKxuQx10YClkGO8wOEG/SeX4d4cyQ4fShFmrTf
 tqop/mY7M+SWuOB4Tvmowebe14BxRws5lJN5yt+8PX3pQeAAMo8O9bPY9MMbrTrmLoP5
 pjmg==
X-Gm-Message-State: AO0yUKUfb7jTAwWP0oakVUR2Y9wP920/Gr++w+CbFhljEJeYoZAoeQAn
 07JoQqpuaZ4xE9LBHZ9v02XNIvrygcDtKIDlsn7uLtg8nhgZp1/tAHuJL0rwqX4eJa9qR57Up9T
 XGmdUW2s0FPdje9cZGxtEflh4I6f32ZCunu6Fzynjqgn3NbOaIuGXa1RU9UQp6oSzDw==
X-Received: by 2002:a05:600c:181a:b0:3ea:d611:f8 with SMTP id
 n26-20020a05600c181a00b003ead61100f8mr7927531wmp.38.1677745487298; 
 Thu, 02 Mar 2023 00:24:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8uzZzoT/baKkkWG1Z71G6KGV9d4kFKbGQ6+pRi2R0GGeqermuOp5Ib/yuFJj7PJo7VuU8YpA==
X-Received: by 2002:a05:600c:181a:b0:3ea:d611:f8 with SMTP id
 n26-20020a05600c181a00b003ead61100f8mr7927502wmp.38.1677745486977; 
 Thu, 02 Mar 2023 00:24:46 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm2339046wmq.5.2023.03.02.00.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:46 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 05/53] Revert "x86: reinitialize RNG seed on system reboot"
Message-ID: <20230302082343.560446-6-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

This reverts commit 763a2828bf313ed55878b09759dc435355035f2e.

Fixes: 763a2828bf ("x86: reinitialize RNG seed on system reboot")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/x86.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ec9c343cdb..278dd54830 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -788,12 +788,6 @@ static void reset_setup_data(void *opaque)
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
@@ -1116,7 +1110,6 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
-        qemu_register_reset(reset_rng_seed, setup_data);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-- 
MST


