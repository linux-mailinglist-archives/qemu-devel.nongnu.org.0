Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0B621BF9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTQQ-0005J1-9o; Tue, 08 Nov 2022 13:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osTQL-0005Hv-5U
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:34:13 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osTQJ-0002Xh-Jp
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 13:34:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso12314359wma.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 10:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EaN4TB87K9SHwpGHJN/1lzTGk4djCbU5hJR52tyhIr4=;
 b=Yq+4pu0e0gCtN3xILjZowPXv8oHA1hwLgxZSDMEzqAEJgM4nvYuMrx1nafYI7IoBFz
 nZM5FFKgEZY6JTX7nJZV3bN5I3tsjzBe0YqapDs/PoXJ6ksy8yh7gTxQ4SES72ewa/Km
 jNVT8kpo9tahlHpRSOJo23vrSCxGSrjZaIUaeT4lCbbOIdHBbgl23B9Bg2SSQZkvZbst
 OKjBvkgKu57nRz/4nmo+IGYZfLnc5EjiAU2c9m6bJcVwhjNis+2ZVVOQCm49Dl6KKb5B
 n1EvDhm+o1w3h2fiJJQs4moTFw6B59lepus32el9gSgm7g+1xDICaG3we9vW8ZfXMo8g
 3SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EaN4TB87K9SHwpGHJN/1lzTGk4djCbU5hJR52tyhIr4=;
 b=vFqVRA/0JMAq/K5keC6ekeIwz49ZtbAZdBVVPYCPI6h8kf912L4al3jqhS59hgvaeE
 1HipTQSZAZdBCj9vkc4gk6aKNBXJf3OB745ETHKCAIl6UcHYThYgrIZn9DWmT3wDsob1
 mxsdPVfVNmROUg99hKG7oOK22yydBAddBNwF2w0tLrnYJCwpPoR7CYUGcaBYCYz+NJum
 pt0iE+UmtUlkvk6KM/CjccrImPfPSiT5EXZQHm35kBTaO1G9Pp1SmaR/XfhCxaeiUu17
 CCPdPMKVf6miM0wXAWI/rMthfZptIJS+yiH+t2+qzQbW0i2L25hIcHE81igcnTNm1EEX
 9adw==
X-Gm-Message-State: ACrzQf3hZC/NaKKCmPJ3X769MWayZDMSQUp8JpWfXcYWwambNLF75nTk
 uq0b4QJENwM4f5Ca00kSIjO1dHGi2ImZBA==
X-Google-Smtp-Source: AMsMyM4hop53k/H7OdLebRixzUPszSkObfe54NPx0X+BJEft6nwrN79uPtBMz7dpL0TIyLtm0Slr7A==
X-Received: by 2002:a05:600c:2143:b0:3cf:63dc:d011 with SMTP id
 v3-20020a05600c214300b003cf63dcd011mr38796548wml.194.1667932449945; 
 Tue, 08 Nov 2022 10:34:09 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adfe505000000b0023c8026841csm11367876wrm.23.2022.11.08.10.34.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Nov 2022 10:34:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 3/3] Revert "hw/block/pflash_cfi: Error out if dev length isn't
 power of 2"
Date: Tue,  8 Nov 2022 19:33:52 +0100
Message-Id: <20221108183352.9466-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221108183352.9466-1-philmd@linaro.org>
References: <20221108183352.9466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Commit 334c388f25 ("pflash_cfi: Error out if device length
isn't a power of two") aimed to finish the effort started by
commit 06f1521795 ("pflash: Require backend size to match device,
improve errors"), but unfortunately we are not quite there since
various machines are still ready to accept incomplete / oversized
pflash backend images, and now fail, i.e. on Debian bullseye:

 $ qemu-system-x86_64 \
   -drive \
   if=pflash,format=raw,unit=0,readonly=on,file=/usr/share/OVMF/OVMF_CODE.fd
 qemu-system-x86_64: Device size must be a power of two.

where OVMF_CODE.fd comes from the ovmf package, which doesn't
pad the firmware images to the flash size:

 $ ls -lh /usr/share/OVMF/
 -rw-r--r-- 1 root root 3.5M Aug 19  2021 OVMF_CODE_4M.fd
 -rw-r--r-- 1 root root 1.9M Aug 19  2021 OVMF_CODE.fd
 -rw-r--r-- 1 root root 128K Aug 19  2021 OVMF_VARS.fd

Since we entered the freeze period to prepare the v7.2.0 release,
the safest is to revert commit 334c388f25707a234c4a0dea05b9df08d.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1294
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221108175755.95141-1-philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221108172633.860700-1-danielhb413@gmail.com>
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
2.38.1


