Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CC036472C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:30:01 +0200 (CEST)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVqa-0004K2-CZ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lYVpI-0003Ib-Dw
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:28:40 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:59802
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lYVpF-0007Fo-WB
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 11:28:40 -0400
Received: from mobile-149-057.wlan.uni-mannheim.de
 (mobile-149-057.wlan.uni-mannheim.de [134.155.149.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 927FADA048C;
 Mon, 19 Apr 2021 17:28:35 +0200 (CEST)
To: Bug 1924912 <1924912@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <161875180735.23175.14682430598239905387.malonedeb@wampee.canonical.com>
 <b48d2719-d334-2c16-be32-f3df52d415c7@vivier.eu>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [Bug 1924912] VirtIO drivers don't work on Windows: "GLib: Too
 many handles to wait for!" crash
Message-ID: <1198818a-4e33-e230-9e4d-7e1926900383@weilnetz.de>
Date: Mon, 19 Apr 2021 17:28:32 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b48d2719-d334-2c16-be32-f3df52d415c7@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.04.21 um 16:30 schrieb Laurent Vivier:

> Le 19/04/2021 =C3=A0 12:39, Stefan Weil a =C3=A9crit=C2=A0:
>> I can confirm the issue also with latest official QEMU sources.
>>
>> Related issue URLs:
>>
>> https://github.com/tesseract-ocr/tesseract/issues/2838
>>
>> https://bugs.launchpad.net/qemu/+bug/1924912
>>
>> Instructions and files required to reproduce the issue:
>>
>> https://qemu.weilnetz.de/test/bugs/1924912/
>>
>> Michael, Laurent, maybe you have an idea how to narrow down this issue=
?
> Could it be related to the number of file descriptors that can differ
> between linux an windows?
>
> We have a series of patches that sets the number of queues to the numbe=
r
> of vCPU:
>
> a4eef0711b2c vhost-user-blk-pci: default num_queues to -smp N
> 9445e1e15e66 virtio-blk-pci: default num_queues to -smp N
> 6a558822849f virtio-scsi-pci: default num_queues to -smp N
> 4e5163bd8444 virtio-scsi: introduce a constant for fixed virtqueues
> 1436f32a84c3 virtio-pci: add virtio_pci_optimal_num_queues() helper
>
> And I think it can have inpact on the number of open file descriptors.
>
> You can try by specifiying "num_queues=3D1" with the virtio interfaces =
on the QEMU command line.
> (ot choose a machine type earlier than 5.2)
>
> Thanks,
> Laurent

I tried different machine types. That did not help.

The full command line which did not work was this one:

qemu-system-i386 -s -m 512M -cpu max -d guest_errors -smp 2 -device=20
VGA,vgamem_mb=3D64 -drive file=3D_disk_image,format=3Draw,index=3D0,media=
=3Ddisk=20
-device ich9-ahci -usb -device virtio-serial -chardev=20
stdio,id=3Dstdout,mux=3Don -device virtconsole,chardev=3Dstdout -device=20
isa-debugcon,chardev=3Dstdout -device virtio-rng-pci -soundhw pcspk=20
-device sb16 -netdev=20
user,id=3Dbreh,hostfwd=3Dtcp:127.0.0.1:8888-10.0.2.15:8888,hostfwd=3Dtcp:=
127.0.0.1:8823-10.0.2.15:23,hostfwd=3Dtcp:127.0.0.1:8000-10.0.2.15:8000,h=
ostfwd=3Dtcp:127.0.0.1:2222-10.0.2.15:22=20
-device e1000,netdev=3Dbreh -kernel Kernel/Kernel -append hello

QEMU works nicely when I remove "-device virtio-serial" and "-device=20
virtconsole,chardev=3Dstdout" from that command line. How would I have to=20

modify those arguments to limit the number of queues?

Thanks,

Stefan



