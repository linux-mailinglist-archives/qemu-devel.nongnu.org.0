Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D36866C49F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:56:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRqQ-0000w7-5k; Mon, 16 Jan 2023 10:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHRqM-0000vr-JI
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:56:18 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>) id 1pHRqK-0004QA-VM
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 10:56:18 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 99D1E20DFE75;
 Mon, 16 Jan 2023 07:56:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 99D1E20DFE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673884575;
 bh=6TVxP60352fMoWoNdwHGSijprHa7fF9F0MLhyVdeG3o=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=NVFrOLl5bvqP7XtvvP/fFqrQDZcYD+RWm+f0D4dEwu4JndcidsAXARuFlErkFKR/s
 tHJ7bbaMKu5JeXdtLWbtF+8FuqZWdK8n/TU5+y8Jo58IxNIFDIifjjapCwLTIM+wZ4
 rkT0zzXppmHKOQoKYCUsd2noHZGrrNXzupyVNEeA=
Message-ID: <1e5c8643-e756-9110-70f1-a83e301cca03@linux.microsoft.com>
Date: Mon, 16 Jan 2023 16:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: eiakovlev@linux.microsoft.com
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, bmeng.cn@gmail.com, philmd@linaro.org
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
 <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
 <871qo7pszr.fsf@linaro.org>
 <CAFEAcA_9db5ijSTW1JBiC7kLUe+E=+OCAHg0xaoa-0p09Wbt3g@mail.gmail.com>
 <f2182772-661a-c021-061e-642ef3aea942@linux.microsoft.com>
 <CAFEAcA_TWOxz52q0EY0Bfvpwmg9bkVD1pSndiyQhfOtXOrtDMA@mail.gmail.com>
In-Reply-To: <CAFEAcA_TWOxz52q0EY0Bfvpwmg9bkVD1pSndiyQhfOtXOrtDMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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



On 1/6/23 7:58 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 6 Jan 2023 at 18:22, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
> >
> >
> > On 1/6/2023 17:28, Peter Maydell wrote:
> >> On Fri, 6 Jan 2023 at 15:44, Alex Bennée <alex.bennee@linaro.org> wrote:
> >>> Peter Maydell <peter.maydell@linaro.org> writes:
> >> I think the theory when the semihosting API was originally designed
> >> decades ago was basically "when the guest does fopen(...) this
> >> should act like it does on the host". So as a bit of portable
> >> guest code you would say whether you wanted a binary or a text
> >> file, and the effect would be that if you were running on Windows
> >> and you output a text file then you'd get \r\n like the user
> >> probably expected, and if on Linux you get \n.
> 
> > If SYS_OPEN is supposed to call fopen (i didn't actually know that..)
> > then it does make more sense for binary/text mode to be propagated from
> > guest.
> 
> It's not required to literally call fopen(). It just has to
> give the specified semantics for when the guest passes it a
> mode integer, which is defined in terms of the ISO C
> fopen() string semantics for "r", "rb", "r+", "r+b", etc.
> 
> > Qemu's implementation calls open(2) though, which is not correct
> > at all then. Well, as long as qemu does that, there is no
> > posix-compliant way to tell open(2) if it should use binary or text
> > mode, there is no notion of that as far as posix (and most
> > implementations) is concerned.
> 
> QEMU doesn't have to be pure POSIX compliant: we know what our
> supported host platforms are and we can freely use extensions
> they provide. If we want to achieve the semantics that semihosting
> asks for then we can do that with open(), by passing O_BINARY when
> the mode integer from the guest corresponds to a string with "b" in it.
> 
> I'm about 50:50 on whether we should do that vs documenting and
> commenting that we deliberately produce the same behaviour on all
> platforms by ignoring the 'b' flag, though.
> 
> thanks
> -- PMM
> 

Thanks Peter, i think i see your point. However, if you ask me, i feel like advertising a feature to guest code and only implementing it on 1 platform that supports it just because it has a non-standard POSIX implementation will only confuse the issue further.
Guest code doesn't want to care whether or not an emulator is running on Linux or Windows, there is no notion of that leaking to guest code. What it cares about is being able to consistently use a certain feature in their code.
So i think it would be rather useless to implement it on Windows-only given there is a clear alternative to switch to fopen. Just my 2 cents.

