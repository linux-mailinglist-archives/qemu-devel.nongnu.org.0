Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417E612D96
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:38:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGtr-0000gQ-9j; Sun, 30 Oct 2022 18:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGsA-0003ef-Qn
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:46 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGs9-0000LG-Ce
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:42 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a14so13675362wru.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27+gO8KDs7eh/C7hO+t+IDu3gwk91f7L9C1dmHDUnx4=;
 b=kKbogMTeHuOPFwTeh39UgjMvx1q8oZzQHpVDcnTRItUaDFAHV8K3eXflWPeVEy4hE/
 pI0oY0To+2os0wu6WxYwzRRw9DAyfrcUBosngwM8fm4ejoMTlg42BKFBq624FcogliiR
 Aa+ys5t7de+Nct9IhO4XX+eL4y2HzC+WUPYeKlf8n1p729M+Mr3R1OAkw5/ikAjTvrno
 jHzPXwBy2umjRQ3+QzPiJblBpNHrpDQueB0agjmm10cK/sNS+cXGd2f8+62K3v0xYGdk
 CGWUzyRuBALyyn+f8ooT2XxbvRpEp3bKA76NsLtr5OBTDMFq2y13ZRqJf/5Sk+bfENfv
 FJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27+gO8KDs7eh/C7hO+t+IDu3gwk91f7L9C1dmHDUnx4=;
 b=yAZyFrGjubpdIjXBgjM1orMwLJ0gNwX2bPyKewMdJH5jWeI6ulqxgwJeyDEY4DyCJP
 ImZJ41vUx516knCifS7H1c+b5N7WgxuidwIzJasKWW82A0gl1P7j9jxey9TrpyaK3eai
 X18IHPF1o5a0oNkJ7jYCXOuC45tAXC90Xn3vQJkgBD/encq2PSPnpn0vX7Xamdrtqg8R
 m8bMAKYpXwWAHoxv4Y/HjOTBz9qPATQb+DRqFtsTgJWYBZLbS4W+Pks7Xw7xO+03Gcbx
 7bnRqU8e6QMDwBTuQvsLyRFGsg2A5B1O2OJ1wC0TDb6+k0E/AgL8LyyMHbdDt1E9qVCG
 uWpw==
X-Gm-Message-State: ACrzQf2o0jodEjSK4oZ7L0OiuZnCfigtmxpubt9BEazcIHKGL3ZqAiaO
 CPjEEB1FCgTmr8q3apMLjfcypEmKr4lrdg==
X-Google-Smtp-Source: AMsMyM7VFONTfs/SsbjtVU8Lb/Wt5FFNEM9yGW/xe5gaMzK2bOXk2NsXPY1uZIR3kOmmP6uf+dZf5w==
X-Received: by 2002:a05:6000:1f1a:b0:236:ce27:230a with SMTP id
 bv26-20020a0560001f1a00b00236ce27230amr499730wrb.469.1667169219885; 
 Sun, 30 Oct 2022 15:33:39 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a5d53cf000000b0023682011c1dsm5209907wrw.104.2022.10.30.15.33.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:33:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 45/55] hw/isa/piix4: Rename wrongly named method
Date: Sun, 30 Oct 2022 23:28:31 +0100
Message-Id: <20221030222841.42377-46-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

This method post-loads the southbridge, not the IDE device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221022150508.26830-8-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 15f344dbb7..c88d3bf3bf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -141,7 +141,7 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xae] = 0x00;
 }
 
-static int piix4_ide_post_load(void *opaque, int version_id)
+static int piix4_post_load(void *opaque, int version_id)
 {
     PIIX4State *s = opaque;
 
@@ -156,7 +156,7 @@ static const VMStateDescription vmstate_piix4 = {
     .name = "PIIX4",
     .version_id = 3,
     .minimum_version_id = 2,
-    .post_load = piix4_ide_post_load,
+    .post_load = piix4_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, PIIX4State),
         VMSTATE_UINT8_V(rcr, PIIX4State, 3),
-- 
2.37.3


