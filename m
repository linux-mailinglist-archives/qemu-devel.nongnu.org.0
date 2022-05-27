Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C71535F14
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 13:16:59 +0200 (CEST)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuXxi-0002Hy-34
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 07:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuXnr-0004Nb-Fw
 for qemu-devel@nongnu.org; Fri, 27 May 2022 07:06:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuXnm-00054m-Vs
 for qemu-devel@nongnu.org; Fri, 27 May 2022 07:06:46 -0400
Received: by mail-wm1-x32e.google.com with SMTP id z17so2452009wmf.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 04:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6e89dnr80+EP8ZVPNUpUNHeefw+2KHhxs5yMFqcG0ZA=;
 b=cbs4IGHI3gEOvrzvGo88kiULjzuv1ISsssBra/2AfcUpArXkKuFzadwUSVVMRB/RX0
 TIT7ewmEcgtrLqyJ7cWUbp9R83bhbgtW3HQsJbxX5SwPLaUVMzv1nSpD5msn2plSznhU
 vvvQbHJVX64g00J1CSDbJOiDMgFeTPOPH4rXLT7cVvfSbgVftgqc7Cw8fh9P8vjgY6qo
 UNvIpPHVbRixAeNF8oB9cil+318NYLx97jL2ljHOy9G91blM02Hnonvz2qrcMuPok22r
 0rG/vcNsO+OePY9qRFp1Pit8qkeS+Ic3i07mY/nwZHTMUoOOTsATuZwtaV0ODbk7vlkd
 KlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6e89dnr80+EP8ZVPNUpUNHeefw+2KHhxs5yMFqcG0ZA=;
 b=vGiLZq3b6h4KLvwTpAJ38XzzI79howshszaXnt3fazQ644tYZyGVsX0nsnW7Qbxpdk
 THfvcYF2ZNaxOXZ1ry3035S9Owjfz2G8Se/dXiPcAwvawDXpADtn+gZ97BSeLmuAkSJU
 2Mo/HOAon5chXlbUmsPp3qIbOwExJA9FR/9Bf+AO2WmyLB/GBMxQ0F5DpfnF67u9AoeK
 NQ7MiB1SREMIekIPSTqLusz6szjf/zfO2n0FPAhtAxI8OA4ikeXl+ly71DN3VmYPJ0jP
 PS7gkDBZet3+ru1imWxj3wdQyeEu4ncxv0TtGdYhmt2pJMqcwDhctiQUfatDDvcA8yew
 PVUQ==
X-Gm-Message-State: AOAM531Vw0YeMbPuulUPfUPQDDs7Hx2cchGJO2kj87E0naEay0feDdZK
 uNt83Jic8QHm9E6TFSyvsmqFG2Zk5NTEYg==
X-Google-Smtp-Source: ABdhPJxleLLg9x+vkHjwEp2yEe6ccj411Qnbdb6tGpGqPwgPRC+Lww0ZMNkY96ordgP6fwCVbOOYjA==
X-Received: by 2002:a05:600c:3d10:b0:397:835e:bf64 with SMTP id
 bh16-20020a05600c3d1000b00397835ebf64mr5094776wmb.167.1653649594497; 
 Fri, 27 May 2022 04:06:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adfea04000000b0020d0c48d135sm1506097wrm.15.2022.05.27.04.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 04:06:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2A581FFB7;
 Fri, 27 May 2022 12:06:32 +0100 (BST)
References: <559271048dfe01bf1a77c36321ceb1c5b4f6efe0.camel@suse.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "cfontana@suse.de"
 <cfontana@suse.de>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: make -j check failing on master, interesting valgrind errors on
 qos-test vhost-user-blk-test/basic
Date: Fri, 27 May 2022 12:02:54 +0100
In-reply-to: <559271048dfe01bf1a77c36321ceb1c5b4f6efe0.camel@suse.com>
Message-ID: <87ilprz13b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


Dario Faggioli <dfaggioli@suse.com> writes:

> [[PGP Signed Part:Undecided]]
> On Fri, 2022-05-27 at 10:18 +0200, Claudio Fontana wrote:
>> On 5/27/22 9:26 AM, Dario Faggioli wrote:
>> > >=20
>> > Yes, this kind of matches what I've also seen and reported about in
>> > <5bcb5ceb44dd830770d66330e27de6a4345fcb69.camel@suse.com>. If
>> > enable/run just one of:
>> > - reconnect
>> > - flags_mismatch
>> > - connect_fail
>> >=20
>> > I see no issues.
>>=20
>> On the countrary, for me just running a single one of those can fail.
>>=20
> Well, but you said (or at least so I understood) that running the test
> for the first time, works.
>
> Then, when you run it multiple times, things start to fail.
>
> That was, in fact, my point... I was making the parallelism between the
> fact running only one of those tests works for me and the fact that
> running the test for the first time works for you too.

Hmm so the qos-test is a bit weird as it:

 - forks itself to run a single subtest (g_test_trap_subprocess)
 - forks itself again for provide the dummy vhost-user daemon
 - as well as the fork/execve for qemu itself

while all the paths used for communication should be unique I wouldn't
be surprised if there is a racey interaction or two in the whole thing.
We even see a bit of this is the fact we don't cleanly tear stuff down
so QEMU sees the vhost-user socket disappear under it's feet.

>
> And between the fact that running two tests, one after the other, fails
> for me and the fact that running the same tests multiple times fails
> for you too.
>
> :-)
>
>> > However, Claudio, AFAIUI, you're seeing this with an older GCC and
>> > without LTO, right?
>>=20
>> Yes, to provide a different angle I tried on veteran OpenSUSE Leap
>> 15.2, so gcc is based on 7.5.0.
>>=20
>> I don't think LTO is being used in any way.
>>=20
> Yep, agreed. Now I don't think it's related to LTO specifically either.
>
> Although, it's at least a bit of an Heisenbug. I mean, we're seeing it
> (with two different setups), but for others, things work fine, I guess?
>
> Regards


--=20
Alex Benn=C3=A9e

