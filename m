Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B98351BFF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:21:58 +0200 (CEST)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1x7-0006ol-JP
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1f9-0003WC-SP
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1f6-000643-SP
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=16gIw2Sth3p3xmGxKGQ0PWspsKIzRyKL0QxExkz02Q8=;
 b=hu5Wy7jRQcq5wCnVqXMyQCckdcM+6Vp08DliunlSwViZxSQPABC7hNMzCOcMORizi4BIKE
 aIS9bKYxCiY++OWtryk9S9aAAZpOTPBJOvui7/t/57eGgLzi50UmQU/HZ9yTuKevjFZ7Iw
 Ul8qpXq/Gk5pW9oZ13cPR9WX9r3WZY4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-rXmqYfs6OCy_KCb-d8HATg-1; Thu, 01 Apr 2021 14:03:17 -0400
X-MC-Unique: rXmqYfs6OCy_KCb-d8HATg-1
Received: by mail-wr1-f70.google.com with SMTP id z17so3116503wrv.23
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=16gIw2Sth3p3xmGxKGQ0PWspsKIzRyKL0QxExkz02Q8=;
 b=bmSDKYc/8BiljSTH4Od/7yEmOj/EMf9S8Fn+nKPw18mAQTQPw4vgwj3XGL8A+bp/Hq
 CRALvB2xyZWOAGt8fM+VV7/YiE6tplgEX4cV83lkyEuB4yT96jB0YqiLVD9mRd2659R9
 BzQbq9QZH/hoLJvgP0Q2liRCBIH2/7aoTohA4MRwByfMEr28f2fhePBYZgrqETtNZbfC
 UHL0087l6+sXyB4Vook4jE709ef2rc8gwsYvqpygAyYvy4N+6PU6xNmBIOo+AFCQxBkW
 0JezB20MlmWJns7fukaNOZjVpeYNX2+T/c8Vr4hW1isvdIVHk5T2C3tc2zfa/0GI2V1W
 VNwg==
X-Gm-Message-State: AOAM530CKw3JAiCkMuC97CE594k53NlnyqGs3yhK5zAiO99LgNA4kKO8
 ooFR6QReJ/OqlnhdrVb1MXVKIYoDM6fdEkfapQvk9q6DjZUFj+q2Lt1XBNBJzOmZkAsl946Cf9C
 Mis+2ybZRn/U/ZgqPeEK9lnmAqFLwL+QR2u1cVSgym6WHYQQ/O1oD4kKSTqts
X-Received: by 2002:adf:f351:: with SMTP id e17mr10991353wrp.416.1617300195459; 
 Thu, 01 Apr 2021 11:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbHLR5i0vzyV0X0RcBPYrV7PbiSg0PNOv90hUw/Xu3WBMQ4yOy2jJvCEHRg3P6gUOXIcSNRA==
X-Received: by 2002:adf:f351:: with SMTP id e17mr10991339wrp.416.1617300195313; 
 Thu, 01 Apr 2021 11:03:15 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id z2sm14070735wrm.0.2021.04.01.11.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:03:14 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:03:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] pci: sprinkle assert in PCI pin number
Message-ID: <20210401180235.226321-10-mst@redhat.com>
References: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

If a device model
(a) doesn't set the value to a correct interrupt number and then
(b) triggers an interrupt for itself,
it's device model bug. Add assert on interrupt pin number to catch
this kind of bug more obviously.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <9cf8ac3b17e162daac0971d7be32deb6a33ae6ec.1616532563.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index ac9a24889c..8f35e13a0c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1450,6 +1450,8 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
     PCIDevice *pci_dev = opaque;
     int change;
 
+    assert(0 <= irq_num && irq_num < PCI_NUM_PINS);
+    assert(level == 0 || level == 1);
     change = level - pci_irq_state(pci_dev, irq_num);
     if (!change)
         return;
@@ -1469,6 +1471,7 @@ static inline int pci_intx(PCIDevice *pci_dev)
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
 {
     int intx = pci_intx(pci_dev);
+    assert(0 <= intx && intx < PCI_NUM_PINS);
 
     return qemu_allocate_irq(pci_irq_handler, pci_dev, intx);
 }
-- 
MST


