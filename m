Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645823BEA6F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:10:32 +0200 (CEST)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19C2-0001GZ-I3
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195Y-0001qD-WB
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195X-0006my-5Z
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rlOjOiVbbAonidOYbIgJ5XNMANyIS28wLAUEMBTpCng=;
 b=OKD+cPbfuclzHa0Ew83pvWg9e8nyllh9HE2UfGRd3CC9QId+wy7piSqweBaklPIj/9K/OE
 4ljnQeoQPlsaC5RGV4NZtjVNnuL6VX1hdsuR6foYCtMHuYHrM1XOr6ev9+EPcgmfJ2V9vR
 1pJtTBobActxox1OwJK1r7hZkgop628=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-GRiR_d94MUm7QqLLhFNM9g-1; Wed, 07 Jul 2021 11:03:45 -0400
X-MC-Unique: GRiR_d94MUm7QqLLhFNM9g-1
Received: by mail-wm1-f72.google.com with SMTP id
 n11-20020a05600c3b8bb02901ec5ef98aa0so612810wms.0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rlOjOiVbbAonidOYbIgJ5XNMANyIS28wLAUEMBTpCng=;
 b=OjdmI9BMWcXsq5hyygD+QJ+5JdmkhFSZNI1bI5F5x/XcuP2wM++AANeFpz7ZBHTFGD
 iqALvd2DuBIKG7qSQYIl6NbsmZEN17312N19CzVHEeIxQ2VImf5/lpnK0H2mO0xGlJwC
 NuOkNnwL+gTB/9ifW0m6Uw7ECdDQeXA1yytKeqo7Vb9U716qztVcuGyHa6kB2isH03VL
 kh09MwrkY5ZNRaPzfo4FVpyXrT/iCXfILujP4NEi+6SzU2S8fEz5bHZi0ZzeMAE8tDBj
 l+gnncg542wDKfkWQ74GTj0cV3YOGB7MBV5+0AcEig1xeL9kNsduzsmslXmIY9mr8EdQ
 0ssg==
X-Gm-Message-State: AOAM530Hr6WaIV77X1VZj1o+w7X3/+BozZ7x86skYyEjrJlkIAQjfuBy
 f6S5LyfDOYYH+aPWIgklb6/OdtknBQPs3Q92VhI8n+J3rdAKKREpwaerHIrut7WF6awXQ7u+1uK
 IxOJFC2UROPRuZILqL9vxKryh8qDv9D2jz98dKsz/yuX3zGlhTY7mEjrExG27
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr26363350wmh.183.1625670224040; 
 Wed, 07 Jul 2021 08:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv/+spCHzrDfA7qH6wvY1DQaa7vvzA90m11twXLw5HhyDltLLA5VAnv1KDGzfV0V5xoTJ4ng==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr26363326wmh.183.1625670223892; 
 Wed, 07 Jul 2021 08:03:43 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id l20sm19537178wmq.3.2021.07.07.08.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:43 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] docs: add slot when adding new PCIe root port
Message-ID: <20210707150157.52328-13-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vincent Bernat <vincent@bernat.ch>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vincent Bernat <vincent@bernat.ch>

Without providing a specific slot, QEMU won't be able to create the
second additional PCIe root port with the following error:

    $ qemu-system-x86_64 [...] -machine q35 \
    >    -device pcie-root-port,bus=pcie.0,id=rp1 \
    >    -device pcie-root-port,bus=pcie.0,id=rp2
    qemu-system-x86_64: -device pcie-root-port,bus=pcie.0,id=rp2:
    Can't add chassis slot, error -16

This is due to the fact they both try to use slot 0. Update the
documentation to specify a slot for each new PCIe root port.

Signed-off-by: Vincent Bernat <vincent@bernat.ch>
Message-Id: <20210614114357.1146725-1-vincent@bernat.ch>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/pcie_pci_bridge.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/pcie_pci_bridge.txt b/docs/pcie_pci_bridge.txt
index ab35ebf3ca..1aa08fc5f0 100644
--- a/docs/pcie_pci_bridge.txt
+++ b/docs/pcie_pci_bridge.txt
@@ -70,9 +70,9 @@ A detailed command line would be:
 
 [qemu-bin + storage options] \
 -m 2G \
--device pcie-root-port,bus=pcie.0,id=rp1 \
--device pcie-root-port,bus=pcie.0,id=rp2 \
--device pcie-root-port,bus=pcie.0,id=rp3,bus-reserve=1 \
+-device pcie-root-port,bus=pcie.0,id=rp1,slot=1 \
+-device pcie-root-port,bus=pcie.0,id=rp2,slot=2 \
+-device pcie-root-port,bus=pcie.0,id=rp3,slot=3,bus-reserve=1 \
 -device pcie-pci-bridge,id=br1,bus=rp1 \
 -device pcie-pci-bridge,id=br2,bus=rp2 \
 -device e1000,bus=br1,addr=8
-- 
MST


