Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386144C641C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:53:52 +0100 (CET)
Received: from localhost ([::1]:33092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOaqs-0001ny-2F
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:53:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nOanK-0000jz-QC
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:50:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nOanH-0000iI-OB
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646034606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QyOv+kLWJsGLxQmWNJ+70ZY+ywUhLBECFumijvmAAfY=;
 b=CNbRap7nL/nF1klsnxpC5WNEFN/qLhEuxviSVA/4FA9ss0JjOCaqd6/0MXQ1/lZNYVAcrl
 y0akXbAfeAwg7hqordhQuOkCUouq3IZgbbb+kjN9XzCUabn39Awk5q5qd1uTCITX5zECVh
 h42lC1t6jR6Raynp5z473/vrrM4e1D4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-ihS40Ys9PRarAZIR67qdWw-1; Mon, 28 Feb 2022 02:50:03 -0500
X-MC-Unique: ihS40Ys9PRarAZIR67qdWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40851091DA2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 07:50:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B586A27BDD;
 Mon, 28 Feb 2022 07:49:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 05EBB1800393; Mon, 28 Feb 2022 08:49:57 +0100 (CET)
Date: Mon, 28 Feb 2022 08:49:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/4] Fix broken PCIe device after migration
Message-ID: <20220228074957.px6wh2acyne5e3fm@sirius.home.kraxel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220225045327-mutt-send-email-mst@kernel.org>
 <20220225141823.5ee12954@redhat.com>
 <20220225084957-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220225084957-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Well the control is present, isn't it? Can be used to e.g. reset the
> device behind the bridge.

Well, not right now b/c poweroff ejects the device.  Would need a patch
like this ...

--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -755,7 +755,8 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
-        (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
+        (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF) &&
+        dev->pending_deleted_event) {
         pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);

... so pcie unplugs on poweroff only in case there is a pending unplug
request.  But with that the guest wouldn't be able to unplug devices on
its own.

take care,
  Gerd


