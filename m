Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B084156034E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 16:41:36 +0200 (CEST)
Received: from localhost ([::1]:39714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Ysp-0006QS-P0
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 10:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6YXN-00030V-VW
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:19:26 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6YXL-0002XX-Fe
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 10:19:25 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e40so22451951eda.2
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hze4HF3ZpzJnpV6m9wUP+WB931eQctb9tT0mNzqLaSw=;
 b=g7+lv7hsuBYi7EaLvXHzQ8jKUo1DvYQHFwY/JXyv632zROEt1Cf0M2Wl+tzWoEm967
 dRgJHnSCf+w/NBSZBvcFcySR78LLxfUrBJ1sgj1AYQuTY/j6k5lBi/Rm//wHT9RgjXpo
 r+AFF0hBt3e9fiLUqc0e4m1MfDILy42XIMP2tks88e0noBC2A/qF487cXaQlwGpx6iYL
 5+oOlZI8n5DfEWdicq/LyD/aXml2/ZmR2X3dZSOHq/cEL2rPVIO4wfMVrelO3qeTJehH
 Kt8jyyPECk9kffkPyFXC9IhpeCmPPWkj1YBHAR9mHwSyAl7ll5uvDp4aPIXbEmFE6WEl
 twoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hze4HF3ZpzJnpV6m9wUP+WB931eQctb9tT0mNzqLaSw=;
 b=JD2Jj7Xhcqb8Pq1EyRr3fOZY8tKO5MO7zV7DEFvSxkXZWKK6dAt/+YSKPNmjL1z7JB
 wTRAWynp5JC7KwZevePNGhwEvrJrRKi/zSm0BcpgnaGG+cMRJw4JZQsVy6dbNMqgc+La
 5xffiFfoJ8aGp9ReeQCPl6oz+4YRVdiHsUv9yexHIL7LDyVfoWVNc6qS3vuadZSs2GZr
 kwlIzbxXX+ZzAmksTl51GDBp6lca5ZXtp2qu/gJkavskVkltGzxg8grIdS+iYi/9jJXK
 rjS+Q8CxXM0JJBPkGrpncLo+1KhhUFthBxLbyvBqijTM+katZkV2C7gHUq8sMXuaBRnW
 COtQ==
X-Gm-Message-State: AJIora+iElMsFfX5wHv52XZqysDCEdWzX66Rg2pqqlo4wluwOomfPwL3
 dhxjK/X4C3UOqgNp4ULG5nOl9A==
X-Google-Smtp-Source: AGRyM1uET4GCch1hK1FUZMki1be0LAG2vkkb5rCG0puiivuyGd/HNUYapzbvyUKtUvKU/eI9fsCJ0w==
X-Received: by 2002:a05:6402:3685:b0:435:8069:e44 with SMTP id
 ej5-20020a056402368500b0043580690e44mr4580888edb.202.1656512360903; 
 Wed, 29 Jun 2022 07:19:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170906444d00b00722eeb368cesm7789984ejp.64.2022.06.29.07.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 07:19:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92ED51FFB7;
 Wed, 29 Jun 2022 15:19:18 +0100 (BST)
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-13-pdel@fb.com>
 <e5f51f14-fe75-0d55-6588-a3ca2565f760@kaod.org>
 <EC44C0BD-7BC0-4BDE-9A41-CB1EAA90EC87@fb.com>
 <e07ec4fe-6968-b19a-e649-298a9aaccba5@kaod.org>
 <07128acf-329a-f372-c48c-0c3cb498d3d0@kaod.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Peter Delevoryas <pdel@fb.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "eduardo@habkost.net"
 <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 "ani@anisinha.ca" <ani@anisinha.ca>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 12/14] aspeed: Make aspeed_board_init_flashes public
Date: Wed, 29 Jun 2022 15:14:10 +0100
In-reply-to: <07128acf-329a-f372-c48c-0c3cb498d3d0@kaod.org>
Message-ID: <87zghvh7rt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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

> On 6/24/22 18:50, C=C3=A9dric Le Goater wrote:
>> On 6/23/22 20:43, Peter Delevoryas wrote:
>>>
>>>
>>>> On Jun 23, 2022, at 8:09 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>>>
>>>> On 6/23/22 12:26, Peter Delevoryas wrote:
>>>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>>>
>>>> Let's start simple without flash support. We should be able to
>>>> load FW blobs in each CPU address space using loader devices.
>>>
>>> Actually, I was unable to do this, perhaps because the fb OpenBMC
>>> boot sequence is a little weird. I specifically _needed_ to have
>>> a flash device which maps the firmware in at 0x2000_0000, because
>>> the fb OpenBMC U-Boot SPL jumps to that address to start executing
>>> from flash? I think this is also why fb OpenBMC machines can be so slow.
>>>
>>> $ ./build/qemu-system-arm -machine fby35 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -device loader,file=3Dfby35.mtd,addr=3D0,cpu-n=
um=3D0 -nographic \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -d int -drive file=3Dfby35.mtd,format=3Draw,if=
=3Dmtd
>> Ideally we should be booting from the flash device directly using
>> the machine option '-M ast2600-evb,execute-in-place=3Dtrue' like HW
>> does. Instructions are fetched using SPI transfers. But the amount
>> of code generated is tremendous.

Yeah because there is a potential race when reading from HW so we throw
away TB's after executing them because we have no way of knowing if it
has changed under our feet. See 873d64ac30 (accel/tcg: re-factor non-RAM
execution code) which cleaned up this handling.

>> See some profiling below for a
>> run which barely reaches DRAM training in U-Boot.
>
> Some more profiling on both ast2500 and ast2600 machines shows :
>
>
> * ast2600-evb,execute-in-place=3Dtrue :
>
> Type               Object  Call site                Wait Time (s)        =
 Count  Average (us)
> -------------------------------------------------------------------------=
--------------------
> BQL mutex  0x564dc03922e0  accel/tcg/cputlb.c:1365       14.21443
> 32909927          0.43

This is unavoidable as a HW access needs the BQL held so we will go
through this cycle every executed instruction.

Did I miss why the flash contents are not mapped into the physical
address space? Isn't that how it appear to the processor?

> condvar    0x564dc0f02988  util/thread-pool.c:90         10.02312        =
    56     178984.32
> condvar    [           2]  softmmu/cpus.c:423             0.10051        =
     6      16752.04
> BQL mutex  0x564dc03922e0  util/rcu.c:269                 0.04372        =
     4      10930.60
> BQL mutex  0x564dc03922e0  cpus-common.c:341              0.00151        =
     8        189.16
> condvar    0x564dc0390360  cpus-common.c:176              0.00092        =
     8        115.04
> condvar    0x564dc0392280  softmmu/cpus.c:642             0.00013        =
     2         65.04
> condvar    0x564dc0392240  softmmu/cpus.c:571             0.00010        =
     2         49.54
> BQL mutex  0x564dc03922e0  accel/tcg/cputlb.c:1426        0.00006        =
   467          0.14
> condvar    0x564dc03903a0  cpus-common.c:206              0.00004        =
     8          5.28
> -------------------------------------------------------------------------=
--------------------
>
>
> * ast2500-evb,execute-in-place=3Dtrue :
>
> Type               Object  Call site                Wait Time (s)        =
 Count  Average (us)
> -------------------------------------------------------------------------=
--------------------
> condvar    0x55a581137f88  util/thread-pool.c:90         10.01158        =
    28     357556.50
> BQL mutex  0x55a57f0e02e0  accel/tcg/cputlb.c:1365        0.29886      14=
394475          0.02
> condvar    0x55a5814cb5a0  softmmu/cpus.c:423             0.02182        =
     2      10912.44
> BQL mutex  0x55a57f0e02e0  util/rcu.c:269                 0.01420        =
     4       3549.56
> mutex      0x55a5813381c0  tcg/region.c:204               0.00007        =
  3052          0.02
> condvar    0x55a57f0e0280  softmmu/cpus.c:642             0.00006        =
     1         59.79
> mutex      [           2]  chardev/char.c:118             0.00003        =
  1492          0.02
> BQL mutex  0x55a57f0e02e0  util/main-loop.c:318           0.00002        =
    34          0.72
> BQL mutex  0x55a57f0e02e0  accel/tcg/cputlb.c:1426        0.00002        =
   973          0.02
> condvar    0x55a57f0e0240  softmmu/cpus.c:571             0.00002        =
     1         15.16
> -------------------------------------------------------------------------=
--------------------
>
> C.
>
>
>
>> * execute-in-place=3Dtrue
>> Each sample counts as 0.01 seconds.
>>  =C2=A0 %=C2=A0=C2=A0 cumulative=C2=A0=C2=A0 self=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self=C2=A0=C2=A0=
=C2=A0=C2=A0 total
>>  =C2=A0time=C2=A0=C2=A0 seconds=C2=A0=C2=A0 seconds=C2=A0=C2=A0=C2=A0 ca=
lls=C2=A0 ns/call=C2=A0 ns/call=C2=A0 name
>> 100.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 0.02=
=C2=A0=C2=A0 164276=C2=A0=C2=A0 121.75=C2=A0=C2=A0 121.75=C2=A0 memory_regi=
on_init_rom_device
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 1610346008=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=
=C2=A0 tcg_code_capacity
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 567612621=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 type_register_static_array
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 328886191=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 do_common_semihosting
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 297215811=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 container_get
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 292670030=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 arm_cpu_tlb_fill
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 195416119=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 arm_cpu_register_gdb_regs_for_features
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 193326677=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 object_type_get_instance_size
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 182365829=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_op_insert_after
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 150668458=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 plugin_gen_tb_end
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 142171940=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 gen_new_label
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 133200628=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 smbios_build_type_38_table
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 130540338=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 object_dynamic_cast_assert
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 129223195=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 cpu_loop_exit_atomic
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 121759298=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_remove_ops_after
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 116887887=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 in_code_gen_buffer
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 111803833=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_emit_op
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 106052221=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 object_class_dynamic_cast_assert
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 99704054=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 __jit_debug_register_code
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 97812458=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 object_get_class
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 88952594=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_splitwx_to_rx
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 85790920=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 object_class_dynamic_cast
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 73780673=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 helper_exit_atomic
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 65337482=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_op_supported
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 61213619=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_func_start
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 54477684=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_flush_softmmu_tlb
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 53968980=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_temp_new_internal
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 51526008=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 qemu_in_vcpu_thread
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 40750952=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 pflash_cfi02_register
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 38039442=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_gen_op2
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 37068039=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_gen_op1
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 36473276=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_gen_op3
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 36310225=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 gen_gvec_uaba
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 30985436=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tb_set_jmp_target
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 30291796=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 tcg_constant_internal
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00 29857950=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=
=A0 ssi_transfer
>> * execute-in-place=3Dfalse
>> Each sample counts as 0.01 seconds.
>>  =C2=A0 %=C2=A0=C2=A0 cumulative=C2=A0=C2=A0 self=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self=C2=A0=C2=A0=
=C2=A0=C2=A0 total
>>  =C2=A0time=C2=A0=C2=A0 seconds=C2=A0=C2=A0 seconds=C2=A0=C2=A0=C2=A0 ca=
lls=C2=A0 ns/call=C2=A0 ns/call=C2=A0 name
>>  =C2=A040.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02=C2=A0=C2=A0=C2=A0=C2=A0 =
0.02=C2=A0=C2=A0 551149=C2=A0=C2=A0=C2=A0 36.29=C2=A0=C2=A0=C2=A0 36.29=C2=
=A0 aspeed_board_init_flashes
>>  =C2=A020.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03=C2=A0=C2=A0=C2=A0=C2=A0 =
0.01=C2=A0 3937238=C2=A0=C2=A0=C2=A0=C2=A0 2.54=C2=A0=C2=A0=C2=A0=C2=A0 2.5=
4=C2=A0 register_cp_regs_for_features
>>  =C2=A020.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04=C2=A0=C2=A0=C2=A0=C2=A0 =
0.01=C2=A0=C2=A0 674096=C2=A0=C2=A0=C2=A0 14.83=C2=A0=C2=A0=C2=A0 14.83=C2=
=A0 gen_gvec_uaba
>>  =C2=A020.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.01=C2=A0=C2=A0 457461=C2=A0=C2=A0=C2=A0 21.86=C2=A0=C2=A0=C2=A0 21.86=C2=
=A0 finalize_target_page_bits
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0 5364258=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.0=
0=C2=A0 arm_gt_hvtimer_cb
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0 2467532=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.0=
0=C2=A0 helper_neon_narrow_sat_s8
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0 2431860=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.0=
0=C2=A0 opb_opb2fsi_address
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0 1828453=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.0=
0=C2=A0 cpsr_read
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0 1820659=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.0=
0=C2=A0 cpu_get_tb_cpu_state
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0 1441344=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.0=
0=C2=A0 arm_cpu_tlb_fill
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0 1427177=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 0.0=
0=C2=A0 cxl_usp_to_cstate
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0 1161059=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0 5.8=
5=C2=A0 aarch64_sync_64_to_32
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 886523=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 helper_iwmmxt_maxsb
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 831393=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 arm_log_exception
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 746940=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 helper_v7m_preserve_fp_state
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 728354=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 hmp_calc_dirty_rate
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 681634=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 helper_sadd8
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 487743=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 7.14=C2=A0 qmp_query_cpu_definitions
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 420528=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 arm_v7m_cpu_do_interrupt
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 382245=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 helper_ssub8
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 374192=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 helper_usub8
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 347199=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 usb_msd_load_request
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 325862=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 target_disas
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 322375=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 arm_hcrx_el2_eff
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 317835=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 virtio_bus_device_iommu_enabled
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 309559=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 mig_throttle_counter_reset
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 301557=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 ram_bytes_remaining
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 292888=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 helper_v7m_blxns
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 289093=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 tpm_util_show_buffer
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 274156=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 helper_sxtb16
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 273588=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 write_v7m_exception
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 271619=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 page_size_init
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 270247=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=
=A0 0.00=C2=A0 qemu_fdt_setprop_sized_cells_from_array
>>  =C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0 229643=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0 14.6=
9=C2=A0 helper_neon_addl_u32


--=20
Alex Benn=C3=A9e

