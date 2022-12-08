Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB36475C7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 19:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3LwC-0007Xk-6X; Thu, 08 Dec 2022 13:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3Lvv-0007UO-03
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 13:47:53 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3Lvr-0007x9-Ma
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 13:47:46 -0500
Received: by mail-oi1-x234.google.com with SMTP id e205so2269386oif.11
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=uggzRw2a27OEv1K9QEuygC5VIetppOVoqwsoP3OI6+g=;
 b=NoCvYR82XacKpJAJlnoV5dC2D8eE9c3tG0tFaXxmgW30GgZiRGxxSUdd6V2lO1OrN+
 /3kGmlaq5U6lECgWxvXn2jM5Q2CuC90wCoMd5E87dnGVdHZCLbl25eYxKzbd8Uptl5VV
 aouIh/1bMxCM9k+CXjgu/IvKHe9JNJWAMxHDs6r6QRIn/lWJxCifnFR+8QJyEdF/4fA9
 IV8aeMN5ufU/oveO5ZlSyRgNyJeQ9Ck1brS5q4DL3aUwcJr7bAFSukJQVdzdkeP6k8cp
 SG25AhvA64WmT+P0EaccrsPUtzLwwfHTd+dOLUpL2lJ4aOjEXprXkQQruHzK0daxo5eX
 5U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uggzRw2a27OEv1K9QEuygC5VIetppOVoqwsoP3OI6+g=;
 b=RJRXf9Y7IllmdLRZQZuQk+Vc8bT5r/0tP72+uN3Q7/Z5cZy4EO1VusNL4R+aCSF/tO
 nbe5pxffREQQD3CX9Uwq11XI1wjXWihI6YmksHN3KnPOlIi/xIBbTzQDi9wURjULSH1u
 AqDcG1EPrZMnEfpfQkeiMevV1632Xugfbp6bpNVnBIQHH7h+ZI0YpO57XInz6z3GT3O4
 ElcI9W/hwo6gV+SCSNK7/tNO+PfYSfypfXVT9gGflsY3DOa/q0AVleiCltbbNcs+/Zc0
 0/Y2GlMRG13m7J1RFfggJKfHhL/M/63bzHXaiW5RaiaKYWJCQI88MWZM9E3C7acYqawp
 40Gg==
X-Gm-Message-State: ANoB5pm27N4lKgpdT/AEL5PXrPDxv3+JYdeIICPE6UsC0RKMr1GwFqIF
 1wh4TlrSSS9rLPlrdNosiWI=
X-Google-Smtp-Source: AA0mqf7amEN41Tmf+rg8zcf+kWGqRoZ0x2Q8/U2iNc0pephJ9lydv0X8QskasGqj1NFhhoddT6/8sg==
X-Received: by 2002:a05:6808:5cb:b0:35b:f272:63c with SMTP id
 d11-20020a05680805cb00b0035bf272063cmr12178519oij.256.1670525262314; 
 Thu, 08 Dec 2022 10:47:42 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a056871061200b00144bb1013e6sm5123036oan.4.2022.12.08.10.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 10:47:41 -0800 (PST)
Date: Thu, 8 Dec 2022 10:47:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <20221208184740.GA3380017@roeck-us.net>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5GbbF68N5ZiYNdv@cormorant.local>
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.229, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 08, 2022 at 09:08:12AM +0100, Klaus Jensen wrote:
> On Dec  8 08:16, Klaus Jensen wrote:
> > On Dec  7 09:49, Guenter Roeck wrote:
> > > Hi,
> > > 
> > > On Thu, Jun 16, 2022 at 08:34:07PM +0800, Jinhao Fan wrote:
> > > > Implement Doorbel Buffer Config command (Section 5.7 in NVMe Spec 1.3)
> > > > and Shadow Doorbel buffer & EventIdx buffer handling logic (Section 7.13
> > > > in NVMe Spec 1.3). For queues created before the Doorbell Buffer Config
> > > > command, the nvme_dbbuf_config function tries to associate each existing
> > > > SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer address.
> > > > Queues created after the Doorbell Buffer Config command will have the
> > > > doorbell buffers associated with them when they are initialized.
> > > > 
> > > > In nvme_process_sq and nvme_post_cqe, proactively check for Shadow
> > > > Doorbell buffer changes instead of wait for doorbell register changes.
> > > > This reduces the number of MMIOs.
> > > > 
> > > > In nvme_process_db(), update the shadow doorbell buffer value with
> > > > the doorbell register value if it is the admin queue. This is a hack
> > > > since hosts like Linux NVMe driver and SPDK do not use shadow
> > > > doorbell buffer for the admin queue. Copying the doorbell register
> > > > value to the shadow doorbell buffer allows us to support these hosts
> > > > as well as spec-compliant hosts that use shadow doorbell buffer for
> > > > the admin queue.
> > > > 
> > > > Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> > > 
> > > I noticed that I can no longer boot Linux kernels from nvme on riscv64
> > > systems. The problem is seen with qemu v7.1 and qemu v7.2-rc4.
> > > The log shows:
> > > 
> > > [   35.904128] nvme nvme0: I/O 642 (I/O Cmd) QID 1 timeout, aborting
> > > [   35.905000] EXT4-fs (nvme0n1): mounting ext2 file system using the ext4 subsystem
> > > [   66.623863] nvme nvme0: I/O 643 (I/O Cmd) QID 1 timeout, aborting
> > > [   97.343989] nvme nvme0: Abort status: 0x0
> > > [   97.344355] nvme nvme0: Abort status: 0x0
> > > [   97.344647] nvme nvme0: I/O 7 QID 0 timeout, reset controller
> > > [   97.350568] nvme nvme0: I/O 644 (I/O Cmd) QID 1 timeout, aborting
> > > 
> > > This is with the mainline Linux kernel (v6.1-rc8).
> > > 
> > > Bisect points to this patch. Reverting this patch and a number of associated
> > > patches (to fix conflicts) fixes the problem.
> > > 
> > > 06143d8771 Revert "hw/nvme: Implement shadow doorbell buffer support"
> > > acb4443e3a Revert "hw/nvme: Use ioeventfd to handle doorbell updates"
> > > d5fd309feb Revert "hw/nvme: do not enable ioeventfd by default"
> > > 1ca1e6c47c Revert "hw/nvme: unregister the event notifier handler on the main loop"
> > > 2d26abd51e Revert "hw/nvme: skip queue processing if notifier is cleared"
> > > 99d411b5a5 Revert "hw/nvme: reenable cqe batching"
> > > 2293d3ca6c Revert "hw/nvme: Add trace events for shadow doorbell buffer"
> > > 
> > > Qemu command line:
> > > 
> > > qemu-system-riscv64 -M virt -m 512M \
> > >      -kernel arch/riscv/boot/Image -snapshot \
> > >      -device nvme,serial=foo,drive=d0 \
> > >      -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
> > >      -bios default \
> > >      -append "root=/dev/nvme0n1 console=ttyS0,115200 earlycon=uart8250,mmio,0x10000000,115200" \
> > >      -nographic -monitor none
> > > 
> > > Guenter
> > 
> > Hi Guenter,
> > 
> > Thanks for the bisect.
> > 
> > The shadow doorbell is also an obvious candidate for this regression. I
> > wonder if this could be a kernel bug, since we are not observing this on
> > other architectures. The memory barriers required are super finicky, but
> > in QEMU all the operations are associated with full memory barriers. The
> > barriers are more fine grained in the kernel though.
> > 
> > I will dig into this together with Keith.
> 
> A cq head doorbell mmio is skipped... And it is not the fault of the
> kernel. The kernel is in it's good right to skip the mmio since the cq
> eventidx is not properly updated.
> 
> Adding that and it boots properly on riscv. But I'm perplexed as to why
> this didnt show up on our regularly tested platforms.
> 
> Gonna try to get this in for 7.2!

I see another problem with sparc64.

[    5.261508] could not locate request for tag 0x0
[    5.261711] nvme nvme0: invalid id 0 completed on queue 1

That is seen repeatedly until the request times out. I'll test with
your patch to see if it resolves this problem as well, and will bisect
otherwise.

Guenter

