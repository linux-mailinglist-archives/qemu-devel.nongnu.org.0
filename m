Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AE58ABB2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:36:32 +0200 (CEST)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJxV8-0006gO-UO
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJxTZ-0005Jt-4r
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oJxTW-0003pJ-Dt
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659706489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEMVMrJZx7N5wR34FR3DduQoeO/gJoUdHi8O/OCglB8=;
 b=fKjTF/kA6Ap4956i1RiSaq+l8EURFamQryz9d2+TG2R+sFAMp/zk73BL3OjMS8Yj+7JO31
 6aXjdYbFr2ZzJBUbAgSAKQePNH5LbmINF/f8vqMoWB2t1S8xFNgSuykkws+I/SL8SRGsD0
 VjkOnjWAkzVlFszzYF532MGpyV8YkBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-A3ytM7WUPsirwl4Izi0EFQ-1; Fri, 05 Aug 2022 09:34:45 -0400
X-MC-Unique: A3ytM7WUPsirwl4Izi0EFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1289985A581;
 Fri,  5 Aug 2022 13:34:45 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51DC7C15D4F;
 Fri,  5 Aug 2022 13:34:41 +0000 (UTC)
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-efi@vger.kernel.org
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
 <Yu0RX2b+e9BpGsJ6@zx2c4.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <fa0601e4-acf5-0ce8-9277-4d90d046b53e@redhat.com>
Date: Fri, 5 Aug 2022 15:34:39 +0200
MIME-Version: 1.0
In-Reply-To: <Yu0RX2b+e9BpGsJ6@zx2c4.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/05/22 14:47, Jason A. Donenfeld wrote:
> Hi Paolo,
> 
> On Fri, Aug 05, 2022 at 10:10:02AM +0200, Paolo Bonzini wrote:
>> On 8/5/22 01:04, Jason A. Donenfeld wrote:
>>> +    /* Nothing else uses this part of the hardware mapped region */
>>> +    setup_data_base = 0xfffff - 0x1000;
>>
>> Isn't this where the BIOS lives?  I don't think this works.
> 
> That's the segment dedicated to ROM and hardware mapped addresses. So
> that's a place to put ROM material. No actual software will use it.

... accordingly (I think), when the guest tries to read it, it will see the ROM MemoryRegion that QEMU places there, not RAM contents.

"info mtree" QEMU monitor command output (excerpt), while OVMF is in the Boot Device Selection phase (well, I left it waiting in the Setup TUI):

address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-000000007fffffff (prio 0, ram): alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
    0000000000000000-ffffffffffffffff (prio -1, i/o): pci
      00000000000a0000-00000000000affff (prio 2, ram): alias vga.chain4 @vga.vram 0000000000000000-000000000000ffff
      00000000000a0000-00000000000bffff (prio 1, i/o): vga-lowmem
      00000000000c0000-00000000000dffff (prio 1, rom): pc.rom
      00000000000e0000-00000000000fffff (prio 1, rom): isa-bios

flat view ("info mtree -f"):

FlatView #1
 AS "memory", root: system
 AS "cpu-memory-0", root: system
 AS "cpu-memory-1", root: system
 AS "cpu-memory-2", root: system
 AS "cpu-memory-3", root: system
 AS "mch", root: bus master container
 AS "ICH9-LPC", root: bus master container
 AS "ich9-ahci", root: bus master container
 AS "ICH9-SMB", root: bus master container
 AS "pcie-root-port", root: bus master container
 AS "pcie-root-port", root: bus master container
 AS "pcie-root-port", root: bus master container
 AS "pcie-root-port", root: bus master container
 AS "pcie-root-port", root: bus master container
 AS "qemu-xhci", root: bus master container
 AS "virtio-scsi-pci", root: bus master container
 AS "virtio-serial-pci", root: bus master container
 AS "virtio-net-pci", root: bus master container
 AS "VGA", root: bus master container
 AS "virtio-balloon-pci", root: bus master container
 AS "virtio-rng-pci", root: bus master container
 Root memory region: system
  0000000000000000-000000000002ffff (prio 0, ram): pc.ram KVM
  0000000000030000-000000000004ffff (prio 1, i/o): smbase-blackhole
  0000000000050000-000000000009ffff (prio 0, ram): pc.ram @0000000000050000 KVM
  00000000000a0000-00000000000affff (prio 1, ram): vga.vram KVM
  00000000000b0000-00000000000bffff (prio 1, i/o): vga-lowmem @0000000000010000
  00000000000c0000-00000000000c3fff (prio 0, rom): pc.ram @00000000000c0000 KVM
  00000000000c4000-00000000000dffff (prio 1, rom): pc.rom @0000000000004000 KVM
  00000000000e0000-00000000000fffff (prio 1, rom): isa-bios KVM


Laszlo


