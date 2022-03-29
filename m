Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDCF4EA89D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 09:38:41 +0200 (CEST)
Received: from localhost ([::1]:54822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ6R5-0003Bd-KH
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 03:38:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZ6Of-0002TI-Td
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:36:11 -0400
Received: from [2a00:1450:4864:20::635] (port=39810
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZ6Oc-0005ZV-F0
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 03:36:07 -0400
Received: by mail-ej1-x635.google.com with SMTP id dr20so33227061ejc.6
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 00:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P1VZZmVEkgJAlc9O4cZyAfSNGrSP6YOJmNZAxENNF+E=;
 b=jp/I/JWMnPhuPsImMPJ0RA+RgXJoP4nwvx90s2ZgK8zDPVubmJsh79exQH2M0SuiV3
 cALeyiSq2WvqM8Zgm7EVB05WhxNliSJwz2xq+xM/YaZHcD4LpeXQMeN5LQRXtKN8hEpA
 d0irDI6ZFuFX9xUfnpj1ps8pDbVVWSmyPYOQxRwNzeZOgvkp2YukMd4xdy8zHR8VkEAt
 1ab1ZdRmRgHX4TBEd9QRvcLj1mZ/ooIQCaxfpj009kz0nYFeWLi/BV4gA9yW1zZ2pMPS
 o6Su9d7ARbq4kY85EMOnZAuGXaH5USDnVvDSzLV1dtRBnTvnH8eP1BI7tQrKAHLxtklV
 tyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=P1VZZmVEkgJAlc9O4cZyAfSNGrSP6YOJmNZAxENNF+E=;
 b=1cPOaTZ7nAWnST2LRaccEfr/VQL2sxe5leYB3nX5+75M5kM8Q2GXvTQTDzwk+RGnxj
 0e7xQpxCxAULZcay8ifsBohtRTkMyNZu5miG/gycJMxo1gV7zx5YwX6Kr1jKkRXgMozw
 CbTkbRytW01d04t9a5TkkAG0TIvqfBgcwVWxAUhk3Oq5s6HV/6GAfbsJf94bjeL4Tiwy
 3fHa3iM8wX6WKQ5URdYiHhLU8WtOuqZB+MDr0F1Lc4yJdycn6O5D8xr/YPRMJBt3wi8v
 RHB3j05U89DFwi3X4WQHkbDxVv2lRzoF5yz3t8iAJRy/rnS41lMQ+v3bxIfmbadngmyP
 QG9g==
X-Gm-Message-State: AOAM533uNj3a3vRdPpupS+rETPdnRTJC51hd4zHgKLMWq7HVK0UJHp6G
 eGF/hX9PPnObNBRD9FaCgv4Gl2STGk0=
X-Google-Smtp-Source: ABdhPJwmW/n/yrCgLyCs+g/S96H+Crz0ygBZkre0TGYyeIGoLbyn42bPvv7saet/757z+UEsQVhX0g==
X-Received: by 2002:a17:907:9495:b0:6da:9602:3ec6 with SMTP id
 dm21-20020a170907949500b006da96023ec6mr33005348ejc.589.1648539364698; 
 Tue, 29 Mar 2022 00:36:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 r11-20020aa7cfcb000000b0041902ac4c6asm7996246edy.1.2022.03.29.00.36.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 00:36:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0] virtio: fix --enable-vhost-user build on non-Linux
Date: Tue, 29 Mar 2022 09:36:02 +0200
Message-Id: <20220329073602.754456-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-shadow-virtqueue.c build requires include files from
linux-headers/, so it cannot be built on non-Linux systems.
Fortunately it is only needed by vhost-vdpa, so move it there.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 6047670804..67dc77e00f 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -11,9 +11,9 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
-virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
+virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
-virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-shadow-virtqueue.c', 'vhost-vdpa.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
 virtio_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VIRTIO_PCI'], if_true: files('virtio-crypto-pci.c'))
-- 
2.35.1


