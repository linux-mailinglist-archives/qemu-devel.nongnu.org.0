Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD47D3F8F7C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 22:09:04 +0200 (CEST)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLgN-0000Bz-MY
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 16:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLex-0005sh-CK
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 16:07:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLet-0005dM-Mr
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 16:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630008449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFdJgmZSFDi0T3tz5j4VdZ4mFoLbPu805prh7+ofjFQ=;
 b=Rmb6K2BGPnhajjnEW1/GQPBsSBshhPMvB55eyMqTkyw2P9tmMPbUghl4YMZYfwT32eCvDs
 h+UpLWoffYhU77CbD/NMzV/mZuP+7/ZOsEai3VuI/OvLHXcMj5Vzg3ZhcKvrJPEyep+03p
 YrXGKlCGvg39DAJf2MblvwpQo69F+cE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-kch9r3bBPu6b5wEqBhDVFw-1; Thu, 26 Aug 2021 16:07:28 -0400
X-MC-Unique: kch9r3bBPu6b5wEqBhDVFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so4800725wmd.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 13:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFdJgmZSFDi0T3tz5j4VdZ4mFoLbPu805prh7+ofjFQ=;
 b=pdcYX4GClK2dej4h0o0SiC7EDIawi38eV+4F1uu3uWxcT/mbg12Topua0qK1LQLTQ4
 6C3ClT0AHiVA5piF3T4+q1u6mPB6i3IAsKMiaR+/WyVXkANYMouzNKsHjPMzphI7Plr2
 Y9XnCenL12vUf5rjgQgFy86Lkq5QTEzOkU28Y38hsE6cHmYIE6SK3kB8Tl+GHPzgMbVc
 pLmngWZdmsJoQhhJTKukWaKQEx4ysQXh16V/14eywgBOkRd7S2t/dSH+k7bN0IsOkbRF
 srfl1ReEtr0E3c5ril9wut4bQBHxmXBVa3eMxSL2GIkjqM3l+B0rpbUol25BAdvelkn+
 RJYQ==
X-Gm-Message-State: AOAM533Fvut+u/PQVM5ilR79PEFpWEF8DniGz4JCamdywgTvKuOtwOzM
 PsohLFdptw34KaTU9OK/Py/eAQch0jUkRek/Rl8LdVAUdy/M5nwsws35/uU8/a6Fe7CQgpiaZCd
 BTsIR9njHFcKuBdIuYcEegRLVxA3mvAvsVkWvYaK8fs6xHd0V8R0gEsI5Nl79Bj1g
X-Received: by 2002:a5d:4568:: with SMTP id a8mr6402661wrc.200.1630008447158; 
 Thu, 26 Aug 2021 13:07:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXM+8NhwWeRegRd1V7F+CEHGpzg5FArWoj0MLdwiQWtLa7KFb1eNKTHJ8Gtl/e3VLSkMXnxw==
X-Received: by 2002:a5d:4568:: with SMTP id a8mr6402629wrc.200.1630008446951; 
 Thu, 26 Aug 2021 13:07:26 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 u26sm2085844wrd.32.2021.08.26.13.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 13:07:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] hw/pci: Introduce pci_dma_memory_region() helper
Date: Thu, 26 Aug 2021 22:07:18 +0200
Message-Id: <20210826200720.2196827-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826200720.2196827-1-philmd@redhat.com>
References: <20210826200720.2196827-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pci_get_address_space() returns an AddressSpace. In some
cases we want a MemoryRegion. Add the pci_dma_memory_region()
equivalent helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d0f4266e372..5860f42e400 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -786,6 +786,11 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
     return &dev->bus_master_as;
 }
 
+static inline MemoryRegion *pci_dma_memory_region(PCIDevice *dev)
+{
+    return &dev->bus_master_container_region;
+}
+
 /**
  * pci_dma_rw: Read from or write to an address space from PCI device.
  *
-- 
2.31.1


