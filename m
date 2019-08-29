Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6067A144D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 11:05:14 +0200 (CEST)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3GMj-0004Ef-Kf
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 05:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jing2.liu@linux.intel.com>) id 1i3GJv-0002AG-QM
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 05:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jing2.liu@linux.intel.com>) id 1i3GJu-0001MC-Hk
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 05:02:19 -0400
Received: from mga07.intel.com ([134.134.136.100]:16861)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jing2.liu@linux.intel.com>)
 id 1i3GJu-0001AO-0x
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 05:02:18 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 02:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="264926291"
Received: from liujing-mobl.ccr.corp.intel.com (HELO [10.238.129.23])
 ([10.238.129.23])
 by orsmga001.jf.intel.com with ESMTP; 29 Aug 2019 02:02:03 -0700
To: Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, rth@twiddle.net,
 ehabkost@redhat.com, maran.wilson@oracle.com, sgarzare@redhat.com,
 kraxel@redhat.com
References: <20190702121106.28374-1-slp@redhat.com>
From: Jing Liu <jing2.liu@linux.intel.com>
Message-ID: <879c7f68-95a3-3bf6-cba8-d3465770d399@linux.intel.com>
Date: Thu, 29 Aug 2019 17:02:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190702121106.28374-1-slp@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-devel] [PATCH v3 0/4] Introduce the microvm machine type
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Sergio,

The idea is interesting and I tried to launch a guest by your
guide but seems failed to me. I tried both legacy and normal modes,
but the vncviewer connected and told me that:
The vm has no graphic display device.
All the screen in vnc is just black.

kernel config:
CONFIG_KVM_MMIO=y
CONFIG_VIRTIO_MMIO=y

I don't know if any specified kernel version/patch/config
is needed or anything I missed.
Could you kindly give some tips?

Thanks very much.
Jing



> A QEMU instance with the microvm machine type can be invoked this way:
> 
>   - Normal mode:
> 
> qemu-system-x86_64 -M microvm -m 512m -smp 2 \
>   -kernel vmlinux -append "console=hvc0 root=/dev/vda" \
>   -nodefaults -no-user-config \
>   -chardev pty,id=virtiocon0,server \
>   -device virtio-serial-device \
>   -device virtconsole,chardev=virtiocon0 \
>   -drive id=test,file=test.img,format=raw,if=none \
>   -device virtio-blk-device,drive=test \
>   -netdev tap,id=tap0,script=no,downscript=no \
>   -device virtio-net-device,netdev=tap0
> 
>   - Legacy mode:
> 
> qemu-system-x86_64 -M microvm,legacy -m 512m -smp 2 \
>   -kernel vmlinux -append "console=ttyS0 root=/dev/vda" \
>   -nodefaults -no-user-config \
>   -drive id=test,file=test.img,format=raw,if=none \
>   -device virtio-blk-device,drive=test \
>   -netdev tap,id=tap0,script=no,downscript=no \
>   -device virtio-net-device,netdev=tap0 \
>   -serial stdio
> 

