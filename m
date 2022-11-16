Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFB62B326
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 07:14:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovBeP-0004Gw-Ef; Wed, 16 Nov 2022 01:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ovBeM-0004GF-Ld; Wed, 16 Nov 2022 01:11:54 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ovBeK-0002NW-VS; Wed, 16 Nov 2022 01:11:54 -0500
Received: by mail-pf1-x436.google.com with SMTP id d192so3403658pfd.0;
 Tue, 15 Nov 2022 22:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=JcHF3ORUXXQR3tJAYqImwRBo08c29Cshwc+UtkgxMLE=;
 b=oRaSgzM09s0+yI/0c1yffJbAKyLBlDcOgvi990XrQrRffwWaS9/yAwnzxFT+kMP9tF
 7AG/U3KQf75rRidTRMx8MAfnUXyaMFCSxzHAfaCgFLoaur7kAMeYsesL8O+UQYn9moc0
 SFIb3r8/k0ePjLKJqFjWHUDGuGOY4Az052rZYq7/wy9CRApfd4ItzdMZucFaWGWqs95y
 AF7/TBbksmztdNBaWKgVU76RUtbh/60Bj3qVpplcP1qsX/Y2nvYU0JTDnjIcXLh0WxI1
 lrhzdZ/TeMq3/FP6ZrB+U4mA11t6/REaQTuZhdlm1hCX361UlrBjzfCTwGnyh4tw55Y9
 eqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JcHF3ORUXXQR3tJAYqImwRBo08c29Cshwc+UtkgxMLE=;
 b=BrEdiX+qAHrFRwkSGs1U6ktFWujOxe/61Utq3zhlmEfnf1Oo7kc2IyW2hDQ0j3Et9T
 jWG82nhChtr0zF+1A8atX6OdLNmVP69kJ92afMdG7OLE/7XRIH7mSbvDceLCa2G5UveA
 tY45etElqSTpNVJXUc/dRrP8yBH9XsDsA52Tb0GnClUARwUlAavZpXfGaa+/+Z0aLiAZ
 TjIH/Kb12puPYn8tk8JaAwXFtqtCQy/qcEoE5MfGb6cGACu/Z0ThtHJWyEWQ/uUyu8gp
 /awIuR3fUZrthlj1Z4Ix3Ym6DPO94jMnk7mZV04gunwXGmJEXHLVp6SZ+UTtPBrVRzY5
 nOcQ==
X-Gm-Message-State: ANoB5pk6i8nZR/nG4lRdn+kJv4gLW6YFa0FkvoeQe1z3u5ifvz02Rn0l
 A62rVCzz/MhL9GuRibgGjiqekbPbwC89pg==
X-Google-Smtp-Source: AA0mqf6up6WIrQhCSVQgWR1+8nVA7kd+BwF9VOtVHKYQ/EbPd5qE2TgDi7x/lZ+NkAKZ94yKF5uFVw==
X-Received: by 2002:a63:d94b:0:b0:43c:6412:994f with SMTP id
 e11-20020a63d94b000000b0043c6412994fmr18829540pgj.421.1668579110167; 
 Tue, 15 Nov 2022 22:11:50 -0800 (PST)
Received: from MBP ([39.170.101.209]) by smtp.gmail.com with ESMTPSA id
 h13-20020a170902680d00b00179e1f08634sm11115827plk.222.2022.11.15.22.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 22:11:49 -0800 (PST)
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com>
 <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Schspa Shi <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Wed, 16 Nov 2022 14:07:46 +0800
In-reply-to: <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
Message-ID: <m2edu3ig2s.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=schspa@gmail.com; helo=mail-pf1-x436.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 8 Nov 2022 at 15:50, Schspa Shi <schspa@gmail.com> wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >>
>> >> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
>> >> > I think this lowmem does not mean below 4GB. and it is to make sure
>> >> > the initrd_start > memblock_start_of_DRAM for Linux address range check.
>> >>
>> >> The wording of this comment pre-dates 64-bit CPU support: it
>> >> is talking about the requirement in the 32-bit booting doc
>> >> https://www.kernel.org/doc/Documentation/arm/Booting
>> >> that says
>> >> "If an initramfs is in use then, as with the dtb, it must be placed in
>> >> a region of memory where the kernel decompressor will not overwrite it
>> >> while also with the region which will be covered by the kernel's
>> >> low-memory mapping."
>> >>
>> >> So it does mean "below 4GB", because you can't boot a 32-bit kernel
>> >> if you don't put the kernel, initrd, etc below 4GB.
>> >
>> > A kernel person corrects me on the meaning of "lowmem" here -- the
>> > kernel means by it "within the first 768MB of RAM". There is also
>> > an implicit requirement that everything be within the bottom 32-bits
>> > of the physical address space.
>> >
>>
>> Thanks for your comment.
>>
>> In this view, initrd shouldn't be placed higher than 4GB ? But it
>> seems the Linux kernel can boot when there is no memory below 4GB.
>
> A *32 bit* kernel cannot -- it is completely unable to access
> anything above the 4GB mark when the MMU is off, as it is on
> initial boot. This QEMU code handles both 32 bit and 64 bit
> kernel boot. These days of course there is 64-bit only hardware,
> and that might choose to put its RAM above the 4GB mark,
> because it isn't ever going to boot a 32-bit kernel anyway.
>

Yes, I think we should accept this patch, because it will not affect
32-bit devices, and provides support for 64-bit devices to put initrd
above 4GB.

> thanks
> -- PMM


-- 
BRs
Schspa Shi

