Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273D2667887
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:05:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyXu-0007ta-SG; Thu, 12 Jan 2023 09:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pFyXq-0007pq-Nt; Thu, 12 Jan 2023 09:27:07 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pFyXo-0001jK-Ad; Thu, 12 Jan 2023 09:27:06 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 y18-20020a0568301d9200b0067082cd4679so10655897oti.4; 
 Thu, 12 Jan 2023 06:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KHn0R/VoBgdRZZXGvJW+csIBEpLzve9yFtzNraGAOmA=;
 b=TuA3j0RTbKiPoD+0NIifbaQAQMSPBP20o6tcDBeimW5Fz1SU9iy3KgoLsT0+iAHDe1
 Z87cxz5eOE2UFYFDQvlGeR9MBTna5VUukbXNoVQ3XBMqLPBAiyaQybw+cxCgp3oCl232
 Kxcv3gjeaBTu2C1Ht4a/z7OBJlKw+xBiMq+JEALbWDdfhtzwlkUtFAm0nauIyMu+qJ1F
 m3aVTW+gVm8SBO7K2I24mPHvAVdcMYLwf7ls2Cogo52pixav/+/P25U1kxvsdMRTqkFl
 wyCL8rVrD0hJ1vTR/Vyp8aPQXgW8DKcTN6n+WgSbfF/niiJ+xd1u6ol11pu/R7hwbkye
 zXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KHn0R/VoBgdRZZXGvJW+csIBEpLzve9yFtzNraGAOmA=;
 b=mLGST5qMHkY4h5DMsKTJn24m4P1WZ+HT/Gy2o7hVWuCtt7TZkwwxQB4tZ+Et8ahWT/
 JQQuHVTd1j97H8/TSf0/Z9opO2uJGMh5goIqhtGwXnzz8HloWFRVR2PFOo6bgR/iBsEc
 gSTljWp114NX861f+TxcHMoxNiMqpAQwOR3oQHF3LXaARF3dxw0/w+zL1HHakzEXrYS9
 PF67BM8pjhSY9q7M20LoFi3T0lb8llXdl3G1qofsuoNiuSehF/DgPbq3e35Sk7qzbhDw
 gQXqj9BmAMdZFqv7r8tu2aV1dGLhiI2mRg5fWKVhSQV8Cc1d4IwZIl9bqgyytqZ2xsqY
 QySQ==
X-Gm-Message-State: AFqh2kq4zK3z1VIEKNde2CU97ct8vNjESHKEt3SUPORsgq3GPV8O7i+l
 oAYKs6iuR5bOW44iENUnWrI=
X-Google-Smtp-Source: AMrXdXv59qMv101vL3nhNReRXmOvurbTwEVzJCY1gxJGCbnPy1iiiRoxWP2YEtdjmxtSO59XjezMdQ==
X-Received: by 2002:a9d:187:0:b0:666:e1b0:8ecb with SMTP id
 e7-20020a9d0187000000b00666e1b08ecbmr37881512ote.29.1673533622059; 
 Thu, 12 Jan 2023 06:27:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s40-20020a05683043a800b00684bc23f2cfsm1911721otv.32.2023.01.12.06.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 06:27:01 -0800 (PST)
Message-ID: <276fc1fd-87f8-e459-c9dc-8e4cf26a9f86@roeck-us.net>
Date: Thu, 12 Jan 2023 06:26:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <Y8AG21o/9/3eUMIg@cormorant.local>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
In-Reply-To: <Y8AG21o/9/3eUMIg@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.067, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/12/23 05:10, Klaus Jensen wrote:
> Hi all (linux-nvme, qemu-devel, maintainers),
> 
> On QEMU riscv64, which does not use MSI/MSI-X and thus relies on
> pin-based interrupts, I'm seeing occasional completion timeouts, i.e.
> 
>    nvme nvme0: I/O 333 QID 1 timeout, completion polled
> 
> To rule out issues with shadow doorbells (which have been a source of
> frustration in the past), those are disabled. FWIW I'm also seeing the
> issue with shadow doorbells.
> 
> 	diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> 	index f25cc2c235e9..28d8e7f4b56c 100644
> 	--- a/hw/nvme/ctrl.c
> 	+++ b/hw/nvme/ctrl.c
> 	@@ -7407,7 +7407,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
> 	     id->mdts = n->params.mdts;
> 	     id->ver = cpu_to_le32(NVME_SPEC_VER);
> 	     id->oacs =
> 	-        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF);
> 	+        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
> 	     id->cntrltype = 0x1;
> 
> 	     /*
> 
> 
> I captured a trace from QEMU when this happens:
> 
> pci_nvme_mmio_write addr 0x1008 data 0x4e size 4
> pci_nvme_mmio_doorbell_sq sqid 1 new_tail 78
> pci_nvme_io_cmd cid 4428 nsid 0x1 sqid 1 opc 0x2 opname 'NVME_NVM_CMD_READ'
> pci_nvme_read cid 4428 nsid 1 nlb 32 count 16384 lba 0x1324
> pci_nvme_map_prp trans_len 4096 len 16384 prp1 0x80aca000 prp2 0x82474100 num_prps 5
> pci_nvme_map_addr addr 0x80aca000 len 4096
> pci_nvme_map_addr addr 0x80ac9000 len 4096
> pci_nvme_map_addr addr 0x80ac8000 len 4096
> pci_nvme_map_addr addr 0x80ac7000 len 4096
> pci_nvme_io_cmd cid 4429 nsid 0x1 sqid 1 opc 0x2 opname 'NVME_NVM_CMD_READ'
> pci_nvme_read cid 4429 nsid 1 nlb 224 count 114688 lba 0x1242
> pci_nvme_map_prp trans_len 4096 len 114688 prp1 0x80ae6000 prp2 0x82474000 num_prps 29
> pci_nvme_map_addr addr 0x80ae6000 len 4096
> pci_nvme_map_addr addr 0x80ae5000 len 4096
> pci_nvme_map_addr addr 0x80ae4000 len 4096
> pci_nvme_map_addr addr 0x80ae3000 len 4096
> pci_nvme_map_addr addr 0x80ae2000 len 4096
> pci_nvme_map_addr addr 0x80ae1000 len 4096
> pci_nvme_map_addr addr 0x80ae0000 len 4096
> pci_nvme_map_addr addr 0x80adf000 len 4096
> pci_nvme_map_addr addr 0x80ade000 len 4096
> pci_nvme_map_addr addr 0x80add000 len 4096
> pci_nvme_map_addr addr 0x80adc000 len 4096
> pci_nvme_map_addr addr 0x80adb000 len 4096
> pci_nvme_map_addr addr 0x80ada000 len 4096
> pci_nvme_map_addr addr 0x80ad9000 len 4096
> pci_nvme_map_addr addr 0x80ad8000 len 4096
> pci_nvme_map_addr addr 0x80ad7000 len 4096
> pci_nvme_map_addr addr 0x80ad6000 len 4096
> pci_nvme_map_addr addr 0x80ad5000 len 4096
> pci_nvme_map_addr addr 0x80ad4000 len 4096
> pci_nvme_map_addr addr 0x80ad3000 len 4096
> pci_nvme_map_addr addr 0x80ad2000 len 4096
> pci_nvme_map_addr addr 0x80ad1000 len 4096
> pci_nvme_map_addr addr 0x80ad0000 len 4096
> pci_nvme_map_addr addr 0x80acf000 len 4096
> pci_nvme_map_addr addr 0x80ace000 len 4096
> pci_nvme_map_addr addr 0x80acd000 len 4096
> pci_nvme_map_addr addr 0x80acc000 len 4096
> pci_nvme_map_addr addr 0x80acb000 len 4096
> pci_nvme_rw_cb cid 4428 blk 'd0'
> pci_nvme_rw_complete_cb cid 4428 blk 'd0'
> pci_nvme_enqueue_req_completion cid 4428 cqid 1 dw0 0x0 dw1 0x0 status 0x0
> [1]: pci_nvme_irq_pin pulsing IRQ pin
> pci_nvme_rw_cb cid 4429 blk 'd0'
> pci_nvme_rw_complete_cb cid 4429 blk 'd0'
> pci_nvme_enqueue_req_completion cid 4429 cqid 1 dw0 0x0 dw1 0x0 status 0x0
> [2]: pci_nvme_irq_pin pulsing IRQ pin
> [3]: pci_nvme_mmio_write addr 0x100c data 0x4d size 4
> [4]: pci_nvme_mmio_doorbell_cq cqid 1 new_head 77
> ---- TIMEOUT HERE (30s) ---
> [5]: pci_nvme_mmio_read addr 0x1c size 4
> [6]: pci_nvme_mmio_write addr 0x100c data 0x4e size 4
> [7]: pci_nvme_mmio_doorbell_cq cqid 1 new_head 78
> --- Interrupt deasserted (cq->tail == cq->head)
> [   31.757821] nvme nvme0: I/O 333 QID 1 timeout, completion polled
> 
> Following the timeout, everything returns to "normal" and device/driver
> happily continues.
> 
> The pin-based interrupt logic in hw/nvme seems sound enough to me, so I
> am wondering if there is something going on with the kernel driver (but
> I certainly do not rule out that hw/nvme is at fault here, since
> pin-based interrupts has also been a source of several issues in the
> past).
> 
> What I'm thinking is that following the interrupt in [1], the driver
> picks up completion for cid 4428 but does not find cid 4429 in the queue
> since it has not been posted yet. Before getting a cq head doorbell
> write (which would cause the pin to be deasserted), the device posts the
> completion for cid 4429 which just keeps the interrupt asserted in [2].
> The trace then shows the cq head doorbell update in [3,4] for cid 4428
> and then we hit the timeout since the driver is not aware that cid 4429
> has been posted in between this (why is it not aware of this?) Timing
> out, the driver then polls the queue and notices cid 4429 and updates
> the cq head doorbell in [5-7], causing the device to deassert the
> interrupt and we are "back in shape".
> 
> I'm observing this on 6.0 kernels and v6.2-rc3 (have not tested <6.0).
> Tested on QEMU v7.0.0 (to rule out all the shadow doorbell
> optimizations) as well as QEMU nvme-next (infradead). In other words,
> it's not a recent regression in either project and potentially it has
> always been like this. I've not tested other platforms for now, but I
> would assume others using pin-based interrupts would observe the same.
> 
> Any ideas on how to shed any light on this issue from the kernel side of
> things?


I have no idea what causes the problem, but I have seen this forever
in my testing. I have seen it with various architectures. Some architectures
are affected more than others. For example, I don't test nvme boots on mips
platforms because the problem is quite notorious there.

Guenter


