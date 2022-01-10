Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5977E48A1C6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:20:03 +0100 (CET)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n725C-0003Q2-6V
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71uk-0003ZD-N9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:09:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71ui-00052z-Ve
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641848952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nsFusxBNak8ylYnp/RAB1KuHip9lMCbLTpLIRHiwyeY=;
 b=IACqjdW20e4K7WqNGOsqJVkYp4bVRekkY5jb5LTm6Ymw+imyziY5gd4YAU5//z2Qq/8tBA
 Y2pfARHmVU6iiQYU3Snqgje5UtOWPHa0vm1Thf4se9/NQsGQ2xVcWAJIMnWHO4n7+OENk6
 sSMErjo2RvTe4aYym9g8TMzClmjaTgo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-cV9s3dTAPqyhEK3mw_G7iA-1; Mon, 10 Jan 2022 16:09:11 -0500
X-MC-Unique: cV9s3dTAPqyhEK3mw_G7iA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so636800wmp.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nsFusxBNak8ylYnp/RAB1KuHip9lMCbLTpLIRHiwyeY=;
 b=QIDzve0ApO9+jx6BInEcvWleXWMQUGyulgAg2fBumhn+ZyqZY91s1PznAqUKtRCv/+
 1Zx0IcOM/qBunQJwK7D7CHv3yjvEzOcL2RXe/qCga/NoS6pXAbKTwXtgLi1r+s4VIuGC
 XYOoWpVcBkDvp2N2RBsJ+oLMSM+3DBOOS3nTupJx5oOU2+PWQqQFnnruhb52qM6YGB9l
 +wxx8PrevnhuUPcjj4Pn3fFpfBSrkFXyTl1An6w9DordDf4Co/d9Eu6NvVTfrOz1vJBY
 je0APH6SM4MU75KUd+HHCgB92G4fujDZiWyw9uEuMMl3K3F27/MZaUbllNuTtkpptGx9
 dQ2g==
X-Gm-Message-State: AOAM5325Zn7eQVtJJLVM3WZFFFk3aogOdBFzFReV44P86w0uaoHvP4gW
 vGxDDD2YIcqcm0Md2WNvv6QbWhqnXRa3XUiM9uSBPmk0JQyvtOWkWs8KglYS1AFczmQ/BEb17fU
 WG2NmU1USBLxL0Wg=
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr1172811wrx.676.1641848949969; 
 Mon, 10 Jan 2022 13:09:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrhiYib5jrCa8s60S/1i6HkDOSTbneE6g/UczeHj+j0c+bBi962GW8OnDHNpK3n/7fvAOSPA==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr1172792wrx.676.1641848949714; 
 Mon, 10 Jan 2022 13:09:09 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id w7sm2072466wrv.96.2022.01.10.13.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:09:09 -0800 (PST)
Date: Mon, 10 Jan 2022 16:09:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] virtio-pci: fix up config interrupt handling
Message-ID: <20220110160811-mutt-send-email-mst@kernel.org>
References: <20220109173136.35848-1-mst@redhat.com>
 <87zgo3xr6w.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <87zgo3xr6w.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Volker =?iso-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org, Cindy Lu <lulu@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 08:37:43PM +0000, Marc Zyngier wrote:
> Hi Michael,
> 
> On Sun, 09 Jan 2022 17:49:19 +0000,
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > 
> > Fixes a couple of issues with irqfd use by config interrupt:
> > - Rearrange initialization so cleanup happens in the reverse order
> > - Don't use irqfd for config when not in use for data path
> > I am not sure this is a complete fix though: I think we
> > are better off limiting the effect to vdpa devices
> > with config interrupt support. Or even bypass irqfd
> > for config completely and inject into KVM using ioctl?
> > The advantage would be less FDs used.
> > This would mean mostly reverting the patchset though.
> > 
> > Fixes: d5d24d859c ("virtio-pci: add support for configure interrupt")
> > Cc: "Cindy Lu" <lulu@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> This doesn't seem to fix the problems I'm seeing here with a KVM/arm64
> guest (the issue exists with and without this patch)
> 
> On initial boot:
> 
> <quote>
> Loading Linux 5.7.0-1-arm64 ...
> Loading initial ramdisk ...
> qemu-system-aarch64: virtio-blk failed to set guest notifier (-16), ensure -accel kvm is set.
> qemu-system-aarch64: virtio_bus_start_ioeventfd: failed. Fallback to userspace (slower).
> qemu-system-aarch64: virtio-scsi: Failed to set guest notifiers (-16), ensure -accel kvm is set.
> qemu-system-aarch64: virtio_bus_start_ioeventfd: failed. Fallback to userspace (slower).
> </quote>
> 
> The guest is functional though. However, on reboot:
> 
> <quote>
> Loading Linux 5.7.0-1-arm64 ...
> Loading initial ramdisk ...
> qemu-system-aarch64: ../hw/pci/msix.c:622: msix_unset_vector_notifiers: Assertion `dev->msix_vector_use_notifier && dev->msix_vector_release_notifier' failed.
> </quote>
> 
> Reverting d5d24d859c fixes the issue. For the record, my qemu command
> line:
> 
> /home/maz/qemu/build/qemu-system-aarch64 -m 1G -smp 8 -cpu host,aarch64=on -machine virt,accel=kvm,gic-version=host -nographic -drive if=pflash,format=raw,readonly=on,file=/usr/share/AAVMF/AAVMF_CODE.fd -drive if=pflash,format=raw,file=bullseye/bBwcgtDY2UwXklV6.fd -netdev user,id=hostnet0 -device virtio-net-pci,netdev=hostnet0 -drive if=none,format=raw,cache=none,aio=native,file=bullseye/bBwcgtDY2UwXklV6.img,id=disk0 -device virtio-blk-pci,drive=disk0 -drive file=debian-testing-arm64-netinst-preseed.iso,id=cdrom,if=none,media=cdrom -device virtio-scsi-pci -device scsi-cd,drive=cdrom
> 
> Thanks,
> 
> 	M.


Thanks, I'm reverting these changes for now.
Cindy, once you have your patches ready pinging people who encountered
problems with the previous versions is a very good idea.

> -- 
> Without deviation from the norm, progress is not possible.


