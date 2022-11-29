Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900C163CB0D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 23:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p094i-0004Uv-10; Tue, 29 Nov 2022 17:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p094e-0004Ua-C4; Tue, 29 Nov 2022 17:27:33 -0500
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1p094b-0004d8-OS; Tue, 29 Nov 2022 17:27:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1669760844; bh=95Fxyn+ohdmahniEx70YCEubPgAVdhlQsChS/+Q52dE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HTkfDbrRa+K/DIFVhCn7KcWqLSiLyCIitlFEXro6A/yoqizGWn2lD22QDwcH17Vre
 Vp/qte4tXhf8WJquoFqcWOZKR1l/Jf3du+T4GS9NI1yJHBITkqvz/ItJvD3o2e8wfo
 x43aBuNyy6Uw/FM1zYM2kwI39NQGGMdg4JjmFiqfvQNjp7mHPQKbRC5TvZZp4QvdvG
 lGYg56q8wGgbK2DaXBOwmwEwY+JIJgCzrBDHi2fIrqG12UQMTVNn/JMjD9RD9QUknH
 YvnG5OnI1RmRzPnEqNmtCwbA4hlkNi/v+0KdFjUVsIZBzDsyxILxTK2XRVJXyTJKLG
 XvSP9JNkL94Sg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([77.178.0.21]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGyxN-1pD7NY3eF9-00E2JK; Tue, 29
 Nov 2022 23:27:23 +0100
Message-ID: <93a679b3-ddf9-354c-079d-b2e9b0ec9694@gmx.de>
Date: Tue, 29 Nov 2022 23:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git v2 9/9] hw/timer/imx_epit: fix compare timer
 handling
Content-Language: de-DE
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-9@git.sr.ht>
 <CAFEAcA-hDkGMnz4iO_V1FHHPer7uSMuNyzoaJu8wuoHY8NpCgg@mail.gmail.com>
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA-hDkGMnz4iO_V1FHHPer7uSMuNyzoaJu8wuoHY8NpCgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EM9OO953FOqmbYDHPVMVpzWcpjw+PY+bTcpc22LOmdRuxL7rH0A
 xMxopmUEVe3Z2eFyEMkalkteWhP9FjX95NoZjiQy+r26G8R2oX/Nlwv3jQUpb5JNSacFn3W
 2rgMjM5Ul49YxWigH5lPwb/6aASxwXaE6+0rr+icFXsCRDeMcPl9QJS1U0qrvFffe/GDU99
 Py6MfXU34jJTAesrg9FoQ==
UI-OutboundReport: notjunk:1;M01:P0:pKY/gkIaWt4=;AENNur2vRY9SidIV5xBXTpzHFIR
 Mx2fQF9BTIg0rHhnBEtPiMVJcWnkNWsoIeP/hMKQ6dMIj828eyKJyOKJ5kHFp4IbRnnRcWb3c
 t3pWhfC1jJ0gPXa89K4AUzPs/Gi9t6t1Me5JupVAYWo8eOxkiDB5Fpo+hlB/JuwWRpZzXOzRn
 cRA+bRenKITK/vwbrJ6wJfKnULuEPa3i6o6Cb6Q5m2McisicgOA5ICAg2jyTUwvUow8Gv7RtP
 jffmYJWNXaA6IodPDK7UvNdvoxIVoQNK8pWSPWVYLnaPSTF+TG/y5IWI4gKCKxXlV1eX1huPZ
 REcxSmjeXhuns68/FDhE4TR4SEWozBO1BjKzw9gFQz8FIUCEspkYP+2YDDYxvi2QSNy6i17aj
 KhjAa+HHOe7xcJ3EV+1wajOsqcz5qc/KINqYYenkGXdD25EMQUG26JvbjstrI77v7u2GtQPk1
 eGo4yM8GjYo/7CXmsIX3iMOxhkupyoJC0pbs4CsM/mOv8wPgxW0/l+1gyeqRi9kjjavTIpfuE
 wT7WZ+fVEPFc3FBUmeRXSozwiPk3bFMz3lCEQB8fzMGp+2HEZjw/4psDAdmYVGIdBLRcrGVX5
 /plpU8pZ6LpEc3nIFgKUsytOg1gYcmBfbv7Q5A+FjkM6+95ynZJ9oUou9gDjCNxjhWFnonyZ0
 tdEgG+iR8gle/t2WqpyHfl0VvsMvJTY0r3hQdGf+Xo3Mg+3/ysBemsqLccuNViziYff3MJLkR
 4X7A4t7xXsbyOneDGU/PLL96u59ZQxDkL0YUbsDj56TQ5QgD6dOXFjGhwU29i+JUUaXPpxj5c
 Ql49dVkA/Asi9DAXLhwgp/OADHRiiXWtn3PUovu0IuNIg4PeLwtbUBj5mWaQdVRLP4Tj8u2tg
 KnketkzkoZlIj3GRYqZiLhP0yFB4tkEPbOR34tvfFIWkRVCaaWg511R5/yl/MxTY050z4gMvL
 COKiVrzel2nUq1BZv7dDeBx71kQ=
Received-SPF: pass client-ip=212.227.15.18; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Peter,

> If you're correcting behaviour of the timer use here,
> you should start by fixing the way the timers are currently
> created with PTIMER_POLICY_LEGACY. That setting is basically
> "bug-for-bug-compatibility with very old QEMU, for devices
> where nobody really knows what the hardware behaviour should
> be". Where we do know what the hardware's supposed to do and
> we have some way of testing we're not breaking guest code,
> the right thing is to set the correct policy flags for
> the desired behaviour. These are documented in a comment
> near the top of include/hw/ptimer.h.

I would prefer to postpone changing PTIMER_POLICY_LEGACY to a
separate patchset, which is on top of the current one, as this
seems not to be an issue at the moment. Fixing the general isses
on access and ensure the flags are correct seem more pressing,
and this seem unrelated to the timer policy.


> It is modestly harmful because the sequence
>     counter =3D ptimer_get_count(s->timer_reload);
>     ...
>     ptimer_set_count(s->timer_cmp, counter);
>
> will cause the counter to lose or gain time. This happens because
> when you call "get" the ptimer code will look at the current exact
> time in nanoseconds and tell you the counter value at that point.
> That is probably somewhere in the middle of a timer-clock period
> (which runs at whatever frequency you tell the ptimer to use):
> for argument's sake, suppose the timer-clock counts every 1000ns.
> Suppose at the point of the 'get' the next tick will be in 300ns time.
> When you do a "set" that is assumed to be the result of a guest
> register write of some kind, and will effectively start a new
> timer-clock period. This means the next tick will not be for
> a full 1000ns, and we just lost 300ns (or gained 700ns perhaps).
> So it's better to avoid this kind of "get-and-then-set" code.

I see you point. The "get-and-then-set" was already in the code, I
did not really change this. I have tried to find a better way to
implement this, but could not come up with something so far. Any
suggestions here that is non trivial? Othereise I would prefer to
look into this in a new patch-set, together with replacing the
PTIMER_POLICY_LEGACY.


Axel

