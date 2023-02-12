Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F240369376C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBiZ-0005ah-UT; Sun, 12 Feb 2023 07:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdO-0007lI-5d; Sun, 12 Feb 2023 07:39:10 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdM-0001QS-9F; Sun, 12 Feb 2023 07:39:09 -0500
Received: by mail-ej1-x62a.google.com with SMTP id jg8so25874725ejc.6;
 Sun, 12 Feb 2023 04:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uJKX+iHDZZxUElS601grp2c7YsdwIFko9wLSh73qHuo=;
 b=bUWDIuQ1XkIeu2xP6zC6iU8fxx1Ajw1Og1tMbsjXgD6jwGOWRP74wLjLOvbeMAp8sR
 7APi1Iz4HCObfmJWPjEzN6fgvn2aHKSKAD1BI/lIHwQCCaXXYjmbUAeUfBXt5tgyBHSP
 Qm8IoAnQ0mKXxbN3rSYunHb6MruthXoqA0Wp89iDR2sv8s9kY2RDwuObC3rXrJ0tFn4n
 AEYTq9v2UJagsPS7RAJdX9ZAWxr2Eh2uOO0+dUiuBxJIzwfI06OOzLY9pQTa9nag3u//
 n/dVaDrkDDReYoavXdQV7S9NhWdK08B0eDYQwKytdd6a/1a+kRepbjv1oRW3U4Z/mO/A
 qb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uJKX+iHDZZxUElS601grp2c7YsdwIFko9wLSh73qHuo=;
 b=M058HQnvB0aB8k9UdhqP7irYnjaNNu1N0CfhR+3thCUT0+R+sPn6/m3VNdnEqRg4Pa
 SvNCapaXJdJXjzyOUFbxVxcxeuB78sKcmOqj3IPmejHEjvZcBkQXTG0IAE8wBiVzRE7k
 edReUSGwCcMZ81m30QTUmR10W4Zj508lvB2CVk3F8kh83QIYp+LcD1h2xF9FSWntxl6s
 2/CYno0LBSHvGls+EJY0FdfZe5TnfZ/Zn5QYE1gnRkDv5HbjY3WNXb2+47zggNvRZRkq
 d8yBny5MQ/DMOoU0WIRVH7Q6W0O+BKFCnxf4WGSr+sofQGH1DJHNrgmo28Zcqgx2Lei0
 R6YA==
X-Gm-Message-State: AO0yUKV51u5+3sFZZ0TFG2RVJOz/GhHgIzTJg/ekzWWveJaqDPPpzDdo
 IJBNtDRnAf/edmK9pNQ5E0vzQ4fTMLg=
X-Google-Smtp-Source: AK7set8Bt3cCxIHp4Ru4PCN+yrQM7tVY0EdTONLKTLKooR9K4aMfnkDODw1NmefVNG3VuZ6HiHYngg==
X-Received: by 2002:a17:906:69c6:b0:881:f614:44ed with SMTP id
 g6-20020a17090669c600b00881f61444edmr24813537ejs.30.1676205544114; 
 Sun, 12 Feb 2023 04:39:04 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:39:03 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 17/23] hw/isa/piix4: Rename reset control operations to
 match PIIX3
Date: Sun, 12 Feb 2023 13:37:59 +0100
Message-Id: <20230212123805.30799-18-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

Both implementations are the same and will be shared upon merging.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-35-shentey@gmail.com>
---
 hw/isa/piix4.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 7d4a66af49..4538676ea5 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -133,8 +133,8 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
-                            unsigned int len)
+static void rcr_write(void *opaque, hwaddr addr, uint64_t val,
+                      unsigned int len)
 {
     PIIXState *s = opaque;
 
@@ -146,16 +146,16 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
     s->rcr = val & 2; /* keep System Reset type only */
 }
 
-static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
+static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned int len)
 {
     PIIXState *s = opaque;
 
     return s->rcr;
 }
 
-static const MemoryRegionOps piix4_rcr_ops = {
-    .read = piix4_rcr_read,
-    .write = piix4_rcr_write,
+static const MemoryRegionOps rcr_ops = {
+    .read = rcr_read,
+    .write = rcr_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -176,7 +176,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-- 
2.39.1


