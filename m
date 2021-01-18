Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568462F9C40
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:19:43 +0100 (CET)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RdO-000662-DA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1RKX-0000el-5q
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:00:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1RKV-0006lf-DO
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:00:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610964010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MBzCV60zdKill+pt0UR7nRPinm+s59+tSgkttsWY9m4=;
 b=O6j98hezFrGwzYYzgavMgz9oAXZM6OGTTSnamCZFcCHL61eiLjD7EmvyxK9mbCh01FxlgM
 INKyFrfWP1pGG7dP1j81MFSG+HuaXd78wVjDP05EifMNbqe40uFDRL6rpcJ5WBiF9mzD+B
 Iw/6k/fnG40y2zAdRiTJXQtsGi2IIrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-iXJoebd-MBu7Zlh2bvFZeA-1; Mon, 18 Jan 2021 05:00:08 -0500
X-MC-Unique: iXJoebd-MBu7Zlh2bvFZeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B957B1005504;
 Mon, 18 Jan 2021 10:00:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B6C10023AF;
 Mon, 18 Jan 2021 10:00:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ED4CB1800380; Mon, 18 Jan 2021 11:00:05 +0100 (CET)
Date: Mon, 18 Jan 2021 11:00:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mihai Carabas <mihai.carabas@oracle.com>
Subject: Re: [PATCH 2/4] hw/misc/pvpanic: add PCI interface support
Message-ID: <20210118100005.7p4hnipsc5tveto7@sirius.home.kraxel.org>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> --- a/docs/specs/pci-ids.txt
> +++ b/docs/specs/pci-ids.txt
> @@ -64,6 +64,7 @@ PCI devices (other than virtio):
>  1b36:000d  PCI xhci usb host adapter
>  1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
>  1b36:0010  PCIe NVMe device (-device nvme)
> +1b36:0011  PCI PVPanic device (-device pvpanic-pci)
>  
>  All these devices are documented in docs/specs.
>  

> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 259f9c9..66db084 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -107,6 +107,7 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE 0x000e
>  #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
>  #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
> +#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
>  #define PCI_DEVICE_ID_REDHAT_QXL         0x0100

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


