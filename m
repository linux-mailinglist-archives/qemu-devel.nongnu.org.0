Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F87134438
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 14:46:08 +0100 (CET)
Received: from localhost ([::1]:44130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipBex-00083D-DG
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 08:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47393)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <afscoelho@gmail.com>) id 1ipAu6-0005iM-NH
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:57:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <afscoelho@gmail.com>) id 1ipAu5-0006u4-LR
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:57:42 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:45167)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <afscoelho@gmail.com>) id 1ipAu5-0006sH-HY
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:57:41 -0500
Received: by mail-qt1-x841.google.com with SMTP id w30so1466077qtd.12
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 04:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BJ2O4PQRw1ys8DhPlVU2A3mHoRVTkwiCzLu+4EEMMFE=;
 b=RJo/CU7KPmVK+yVU3Isg+LDmVAPnLwoua90zVWOWLiyTBLzMEO6i7GlnFKVKLDSwQB
 6gGib2whmemSzZXmGIf2lAPKhKRWxls4VMf/E/CNSBnecgMtQt/Z3Hnzow3Llieek3Rn
 W1m+Jip+25Ne564NXnUV7ff+XQA7zNcDOUDMl1pJrwohrntmtH3hzpe3BiFzAXx5slPY
 XpLq2HTYbdudsSCkI+H2VwxmiKvt3W3WoX3MNjn1lsIgNtdQP73herNXqRK+Xl2n+NMZ
 hwM29A4m5z2BXcp/kJN9AC8KSwPSKmNA9hufJkcFGU1brqRvSZsP+JWxrJE1CdcRKgxf
 Lt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BJ2O4PQRw1ys8DhPlVU2A3mHoRVTkwiCzLu+4EEMMFE=;
 b=aV0kC4FXyfKoSze5sthgPUjqWk5/mIRWj2uZBjDfMpqp+ErJEi9JiV+S6s4rgej3u6
 cqSvrw/h2EnBvaebAwCx/B8bhGO5mhraN05yYhOHxoI2b4gGyI96kEcmadMisZodiOaF
 SuP7MFfxMYn4PoBNVH+BLwuRonWFo7BrdHPmVSD5SP0nLqxjkEnM3LxpCcIKVKx60FHy
 Se2yx91t+QvgZg/2pX54p75aA8McbkUR/FvYjIT1UGtdbnDbzMbBPZpBsMNrEGbNi1GU
 KkG4Np6MH5DSX1QTng+RtnwvTQOn0KLrIeWBTGHsQS4iyDRP5pQO/Khw5HgCieFHfDRD
 4Z4w==
X-Gm-Message-State: APjAAAXkLd5p8sm1Nck38bf3YFp9zAHvO6Z7HOqb3WVIqgq20BkCnmHL
 Czwqvay723qTQYyn9SZm1hfeDgqP
X-Google-Smtp-Source: APXvYqxI8mL2kPmjK2pEVhEL/dy8DqjI6OaSSQflavwt0BY2JUXlgBNy2kIYm/FyVKzp4LyWBBitMQ==
X-Received: by 2002:ac8:f77:: with SMTP id l52mr3337782qtk.310.1578488260302; 
 Wed, 08 Jan 2020 04:57:40 -0800 (PST)
Received: from frodo.corp.eldorado.org.br ([200.168.210.66])
 by smtp.gmail.com with ESMTPSA id z6sm1283615qkz.101.2020.01.08.04.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 04:57:39 -0800 (PST)
From: Andre Silva <afscoelho@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio: Prevent double swap due to target pre 1.0 VirtIO
Date: Wed,  8 Jan 2020 09:56:57 -0300
Message-Id: <20200108125658.208480-1-afscoelho@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:43:53 -0500
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the bswap function calls after reading and before writing
memory bytes in virtio_pci_config_read and virtio_pci_config_write
because they are reverting back an already swapped bytes.

Consider the table below in the context of virtio_pci_config_read
function.

Host   Target  virtio-config-read[wl]
               swap?                   virtio-is-big-endian?   extra bswap?   Should be   Final result   Final result ok?
----- ------- ------------------------ ----------------------- -------------- ----------- -------------- ------------------
LE     BE      s(x)                    true                    s(s(x))        s(x)        x              No
LE     LE      x                       false                   -              x           x              Yes
BE     LE      s(x)                    false                   -              s(x)        s(x)           Yes
BE     BE      x                       true                    s(x)           x           s(x)           No

In table above, when target is big endian and VirtIO is pre 1.0,
function virtio_is_big_endian would return true and the extra
swap would be executed, reverting the previous swap made by
virtio_config_read[wl].

The 's(x)' means that a swap function was applied at
address x. 'LE' is little endian and 'BE' is big endian. The
'Final result' column is the returned value from
virtio_pci_config_read, considering a target Virtio pre 1.0.
'x' means that target's value was not swapped in Qemu, 's(x)' means
that Qemu will use a swapped value.

If we remove the extra swap made in virtio_pci_config_read we will
have the correct result in any host/target combination, both for
VirtIO pre 1.0 or later versions.

The same reasoning applies to virtio_pci_config_write.

Signed-off-by: Andre Silva <afscoelho@gmail.com>
---
 hw/virtio/virtio-pci.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c6b47a9c73..4ba9e847f3 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -431,15 +431,9 @@ static uint64_t virtio_pci_config_read(void *opaque, hwaddr addr,
         break;
     case 2:
         val = virtio_config_readw(vdev, addr);
-        if (virtio_is_big_endian(vdev)) {
-            val = bswap16(val);
-        }
         break;
     case 4:
         val = virtio_config_readl(vdev, addr);
-        if (virtio_is_big_endian(vdev)) {
-            val = bswap32(val);
-        }
         break;
     }
     return val;
@@ -465,15 +459,9 @@ static void virtio_pci_config_write(void *opaque, hwaddr addr,
         virtio_config_writeb(vdev, addr, val);
         break;
     case 2:
-        if (virtio_is_big_endian(vdev)) {
-            val = bswap16(val);
-        }
         virtio_config_writew(vdev, addr, val);
         break;
     case 4:
-        if (virtio_is_big_endian(vdev)) {
-            val = bswap32(val);
-        }
         virtio_config_writel(vdev, addr, val);
         break;
     }
-- 
2.24.1


