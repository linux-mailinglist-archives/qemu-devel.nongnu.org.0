Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667C6A7C92
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFr-0002ro-DE; Thu, 02 Mar 2023 03:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFe-0002K5-O8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFd-0002Df-1Z
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9lh/lr2hakq6E/VKG0k7kjdQSKbHg/RTFjaRttdp51E=;
 b=g6grDu4t14IhlTn6XcpR2QSiJH/QxGE7qdEffdR9NPl3ahhGVLtdSZzcJLd4cSM7Wra1tG
 STT55EbswQ7FPt8BE+nDnGa8MuFEBLWS5KXWPUk74obdH6nlL17Vs8eVcmjfLYOvslUI3I
 V5iuoCRirczLrRNvX0zLEnQZVsBJ5A0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-gq67WOqBNMKNj8ZvaFCHMg-1; Thu, 02 Mar 2023 03:25:19 -0500
X-MC-Unique: gq67WOqBNMKNj8ZvaFCHMg-1
Received: by mail-wr1-f72.google.com with SMTP id
 l5-20020a5d6745000000b002c91cb49949so2982798wrw.14
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lh/lr2hakq6E/VKG0k7kjdQSKbHg/RTFjaRttdp51E=;
 b=IrIcRbYrMzwW/nwMIFv/MtAbwgl5aFaaLX3R9IUDGtQ52M6Nr+EbplrKOn4mS82efl
 XcMUq9fzOR7j+HoGRVeUb7zTjXfrQa0KwbbJQBhc3pLhQRhAmwMY5uy53kZDe0V56BF+
 Aw+SvklnIIJKNl5jxtF+Hy/GLmy8bV4tkAyadZwqpwL7vlcr9We0BtmIghfznG8T5BR4
 OvO55fUTLYuwPqAkS26Qw1S5k9CNa3GmCSJMVGbCN3SBL63cUkrxH8Mt/Woh390UB9tm
 7iV4kIxC+ojs+5d2JuLf27/8NmeL50uvLMAvfEn5L3tiT6zrXm4TwXKK8OsxSj3Yg6bl
 VgwA==
X-Gm-Message-State: AO0yUKXOtG4VU2NhzR2O4fu3sP0osM8Q/1ixZyD/WRVtKJdoNq5LGS5Z
 +ik2gVp6GNF+0ERnld8IcpwattzVFjdzGN4oG8Y1gNrUPVQpBj/Iq/zILMmp2vrMRkl4hooOtX9
 0dJ2gQu3pscQ6/2eodr9Uo/ZnNKtfIGQcQeEqmeQuSkv4cO5GCJUWKE1qSkh3pcsydA==
X-Received: by 2002:adf:e543:0:b0:2c5:594f:121d with SMTP id
 z3-20020adfe543000000b002c5594f121dmr6239310wrm.12.1677745517667; 
 Thu, 02 Mar 2023 00:25:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/Aedcfn7ToxcNjLe/ujsXCJhRthqHPryFUYBNNVJ2W1G/bZVKtUWohyy+HIAI8DCfxjdkRsg==
X-Received: by 2002:adf:e543:0:b0:2c5:594f:121d with SMTP id
 z3-20020adfe543000000b002c5594f121dmr6239291wrm.12.1677745517409; 
 Thu, 02 Mar 2023 00:25:17 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5084000000b002cdbb26bb48sm3601930wrt.33.2023.03.02.00.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:16 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 14/53] virtio-rng-pci: fix transitional migration compat for
 vectors
Message-ID: <20230302082343.560446-15-mst@redhat.com>
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

In bad9c5a516 ("virtio-rng-pci: fix migration compat for vectors") I
fixed the virtio-rng-pci migration compatibility, but it was discovered
that we also need to fix the other aliases of the device for the
transitional cases.

Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20230207174944.138255-1-dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/core/machine.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f29e700ee4..1cf6822e06 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -47,6 +47,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
     { "virtio-rng-pci", "vectors", "0" },
+    { "virtio-rng-pci-transitional", "vectors", "0" },
+    { "virtio-rng-pci-non-transitional", "vectors", "0" },
 };
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
-- 
MST


