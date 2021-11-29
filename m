Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C1461750
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:00:39 +0100 (CET)
Received: from localhost ([::1]:44070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhCw-0001cw-Da
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:00:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh4N-0003oS-6H
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh4F-00036n-Dn
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bxt+L8k1GZjsKtb7c8tzi14JSMlMCVQgRMRp4CiqFKo=;
 b=UP9gEC9QHJknW+cBBqReiA+4ypj5IEiCyhwFCpnqK8VuJeJYCa2/EhbzaQPHdtJlsoM2lA
 5hqseIIpjzOc+UUK+7OFGB5hcPmWUkO/UnRsHR2if7VYOHR96nZfDJfwBJn2dbyoqJE27i
 PsrBXf4w4Sft+LRVJyuEK2YqZI9en5g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-79Ut3w_kPASTPoXriqsD9w-1; Mon, 29 Nov 2021 08:51:36 -0500
X-MC-Unique: 79Ut3w_kPASTPoXriqsD9w-1
Received: by mail-ed1-f70.google.com with SMTP id
 eg20-20020a056402289400b003eb56fcf6easo13702896edb.20
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bxt+L8k1GZjsKtb7c8tzi14JSMlMCVQgRMRp4CiqFKo=;
 b=buBXgFdZ2P4azrpAtElZwjykreqlkwpEH08HLkF1j4GYZh1/fIccvYGsHkeQDp7X7W
 KYc8eI67eLIB9APBIfA4SDe9gWBfWxJpSqF+G8ps05Z5Vkd/XEMyYP4DOu3sJxUgst9r
 GWNqRIAr3sQqto41kGnf7/ZtkK5fAuPzKXoomE77YiMjjzj7meC2oY0auS8xtli89GC5
 b1OQ1f0r4eqnWHaQjeOFU1IaQaQu3kGR+Qyt3QSmsr8JqmmJgMyiwy6Q0hGimhcnwegQ
 usa+7ZG0yZTyIQyG24sOeaDGLww8VFW+X0kF70dAJ7IjxPDnh2vW3tn650iRcsPz9CFP
 GYhQ==
X-Gm-Message-State: AOAM533ymPq84v9MLwMSv65NwjgCzBkSZ2YaCTZ0vrCs+fe18SIPPZsE
 yzcRZrfezeYcF6U+iyN498q+QQl9W9Pj7YVbRxgRH+9TZEjjrhJcbe9xI8NgKOvSo+z12HEFRzE
 jVRARUS0VMCAR1zdFVm5LWLd3EaD6LyTaua/Pt2wV3DZysShkLDys+jhoiIik
X-Received: by 2002:aa7:ca46:: with SMTP id j6mr31327335edt.234.1638193895318; 
 Mon, 29 Nov 2021 05:51:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdU7ye2ncZAocRyq4VF3avfUtGtkN9CAGlPFLRTNajwzKT6Zom4wsbykJfPBcSL8OULs5MCg==
X-Received: by 2002:aa7:ca46:: with SMTP id j6mr31327308edt.234.1638193895123; 
 Mon, 29 Nov 2021 05:51:35 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id w18sm9189169edx.55.2021.11.29.05.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:51:34 -0800 (PST)
Date: Mon, 29 Nov 2021 08:51:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] Fix bad overflow check in hw/pci/pcie.c
Message-ID: <20211129135053.560225-8-mst@redhat.com>
References: <20211129135053.560225-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211129135053.560225-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniella Lee <daniellalee111@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniella Lee <daniellalee111@gmail.com>

Orginal qemu commit hash:14d02cfbe4adaeebe7cb833a8cc71191352cf03b

In function pcie_add_capability, an assert contains the
"offset < offset + size" expression.
Both variable offset and variable size are uint16_t,
the comparison is always true due to type promotion.
The next expression may be the same.

It might be like this:
Thread 1 "qemu-system-x86" hit Breakpoint 1, pcie_add_capability (
    dev=0x555557ce5f10, cap_id=1, cap_ver=2 '\002', offset=256, size=72)
    at ../hw/pci/pcie.c:930
930	{
(gdb) n
931	    assert(offset >= PCI_CONFIG_SPACE_SIZE);
(gdb) n
932	    assert(offset < offset + size);
(gdb) p offset
$1 = 256
(gdb) p offset < offset + size
$2 = 1
(gdb) set offset=65533
(gdb) p offset < offset + size
$3 = 1
(gdb) p offset < (uint16_t)(offset + size)
$4 = 0

Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
Message-Id: <20211126061324.47331-1-daniellalee111@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index c5ed266337..d7d73a31e4 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -929,8 +929,8 @@ void pcie_add_capability(PCIDevice *dev,
                          uint16_t offset, uint16_t size)
 {
     assert(offset >= PCI_CONFIG_SPACE_SIZE);
-    assert(offset < offset + size);
-    assert(offset + size <= PCIE_CONFIG_SPACE_SIZE);
+    assert(offset < (uint16_t)(offset + size));
+    assert((uint16_t)(offset + size) <= PCIE_CONFIG_SPACE_SIZE);
     assert(size >= 8);
     assert(pci_is_express(dev));
 
-- 
MST


