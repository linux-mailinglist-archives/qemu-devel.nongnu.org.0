Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C937B6A7CDA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGb-0005JT-O1; Thu, 02 Mar 2023 03:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGT-00054n-IQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGQ-0002Qn-Uh
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BZdFF76ZcDhntkg5fV7Et8wjmIeg/gJw+wUQyOqPpkg=;
 b=A1L9bTKHve7JHkq+/NHK3JHmvW4mWonvD0VyPjoDyCBp7lWGuhcZ2jo4qr/fjAzh5qFJM7
 jjlECK5m3/sz4cFtOFJjImoo5AFWa1IspXOntHiaboztNVPoFs2DcHtap74JWXHzWYm22u
 3ZCPC/ZKsvgZ3sYPmFnkdWkPeQY4BPI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-B4sr-IbgOz2q006tF0UQ4w-1; Thu, 02 Mar 2023 03:26:09 -0500
X-MC-Unique: B4sr-IbgOz2q006tF0UQ4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so923811wmj.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZdFF76ZcDhntkg5fV7Et8wjmIeg/gJw+wUQyOqPpkg=;
 b=Ji88waOA6R+T81XzKtc8/V5womeOpZ2Tiz834OU/lDolFpn9QS4yWBPcMZZJCIVo0T
 K7KRsy/cxjxpYh7L/pCaAr3Z8fASTD1H9k4Hw7Qy7wKw0YRNG5l1G5u7glhwJ4mnjifs
 1vaN7a0MnvDoxRORd7i5AIixNCblx6aQsveYzgHdopl+7vr7Qs4+P9oKIPWYS76dvDXq
 H9+okz7rTN5aX22T17FzXX4wPAKQxSgFUOQMP5b1P9E7uzk3Gl2Gd3j5R5dLmSgIFFOR
 +E+B/hYrZ/ehc/mCgGHo4CT+5YMQbQnxZ7FO3Q6l5bPoCE7K1A5RqD5rt1GxvZq66+9u
 Ny0g==
X-Gm-Message-State: AO0yUKXFXrhI0qibh8VPn13oT9ZUqBovekuM3ZHTLj6Gb1BnNK/lKixd
 TR+aerbQ6OExjY5t9GfyKURL23n9mAqHDVLtSlKHKfprERYDlUOX4XwFOs0diveUsEaGQVPtzon
 5yaR1e0Sfu2nlrhSdh4vf8rnl2lnSDql5fXvWKFQ1u/Ex1EX+PHezH1lExg+05afGMg==
X-Received: by 2002:a05:600c:4450:b0:3eb:3c76:c23c with SMTP id
 v16-20020a05600c445000b003eb3c76c23cmr6824604wmn.3.1677745567563; 
 Thu, 02 Mar 2023 00:26:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+FgHtEbsjXN5dnLTYmIdY2IJfj0C42Rmvygx/oom9GJG/OoAI1bgh8wsJNzwwGIGRSkg2GYQ==
X-Received: by 2002:a05:600c:4450:b0:3eb:3c76:c23c with SMTP id
 v16-20020a05600c445000b003eb3c76c23cmr6824580wmn.3.1677745567176; 
 Thu, 02 Mar 2023 00:26:07 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4804000000b002c59c6abc10sm14447805wrq.115.2023.03.02.00.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:06 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 31/53] pcie: set power indicator to off on reset by default
Message-ID: <20230302082343.560446-32-mst@redhat.com>
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

It should be zero, the only valid values are ON, OFF and BLINK.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-13-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 90faf0710a..b8c24cf45f 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -684,6 +684,7 @@ void pcie_cap_slot_reset(PCIDevice *dev)
                                  PCI_EXP_SLTCTL_PDCE |
                                  PCI_EXP_SLTCTL_ABPE);
     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL,
+                               PCI_EXP_SLTCTL_PWR_IND_OFF |
                                PCI_EXP_SLTCTL_ATTN_IND_OFF);
 
     if (dev->cap_present & QEMU_PCIE_SLTCAP_PCP) {
-- 
MST


