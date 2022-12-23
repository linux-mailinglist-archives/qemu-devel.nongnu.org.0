Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D256D65516C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 15:35:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8j7u-0005B2-Bu; Fri, 23 Dec 2022 09:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1p8j7g-00056y-D3; Fri, 23 Dec 2022 09:34:11 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1p8j7c-0005Ez-LV; Fri, 23 Dec 2022 09:34:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D3D560F74;
 Fri, 23 Dec 2022 14:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA96C4339E;
 Fri, 23 Dec 2022 14:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671806031;
 bh=i78MCQ30G80ajVIBVA2UX7jOa9KC4fgE6A8ei9cQdCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WrqcTD8hzfKcLUHfQhaOjQi+ynOM+ERhDLMyZh6rwxH2IPkLw62LlWXfdh26t6VPk
 FNwQCdd5HaPmKMeDq9BydbgOo4Vt2CUav+0xCa6C66U5vwxTaXgFbT7K/kgZHkfmlP
 LLlxR7tB/hhSqFeoCt6dQTY74hOqnGbL1d0aBgEoCHOAInuIZjAPgJ7ykKXZpzwdLm
 dY7Hqspe5IjqW5Vu9WCanLgQbeLJnasqG2Zvn0j+QO0tQaqqOORGngyjtzE9xx/6MK
 U9Y9p1Jmhejy0x7rqeEH1tZ6bKWOQYCCd8gy32ex7anBvqaTe4BQj2UvKPdeRnQWEc
 fz45JSIlQp4kA==
Received: by mail-lf1-f47.google.com with SMTP id o6so7310556lfi.5;
 Fri, 23 Dec 2022 06:33:51 -0800 (PST)
X-Gm-Message-State: AFqh2krcU0m69SVmpdSCdiEUHhYN/aWxBU2Q8zS46UBAHzEaQZ77gXS5
 fPXxCpGJcXW7ugVP1OzVLuINa9OwHgNpq6Qx1RM=
X-Google-Smtp-Source: AMrXdXtlxL25IMQBtXAjMER7cPhxDiCU+Fc06o21xzle259bphJgh0v4pYZNOMes1bDBrjeaBqmUcNXqZ1EMLUqpdqs=
X-Received: by 2002:a05:6512:15a3:b0:4bc:bdf5:f163 with SMTP id
 bp35-20020a05651215a300b004bcbdf5f163mr520074lfb.583.1671806029642; Fri, 23
 Dec 2022 06:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20221220084246.1984871-1-kraxel@redhat.com>
 <a31967f6-6de5-bed2-8a1a-68a909850dd5@linaro.org>
 <20221220153301.ku3zxwglhxepet6i@sirius.home.kraxel.org>
In-Reply-To: <20221220153301.ku3zxwglhxepet6i@sirius.home.kraxel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Dec 2022 15:33:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF=SNeK6fSgo0821XF+dgs-i__bEoUwvJsDRCtpixsTsg@mail.gmail.com>
Message-ID: <CAMj1kXF=SNeK6fSgo0821XF+dgs-i__bEoUwvJsDRCtpixsTsg@mail.gmail.com>
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>, 
 Xiang Zheng <zhengxiang9@huawei.com>,
 David Edmondson <david.edmondson@oracle.com>, 
 Markus Armbruster <armbru@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki <rad@semihalf.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Tue, 20 Dec 2022 at 16:33, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Dec 20, 2022 at 10:30:43AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > [Extending to people using UEFI VARStore on Virt machines]
> >
> > On 20/12/22 09:42, Gerd Hoffmann wrote:
> > > From: Xiang Zheng <zhengxiang9@huawei.com>
> > >
> > > Currently we fill the VIRT_FLASH memory space with two 64MB NOR image=
s
> > > when using persistent UEFI variables on virt board. Actually we only =
use
> > > a very small(non-zero) part of the memory while the rest significant
> > > large(zero) part of memory is wasted.
> > >
> > > So this patch checks the block status and only writes the non-zero pa=
rt
> > > into memory. This requires pflash devices to use sparse files for
> > > backends.
> >
> > I like the idea, but I'm not sure how to relate with NOR flash devices.
> >
> > From the block layer, we get BDRV_BLOCK_ZERO when a block is fully
> > filled by zeroes ('\0').
> >
> > We don't want to waste host memory, I get it.
> >
> > Now what "sees" the guest? Is the UEFI VARStore filled with zeroes?
>
> The varstore is filled with 0xff.  It's 768k in size.  The padding
> following (63M plus a bit) is 0x00.  To be exact:
>
> kraxel@sirius ~# hex /usr/share/edk2/aarch64/vars-template-pflash.raw
> 00000000  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ...........=
.....
> 00000010  8d 2b f1 ff  96 76 8b 4c  a9 85 27 47  07 5b 4f 50  .+...v.L..'=
G.[OP
> 00000020  00 00 0c 00  00 00 00 00  5f 46 56 48  ff fe 04 00  ........_FV=
H....
> 00000030  48 00 28 09  00 00 00 02  03 00 00 00  00 00 04 00  H.(........=
.....
> 00000040  00 00 00 00  00 00 00 00  78 2c f3 aa  7b 94 9a 43  ........x,.=
.{..C
> 00000050  a1 80 2e 14  4e c3 77 92  b8 ff 03 00  5a fe 00 00  ....N.w....=
.Z...
> 00000060  00 00 00 00  ff ff ff ff  ff ff ff ff  ff ff ff ff  ...........=
.....
> 00000070  ff ff ff ff  ff ff ff ff  ff ff ff ff  ff ff ff ff  ...........=
.....
> *
> 00040000  2b 29 58 9e  68 7c 7d 49  a0 ce 65 00  fd 9f 1b 95  +)X.h|}I..e=
.....
> 00040010  5b e7 c6 86  fe ff ff ff  e0 ff 03 00  00 00 00 00  [..........=
.....
> 00040020  ff ff ff ff  ff ff ff ff  ff ff ff ff  ff ff ff ff  ...........=
.....
> *
> 000c0000  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ...........=
.....
> *
>
> > If so, is it a EDK2 specific case for all virt machines?  This would
> > be a virtualization optimization and in that case, this patch would
> > work.
>
> vars-template-pflash.raw (padded image) is simply QEMU_VARS.fd (unpadded
> image) with 'truncate --size 64M' applied.
>
> Yes, that's a pure virtual machine thing.  On physical hardware you
> would probably just flash the first 768k and leave the remaining flash
> capacity untouched.
>
> > * or you are trying to optimize paravirtualized guests.
>
> This.  Ideally without putting everything upside-down.
>
> >   In that case why insist with emulated NOR devices? Why not have EDK2
> >   directly use a paravirtualized block driver which we can optimize /
> >   tune without interfering with emulated models?
>
> While that probably would work for the variable store (I think we could
> very well do with variable store not being mapped and requiring explicit
> read/write requests) that idea is not going to work very well for the
> firmware code which must be mapped into the address space.  pflash is
> almost the only device we have which serves that need.  The only other
> option I can see would be a rom (the code is usually mapped r/o anyway),
> but that has pretty much the same problem space.  We would likewise want
> a big enough fixed size ROM, to avoid life migration problems and all
> that, and we want the unused space not waste memory.
>
> > Keeping insisting on optimizing guests using the QEMU pflash device
> > seems wrong to me. I'm pretty sure we can do better optimizing clouds
> > payloads.
>
> Moving away from pflash for efi variable storage would cause alot of
> churn through the whole stack.  firmware, qemu, libvirt, upper
> management, all affected.  Is that worth the trouble?  Using pflash
> isn't that much of a problem IMHO.
>

Agreed. pflash is a bit clunky but not a huge problem atm (although
setting up and tearing down the r/o memslot for every read resp. write
results in some performance issues under kvm/arm64)

*If* we decide to replace it, I would suggest an emulated ROM for the
executable image (without any emulated programming facility
whatsoever) and a paravirtualized get/setvariable interface which can
be used in a sane way to virtualize secure boot without having to
emulate SMM or other secure world firmware interfaces.

