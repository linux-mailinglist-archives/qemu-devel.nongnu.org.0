Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4734524B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 23:10:51 +0100 (CET)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOSl7-00035r-R8
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 18:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOSjq-0002bs-Bq
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 18:09:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOSjk-0003Yh-Rk
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 18:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616450963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJZZKC0AcGAtD/3j9IffcYlWsC2MGI85T7Z7r3MA1rc=;
 b=J95leSl0TWBcyeTYYX+2idqkhgFzyeuBWK0gJxD2f9+reyv5TeJlLneUbNsnGC5gbLHalc
 cZ8KBlxLzYCRgypb39Bajjb2dQyDbVqwCYg84Psyjb+H+HYDBVdFQIR0zAlvvUZgAf8i1/
 S3IplrShfoN34WdqxeBdIn5N4upZ2uI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-of8FnGqCMB6H2Ad8KT-cDQ-1; Mon, 22 Mar 2021 18:09:21 -0400
X-MC-Unique: of8FnGqCMB6H2Ad8KT-cDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AE631007467;
 Mon, 22 Mar 2021 22:09:19 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D7B360BE5;
 Mon, 22 Mar 2021 22:09:18 +0000 (UTC)
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
To: Olaf Hering <olaf@aepfle.de>
References: <20210317070046.17860-1-olaf@aepfle.de>
From: John Snow <jsnow@redhat.com>
Message-ID: <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
Date: Mon, 22 Mar 2021 18:09:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317070046.17860-1-olaf@aepfle.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 3:00 AM, Olaf Hering wrote:
> Commit ee358e919e385fdc79d59d0d47b4a81e349cd5c9 causes a regression in
> Xen HVM domUs which run xenlinux based kernels.
> 
> If the domU has an USB device assigned, for example with
> "usbdevice=['tablet']" in domU.cfg, the late unplug of devices will
> kill the emulated USB host. As a result the khubd thread hangs, and as
> a result the entire boot process.
> 
> For some reason this does not affect pvops based kernels. This is
> most likely caused by the fact that unplugging happens very early
> during boot.
> 

I'm not entirely sure of how the commit message relates to the patch, 
actually. (Sorry, I am not well familiar with XEN.)

> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   hw/ide/piix.c        | 5 +++++
>   include/hw/ide/pci.h | 1 +
>   2 files changed, 6 insertions(+)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index b9860e35a5..7f1998bf04 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -109,6 +109,9 @@ static void piix_ide_reset(DeviceState *dev)
>       uint8_t *pci_conf = pd->config;
>       int i;
>   
> +    if (d->xen_unplug_done == true) {
> +        return;
> +    }

My understanding is that XEN has some extra disks that it unplugs when 
it later figures out it doesn't need them. How exactly this works is 
something I've not looked into too closely.

So if these IDE devices have been "unplugged" already, we avoid 
resetting them here. What about this reset causes the bug you describe 
in the commit message?

Does this reset now happen earlier/later as compared to what it did 
prior to ee358e91 ?

>       for (i = 0; i < 2; i++) {
>           ide_bus_reset(&d->bus[i]);
>       }
> @@ -151,6 +154,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>       PCIIDEState *d = PCI_IDE(dev);
>       uint8_t *pci_conf = dev->config;
>   
> +    d->xen_unplug_done = false;
>       pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>   
>       bmdma_setup_bar(d);
> @@ -170,6 +174,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
>       BlockBackend *blk;
>   
>       pci_ide = PCI_IDE(dev);
> +    pci_ide->xen_unplug_done = true;
>   
>       for (i = aux ? 1 : 0; i < 4; i++) {
>           idebus = &pci_ide->bus[i / 2];
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index d8384e1c42..9e71cfec3b 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -50,6 +50,7 @@ struct PCIIDEState {
>       IDEBus bus[2];
>       BMDMAState bmdma[2];
>       uint32_t secondary; /* used only for cmd646 */
> +    bool xen_unplug_done;

I am hesitant to put a new XEN-specific boolean here, but don't know 
enough about the problem to outright say "no".

This looks like a band-aid that's out of place, but I don't understand 
the problem well enough yet to suggest a better place.

>       MemoryRegion bmdma_bar;
>       MemoryRegion cmd_bar[2];
>       MemoryRegion data_bar[2];
> 

(If anyone else with more experience with XEN wants to take over the 
review of this patch, let me know. I only really care about the IDE bits.)


