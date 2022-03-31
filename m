Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E684EE22B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:56:26 +0200 (CEST)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0u9-0005u3-Dv
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:56:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1na0sF-0004pP-8o
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:54:27 -0400
Received: from [2607:f8b0:4864:20::62d] (port=35414
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1na0sD-0004oE-9O
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:54:26 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y6so562056plg.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8uJ7V2Lk5b43qtRmyNKIxduM/i4ZvkhkfMVtcSMTHLc=;
 b=FU4YJeOWM6yJOftdRdppJkqAphiFFHBDWUUenEYTDla3AjR/9XyWUZ7NZrML9kP99Z
 rqVOzKX0OfynEviPak2SUeMa0Jxf+lrS9EClU7ZqMwKR3W/DNIVrESqbp+0eIEVkrIBM
 M2axkYIj+R7nx0w3lyY4eEihxCsjEfF2rwwm4ERkBmFL3F2/vYC+dG+rn5028ncqt8cj
 SlsMm9LggdTPgKMEVRPSqQNUJJCSU9RceECfCtuPpey4sagbpN/5/PCyVkitJ13aPlA3
 YdQ3O527QYaVl7OfKeTFGDfExvfTRBdEKXr5OeP9UNh/o1LsqwQB9z32d0VsYvZtWzn+
 VywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8uJ7V2Lk5b43qtRmyNKIxduM/i4ZvkhkfMVtcSMTHLc=;
 b=x9+cZLERFpwxr5cFxc1d1IaN5l3moDtovvHITEC4z9UKPxfq5Lf6kTbH4lgRklliGS
 e60XabEdmNGab8eoFEIIQYRgp8HzWX/dl8aiLpVLJ72CZMJs4fwWdJAf/O1O0/6luUib
 Azm8uylL8S6DUfD5d7NnzoLD1M/CO2ftuhc+ARFSJ59Mf3L8a0FgQdn/s6DSvDiqlxu2
 5XclWXb6FO0t0HTJJU3wZHxAz6ZG2n8BZC5T1PcUCPBWng0LPL0PbDgJRsiy3AK0CGlD
 PnEN/s083EvK/kdQaUuPCQe+mPClCtPp2ejZ5NnDXwnXa2KebpA0P0qsCMbSgfzzw2L5
 nkvQ==
X-Gm-Message-State: AOAM533nndUS4R7J7LTWpGTfWVs/zmhpca6kBAbzVaBhriRzvnTCmg5K
 KSW7mrlIFBG7rT17K3I0EaJAOw==
X-Google-Smtp-Source: ABdhPJw7JKGfhtf3xhglvwKuCf7tiq5byULmqZPX/onK7gDxOwmiShZCnNHHKkZbJwIlhjSsWTfaDg==
X-Received: by 2002:a17:903:32c7:b0:154:4156:f384 with SMTP id
 i7-20020a17090332c700b001544156f384mr6965753plr.34.1648756463019; 
 Thu, 31 Mar 2022 12:54:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056a00114a00b004f784ba5e6asm323970pfm.17.2022.03.31.12.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:54:22 -0700 (PDT)
Date: Thu, 31 Mar 2022 12:54:22 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 12:54:20 PDT (-0700)
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
In-Reply-To: <CAKmqyKMsG6d7jaS2gxXxh+qONWkWGbHFwLK9tYb2q7eeQe77uw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-beb640a4-0833-45b9-a57d-1e98464152f5@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: phantom@zju.edu.cn, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org,
 idan.horowitz@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Mar 2022 22:13:39 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Mar 31, 2022 at 2:36 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 30 Mar 2022 20:23:21 PDT (-0700), alistair23@gmail.com wrote:
>> > On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>> >>
>> >> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >> >
>> >> >
>> >> > Presumably you mean "revert" here?  That might be the right way to go,
>> >> > just to avoid breaking users (even if we fix the kernel bug, it'll take
>> >> > a while to get everyone to update).  That said, this smells like the
>> >> > sort of thing that's going to crop up at arbitrary times in dynamic
>> >> > systems so while a revert looks like it'd work around the boot issue we
>> >> > might be making more headaches for folks down the road.
>> >> >
>> >>
>> >> The opposite in fact, I did not suggest to revert it, but rather undo
>> >> the revert (as Alistair already removed it from the apply-next tree),
>> >> since my original patch fixes buggy behaviour that is blocking the
>> >> testing of some embedded software on QEMU.
>>
>> Ah, sorry -- the QEMU tree I was looking at still had the patch in
>> there, must have just been an old one.
>>
>> > So, this is a little tricky.
>> >
>> > We want to apply the fix, but that will break current users.
>> >
>> > Once the fix is merged into Linux we can apply it here. That should
>> > hopefully be right at the start of the 7.1 QEMU development window,
>> > which should give time for the fix to propagate into stable kernels
>> > and not break too many people by the time QEMU is released.
>>
>> If you think this is a Linux bug then that makes sense, but I think this
>> is a QEMU bug -- I sent a patch, not sure if it went through as it didn't
>> make it to lore.
>
> Ah whoops. I saw the patch but didn't read it, then I assumed it was a
> Linux bug from your diff earlier.

No problem, that was the first thing I sent in the morning so I doubt it 
made any sense.

>
>>
>> I also think the bug will manifest without the TB exit patch, maybe in
>> single-step mode and definately if we happen to exit the TB at that
>> point for other reasons.  Assuming my reasoning is correct in that
>> patch, we may also be hitting this as arbitrary corruption anywhere.
>> I'd started to write up a "QEMU errata" Linux patch for this, but then
>> convinced myself that just adding the sfence.vma was insufficient.
>
> Yeah, looking at it now I agree, I'll send a PR for 7.0.

Thanks!

