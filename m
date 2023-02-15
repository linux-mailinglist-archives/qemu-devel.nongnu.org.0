Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9926980B7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:19:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKUe-0001Rh-32; Wed, 15 Feb 2023 11:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKU0-00006F-Ny
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:13 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTx-0008Sn-Uj
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:12 -0500
Received: by mail-wr1-x434.google.com with SMTP id l2so3083963wry.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RUJxKchPku4NWeByHhp6ftHtPwKBb41iVLhcZRE2cI=;
 b=QLYWuzZQvLCjzODBlWvwXGOEfDGjL5w5+YmJxblumx2c/bFUCQBxek7p9J84VPKWeh
 4K10Y21GcwaYb1wcxIikeGffsdNLdCVOlF3pr96P7l5fEz3cutVrGDeBj5f1FJ8LaJ8+
 5m6na1lMAfpdFVHMXah0QyQ28ZKBtksXyZsD+rTE8TvVrWqw7rKxL/gJg2vOLbsTdYtd
 DAzUa6yE7JPrJLJYBy60vEdDx9Z8/V0G+exGBG1Hyol+IchPdgGaoH9Hg0qknHs9Ws5T
 jNBb0zgivNnzYJTZIb9gyLRLu/lMrggLs6//udyroveG7KwgZ4SDOPg0ienCEjji6rce
 PO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1RUJxKchPku4NWeByHhp6ftHtPwKBb41iVLhcZRE2cI=;
 b=jFmFTFOAH2V20wcUnoaROqftRNApfUqmVucS/k7qEtpBcyAyLh69RBpl5ir06Gej4T
 bMZTtqVU7pygM/OmXckarH7MmxfTQlulJNfRgdJyAREYR0uBD9THASt0R0HyPnlTenX8
 XNs/pTmLZ3Nb01nO8PzA8DVmpxkt65/QvP1wpK50F+bDKvqlf9mJJyZnLDMm71re7xB/
 vZ02AeiPb3LbbCBgNzd+VKAzPqQ2ji2B9ZMsODDTq+1znsAIoESAyl56UCdfcMMU6JHC
 k6LEdK7ouPzfaSnIkFjBVxLhNDIrR5B5OtRYdHBPV6v06NCXlhI/0qHFruA/A6VZ14u+
 rB8A==
X-Gm-Message-State: AO0yUKXQLnaexamMLXocsR8O2Hj3WF0a0qgljfWw4DVH+pw1qbHP7/qk
 Iudk0Set04xaDDoVOg1xH8kN3+IctnlelHur
X-Google-Smtp-Source: AK7set88zhhXw+690FegjzwhThE2YJFUmtvDAlV302artGb07540Co0Aepk9DU9NkEvhOqQyec0IFg==
X-Received: by 2002:adf:ee07:0:b0:2c3:f880:bb1f with SMTP id
 y7-20020adfee07000000b002c3f880bb1fmr2284540wrn.14.1676477885607; 
 Wed, 15 Feb 2023 08:18:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6d42000000b002c4061a687bsm16206609wri.31.2023.02.15.08.18.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:18:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 15/18] hw/isa: Ensure isa_register_portio_list() do not get
 NULL ISA device
Date: Wed, 15 Feb 2023 17:16:38 +0100
Message-Id: <20230215161641.32663-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Previous commit removed the single call to isa_register_portio_list()
with dev=NULL. To be sure we won't reintroduce such weird (ab)use,
assert dev is non-NULL.

We can now calls isa_address_space_io() to get the device I/O region.

Note we can then remove the NULL check in isa_init_ioport() because
it is only called in 2 places (and is static to this file):
- isa_register_ioport() which first calls isa_address_space_io(),
  itself asserting dev is not NULL.
- isa_register_portio_list() which also asserts dev is not NULL
  since the previous commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index abc1bd0771..59f98472d1 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -113,7 +113,7 @@ IsaDma *isa_bus_get_dma(ISABus *bus, int nchan)
 
 static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 {
-    if (dev && (dev->ioport_id == 0 || ioport < dev->ioport_id)) {
+    if (dev->ioport_id == 0 || ioport < dev->ioport_id) {
         dev->ioport_id = ioport;
     }
 }
@@ -129,6 +129,7 @@ int isa_register_portio_list(ISADevice *dev,
                              const MemoryRegionPortio *pio_start,
                              void *opaque, const char *name)
 {
+    assert(dev);
     assert(piolist && !piolist->owner);
 
     if (!isabus) {
@@ -141,7 +142,7 @@ int isa_register_portio_list(ISADevice *dev,
     isa_init_ioport(dev, start);
 
     portio_list_init(piolist, OBJECT(dev), pio_start, opaque, name);
-    portio_list_add(piolist, isabus->address_space_io, start);
+    portio_list_add(piolist, isa_address_space_io(dev), start);
 
     return 0;
 }
-- 
2.38.1


