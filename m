Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73FA662D09
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:42:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuO-0003Yt-03; Mon, 09 Jan 2023 12:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtg-0002jz-CP; Mon, 09 Jan 2023 12:25:21 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvte-0000yV-BV; Mon, 09 Jan 2023 12:25:19 -0500
Received: by mail-ej1-x630.google.com with SMTP id ud5so21943252ejc.4;
 Mon, 09 Jan 2023 09:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROZS9DAh1LyOJO5f9sd5J7Flg4V9+Kkad/7x0aYqgvc=;
 b=QOxTCkWYtQ2NrjW970gscMh7LdpPdU82Isr4STYC/SiK5QpHpH3soV11RnisKqsCH4
 NJGqFzkk0WAHu2/PXN7ZpEFiKZ4YHChDVd3ph5NUwfVPBsJJKft3qJRnxw2Pp0TgOS4F
 TpFJ7WGyue6EF7uSDiX4I4EUYH+Cg0iFsOtyzJVD7zvJmOpCAhN8q45Bvq4JjCKGQ3IU
 q6b6VIkjqw/KOF9S4QnofuBBGsBXtn0PXBmNH5qCXyK8VSf0kDiLEZOCtuZfZ9BEsqP3
 NApuhsGwquujIVYQVx43mVJopVT28ZXM5hdGQuAfkycZh3hksL8oMzuN5EmSJD7JdZYB
 2Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROZS9DAh1LyOJO5f9sd5J7Flg4V9+Kkad/7x0aYqgvc=;
 b=VgkXXUM+vqhqtasA5nAv9tISQaTFYIW67pgo3FII0D0sPRiWR/SJfao1ccGljh0LgO
 ybvDNy8kGnNQTzeKKJo+gUcP4EmLjIkso1F1jdUu7R2kqbTSetjN3HzvIL/YxgJTxCtr
 rTdecyOfa6DR2vNmcfOf4xH5O8yAPgFNL5j/L59ZbZsqM67THJRkSlSSj2pevcuPr1BW
 aTrqBXwf0nU7kjOVjv8MHhyuQ/oJJILcWJtvWgvCAG8u/aHui/lS5zEgSMjKZi7MEeXC
 7E3JImxN5PB246eQosJ5TbzK842uJlrp1Veg8ilZxKAZG/hQpeKYZnRXB9XZCLfd5sH8
 0C6A==
X-Gm-Message-State: AFqh2kp1wPlYkbZ+XgamkgDxW9xDbjOmBGgnpeV/Pvgd60msxP+vZgmZ
 11FWPGGoNewEsfJoMHji1CTY36PZtBYmjQ==
X-Google-Smtp-Source: AMrXdXsZeLhSz9webd8GJZxKRRead2xCnIQi4//sxThppFGbttsgSTVR68MJYcx15nqzzTlq8S3mAQ==
X-Received: by 2002:a17:906:2349:b0:7c1:844d:7447 with SMTP id
 m9-20020a170906234900b007c1844d7447mr55751775eja.35.1673285115497; 
 Mon, 09 Jan 2023 09:25:15 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 20/33] hw/isa/piix3: Rename pci_piix3_props for sharing
 with PIIX4
Date: Mon,  9 Jan 2023 18:23:33 +0100
Message-Id: <20230109172347.1830-21-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-22-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e813e20639..c6659bbfda 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -381,7 +381,7 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "ide", &d->ide, TYPE_PIIX3_IDE);
 }
 
-static Property pci_piix3_props[] = {
+static Property pci_piix_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
     DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
@@ -408,7 +408,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
-    device_class_set_props(dc, pci_piix3_props);
+    device_class_set_props(dc, pci_piix_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-- 
2.39.0


