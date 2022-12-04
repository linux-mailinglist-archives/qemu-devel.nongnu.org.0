Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1281641F21
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:12:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLK-00027f-JO; Sun, 04 Dec 2022 14:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLH-00026T-Hu; Sun, 04 Dec 2022 14:07:59 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLG-0001bf-0N; Sun, 04 Dec 2022 14:07:59 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ml11so23089975ejb.6;
 Sun, 04 Dec 2022 11:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zK5nuVbQbCTa67pCIp/qbXP1Qf38RupVyTggBo1e+Hg=;
 b=XL2JNAGHzXCdSJz4ZkqWC55XAwXnvODNawtFBv7NJuVt9SKI5cDwAlIJW1yMjwkel0
 g5F0ON7DKLre0zvhfRBD+0CYVsDkLOdCxgmflTHG2o2Hkm8q6N3XeXFN72D1Jk2VZDUY
 BQeCwe3Qk32IlSAsMqyHxcH8P8O1zUwp3sJ1mlKsifqC/3g7PJtGkW8G0GlUheSrj1+Q
 VvU6C4L/U/sZCGmgiRLt0KTqb3Flfnp/lwPXHqiagqRT9hIJJG5m6ilyCHc3ETEtYVpR
 LVBuwIK6PKLtVtXgu+TxWn22S3Op5KQiqYQGh1UOazwOuYFreSqx7WxApG9PsOAzOzk2
 QMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zK5nuVbQbCTa67pCIp/qbXP1Qf38RupVyTggBo1e+Hg=;
 b=2b0vub3HLruoDNNNOIHc7WkraNa2RErwtV20LX5juSZl/Cw4K1XdXTwAxbyJ91xIxD
 JnEGL0WSNDjUMNug1fmMWxu7MeK3iEHj+ic970YU5x+ta4cWFOoTdyYR0XZ2uPnX6aFs
 PWfGc9l4YaKaN05iFIK8ZO2rDzWIMFSFyfoUtwgs6fa3qebTOXOiqHgdb8iF9/xkarXu
 EJJE9MzFOgPKKfDa43E3WYx+I0lb9wTtmhKELSDVcxrTzFq2XVcHCRgyxKAJxjFxzhEJ
 BN3dobHv2zSO8P1Gc8iqHmbEp4xSyk+IVPRoCeJsCvyqShP2LLJ9pRJq081impGZxyZZ
 RZ9g==
X-Gm-Message-State: ANoB5pmAfMk6ytIi1MdJeCAqGsXFftGlHsrrfXEOhnWvkDF5OQkiGp8p
 YO6ufhQourPaqTl73NfegW+ThSzwEI0=
X-Google-Smtp-Source: AA0mqf6rK4MrxKwnU00FtgEnm66QsBH3Zd2tj3/gKQblm29/7aaKs4aVJjWQjzOjhwtEnFlmDO1JBA==
X-Received: by 2002:a17:907:76e6:b0:7c0:543a:5229 with SMTP id
 kg6-20020a17090776e600b007c0543a5229mr16807534ejc.58.1670180875881; 
 Sun, 04 Dec 2022 11:07:55 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 21/32] hw/isa/piix4: Remove unused code
Date: Sun,  4 Dec 2022 20:05:42 +0100
Message-Id: <20221204190553.3274-22-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The Malta board, which is the only user of PIIX4, doesn't connect to the
exported interrupt lines.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-32-shentey@gmail.com>
---
 hw/isa/piix4.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 24d943c609..dbefcb3ff4 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -180,12 +180,6 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_set_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->isa[irq], level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -229,8 +223,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
-                            "isa", ISA_NUM_IRQS);
     qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
                              "intr", 1);
 
-- 
2.38.1


