Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EF7280548
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 19:32:37 +0200 (CEST)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO2RY-0002pY-On
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 13:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO2Kh-00041Q-V2
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO2Kg-00049R-1Z
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601573129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDqdtq58pQ4zoZVkr3FaloUPfNhxdNZfP/qYUQHcHb8=;
 b=T8G8tqPcDDvRNi4W0HDyWSBU0ZO7SjpJaGWV9K9X07VqXxodR3melcpyKJPWEHWVSQEu8B
 o1Vc/jqknmYywFiffuvLFRvwb3v5K0Y4pSjfjqf8uSyKOPczmswvUxs9Hlay+OenXQE8yy
 3DJdMmrkeHXoKtCKYztiCj17Ct6nlhQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-rcH12yCSOJGFfdCnvLjGIg-1; Thu, 01 Oct 2020 13:25:28 -0400
X-MC-Unique: rcH12yCSOJGFfdCnvLjGIg-1
Received: by mail-wr1-f69.google.com with SMTP id f18so2320117wrv.19
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 10:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDqdtq58pQ4zoZVkr3FaloUPfNhxdNZfP/qYUQHcHb8=;
 b=EFy6QLNTo45m0oGLzT2InbYS1wGzx0kwHPSfulozT9Lac5MBrD8qgpPD67JTlyg3Gr
 nnfSiVg1v4rGpylwR3EIF6XJcB/CPKO51PFi/3gCzawF/5B6cT0FQUPPkbVagbL926vu
 /0mSd0PBj/gPkHFR4Fi6VrHw7ZTJLObH3SZ/jtpx42M9ZHypJZWn5zqd3RLeqdVwGhLk
 XZIecwRlFmEv3sjxzC6etI+t/F+D/oLOK2kZMkVyr0jlaQywD/YlCjPiMcA/vazyrjaj
 1SxWr9dQ/nJPgWTuFNbkgcc1WT/wbx0erWcrb51rUEVBMKe6ZPsftcce8oxX/pB/dd+8
 4f0Q==
X-Gm-Message-State: AOAM531msXEHEJ9HWvGxURvs1s5qhTYSwbUXPjWV/ZaWGf3e5zU2SMVG
 ztY773/BRW0o4yFwhcA1VJ29ZfWhOQAq3EQUBBR7Yzh2NyelZIulEorNBqVDipRHPxwPgRt4I/O
 vYG60S24tMEEHs+g=
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr11075389wrw.198.1601573126646; 
 Thu, 01 Oct 2020 10:25:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySZMM33BbdJ0sR0nGXiOX6FWsXB2b32Yq56EZPV+x7b/7t27gSDw9A3CcKwp1NY4quCUxtNQ==
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr11075373wrw.198.1601573126441; 
 Thu, 01 Oct 2020 10:25:26 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id c4sm911793wme.27.2020.10.01.10.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 10:25:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v2 01/16] pci: pass along the return value of
 dma_memory_rw
Date: Thu,  1 Oct 2020 19:25:04 +0200
Message-Id: <20201001172519.1620782-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001172519.1620782-1-philmd@redhat.com>
References: <20201001172519.1620782-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Some might actually care about the return value of dma_memory_rw. So
let us pass it along instead of ignoring it.

There are no existing users of the return value, so this patch should be
safe.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Message-Id: <20191011070141.188713-2-its@irrelevant.dk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 0a59a06b14..f19ffe6b4f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -783,8 +783,7 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
 static inline int pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                              void *buf, dma_addr_t len, DMADirection dir)
 {
-    dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
-    return 0;
+    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len, dir);
 }
 
 static inline int pci_dma_read(PCIDevice *dev, dma_addr_t addr,
-- 
2.26.2


