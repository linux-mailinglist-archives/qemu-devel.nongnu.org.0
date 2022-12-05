Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109C642B10
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 16:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2D51-0008CS-Og; Mon, 05 Dec 2022 10:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p2D4Q-000895-97
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 10:07:54 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p2D4N-0005w7-St
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 10:07:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id bg10so8965761wmb.1
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 07:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWqbMeIxFY0eCr0c9ZmTiNL5KHND9XFBNlTNGEDljWs=;
 b=hUaR/5FSV6AIjNdFYiCDcA1EK4fUhUkh930hK1kp9HoENXNVxMHDgg9er3MaojVTp7
 3dMiLRhlocLLEt/NF8i+FjbIlw3btVktwkagKj2iCzNk4k0nssjKVPj1GPqNzEbU2tsg
 VC3pB+E7IJ4mF0JCQgvl3NJ45eFXHjzagl6mwzGMZEpwfg12b/+mr9jNzRPoJusxufpw
 q8pEPBaM2sWlucfGa/mNy22krflNRUKuoCyXhLL280OhmyiNm5cvFSDGywP/ElsXyqw9
 TjOumJFNL42vD+acUMD6QSQ0aBczqSoy8jjGr4u9RzQHesLTcTv2jrJ+pDkHiqBXtfbf
 lwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yWqbMeIxFY0eCr0c9ZmTiNL5KHND9XFBNlTNGEDljWs=;
 b=wtPGiiFXf4KRZ/wbqvQtZJk4OVxfydlE6DGKHkLS3Qd/Lj0vY4O8Rk3KSkLzbtaTmM
 3ULq1ALYePiyBwyqzbK9CURg8mUK8VMvglPCiRzdsJ7Qjh+vr0ORdpqhHxW7RGFFOGEP
 NiZ5QMN660k4c/uDfmL9ilrlmyycHzdF36r67L3cwYDw1lXcE/RQxE+cOBhVR/jDuAJ5
 gV4q3bzo9U9ag6VK6i6fTlka2KZD9Uw7bkPOe7ap2yLFqu3xEKudW62XzntQx/sIfHT0
 U3f+5xFnyejTiqWLbiPgBTKIhMqvlV4fJU357VZuXtEBU1jwQ1Zl2l1zYan8DMtm0nXs
 45Dw==
X-Gm-Message-State: ANoB5pma6kTp5f6NEZG97hg4oiRNkfZ1UF3Vhymo87Yni7vS1/90vNNF
 oad2TL8fI1yvAm9wMJdteMlf/A==
X-Google-Smtp-Source: AA0mqf6+V/V6M2TxLss0enIEQ+95QUvXew4oOeOmw9DbJt6SE9UU7brIYspwTyGXHkw5OEhGByb2LQ==
X-Received: by 2002:a05:600c:1f0f:b0:3d0:2a82:1cb2 with SMTP id
 bd15-20020a05600c1f0f00b003d02a821cb2mr45906882wmb.206.1670252865704; 
 Mon, 05 Dec 2022 07:07:45 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c00c100b003d1e34bcbb2sm1262152wmm.13.2022.12.05.07.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 07:07:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 179EA1FFB7;
 Mon,  5 Dec 2022 15:07:44 +0000 (GMT)
References: <20220616165703.42226-1-mst@redhat.com>
 <20220616165703.42226-3-mst@redhat.com>
 <4274de61-292d-b3e0-8f86-d7000122a715@redhat.com>
 <06f4e22c-1c30-42a6-6f80-1f04e9d55c96@redhat.com>
 <20221205105403.00003d0f@huawei.com> <20221205124516.00006362@huawei.com>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Ben Widawsky
 <ben.widawsky@intel.com>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 02/10] pci-bridge/cxl_downstream: Add a CXL switch
 downstream port
Date: Mon, 05 Dec 2022 14:59:39 +0000
In-reply-to: <20221205124516.00006362@huawei.com>
Message-ID: <87y1rlnb28.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Jonathan Cameron via <qemu-devel@nongnu.org> writes:

> On Mon, 5 Dec 2022 10:54:03 +0000
> Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
>
>> On Sun, 4 Dec 2022 08:23:55 +0100
>> Thomas Huth <thuth@redhat.com> wrote:
>>=20
>> > On 04/11/2022 07.47, Thomas Huth wrote:=20=20
>> > > On 16/06/2022 18.57, Michael S. Tsirkin wrote:=20=20=20=20
>> > >> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> > >>
>> > >> Emulation of a simple CXL Switch downstream port.
>> > >> The Device ID has been allocated for this use.
>> > >>
>> > >> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> > >> Message-Id: <20220616145126.8002-3-Jonathan.Cameron@huawei.com>
>> > >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> > >> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> > >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> > >> ---
>> > >> =C2=A0 hw/cxl/cxl-host.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 43 +++++-
>> > >> =C2=A0 hw/pci-bridge/cxl_downstream.c | 249 +++++++++++++++++++++++=
++++++++++
>> > >> =C2=A0 hw/pci-bridge/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
>> > >> =C2=A0 3 files changed, 291 insertions(+), 3 deletions(-)
>> > >> =C2=A0 create mode 100644 hw/pci-bridge/cxl_downstream.c=20=20=20=20
>> > >=20
>> > >  =C2=A0Hi!
>> > >=20
>> > > There is a memory problem somewhere in this new device. I can make Q=
EMU=20
>> > > crash by running something like this:
>> > >=20
>> > > $ MALLOC_PERTURB_=3D59 ./qemu-system-x86_64 -M x-remote \
>> > >  =C2=A0=C2=A0=C2=A0 -display none -monitor stdio
>> > > QEMU 7.1.50 monitor - type 'help' for more information
>> > > (qemu) device_add cxl-downstream
>> > > ./qemu/qom/object.c:1188:5: runtime error: member access within misa=
ligned=20
>> > > address 0x3b3b3b3b3b3b3b3b for type 'struct Object', which requires =
8 byte=20
>> > > alignment
>> > > 0x3b3b3b3b3b3b3b3b: note: pointer points here
>> > > <memory cannot be printed>
>> > > Bus error (core dumped)
>> > >=20
>> > > Could you have a look if you've got some spare minutes?=20=20=20=20
>> >=20
>> > Ping! Jonathan, Michael, any news on this bug?
>> >=20
>> > (this breaks one of my local tests, that's why it's annoying for me)=
=20=20
>> Sorry, my email filters ate your earlier message.
>>=20
>> Looking into this now. I'll note that it also happens on
>> device_add xio3130-downstream so not specific to this new device.
>>=20
>> So far all I've managed to do is track it to something rcu related
>> as failing in a call to drain_call_rcu() in qmp_device_add()
>>=20
>> Will continue digging.
>
> Assuming I'm seeing the same thing...
>
> Problem is g_free() on the PCIBridge windows:=20
> https://elixir.bootlin.com/qemu/latest/source/hw/pci/pci_bridge.c#L235
>
> Is called before we get an rcu_call() to flatview_destroy() as a
> result of the final call of flatview_unref() in address_space_set_flatvie=
w()
> so we get a use after free.
>
> As to what the fix is...  Suggestions welcome!

It sounds like this is the wrong place to free the value then. I guess
the PCI aliases into &w->alias_io() don't get dealt with until RCU
clean-up time.

I *think* using g_free_rcu() should be enough to ensure the free occurs
after the rest of the RCU cleanups but maybe you should only be cleaning
up the windows at device unrealize time? Is this a dynamic piece of
memory which gets updated during the lifetime of the device?

If the memory is being cleared with RCU then the access to the base
pointer should be done with the appropriate qatomic_rcu_[set|read]
functions.

--=20
Alex Benn=C3=A9e

