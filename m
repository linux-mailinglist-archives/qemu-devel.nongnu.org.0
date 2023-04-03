Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0976D45DC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:31:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKGq-0005ej-7r; Mon, 03 Apr 2023 09:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKGj-0005du-Q1
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:30:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKGg-0001ku-JT
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:30:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id y14so29383998wrq.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680528637;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8RAq1C4J2iaPDx5igIFbobAvzse3gq/IhVwAoAAAqI=;
 b=zCPklh9Ny68DWyUQsxlOXhFFX+3/IRrBovURkHDawjVq4VAN6IYhxa40cNOJxcJXzl
 Ai6Li5b6BZyyjOLE1XRRQlZQwtSdmNGabtl9YyUvJ26ouEXTgQWJejwlueQ3hxOnYcmD
 HG15EiGY65ftuCNPTc0vvclNzmVwIcydNdnjFAhSNOsXIDQWw26a9KLfYukWT6qZjgno
 ezOX/bfYQwljYVsOPO0uwtDHwox2co9mC/auGG5rjCLw2c3oPwUR4s8nj+W1OBXcTxF3
 JBK5LGNa2yCQ+Vi28+W6WbbKAZox7HkOvQ6wJLZAcEyG/xa2/Gw1Rlj2sx4Xf6JGSGqb
 0njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680528637;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z8RAq1C4J2iaPDx5igIFbobAvzse3gq/IhVwAoAAAqI=;
 b=00ONw2sUu/bXZGtU+XevamY6RswJ3ZJXfYW24CniQdI8ZzTgAwfkVRGwhy93Gb0f25
 tXxN6sAtnMU4/ewqcxVB/NVLGurJUupvx6FYVMN/4X3/QVQdcs6OtsTid6oJoO1kvNYw
 O2eKowMj7UqEL6pwLaY9Mu9EMpJA1EgR2RYpg/PAiI3sEME+BDXijlOVPWNwd17hwFd8
 WUzrHoVfw9qfrpRUJQflAv2hnkUcppEp4GS90FZXfYqRFwv28e/PKjxTQPXdMlFnUy1S
 2EVsswjQG1lpXkUjciUZ8g2Ao78uTHB5lNAYjpDdEboc/Ia9ICLGg92Pl76ePnJ16OCr
 DEvw==
X-Gm-Message-State: AAQBX9dmdTdtCUa8MGJiKCzv6UbVPCCsRdXfT/kxwDV4pDdkW4fBuYgW
 4Ug//iTuPoir9toG1yuNRW1Dkg==
X-Google-Smtp-Source: AKy350ZP+qVMrZ8DoBoA5Q2YX45hUKwfoFwkt+eyixja+xV7voH7rhwbxtfIEalmJi3ckt59Xqb27g==
X-Received: by 2002:a5d:538d:0:b0:2cf:e023:5915 with SMTP id
 d13-20020a5d538d000000b002cfe0235915mr24508471wrv.61.1680528637578; 
 Mon, 03 Apr 2023 06:30:37 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o18-20020adfe812000000b002daf0b52598sm9794576wrm.18.2023.04.03.06.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:30:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE9641FFB7;
 Mon,  3 Apr 2023 14:30:36 +0100 (BST)
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-5-alex.bennee@linaro.org>
 <871ql1lc2z.fsf@pond.sub.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Warner Losh
 <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>, Kevin Wolf
 <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Kyle
 Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, Michael
 Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH 04/11] qemu-options: finesse the recommendations around
 -blockdev
Date: Mon, 03 Apr 2023 14:16:36 +0100
In-reply-to: <871ql1lc2z.fsf@pond.sub.org>
Message-ID: <87mt3pm6tf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Markus Armbruster <armbru@redhat.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> We are a bit premature in recommending -blockdev/-device as the best
>> way to configure block devices, especially in the common case.
>> Improve the language to hopefully make things clearer.
>>
>> Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  qemu-options.hx | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 59bdf67a2c..9a69ed838e 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1143,10 +1143,14 @@ have gone through several iterations as the feat=
ure set and complexity
>>  of the block layer have grown. Many online guides to QEMU often
>>  reference older and deprecated options, which can lead to confusion.
>>=20=20
>> -The recommended modern way to describe disks is to use a combination of
>> +The most explicit way to describe disks is to use a combination of
>>  ``-device`` to specify the hardware device and ``-blockdev`` to
>>  describe the backend. The device defines what the guest sees and the
>> -backend describes how QEMU handles the data.
>> +backend describes how QEMU handles the data. The ``-drive`` option
>> +combines the device and backend into a single command line options
>> +which is useful in the majority of cases.
>
> -drive may look simpler from afar, but it really is a hot mess.  Sadly,
> we can't get rid of it until we find a replacement for configuring
> onboard block devices.  We might be able to clean it up some if we
> accept compatibility breaks.  A new convenience option would be less
> confusing, I guess.

This is only a partial revert of the original wording which others have
pointed out was a little too prescriptive. I believe the case of
snapshot was one where a pure device/blockdev command line is hard to
use.=20

>>                                            Older options like ``-hda``
>> +bake in a lot of assumptions from the days when QEMU was emulating a
>> +legacy PC, they are not recommended for modern configurations.
>>=20=20
>>  ERST
>
> These older options and the non-option argument are simple macros for
> -drive:
>
>     IMG-FILE                    -drive index=3D0,file=3DIMG-FILE,media=3D=
disk
>     -hda IMG-FILE               -drive index=3D0,file=3DIMG-FILE,media=3D=
disk
>     -hdb IMG-FILE               -drive index=3D1,file=3DIMG-FILE,media=3D=
disk
>     -hdc IMG-FILE               -drive index=3D2,file=3DIMG-FILE,media=3D=
disk
>     -hdd IMG-FILE               -drive index=3D3,file=3DIMG-FILE,media=3D=
disk
>     -cdrom IMG-FILE             -drive index=3D2,file=3DIMG-FILE,media=3D=
cdrom
>     -fda IMG-FILE               -drive if=3Dfloppy,index=3D0,file=3DIMG-F=
ILE
>     -fdb IMG-FILE               -drive if=3Dfloppy,index=3D1,file=3DIMG-F=
ILE
>     -mtdblock IMG-FILE          -drive if=3Dmtd,file=3DIMG-FILE
>     -sd IMG-FILE                -drive if=3Dsd,file=3DIMG-FILE
>     -pflash IMG-FILE            -drive if=3Dpflash,file=3DIMG-FILE
>
> What assumptions do you have in mind?

I was under the impression things like -hda wouldn't work say on an Arm
machine because you don't know what sort of interface you might be
using and -hda implies IDE. Where is this macro substitution done?

> I think you need at least Kevin's Acked-by for this.

In the ideal world I could convince the block maintainers to write a new
section to the manual that explains the theory behind the block
subsystem and how things interact and are put together. Until then this
is merely a sticking plaster to make the manual a little more
authoritative than then numerous example command lines our users blindly
copy from online blog posts.

Of course we could* always ask our new AI overlords:

  1. `qemu-system-x86_64 -drive file=3Ddisk.img,format=3Draw,if=3Dvirtio`
  In this command, we are running QEMU on an x86_64 CPU architecture and cr=
eating a virtual block device using the file `disk.img` as its storage. The=
 format of the file is set to `raw`, which means that it will be accessed d=
irectly as a block device. We are using the `virtio` interface to connect t=
he block device to the virtual machine.

  2. `qemu-system-x86_64 -drive file=3Ddisk.img,format=3Dqcow2,if=3Dvirtio`
  This command is similar to the first one, but the format of the `disk.img=
` file is set to `qcow2`. This means that the file is a disk image in the Q=
EMU Copy-On-Write format, which allows for more efficient storage of virtua=
l disks. We are still using the `virtio` interface to connect the device to=
 the VM.

  3. `qemu-system-x86_64 -drive file=3D/dev/sda,if=3Dvirtio`
  In this command, we are using a physical block device as the backend for =
the virtual block device. The device we are using is `/dev/sda`, which is t=
ypically the first hard disk on a Linux system. We are still using the `vir=
tio` interface to connect the device to the VM.

  4. `qemu-system-x86_64 -device ide-hd,drive=3Dmydrive -drive file=3Ddisk.=
img,format=3Dqcow2,id=3Dmydrive`
  This command sets up two block devices for the virtual machine. The first=
 device is connected using the `ide-hd` device type, and is connected to a =
virtual drive called `mydrive`. The second device is a `qcow2` disk image f=
ile, also using the virtual drive `mydrive`. The `id` property on the secon=
d command tells QEMU to use the virtual drive with the identifier `mydrive`=
 as the backend for this block device.

  The differences between these commands lie in the backend layout of the v=
irtual devices. In the first two commands, we are using file-based storage =
for the devices, with different formats. In the third command, we are using=
 a physical block device as the backend. In the fourth command, we are usin=
g a combination of virtual and file-based storage, with virtual drives conn=
ected to individual devices. The choice of backend layout will depend on th=
e specific requirements of the virtual machine and its workload.

  5. `qemu-system-arm -machine virt,gic-version=3D3 -cpu cortex-a57 -drive =
file=3Ddisk1.qcow2,if=3Dnone,id=3Ddrive0 -device virtio-blk-device,drive=3D=
drive0 -blockdev node-name=3Dmy-snapshot,driver=3Dqcow2,file=3Dsnapshot.qco=
w2,backing=3Ddrive0 -device virtio-blk-device,drive=3Dmy-snapshot`
  In this command, we are using an "ARM virtual machine" and creating a blo=
ck device using `disk1.qcow2` file as its storage with `if=3Dnone` paramete=
r to not attach it directly to the device. Then, we create a virtual device=
 of `virtio-blk-device` type and connecting `drive0` to it using the `-devi=
ce` option.=20

  Next, we are creating a new block device named `my-snapshot` with the `qc=
ow2` driver using `-blockdev` and specifying `file=3Dsnapshot.qcow2` as its=
 storage. We are also specifying `backing=3Ddrive0`, which means the new bl=
ock device is a snapshot of `drive0`. Finally, we are creating another virt=
ual device of `virtio-blk-device` type and connecting `my-snapshot` to it u=
sing the `-device` option.

  This command creates a snapshot of the original `disk1.qcow2` image, whic=
h allows us to create clones of the original disk that are based on differe=
nt points in time.

  6. `qemu-system-ppc64 -M pseries -drive file=3Ddisk1.raw,if=3Dnone,id=3Dd=
rive0 -blockdev node-name=3Dmy-backup,driver=3Dfile,cache.direct=3Don,cache=
.no-flush=3Doff,filename=3Dbackup.raw -blockdev node-name=3Dmy-snapshot,dri=
ver=3Dqcow2,file=3Dsnapshot.qcow2,backing=3Dmy-backup -device virtio-blk-de=
vice,drive=3Dmy-snapshot`
  In this command, we are using a "PowerPC64 virtual machine" machine type =
and creating a block device using `disk1.raw` as its storage with `if=3Dnon=
e` parameter to not attach it directly to the device.=20

  Next, we are creating a backup block device using the `file` driver, and =
set `cache.direct` to `on` and `cache.no-flush` to `off`, which means that =
the write operations will go directly to the `backup.raw` image file and re=
duces the risk of data loss.=20

  Then, we create a new block device named `my-snapshot` with the `qcow2` d=
river using `-blockdev` and specifying `file=3Dsnapshot.qcow2` as its stora=
ge. We are also specifying `backing=3Dmy-backup`, which means the new block=
 device is a snapshot of `my-backup`. Finally, we are creating a virtual de=
vice of `virtio-blk-device` type and connecting `my-snapshot` to it using t=
he `-device` option.

  This command creates a snapshot of the `my-backup` block device, which ca=
n be used to recover data if the original disk becomes corrupted or lost. T=
he `cache` options are used to ensure that write operations are written dir=
ectly to the backup file, rather than being buffered in memory and potentia=
lly lost in the event of a system crash.

But even these stochastic parrots gloss over the meaning of such
vagaries as if=3Dnone.

* just because we could doesn't mean we should

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

