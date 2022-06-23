Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CB155780E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 12:43:39 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4KJG-0007Wz-CG
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 06:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o4JzW-0006ev-CO
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 06:23:14 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o4JzU-00050o-8C
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 06:23:13 -0400
Received: by mail-ed1-x535.google.com with SMTP id ej4so23880343edb.7
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=p2KEt7qzXlEIt6YI2IoGGGQadr4cfLBaOgRUiqn+e14=;
 b=KGMGUHK542FOPXa9W3MSyAaWamdvSHueudR8Y4uK08E0Ym/oA2d+EqMYfBKFRpzb4Z
 W305XKOrnGgFrMXXRsCo+4Rs4ZZ1PHG7j7s1kOjYH7LsUIflGFctRtpNPYEzwNFTHSMy
 DO01P3bbtdq7+E+tPyPvhx3U/ab0vW6KJgR/meq2w47MAKWDtf/9BBsQulPMJWM9ZrRf
 PLhE5twd8NvvvhOmohydr6QJ1W3f8U54NZn9RQ+/wBRZdUizGjltiZmfP0zIlHUm4xe0
 hfaaMpAdkpqIPbwGPQSHwBMLfhJYEhlylebZdbgWT4ujFwZ8R7r7VzNP5P4Qg3qH5EcM
 FxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=p2KEt7qzXlEIt6YI2IoGGGQadr4cfLBaOgRUiqn+e14=;
 b=BLRiwYIBSFTGUz/7bhihuZWFmDo1gRiCeu+FPGf6lkZmucm/NRnOlPwBnaqZYp4vL8
 WOjyx5FSqOU2tx+w7pG12fA71hUJV8bm1i6zZd/uhpPPaCWNs5spqCz0HHvBZ16ZQ8NR
 DfcB9tXBpoUl/mngZBXcreZlZYg1HZzJModCaU1jTCTmeQOrMtdkKIWGTeGBM0MbrStx
 aRjTzf1R0bLHOVmethDB++nmUWDWbCSCdsrBqPtjIGWdYatvpbOskfaSDKCv8Im8TOun
 I//xyZ0afJLDtWxe5HWP4Efn6OhmWAhs2bjJlV3CSumgf5G5sUGEDZxSn/gAuBrgpVn2
 Ymbg==
X-Gm-Message-State: AJIora9Gco2n5RRAORZS36gtov3ywFFYvEWt14VdowZuLIQrxMuayYkR
 nXyU7bw3be//9CFyBoSOhkzmpQ==
X-Google-Smtp-Source: AGRyM1u2jOTEIdRdKxo20UOhMmmiNeFcnxRm2bIH0X6ENSrTgV8RNG++mupyJpgx/V3qWqqCRlnaLw==
X-Received: by 2002:a05:6402:348e:b0:435:a912:355f with SMTP id
 v14-20020a056402348e00b00435a912355fmr9584922edc.326.1655979789823; 
 Thu, 23 Jun 2022 03:23:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a170906768200b0070fd7da3e47sm10536709ejm.127.2022.06.23.03.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 03:23:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E04451FFB7;
 Thu, 23 Jun 2022 11:23:07 +0100 (BST)
References: <20220622145052.4012981-1-alex.bennee@linaro.org>
 <474f352b-4cb6-00c1-cc3b-432a54468b7b@kaod.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] qemu-options: bring the kernel and image options
 together
Date: Thu, 23 Jun 2022 11:21:01 +0100
In-reply-to: <474f352b-4cb6-00c1-cc3b-432a54468b7b@kaod.org>
Message-ID: <8735fvr850.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 6/22/22 16:50, Alex Benn=C3=A9e wrote:
>> How to control the booting of QEMU is often a source of confusion for
>> users. Bring the options that control this together in the manual
>> pages and add some verbiage to describe when each option is
>> appropriate.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>   qemu-options.hx | 80 ++++++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 62 insertions(+), 18 deletions(-)
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 377d22fbd8..9b0242f0ef 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1585,13 +1585,6 @@ SRST
>>       Use file as SecureDigital card image.
>>   ERST
>>   -DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
>> -    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH=
_ALL)
>> -SRST
>> -``-pflash file``
>> -    Use file as a parallel flash image.
>> -ERST
>> ->   DEF("snapshot", 0, QEMU_OPTION_snapshot,
>>       "-snapshot       write to temporary files instead of disk image fi=
les\n",
>>       QEMU_ARCH_ALL)
>> @@ -3680,12 +3673,51 @@ DEFHEADING()
>>     #endif
>>   -DEFHEADING(Linux/Multiboot boot specific:)
>> +DEFHEADING(Boot Image or Kernel specific:)
>> +SRST
>> +There are broadly 4 ways you can boot a system with QEMU.
>> +
>> + - specify a firmware and let it control finding a kernel
>> + - specify a firmware and pass a hint to the kernel to boot
>> + - direct kernel image boot
>> + - manually load files into the guests address space
>> +
>> +The last method is useful for quickly testing kernels but as there is
>> +no firmware to pass configuration information to the kernel it must
>> +either be built for the exact configuration or be handed a DTB blob
>> +which tells the kernel what drivers it needs.
>
> The last method can also load any FW blob with the correct executable
> layout (reset vector).

Heh - actually I wrote that paragraph for the direct kernel image boot
and then added the manual option after the fact. I'll try and clean that
up to make it clearer.

>
>> +
>> +ERST
>> +
>> +SRST
>> +
>> +For x86 machines ``-bios`` will generally do the right thing with
>> +whatever it is given. For non-x86 machines the more strict ``-pflash``
>> +option needs an image that is sized for the flash device for the given
>> +machine type.
>
> Some ppc machine use -bios also, mac, pseries, PowerNV (let's not restrict
> to x86).

Ahh the magic some ;-) Does it essentially rely on if the correct
plumbing has been done for the machine? Anything I can look for to audit
other machine types?

>
>
> LGTM.
>
> Thanks,
>
> C.
>
>
>> +
>> +ERST
>> +
>> +DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
>> +    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
>> +SRST
>> +``-bios file``
>> +    Set the filename for the BIOS.
>> +ERST
>> +
>> +DEF("pflash", HAS_ARG, QEMU_OPTION_pflash,
>> +    "-pflash file    use 'file' as a parallel flash image\n", QEMU_ARCH=
_ALL)
>> +SRST
>> +``-pflash file``
>> +    Use file as a parallel flash image.
>> +ERST
>> +
>>   SRST
>> -When using these options, you can use a given Linux or Multiboot kernel
>> -without installing it in the disk image. It can be useful for easier
>> -testing of various kernels.
>>   +The kernel options were designed to work with Linux kernels
>> although
>> +other things (like hypervisors) can be packaged up as a kernel
>> +executable image. The exact format of a executable image is usually
>> +architecture specific.
>>   ERST
>>   @@ -3725,6 +3757,25 @@ SRST
>>       kernel on boot.
>>   ERST
>>   +SRST
>> +
>> +Finally you can also manually load images directly into the address
>> +space of the guest. This is most useful for developers who already
>> +know the layout of their guest and take care to ensure something sane
>> +will happen when the reset vector executes.
>> +
>> +The generic loader can be invoked by using the loader device:
>> +
>> +``-device loader,addr=3D<addr>,data=3D<data>,data-len=3D<data-len>[,dat=
a-be=3D<data-be>][,cpu-num=3D<cpu-num>]``
>> +
>> +there is also the guest loader which operates in a similar way but
>> +tweaks the DTB so a hypervisor loaded via ``-kernel`` can find where
>> +the guest image is:
>> +
>> +``-device guest-loader,addr=3D<addr>[,kernel=3D<path>,[bootargs=3D<argu=
ments>]][,initrd=3D<path>]``
>> +ERST
>> +
>>   DEFHEADING()
>>     DEFHEADING(Debug/Expert options:)
>> @@ -4175,13 +4226,6 @@ SRST
>>       To list all the data directories, use ``-L help``.
>>   ERST
>>   -DEF("bios", HAS_ARG, QEMU_OPTION_bios, \
>> -    "-bios file      set the filename for the BIOS\n", QEMU_ARCH_ALL)
>> -SRST
>> -``-bios file``
>> -    Set the filename for the BIOS.
>> -ERST
>> -
>>   DEF("enable-kvm", 0, QEMU_OPTION_enable_kvm, \
>>       "-enable-kvm     enable KVM full virtualization support\n",
>>       QEMU_ARCH_ARM | QEMU_ARCH_I386 | QEMU_ARCH_MIPS | QEMU_ARCH_PPC |


--=20
Alex Benn=C3=A9e

