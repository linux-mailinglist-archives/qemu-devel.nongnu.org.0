Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF247B60E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 00:06:12 +0100 (CET)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzRjO-0004OM-Pk
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 18:06:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mzRhP-0003I7-DZ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 18:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mzRhM-00081b-Cm
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 18:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640041442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HaUsClrGG9mRhjxiM6CNLgh7AwI4grGt2FZVxDMKgSA=;
 b=Wi/vAcOTOdJB5Eq7ucqqqSvPMdDbjj9s/rfiKcIjwjooDZKzo/qsgYrdLdzRuhPxpHYAEe
 q2Rq3GOHY88tT6d9J0TcPP31FbMuDjviPYGYQXwGNzn9FJIul7PnfUBAtsl6G0mrhnzwbS
 Nv8uquDAVIz5+QUNqNpXX7hHXC3unuA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-vvGDOCo8PmmqiAu8XYTQSw-1; Mon, 20 Dec 2021 18:04:01 -0500
X-MC-Unique: vvGDOCo8PmmqiAu8XYTQSw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y17-20020a056402271100b003f7ef5ca612so8761020edd.17
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 15:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HaUsClrGG9mRhjxiM6CNLgh7AwI4grGt2FZVxDMKgSA=;
 b=39PWiGACZlvDYoRahWBM6AYVE+Mud5aHaLb8VWFZYOe9rODDFLrQ96MSEBmQR6h6cx
 O2sFTQjIv7TbDocWmRlfPE0FdKNDMppQXNszYZ8JISLZsSvLAfkowDCgtumgWnBBoy3M
 PA1lVhRqmQBVB+TsveNQ20r/j+PxW8HTx9KAmMIok+EEmJTTedzQfNyMW/okk2SHNkoS
 SEtljfGGkAlZIU6zWNqQN8+fpYXw/6wL1J1S9y1/dMvyqFEg3qrf11qUvsI+yoNwfvNC
 jc7McYPfX/NyLrtF4JRO9DWhwugVjbnnZjIldN8DYqN3blnIpi02jzMyf6rrl5qIQyaE
 Mgew==
X-Gm-Message-State: AOAM532FubllqeTOlbfWdaESv2rCI5Bv20zM/nS/JRiECb8DBFfMAPyq
 qWBEsdXDJLDNgAbJpS3CtKYloVmNxO9Huaj+hSo9nmEAliFVsGPnQMGMWWyhDPFqLz4vcMqErI+
 9kS2bZNMfJxTfoy0=
X-Received: by 2002:a50:a41e:: with SMTP id u30mr343904edb.388.1640041440166; 
 Mon, 20 Dec 2021 15:04:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJ6uHoO2T5uq+kADFwbdVhCdksXm3L91qMuL4Dm7KcXeaw48t8kdo3e4sM1nskQJrYZj/q9Q==
X-Received: by 2002:a50:a41e:: with SMTP id u30mr343885edb.388.1640041439928; 
 Mon, 20 Dec 2021 15:03:59 -0800 (PST)
Received: from redhat.com ([2.55.141.192])
 by smtp.gmail.com with ESMTPSA id o17sm5719341ejj.162.2021.12.20.15.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 15:03:59 -0800 (PST)
Date: Mon, 20 Dec 2021 18:03:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] pci: Skip power-off reset when pending unplug
Message-ID: <20211220174502-mutt-send-email-mst@kernel.org>
References: <164002480875.2328622.7843917444941101286.stgit@omen>
MIME-Version: 1.0
In-Reply-To: <164002480875.2328622.7843917444941101286.stgit@omen>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 11:26:59AM -0700, Alex Williamson wrote:
> The below referenced commit introduced a change where devices under a
> root port slot are reset in response to removing power to the slot.
> This improves emulation relative to bare metal when the slot is powered
> off, but introduces an unnecessary step when devices under that slot
> are slated for removal.
> 
> In the case of an assigned device, there are mandatory delays
> associated with many device reset mechanisms which can stall the hot
> unplug operation.  Also, in cases where the unplug request is triggered
> via a release operation of the host driver, internal device locking in
> the host kernel may result in a failure of the device reset mechanism,
> which generates unnecessary log warnings.
> 
> Skip the reset for devices that are slated for unplug.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: d5daff7d3126 ("pcie: implement slot power control for pcie root ports")
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

I am not sure this is safe. IIUC pending_deleted_event
is normally set after host admin requested device removal,
while the reset could be triggered by guest for its own reasons
such as suspend or driver reload.

Looking at this some more, I am not sure I understand the
issue completely.
We have:

    if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
        (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
        (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
        (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
        pcie_cap_slot_do_unplug(dev);
    }
    pcie_cap_update_power(dev);

so device unplug triggers first, reset follows and by that time
there should be no devices under the bus, if there are then
it's because guest did not clear the power indicator.


So I am not sure how to fix the assignment issues as I'm not sure how do
they trigger, but here is a wild idea: maybe it should support an API
for starting reset asynchronously, then if the following access is
trying to reset again that second reset can just be skipped, while any
other access will stall.





> ---
>  hw/pci/pci.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index e5993c1ef52b..f594da410797 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2869,7 +2869,7 @@ void pci_set_power(PCIDevice *d, bool state)
>      memory_region_set_enabled(&d->bus_master_enable_region,
>                                (pci_get_word(d->config + PCI_COMMAND)
>                                 & PCI_COMMAND_MASTER) && d->has_power);
> -    if (!d->has_power) {
> +    if (!d->has_power && !d->qdev.pending_deleted_event) {
>          pci_device_reset(d);
>      }
>  }
> 


