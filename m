Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791EA6A7C8E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:27:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGU-0004yg-7J; Thu, 02 Mar 2023 03:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGN-0004bK-4j
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGL-0002Px-H7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h2bR1E9x5nXhHVI2VgaSSLZQ00ud7nc8Dt6XI/qDYmY=;
 b=CYd9wBAVDBoQJAFsvaLXV5ss3iuRhJAK34e5tANcKl06/lQadsceUdxEHGTJKnqocHPbJb
 3CLU5IYqxtLsaHjSE72YwngHaD9Irvq3CD/PSNkhyiTU+a74ZYRcDEN2XQYNCkD2W8dPO6
 etwm4/owcr6VK9ADd1hBZxbv+CXO1IQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-HJ-w1EcXNJaTZoSEoBUqsw-1; Thu, 02 Mar 2023 03:26:03 -0500
X-MC-Unique: HJ-w1EcXNJaTZoSEoBUqsw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso920834wms.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745562;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2bR1E9x5nXhHVI2VgaSSLZQ00ud7nc8Dt6XI/qDYmY=;
 b=HhdMEB/iJWeSZlKDfyQm8lssayhO1i0n/jmqBjAbyC+kB49NrcbnLwBg9XUox8EGtA
 xYMhS49y2wBXNkiY4DtCQbfzTalaDUssEkrNA03Mjf8TGVfMsk0RoHabSVkXafqNi08m
 t+hr0Fr9iPxz+T6nznvmPBQhBWmDTT/+Oi8qEUBRqJxeUedBLawarfDQbhjNZ7NM9by9
 xE56HR3v5rZwjJh1y+RrLArC9v229u0EBf+5jB2QqAbQz6qgxH0W2RBcVfG1IUKKGPdk
 kiSk7UG5njJ/ptK4PQFZlmyzuBd++SlfJlNlVG4Lnravvl7qCnKLad5ZbpDpSn6AHSzL
 d+jA==
X-Gm-Message-State: AO0yUKUhgw7ZQf52aiSs4ObVwHi2tJKFDcz2lQ9gYypfjofIX+xdm5IR
 uX9It8esPKJaxO6qCc/325TckqQcQZhPKdj3S9NBqvaPGgVUSAVDpfkOcrLmWCdIEPqa4E1144l
 uxh3iYYYdUHD/+QbXIxECR2j6DsRWRQMI8vgKdPbZhaq3s4eRxfkU6cKp8g6ASNAhrw==
X-Received: by 2002:a05:600c:4450:b0:3dc:16d2:ae5e with SMTP id
 v16-20020a05600c445000b003dc16d2ae5emr7194868wmn.32.1677745562022; 
 Thu, 02 Mar 2023 00:26:02 -0800 (PST)
X-Google-Smtp-Source: AK7set867L6gQV+lq+ECJNvoGTId2PsKcLD2opiwPutaGqJdHDOEOV5BV1V8ILTkglpj29xQLLMt+A==
X-Received: by 2002:a05:600c:4450:b0:3dc:16d2:ae5e with SMTP id
 v16-20020a05600c445000b003dc16d2ae5emr7194848wmn.32.1677745561696; 
 Thu, 02 Mar 2023 00:26:01 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 hn6-20020a05600ca38600b003e22508a343sm2120388wmb.12.2023.03.02.00.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:01 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 29/53] pcie: pcie_cap_slot_enable_power() use correct helper
Message-ID: <20230302082343.560446-30-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

*_by_mask() helpers shouldn't be used here (and that's the only one).
*_by_mask() helpers do shift their value argument, but in pcie.c code
we use values that are already shifted appropriately.
Happily, PCI_EXP_SLTCTL_PWR_ON is zero, so shift doesn't matter. But if
we apply same helper for PCI_EXP_SLTCTL_PWR_OFF constant it will do
wrong thing.

So, let's use instead pci_word_test_and_clear_mask() which is already
used in the file to clear PCI_EXP_SLTCTL_PWR_OFF bit in
pcie_cap_slot_init() and pcie_cap_slot_reset().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-11-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index ccdb2377e1..db8360226f 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -373,8 +373,8 @@ void pcie_cap_slot_enable_power(PCIDevice *dev)
     uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
 
     if (sltcap & PCI_EXP_SLTCAP_PCP) {
-        pci_set_word_by_mask(exp_cap + PCI_EXP_SLTCTL,
-                             PCI_EXP_SLTCTL_PCC, PCI_EXP_SLTCTL_PWR_ON);
+        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTCTL,
+                                     PCI_EXP_SLTCTL_PCC);
     }
 }
 
-- 
MST


