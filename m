Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4E339D88D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 11:21:11 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqBRV-0001j4-Mr
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 05:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lqBQA-0000r8-O4
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 05:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lqBQ8-0005aT-AU
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 05:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623057583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFdNlErOxTqFKbmwI105aIqMjRySxdMaBEh8q3km9rs=;
 b=UvsVwNC6WOvBg1N2HhdSCkFHoQovpfcqQ7xEvnErrnPP2iBriMQQFDJyOhkztiuezKhGlp
 LQNyS3cAsPirDYRxNCRE4m+K1JjL6r3Xhj1GGl5Sn7onqAEbSiJ1IhlM4xq0BsHduQTmqx
 RL6KRnwvVib0gRE4uyMtrM6fiKSrCUw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-Bdatbe7xOw-dLTia6nuyMQ-1; Mon, 07 Jun 2021 05:19:42 -0400
X-MC-Unique: Bdatbe7xOw-dLTia6nuyMQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so7600348wrs.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 02:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=bFdNlErOxTqFKbmwI105aIqMjRySxdMaBEh8q3km9rs=;
 b=XmkbPpYzluPxDumdrb8QrSbAWX1dEKrU4G8Rv5WYLY1HhyruID2iaZaHS9k3P6Nlx8
 F9Wd7ui7xFO2FBMYRsgzSG1E1X3rKsm6ExbpkFCQyZYhuVk6hUY00ADlKdlWN2obbKTy
 QZgE5sAdvD9UQpZMkWn/UdUq3FvefP4052Dh0eIOR5wX+rdIvpvlaQDh4C00eholajvU
 tpzw9LIyUPgIJW+zOj0XI1IxPzEQzC67efrwMtMbNkog+GhR7uWPnlF9X/QwBeSLmRUO
 LZGOO4JKLN4r9JNRoEX4QtgZ+mT66tBqOSOD+OGgQpH7H3OohsAqYNHS1jfPZvwW5VIH
 1i0g==
X-Gm-Message-State: AOAM532CUNZLPncD56z8w/c3LBqqLHUSwZv3y7ND2tyWpe3LwZXrzBKG
 CGFPgN267BnxrNkd3spCEdTtLdEGoa6Ds1qkxfAWlsk5Q41S2Gzg1Q+rWIQbilXOlGxrnEo2gIN
 Gsyej2FwuwVnbxb4=
X-Received: by 2002:a5d:6443:: with SMTP id d3mr16301436wrw.389.1623057581400; 
 Mon, 07 Jun 2021 02:19:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyCHznnakSW+xXXw/5ZBi9nqwVSp4xPGtJItzytlxZknu745IScFJpNUNmz8XinMrMa7r3Hw==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr16301411wrw.389.1623057581065; 
 Mon, 07 Jun 2021 02:19:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r7sm21072609wma.9.2021.06.07.02.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 02:19:40 -0700 (PDT)
Subject: Re: [RESEND] Multiple SMMUv3 instances on PCI Bus and PCI Host Bridge
To: Nicolin Chen <nicolinc@nvidia.com>, miaoyubo@huawei.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20210604231613.GC15599@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a349744d-762b-74b9-352b-ad0a7b16dfec@redhat.com>
Date: Mon, 7 Jun 2021 11:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604231613.GC15599@Asurada-Nvidia>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: vdumpa@nvidia.com, praithatha@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
On 6/5/21 1:16 AM, Nicolin Chen wrote:
> (Resending as my previous mail didn't go through mailing lists)
>
> Hello Eric, Yubo, and other QEMU developers,
>
> I am having a problem with links between vSMMU and PCI Host Bridge,
> using ARM-VIRT (64-bit; ACPI) + SMMUv3 (nested translation) setup.
>
> Firstly, I am very new to the areas of QEMU, PCI and ACPI. So some
> of my thoughts/ideas below might not sound very reasonable to you.
>
> My goal here is to create two vSMMU instances in QEMU level and to
> link them to different passthrough devices: each vSMMU has my local
> feature that reads/writes through a VFIO mdev interface to talk to
> Host OS, so it has to be two vSMMU instances in the QEMU level for
> my use case.
>
> As we know, QEMU by default has only one PCI root bus (PCIE.0) that
> links to a default vSMMU (let's call it vSMMU0). And I learned that
> now ARM-VIRT has PCI gpex feature. So I was planning to create one
> host bridge (PCIE.128) to link to a different instance (vSMMU1) --
> later on I can pass through different PCI devices to either PCIE.0
> or PCIE.128 for different mdev pathways.
>
> I then tried to add a PCI Host Bridge using the following commands
> that created one default vSMMU instance, as my first experiment.
>
> /home/ubuntu/qemu-system-aarch64
>     -machine virt,accel=kvm,gic-version=3,iommu=smmuv3 \
>     -cpu host -smp cpus=1 -m 1G -nographic -monitor none -display none \
>     -kernel /boot/Image -bios /usr/share/AAVMF/AAVMF_CODE.fd \
>     -initrd /home/ubuntu/buildroot-20200422-aarch64-qemu-test-rootfs.cpio \
>     -object memory-backend-ram,size=1G,id=m0 \
>     -numa node,cpus=0,nodeid=0,memdev=m0 \
>     -device pxb-pcie,id=pxb-pcie.128,bus=pcie.0,bus_nr=128,numa_node=0 \
>     -device pcie-root-port,id=pcie.128,bus=pxb-pcie.128,slot=1,addr=0,io-reserve=0 \
>     -device vfio-pci,host=0003:01:00.0,rombar=0,bus=pcie.128
>
> However I found that PCIE.128 was also added to vSMMU0, which feels
> like that PCIE.128 treated PCIE.0 root bus as a parent device so it
> was added to the parent's vSMMU too.
>
> Then I tried another experiment with the following hack, hoping that
> it would link vSMMU0 to PCIE.128 instead of PCIE.0:
>
> @@ -385,13 +387,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* fully coherent device */
>      rc->memory_properties.cache_coherency = cpu_to_le32(1);
>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>      rc->pci_segment_number = bus_num; /* MCFG pci_segment */
> +    rc->pci_segment_number = cpu_to_le32(bus_num); /* MCFG pci_segment */
>
>      /* Identity RID mapping covering the whole input RID range */
>      idmap = &rc->id_mapping_array[0];
>      idmap->input_base = 0;
>      idmap->id_count = cpu_to_le32(0xFFFF);
> -    idmap->output_base = 0;
> +    idmap->output_base = cpu_to_le32(bus_num << 16);
>
> Yet, I found it's not successful either: the vSMMU instance was not
> added to either PCIE.0 or PCIE.128.
>
> So I started to have questions in my mind:
> (1) Can PCI host bridge (PCIE.128) add to a different vSMMU without
>     following PCIE.0's SMMU setup?
changes need to be made in hw/arm/virt.c
create_smmu() is passed the primary bus the iommu is attached to.
Currently arm virt only supports one smmu instance. So playing with qemu
options is not sufficient.
Besides that, effectively there are IORT changes needed because you need
to route RCs to the different SMMU instances, ie. some RIDs need to
reach SMMU#0 and others #SMMU#1.
You can get inspired of "[PATCH v4 6/8] hw/arm/virt-acpi-build: Add
explicit IORT idmap for smmuv3 node for this kind of changes."

Thanks

Eric
> (2) If the answer to (1) is yes, is there any way to have two pairs
>     of PCI+vSMMU?
> (3) If the answer to (1) is no, how can I correctly change the iort
>     table to link vSMMU to PCIE.128?
>
> Thanks
> Nic
>


