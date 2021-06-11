Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE743A416C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:47:32 +0200 (CEST)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfdL-0007I4-UE
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrfc8-0005Ym-4u
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrfc6-0003QZ-5X
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623411973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3HxrRjXZtq/rDjq9L+Lr4ncdiBs2BGSu6eIpKuKzbR0=;
 b=fIPTPccOw1+r3zZoFb5Flimr5j4GKJCd9BoURbsIbn0JI7zi/wbfQN7bdevj7+KBqf/cEo
 puwO6B3LDr1mxgsG2qb6iqx358a1L/4oo2psBqaRZiKK7l4154fHKrkTdMvJKOnL5vzqIx
 DRsMIB6X9YzFol4symQJ7LowtXTknc4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-kijN4uMfPTOUy0Uf_kAYuA-1; Fri, 11 Jun 2021 07:46:10 -0400
X-MC-Unique: kijN4uMfPTOUy0Uf_kAYuA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso2510540wrh.12
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3HxrRjXZtq/rDjq9L+Lr4ncdiBs2BGSu6eIpKuKzbR0=;
 b=WP6iKO+jy6iXuvNMFyBucn0WE20E46qZP+t8XTwqVTe/GlXan3+bsa0/2OuOIe9nQ/
 sD+8KjFg4ElAOxsCpfLlA17NbmY/BWJe2KkJwycm9fQJyNCZGEaegrC4/pA8pMuiJGmG
 zHzQOKbOMaJHzICEJZzvWVe54/iJZ5dlLtZH6P5cpZIG4Wddd2H3U+0mXYin1WKGHC+h
 FveaiUnn7Ln1VYpLqY7MF2EblZ4dSGsvmeiWHQwPqM2s55zYsshue5V4GnsMd3jcc9/W
 xRk0aEX51zmTaJmIP8MUBAtLcQyGW+GT65JYNNpvRyI2nfP4iewUvmC4dCSJKGi42WeJ
 sUvg==
X-Gm-Message-State: AOAM530gnkkOV6kpEmYyYEo2Ka0xD+bh6Qsyub3yU5S7WTl8LBeKhhvz
 N5zF7wx24RBOkHvzdcxJBEsEbF97PQIl5kCzPGmzSyPO6iy6ZTH5o5QB0hUBChwyNwz/O0FYbt2
 zY/57G9Xkas1g6sWWxqKR5QlNouxdxeMUcWO0Hlb/Cpd7O68Dj7iGJuJPCuPbjOch
X-Received: by 2002:a7b:c750:: with SMTP id w16mr3542344wmk.69.1623411969049; 
 Fri, 11 Jun 2021 04:46:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMTGVSuvmbRjNEtAuF1BplmTOkmuSiBIVyENFhhaM37o1SvH4Y/ktY1B6SNCq7clOTCT0H8Q==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr3542312wmk.69.1623411968779; 
 Fri, 11 Jun 2021 04:46:08 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id k25sm15025413wmi.36.2021.06.11.04.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:46:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/nvme: Fix VFIO_MAP_DMA failed: No space left on device
Date: Fri, 11 Jun 2021 13:46:06 +0200
Message-Id: <20210611114606.320008-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the NVMe block driver was introduced (see commit bdd6a90a9e5,
January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
-ENOMEM in case of error. The driver was correctly handling the
error path to recycle its volatile IOVA mappings.

To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
DMA mappings per container", April 2019) added the -ENOSPC error to
signal the user exhausted the DMA mappings available for a container.

The block driver started to mis-behave:

  qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
  (qemu)
  (qemu) info status
  VM status: paused (io-error)
  (qemu) c
  VFIO_MAP_DMA failed: No space left on device
  qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.

Fix by handling the -ENOSPC error when DMA mappings are exhausted;
other errors (such -ENOMEM) are still handled later in the same
function.

An easy way to reproduce this bug is to restrict the DMA mapping
limit (65535 by default) when loading the VFIO IOMMU module:

  # modprobe vfio_iommu_type1 dma_entry_limit=666

Cc: qemu-stable@nongnu.org
Reported-by: Michal Prívozník <mprivozn@redhat.com>
Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Michal, is it still possible for you to test this (old bug)?

A functional test using viommu & nested VM is planned (suggested by
Stefan and Maxim).
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index 2b5421e7aa6..12f9dd5cce3 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1030,7 +1030,7 @@ try_map:
         r = qemu_vfio_dma_map(s->vfio,
                               qiov->iov[i].iov_base,
                               len, true, &iova);
-        if (r == -ENOMEM && retry) {
+        if (r == -ENOSPC && retry) {
             retry = false;
             trace_nvme_dma_flush_queue_wait(s);
             if (s->dma_map_count) {
-- 
2.31.1


