Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7F621A90
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 18:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osSN5-0001GD-O5; Tue, 08 Nov 2022 12:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1osSN3-0001Ee-8b
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 12:26:45 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1osSN1-0003GA-KF
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 12:26:45 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-13c2cfd1126so16969351fac.10
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 09:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lrK0gHo3vQFxmCYTdPuHMJ0gn/TJm6opQJd16pJ8n0s=;
 b=TEBjmU1LiF0nXgzjt9rq8EUlkBK+Gqk8liEHSPNRCcdsK6ImZjDF98wBsvsTWuKvOQ
 Eet8sUpPM1oNqXVHhLnHc6AS9lvdwbf6gpSaZ3OsapK/urvUPkeQK14hphpbcd59UXq+
 vcih0FGuU2bQnSQOwaV4GiBscZ6EqSj81Mh7gAfQLnianFSwUu+OJsGAl18Ew3XEk7rE
 DkbTnKdmDqZwjRxd9K9lEyxnyRzHueHr79MBZ7mmZKB3NlU58WPktzTHYDb93izAEsvO
 AUJoGWbDcZT15FoQ/s65z/l/+nyIraX/5ECbzECommtyoEzKzO17kq0jRgofrnlVxWQl
 qvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrK0gHo3vQFxmCYTdPuHMJ0gn/TJm6opQJd16pJ8n0s=;
 b=MYcdJ7kXjF14Os9WbGp1q/8m1u6P1UOuMkFHP+8eC/w58YpfxGJS7E/pHZpGwGnFXq
 2GyDX7DSmxKdAvG+qeKpee75aObxEAH4Nv/cCmfv5U41/DKRJH6tNB5CE7XEOjtq70ij
 AIxzHi2/LuIbpvwwV8u043blGjQ4RipsZw3uc28+TY6ncNmkt+JFTsX0EKttQ4GuZZUq
 BdndAMaD+CafrSTFOUlpShPzydjkjz0S8ShH+UvDnuSOTzk9V1yfuR8enF54d01vckQh
 4XePPWazTJGzGFi9xAamZ7/9MiVghnRVL/Q9Ov/EJezVoNtbozvRDpAHOepjR5iwFfz7
 NE1A==
X-Gm-Message-State: ACrzQf28iaOiSIdnKEkl0dzbfzqKgZDQuKJef2rjXYLxhMJbjnD+zzL7
 YLeDfisbIhIJstHfSSuTFyCUfpxaRD0=
X-Google-Smtp-Source: AMsMyM4Yo6n2kO3fZIYOGSIjThwYmROuCitxt+3PGDllrBAHUURGQXdUIe5qfGpNcSBgO0uA4f98pg==
X-Received: by 2002:a05:6870:d60d:b0:13b:9d25:3358 with SMTP id
 a13-20020a056870d60d00b0013b9d253358mr34774369oaq.217.1667928400495; 
 Tue, 08 Nov 2022 09:26:40 -0800 (PST)
Received: from balboa.COMFAST ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 e66-20020aca3745000000b0035a5ed5d935sm3680277oia.16.2022.11.08.09.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 09:26:40 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: [PATCH] Revert "hw/block/pflash_cfi0{1,
 2}: Error out if device length isn't a power of two"
Date: Tue,  8 Nov 2022 14:26:33 -0300
Message-Id: <20221108172633.860700-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

This commit caused a regression [1] that prevents machines that uses
Open Virtual Machine Firmware (OVMF) to boot.

This is a long standing behavior with how pflash handles images. More
information about why this happens can be found in [2] and commit
06f1521795 ("pflash: Require backend size to match device, improve
errors").

This reverts commit 334c388f25707a234c4a0dea05b9df08d7746638.

[1] https://gitlab.com/qemu-project/qemu/-/issues/1294
[2] https://lore.kernel.org/qemu-devel/20190308062455.29755-1-armbru@redhat.com/

Cc: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1294
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/block/pflash_cfi01.c | 8 ++------
 hw/block/pflash_cfi02.c | 5 -----
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 9c235bf66e..0cbc2fb4cb 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -690,7 +690,7 @@ static const MemoryRegionOps pflash_cfi01_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl, Error **errp)
+static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
 {
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -708,10 +708,6 @@ static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl, Error **errp)
         sector_len_per_device = pfl->sector_len / num_devices;
     }
     device_len = sector_len_per_device * blocks_per_device;
-    if (!is_power_of_2(device_len)) {
-        error_setg(errp, "Device size must be a power of two.");
-        return;
-    }
 
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
@@ -869,7 +865,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
      */
     pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
-    pflash_cfi01_fill_cfi_table(pfl, errp);
+    pflash_cfi01_fill_cfi_table(pfl);
 }
 
 static void pflash_cfi01_system_reset(DeviceState *dev)
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index ff2fe154c1..2a99b286b0 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -880,11 +880,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!is_power_of_2(pfl->chip_len)) {
-        error_setg(errp, "Device size must be a power of two.");
-        return;
-    }
-
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
                                   pfl->chip_len, errp);
-- 
2.37.3


