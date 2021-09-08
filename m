Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7954041C3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:27:39 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6yg-0004oG-4Y
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sZ-0008RO-MZ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sY-0003AB-2Z
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkBFAMCpq6n9y+VH8JjTuNHo5ej2dLMGMd9K3LlaeP8=;
 b=MbajT/kNKsg4SXBKvHTR6tDLMIIK9gQUeckCC931eQZSpF/3DAT0PItZYHI/N0H3/BXSkH
 mgVNMFrCiSG+J/8pX7Eo5vNPU5izZBGZXmdUjY39Rzc5qYqdr1iwlNITyuZWSRp48lgDbc
 BYG9oZIHlsPUzJa+vTOzD1n6xajIZpI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-MSOfV3SwOfmiIKhNA_qD8g-1; Wed, 08 Sep 2021 19:21:16 -0400
X-MC-Unique: MSOfV3SwOfmiIKhNA_qD8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso59726wmx.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZkBFAMCpq6n9y+VH8JjTuNHo5ej2dLMGMd9K3LlaeP8=;
 b=gZQszYS8N6QRi9hlTOHYtCaK+ZSJccQVgRu2iyEgnryJTWc2tesBhb0fGjQAq+B9vp
 nm4wSIfw/ncHg7+1luDlZ1UI1IjAxggqpaYXIaICHDiB6TCbkUl2ekrq560beq7dsWtY
 gqc5nO9EFwHpvfjv2WMnywDRJ4W2+mdxYCQpYh3XxAgnJZ7L3SYrCtj4x+WrmU29xnhd
 M8z1meeMRAbF+/aX9fKRBYDosxoqYpE5GBvOlYPX4pS4cagv6a7eT1z5xn6nhm72/Odr
 O8hlHESqX1tfvAW3YYqQUD7jHAg+c4hVZEnFvdj8/CBQLn6cmpQHW4+3zVM4cjE/xPAO
 40rw==
X-Gm-Message-State: AOAM533Upj9UrsWPz74sa+GtMG7tL4XZrJwL/HhG+gGu6kBe/oJ6B6O9
 MA5fR1hTxoKjtEa4+yV/sN6Hhd+gkENmREnR/RxannCrzYX3E2uimt7aw+vHdBBvT3/nDKnbVVY
 JRfREvVXn+yZPRJMlrOiVBNOdcS46RDtEWGqoWBYhNT3Uv48MZ1wOhQ5pQ4JVJbR4
X-Received: by 2002:a7b:c4cd:: with SMTP id g13mr5796256wmk.91.1631143275375; 
 Wed, 08 Sep 2021 16:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybmoGBTuN4rPAmVNoHLJ613PnCRxyUI7oFmyfrpx3hP5AYKM4updonQnfJItVUJwu02OE/7Q==
X-Received: by 2002:a7b:c4cd:: with SMTP id g13mr5796223wmk.91.1631143275096; 
 Wed, 08 Sep 2021 16:21:15 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t64sm344074wma.48.2021.09.08.16.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:21:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/10] hw/sd: Mark sdhci-pci device as unsafe
Date: Thu,  9 Sep 2021 01:20:24 +0200
Message-Id: <20210908232024.2399215-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/sd/sdhci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index c737c8b930e..7a36f88fd87 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -64,6 +64,7 @@ static void sdhci_pci_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_REDHAT_SDHCI;
     k->class_id = PCI_CLASS_SYSTEM_SDHCI;
     device_class_set_props(dc, sdhci_pci_properties);
+    dc->taints_security_policy = true;
 
     sdhci_common_class_init(klass, data);
 }
-- 
2.31.1


