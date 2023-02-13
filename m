Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF4694D31
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:46:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbyD-0004Uz-2q; Mon, 13 Feb 2023 11:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <majosaheb@gmail.com>)
 id 1pRbxj-0004La-1A
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:45:55 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <majosaheb@gmail.com>)
 id 1pRbxe-0004GA-27
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:45:54 -0500
Received: by mail-wr1-x431.google.com with SMTP id m10so3997574wrn.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uegmIaqx4WlofoUIygpY49tjwD81S0oXx+VTVTulg0U=;
 b=pW+TQJrpP2FemyjURKu7U8SobwiJ4+YdI63tF2njWymCpW/JTdTtZxcTsxOC0FRt+c
 3ut6MXHGTlGTDNM3igIcxlj5DmGW5OsRJTws/gebg3unU2+YZUKI7mBwI/yrMlHZOLfV
 y+0GMQtTrLKiaWEvxkzHsODhcIJepzk5cfVDamdaKZxCjUTUfgwLDBLQirf7OCgbw6SQ
 huHA6Z9ksFy44ORJJKxHtFpISU8LSCMbuhKa9uNc3KtrwGmU5/tFRT6ugRR6iZ33tfPl
 6fW/OTNt6UKy/T6le1kUF9Z9sXb5z+Yh3lByd26GSmySsfWfn+s7NW7UGefv0qgFynyW
 m/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uegmIaqx4WlofoUIygpY49tjwD81S0oXx+VTVTulg0U=;
 b=2mchif6LQkYk9zDWi+99IIvOsr8PHYeAB3whjXhD+EdlIfdYBCKkrIKOn44LNcD59W
 VBS95BzvahFJDGJwz2nGZqy8Y/SN5HkJDTM8MGQA7TeW0YRX6fRVimEHhA9Aoinp2kEC
 x7sfmAKLRhdpT8CyLo8bjlRfUcqLpMmOz2SYL5mn+agGblcmtB+1HR69JCHlBZLTxUlW
 s7al5pOBQ4WZBRfSEAZ9vsv/9MKA2UV4DWnT5Dj4IH9BXKBFgLo+F32WS6d9W660PiSa
 SUwWc3/jVXTKCUByOKSTRs5uUmWh735NSAsNCwcbjpVGKIoJ0Uz7tNIi9fPP5Dm9k86q
 M3VQ==
X-Gm-Message-State: AO0yUKXUiKNbf92iaU6PxYvpOa6vxFAKWR6yuNNfff55FE730tq9T7yd
 qjoXQDvOFBWbX1EUWQdcyvl0dIsg9fcV3yYXKPXRBcaEg0s=
X-Google-Smtp-Source: AK7set+KKqje6OsViRNc8jo6CZ1BTVmonGnrN+2YJs1WWmW7GPGMmiigV1plJnHJGAR/YX6kaksvA94ejO/oolGWHDw=
X-Received: by 2002:adf:f40f:0:b0:2c5:4c8e:70b4 with SMTP id
 g15-20020adff40f000000b002c54c8e70b4mr506096wro.549.1676306746105; Mon, 13
 Feb 2023 08:45:46 -0800 (PST)
MIME-Version: 1.0
From: Major Saheb <majosaheb@gmail.com>
Date: Mon, 13 Feb 2023 22:15:34 +0530
Message-ID: <CANBBZXMpWOj5fE2YF8XGvWmBtbc=9YKiMCSfUKC7AoP5Ros9QA@mail.gmail.com>
Subject: DMAR fault with qemu 7.2 and Ubuntu 22.04 base image
To: Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, peterx@redhat.com, 
 Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=majosaheb@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi All,

I am facing an issue with qemu 7.2 rc2 with nvme. I have a container
running Ubuntu 22.04 base image and host is running Ubuntu 22.04
(Linux node-1 5.15.0-60-generic #66-Ubuntu SMP Fri Jan 20 14:29:49 UTC
2023 x86_64 x86_64 x86_64 GNU/Linux), and I am using vfio-pci to
communicate with nvme devices. I am observing DMAR fault as following

[ 3761.999996] DMAR: DRHD: handling fault status reg 2
[ 3762.001609] DMAR: [DMA Read NO_PASID] Request device [0b:00.0]
fault addr 0x1187a9000 [fault reason 0x06] PTE Read access is not set

I also enabled vtd_iommu_translate and vtd_dmar_fault traces which is
showing the following

2023-02-13T07:02:37.074397Z qemu-system-x86_64: vtd_iova_to_slpte:
detected slpte permission error (iova=0x1187a9000, level=0x3,
slpte=0x0, write=0, pasid=0xffffffff)
236498@1676271757.075075:vtd_dmar_fault sid 0xb00 fault 6 addr
0x1187a9000 write 0
2023-02-13T07:02:37.075174Z qemu-system-x86_64: vtd_iommu_translate:
detected translation failure (dev=0b:00:00, iova=0x1187a9000)

It seems 'vtd_iova_to_slpte()' it is returning 0 slpte resulting this
issue. In our driver code (which is running in a container) we are
using 0x800000000 as our IOVA base address. We have 10 nvme devices
that we are initializing, and we start initialization by sending
identify controller and get log page commands. Observation is
sometimes the first device is getting DMAR fault, sometimes first is
successfully completed identify and get log page, and second device is
getting DMAR fault. Also if I use Ubuntu 20.04 as base image for the
container, then this issue is not seens as seen in the following trace
output

278365@1676297375.587477:vtd_dmar_slpte sid 0xb00 slpte 0x1f2556003
addr 0x800000000 write 0
278365@1676297375.587513:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
278365@1676297375.587527:vtd_dmar_slpte sid 0xb00 slpte 0x1f25fc003
addr 0x80020a000 write 1
278365@1676297375.587532:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x80020a000 -> gpa 0x1f25fc000 mask 0xfff
278365@1676297375.587566:vtd_dmar_slpte sid 0xb00 slpte 0x1f2560003
addr 0x800008000 write 1
278365@1676297375.587572:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
278365@1676297375.587814:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
278365@1676297375.587850:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
278365@1676297375.588455:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
278365@1676297375.588473:vtd_dmar_slpte sid 0xb00 slpte 0x1f25fe003
addr 0x80020b000 write 1
278365@1676297375.588479:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x80020b000 -> gpa 0x1f25fe000 mask 0xfff
278365@1676297375.588507:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
278365@1676297375.588737:vtd_dmar_translate pasid 0xffffffff: dev
0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff

Following is the partial qemu command line that I am using

-device intel-iommu,intremap=on,caching-mode=on,eim=on,device-iotlb=on,aw-bits=48

-device pcie-root-port,id=pcie-root-port0,slot=1 -drive
file=/home/raghu/lfd/datadir/rs-bdc0/storage/rs-bdc0-0-0,format=qcow2,cache=unsafe,if=none,id=NVME0
-device nvme,serial=rs-bdc0-0_0,id=NVME0,bus=pcie-root-port0 -device
nvme-ns,drive=NVME0,eui64=0,uuid=30303030-3030-3030-3030-303030303030

cat /proc/cmdline
BOOT_IMAGE=/boot/vmlinuz-5.15.0-60-generic
root=UUID=102c974c-7a1c-49cf-9bdd-a8e4638cf5c4 ro console=ttyS0,115200
intel_iommu=on iommu=pt

I have also tried without 'iommu=pt' producing same result in Ubuntu
22.04 base image in container, also the host OS version remains same
in both cases.

-R

