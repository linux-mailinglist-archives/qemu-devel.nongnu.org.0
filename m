Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB60C55BEC5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:34:11 +0200 (CEST)
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64na-0008Ie-Q9
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633k-0007fN-In
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633h-0006p5-1i
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rsJM2XN1k5xLdA4WoRw6Yh/T9zUNL7IrEHO/2qKbDbs=;
 b=YRn2wZN9SStIVGJ6iuEssRpUltERM0W8apWdI5YWHYBzWIFf1DDMmdUdIbYHz5uFVMflkV
 QHO8I3h4EljWQuI2F+bfkAZMYYXXwKgdGst+PKh1tNVunhr4hpZ6cb1X3PAzFoGyuW8F2c
 Hm0pXXr8sfisrT9+1Wzw/VOG8QhJdQE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-ED25ewKCM7GCinrWMNmHpA-1; Tue, 28 Jun 2022 00:42:35 -0400
X-MC-Unique: ED25ewKCM7GCinrWMNmHpA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o28-20020a05600c511c00b003a04f97f27aso1086383wms.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rsJM2XN1k5xLdA4WoRw6Yh/T9zUNL7IrEHO/2qKbDbs=;
 b=P2MmAYLXklgoLm5KcJQmLQVx4AXlZ637jfkPwWVIRoKDMbgAD5DNPeeRTSDr4BXJm1
 7n6kcvO1na5K1qkSnHYS5Vt/wKfuiOmsvfmyVk8dfQoLSKE2Fw1hnm0WLZedN9db/vWn
 NuGLEFJpx6NsnZMJKPS71stCzTswZla+bUXIHtc3lOWI3dcwIZLNODBB8wfhewKgvORs
 Za4fLgx1BOSeLWhV/lF5AV1C1W8T7+ggmDWROmOOo4bVKwrSDFic5stLUgRuHWN7SpjN
 xW/x6YQ7NdcxixX7XLlLuuPb6hvyafxFBCYNY2AhxmVAD7n4wiM38g7MAC/dBVQM3v+t
 xZeA==
X-Gm-Message-State: AJIora8PdOcX1YqvtJCYBLuzb+ylMH3HnagUuv59SHB3JiA2XCf8cWws
 tO5OUjKur6TMCAfpNeXeggjSoAobMLZCA4zjStUQ19yqtMOmB1fVcpTciHVTn8UDodQnK12ZtYC
 cMQIJfdB7q83/ibCaAf8UtCvrhIG0mx8xsjbpvn3mad04of4T9cK2TgX96K8O
X-Received: by 2002:a5d:5846:0:b0:21b:c444:9913 with SMTP id
 i6-20020a5d5846000000b0021bc4449913mr11574698wrf.128.1656391353857; 
 Mon, 27 Jun 2022 21:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu0Nflzc4Jnpn+LuoVvZFzkCDywq1wI1GzHq2Kcfcr1TF2qOv9jng9LPQbzxlvzx7GWQA1kw==
X-Received: by 2002:a5d:5846:0:b0:21b:c444:9913 with SMTP id
 i6-20020a5d5846000000b0021bc4449913mr11574684wrf.128.1656391353636; 
 Mon, 27 Jun 2022 21:42:33 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 h6-20020adffd46000000b0021b96cdf68fsm12205741wrs.97.2022.06.27.21.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:33 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 02/12] msi: fix MSI vector limit check in msi_set_mask()
Message-ID: <20220628044201.217173-3-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jagannathan Raman <jag.raman@oracle.com>

MSI supports a maximum of PCI_MSI_VECTORS_MAX vectors - from 0 to
PCI_MSI_VECTORS_MAX - 1.

msi_set_mask() was previously using PCI_MSI_VECTORS_MAX as the upper
limit for MSI vectors. Fix the upper limit to PCI_MSI_VECTORS_MAX - 1.

Fixes: Coverity CID 1490141
Fixes: 08cf3dc61199 vfio-user: handle device interrupts

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Message-Id: <20220623153844.7367-1-jag.raman@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/pci/msi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 5c471b9616..058d1d1ef1 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -322,9 +322,9 @@ void msi_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
     uint32_t irq_state, vector_mask, pending;
 
-    if (vector > PCI_MSI_VECTORS_MAX) {
+    if (vector >= PCI_MSI_VECTORS_MAX) {
         error_setg(errp, "msi: vector %d not allocated. max vector is %d",
-                   vector, PCI_MSI_VECTORS_MAX);
+                   vector, (PCI_MSI_VECTORS_MAX - 1));
         return;
     }
 
-- 
MST


