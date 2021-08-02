Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D253DD29E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:06:42 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mATuD-00005Z-MU
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mATt2-00074b-Nr
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mATt0-0003uH-Lb
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627895125;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/LKljomjUhvHpkH1LlnO3ufgIi/bwXscU6akr+ULksI=;
 b=MqD8SQZjPqJcKDJ4CUHHMnFV51hj/kh2uv/1Kx6mt5XEaXFQwADRz5pHVE2CveUJVPoMcF
 cG/ThQ/mSxHYK123r+jHt3WB8M4OQlKhibB40F5z+xJHuwcDChOaMsM55WomPsJdj7sF1V
 OBAI3wHvWaOwu+DCEbdTaN8IGpHh31g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-DG1JVbpDOO2y4PyQFiM3lA-1; Mon, 02 Aug 2021 05:05:24 -0400
X-MC-Unique: DG1JVbpDOO2y4PyQFiM3lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D922180FCCD;
 Mon,  2 Aug 2021 09:05:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D50B761093;
 Mon,  2 Aug 2021 09:05:13 +0000 (UTC)
Date: Mon, 2 Aug 2021 10:05:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
Message-ID: <YQe1RDEajaz7FYJw@redhat.com>
References: <20210802090057.1709775-1-marcel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210802090057.1709775-1-marcel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: marcel@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 12:00:57PM +0300, Marcel Apfelbaum wrote:
> Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> As opposed to native PCIe hotplug, guests like Fedora 34
> will not assign IO range to pcie-root-ports not supporting
> native hotplug, resulting into a regression.

Presumably this means this patch should have 'for 6.1' tagged
in subject, as we don't want 6.1 to regress ?

> 
> Reproduce by:
>     qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio
>     device_add e1000,bus=p1
> In the Guest OS the respective pcie-root-port will have the IO range
> disabled.
> 
> Fix it by setting the "reserve-io" hint capability of the
> pcie-root-ports so the firmware will allocate the IO range instead.
> 
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
> v2:
>    - improve commit message (Igor)
> 
>  hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
> index ec9907917e..20099a8ae3 100644
> --- a/hw/pci-bridge/gen_pcie_root_port.c
> +++ b/hw/pci-bridge/gen_pcie_root_port.c
> @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN_PCIE_ROOT_PORT)
>          (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
>  
>  #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
> +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
>  
>  struct GenPCIERootPort {
>      /*< private >*/
> @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque, int version_id)
>  static void gen_rp_realize(DeviceState *dev, Error **errp)
>  {
>      PCIDevice *d = PCI_DEVICE(dev);
> +    PCIESlot *s = PCIE_SLOT(d);
>      GenPCIERootPort *grp = GEN_PCIE_ROOT_PORT(d);
>      PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
>      Error *local_err = NULL;
> @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
> +        grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
> +    }
>      int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
>                                                grp->res_reserve, errp);
>  
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


