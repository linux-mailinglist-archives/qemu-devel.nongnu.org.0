Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69564813E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:00:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3b7G-0003Do-5X; Fri, 09 Dec 2022 06:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3b7D-0003Ca-Il
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:00:27 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3b7B-0003fH-J1
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:00:27 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so5241513fac.2
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=wXtACFhBsXnFxC9BUdlXLVDQ3ZnTQp4VBJ7r9aK9yL4=;
 b=T8zkhctqkoR6qCbEN2PC5BNbZfWXNa1vp5F/C60oieHLBa9JgEyZYD/exOxTSpBWlR
 KEfHo7UyMU6nJzDGV7929tNErt0fYxZ1775b9V+PkLPmR8UwzTucSxohoCfx8kpvE6Zx
 tDa+vyk9UMTGlhWbm0DmUQA3irR+JK6nU3IWdsNx3xATWvO3HrvzUFEIglQspDdV8nZH
 LI731SLLU5zS0qczxSqKAi/kqu0nivu0rg3XWN9jlrVwySBQvk1Xp1XxpXRN5Jp4F7c8
 BwOwOPpONGxKNjUjLxIXJb1tDYKd8FrCtj0n/SZws9W9O9MCh5OD6tH53PoUZkkGatHA
 PoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXtACFhBsXnFxC9BUdlXLVDQ3ZnTQp4VBJ7r9aK9yL4=;
 b=1hKlFYDfE63BWoh6JUQtSrj1wauZ2/m+k1BR+Khv1yafVOLbWkjWX0ZGaJ9AuCzDtj
 npX2AyVQ3fTJ9Ws/EOSnKRFU+FffDcklziYoxyLXqmNPvaBeIq8hJp7Dif5YA6wRb2D2
 MBngtjd0CxbXG/WLoh5Jidm7V8Ntyg60aCCTh/k535B0PXpWVaybqf2S3pwSajH2RhhU
 47TWeB6NIuw1phDIAf63FFQXGV7QdTq2PMFkVELP44hi0EVFAFmDxJRwjYdaHy8Zhkld
 wNfZx4awRGgRZmr7K+kAlagwh7tnZ6zaFRm1g9CtaqXrvhRs6nVHsCE1ifuae18jILdQ
 Yq9w==
X-Gm-Message-State: ANoB5pkt5LLypQMwSwlWicTQvkhbSWJVBzK07EYwd1TeTvtx06X0m/46
 MYnqccJ11NvVk8rpbv3gp5w=
X-Google-Smtp-Source: AA0mqf55HWjhTw2i7YT3ZhvSTu1aLw4MleuWaVMAqcTw7NDrRduraVKk/rdnAi5dQDTFAaBFDOFRsw==
X-Received: by 2002:a05:6870:50c:b0:13b:8098:d195 with SMTP id
 j12-20020a056870050c00b0013b8098d195mr2850934oao.27.1670583624036; 
 Fri, 09 Dec 2022 03:00:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y44-20020a056870b4ac00b001447602267esm657459oap.41.2022.12.09.03.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:00:23 -0800 (PST)
Date: Fri, 9 Dec 2022 03:00:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <20221209110022.GA3396194@roeck-us.net>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local>
 <20221208184740.GA3380017@roeck-us.net>
 <20221208201353.GA928427@roeck-us.net>
 <20221208203955.GA1367659@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208203955.GA1367659@roeck-us.net>
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x36.google.com
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

On Thu, Dec 08, 2022 at 12:39:57PM -0800, Guenter Roeck wrote:
> On Thu, Dec 08, 2022 at 12:13:55PM -0800, Guenter Roeck wrote:
> > On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
> > > > 
> > > > A cq head doorbell mmio is skipped... And it is not the fault of the
> > > > kernel. The kernel is in it's good right to skip the mmio since the cq
> > > > eventidx is not properly updated.
> > > > 
> > > > Adding that and it boots properly on riscv. But I'm perplexed as to why
> > > > this didnt show up on our regularly tested platforms.
> > > > 
> > > > Gonna try to get this in for 7.2!
> > > 
> > > I see another problem with sparc64.
> > > 
> > > [    5.261508] could not locate request for tag 0x0
> > > [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
> > > 
> > > That is seen repeatedly until the request times out. I'll test with
> > > your patch to see if it resolves this problem as well, and will bisect
> > > otherwise.
> > > 
> > The second problem is unrelated to the doorbell problem.
> > It is first seen in qemu v7.1. I'll try to bisect.
> > 
> 
> Unfortunately, the problem observed with sparc64 also bisects to this
> patch. Making things worse, "hw/nvme: fix missing cq eventidx update"
> does not fix it (which is why I initially thought it was unrelated).
> 
> I used the following qemu command line.
> 
> qemu-system-sparc64 -M sun4v -cpu "TI UltraSparc IIi" -m 512 -snapshot \
>     -device nvme,serial=foo,drive=d0,bus=pciB \
>     -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
>     -kernel arch/sparc/boot/image -no-reboot \
>     -append "root=/dev/nvme0n1 console=ttyS0" \
>     -nographic -monitor none
> 

With completed tests, it turns out the problem is seen with various
emulations running big endian CPUs.

Example from arm64be:

[    4.736752] nvme nvme0: pci function 0000:00:02.0
[    4.737829] nvme 0000:00:02.0: enabling device (0000 -> 0002)
[    4.774673] nvme nvme0: 2/0/0 default/read/poll queues
[    4.779331] nvme nvme0: Ignoring bogus Namespace Identifiers
[    4.799400] could not locate request for tag 0x0
[    4.799533] nvme nvme0: invalid id 0 completed on queue 2
[    4.799612] could not locate request for tag 0x0
[    4.799676] nvme nvme0: invalid id 0 completed on queue 2
[    4.799744] could not locate request for tag 0x0

powerpc:

could not locate request for tag 0x0
nvme nvme0: invalid id 0 completed on queue 1
could not locate request for tag 0x0
nvme nvme0: invalid id 0 completed on queue 1

trace logs (arm64be, good, qemu v7.0):

pci_nvme_admin_cmd cid 2864 sqid 0 opc 0x6 opname 'NVME_ADM_CMD_IDENTIFY'
pci_nvme_identify cid 2864 cns 0x5 ctrlid 0 csi 0x0
pci_nvme_identify_ns_csi nsid=1, csi=0x0
pci_nvme_map_prp trans_len 4096 len 4096 prp1 0x44a84000 prp2 0x0 num_prps 2
pci_nvme_map_addr addr 0x44a84000 len 4096
pci_nvme_enqueue_req_completion cid 2864 cqid 0 dw0 0x0 dw1 0x0 status 0x0
pci_nvme_irq_msix raising MSI-X IRQ vector 0
pci_nvme_mmio_write addr 0x1004 data 0x10 size 4
pci_nvme_mmio_doorbell_cq cqid 0 new_head 16
pci_nvme_mmio_write addr 0x1008 data 0x1 size 4
pci_nvme_mmio_doorbell_sq sqid 1 new_tail 1
pci_nvme_io_cmd cid 32770 nsid 0x1 sqid 1 opc 0x2 opname 'NVME_NVM_CMD_READ'
pci_nvme_read cid 32770 nsid 1 nlb 8 count 4096 lba 0x0
pci_nvme_map_prp trans_len 4096 len 4096 prp1 0x44879000 prp2 0x0 num_prps 2
pci_nvme_map_addr addr 0x44879000 len 4096
pci_nvme_rw_cb cid 32770 blk 'd0'
pci_nvme_rw_complete_cb cid 32770 blk 'd0'
pci_nvme_enqueue_req_completion cid 32770 cqid 1 dw0 0x0 dw1 0x0 status 0x0
pci_nvme_irq_msix raising MSI-X IRQ vector 1
pci_nvme_mmio_write addr 0x100c data 0x1 size 4
pci_nvme_mmio_doorbell_cq cqid 1 new_head 1
pci_nvme_mmio_write addr 0x1008 data 0x2 size 4
pci_nvme_mmio_doorbell_sq sqid 1 new_tail 2

trace log (arm64be, bad, qemu v7.2):

pci_nvme_admin_cmd cid 5184 sqid 0 opc 0x6 opname 'NVME_ADM_CMD_IDENTIFY'
pci_nvme_identify cid 5184 cns 0x5 ctrlid 0 csi 0x0
pci_nvme_identify_ns_csi nsid=1, csi=0x0
pci_nvme_map_prp trans_len 4096 len 4096 prp1 0x44e56000 prp2 0x0 num_prps 2
pci_nvme_map_addr addr 0x44e56000 len 4096
pci_nvme_enqueue_req_completion cid 5184 cqid 0 dw0 0x0 dw1 0x0 status 0x0
pci_nvme_update_sq_eventidx sqid 0 new_eventidx 18
pci_nvme_update_sq_tail sqid 0 new_tail 18
pci_nvme_update_cq_eventidx cqid 0 new_eventidx 16
pci_nvme_update_cq_head cqid 0 new_head 16
pci_nvme_irq_msix raising MSI-X IRQ vector 0
pci_nvme_mmio_write addr 0x1004 data 0x11 size 4
pci_nvme_mmio_doorbell_cq cqid 0 new_head 17
pci_nvme_mmio_write addr 0x1010 data 0x1 size 4
pci_nvme_mmio_doorbell_sq sqid 2 new_tail 1
pci_nvme_update_sq_tail sqid 2 new_tail 0
pci_nvme_io_cmd cid 16384 nsid 0x1 sqid 2 opc 0x2 opname 'NVME_NVM_CMD_READ'
pci_nvme_read cid 16384 nsid 1 nlb 8 count 4096 lba 0x0
pci_nvme_map_prp trans_len 4096 len 4096 prp1 0x44cea000 prp2 0x0 num_prps 2
pci_nvme_map_addr addr 0x44cea000 len 4096
pci_nvme_update_sq_eventidx sqid 2 new_eventidx 0
pci_nvme_update_sq_tail sqid 2 new_tail 0
pci_nvme_io_cmd cid 0 nsid 0x0 sqid 2 opc 0x0 opname 'NVME_NVM_CMD_FLUSH'
pci_nvme_enqueue_req_completion cid 0 cqid 2 dw0 0x0 dw1 0x0 status 0x400b
pci_nvme_err_req_status cid 0 nsid 0 status 0x400b opc 0x0
pci_nvme_update_sq_eventidx sqid 2 new_eventidx 0
pci_nvme_update_sq_tail sqid 2 new_tail 0

[flush command repeated many times]

Guenter

