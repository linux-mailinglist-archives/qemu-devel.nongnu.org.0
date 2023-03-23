Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2EF6C7068
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 19:43:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfPsU-0001Fv-AK; Thu, 23 Mar 2023 14:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pfPsS-0001FS-Az
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:41:32 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pfPsQ-0002vg-Fh
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:41:31 -0400
Received: by mail-ed1-x536.google.com with SMTP id eg48so90696777edb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 11:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679596888;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1JyK0IQI84W6nhwKY+NkwFmD6F/ZA/6M8eEk157uOY=;
 b=kHxECXONHnJICXFE2KajI02pgzjwnx36OW0Igj+YcnaYipOuhMkzuGxvWvX4scHStV
 NlKW9z2C/lNkeKmGeRjXVlq8P+Ll60XL7jkGMk51w7nj5BlQyjFXKsaPANqDNYTlN88t
 l48lqpYWryzMjqx64syNmaIdOeo3D8uArr60hLkDNt4iFENH9JcLtV+tv/VgvOXlguRY
 LIVw81dVsOHCvNDHx+RJBaZq2JIluxpuUDpSdHgsiJAmLE7ZswxGQOnPtH146p+33vuZ
 9Rgam/7cu5nC6ozdz59MRU4ZL3Jzl3bVnCLr9+Sf2M7rjCHj5NNRorhpu+mrX3+ahTNk
 sHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679596888;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q1JyK0IQI84W6nhwKY+NkwFmD6F/ZA/6M8eEk157uOY=;
 b=HqXROKLe75FmKQT6MtJof3YCkFp9oFYatCqawYuiKDupDCBkpff0VnswUXfUWlhyDf
 ySxDsbe1j9nF+tXwlWNZzYTiTAdjqLC43VR0lnuSCNKUvcDSmh7hJN3R5mNi9O2TqxEe
 IIr6YKcvLevg8TC+XJR5aTr2OSjXmDPmRUBLvxW9pLBMbkaUUADBn+q4oyW5A+7IJEFv
 PVpy+zuPvdV0/a0ZSPK6CktYk47RmBJ7qPwrjVOz0J3b9feZjf1Z/ZOEh4rA0ZY1YhMK
 vTtjQHyoQIuEQzxdetLaq1bMNOHkzGMIh4RqGaIDjHCZtcAcbPucCIb32kZol+NAFN5u
 94CQ==
X-Gm-Message-State: AAQBX9fbn3aTJG94q/lNFHTpRPm3f11VPbQ8MwOAWjrUCJC6d8F6rL1b
 7ThazWloSjA5cqu27rm5v9sBPGlc1tg=
X-Google-Smtp-Source: AKy350aP9ylLaxYkp0efw8WSEW3y+zffCtic0e6R4gDzHb6D/hUIFyW3rEp9lrNeHqrT/ZYt9Nzl4A==
X-Received: by 2002:a17:906:8a41:b0:92b:6f92:7705 with SMTP id
 gx1-20020a1709068a4100b0092b6f927705mr23893ejc.40.1679596888148; 
 Thu, 23 Mar 2023 11:41:28 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 by22-20020a170906a2d600b008cecb8f374asm8955638ejb.0.2023.03.23.11.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 11:41:27 -0700 (PDT)
Date: Thu, 23 Mar 2023 18:41:07 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: QMP command dumpdtb crash bug
In-Reply-To: <15d643ae-fad0-fb19-c9f2-bb586cbd3317@ventanamicro.com>
References: <87jzz82d6o.fsf@pond.sub.org>
 <0f671d7f-5862-cf59-2ef2-be347c044a0b@ventanamicro.com>
 <87355vy4sq.fsf@pond.sub.org>
 <CAFEAcA8Yy2-z-J7yjjUxv4ZTg06fEsUt3HVkwNJWYiMBsqkWcA@mail.gmail.com>
 <15d643ae-fad0-fb19-c9f2-bb586cbd3317@ventanamicro.com>
Message-ID: <17A00968-1677-4CC7-BDE9-CF2630189933@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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



Am 23=2E M=C3=A4rz 2023 15:13:28 UTC schrieb Daniel Henrique Barboza <dbar=
boza@ventanamicro=2Ecom>:
>
>
>On 3/23/23 10:38, Peter Maydell wrote:
>> On Thu, 23 Mar 2023 at 13:29, Markus Armbruster <armbru@redhat=2Ecom> w=
rote:
>>>=20
>>> Peter, Daniel offers two ways to fix this bug (see below)=2E  Got a
>>> preference?
>>=20
>> Not freeing seems the correct thing=2E As Daniel says, this
>> should have been a prerequisite for implementing the
>> command in the first place (you need to change the lifecycle
>> of the fdt blob from "delete when done with in the arm boot code"
>> to "delete on machine finalize")=2E It looks like somehow we added
>> the command but missed out on getting all of the prerequisite
>> patches in=2E (File under "need to be cautious about applying partial
>> patchsets", I guess=2E)
>
>Yeah, I'm at fault here=2E I should've been more insistent about acking
>the ARM patch=2E All other patches that we left behind was optional, mean=
ing
>that the machine wouldn't implement the command but nothing bad would hap=
pen,
>but the ARM patch was kind of mandatory because arm_load_dtb() is
>freeing ms->fdt without assigning it to NULL=2E
>
>>=20
>> Did anything else from that initial patchset get omitted?
>
>Searching the ML I see that I sent a message saying that I pushed patches=
 1,
>6 and 8-15 via ppc-next=2E This means that these patches got left behind:
>
> 2  hw/core: free ms->fdt in machine_finalize()
> 3  hw/arm: do not free machine->fdt in arm_load_dtb()
> 4  hw/mips: set machine->fdt in boston_mach_init()
> 5  hw/microblaze: set machine->fdt in microblaze_load_dtb()
> 7  hw/ppc: set machine->fdt in ppce500_load_device_tree()

We dealt with e500 in a different series=2E So 7 is basically in 8=2E0 alr=
eady (but in a different form)=2E

Best regards,
Bernhard

>15  hw/xtensa: set machine->fdt in xtfpga_init()
>
>
>Patch 2 was suggested by Phil and changes the common code to free ms->fdt
>during machine_finalize()=2E Can be re-sent I guess=2E
>
>All other patches, aside from patch 3 from ARM, are optional because the
>machine isn't freeing ms->fdt or anything like that=2E
>
>
>I'll rebase and re-sent patch 3 as a bug fix=2E I'll re-sent the hw/core =
patch
>as well for 8=2E1=2E
>
>
>Daniel
>
>
>>=20
>> thanks
>> -- PMM
>

