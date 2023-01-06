Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C875660651
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDrMh-0007a6-Tl; Fri, 06 Jan 2023 13:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDrMf-0007Zy-KS
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:22:49 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>) id 1pDrMd-0000RO-MJ
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:22:49 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id D874820B8762;
 Fri,  6 Jan 2023 10:22:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D874820B8762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673029365;
 bh=ITFBFfu6kj7QyHwhmRwLd/DgIo0Daw5HtDjOgY1ivBk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QcvOXb17Q0CE5ITUUPakFzB0KIoiUw8tVGuir44O+T1bs0mJOPk9wrLjzI+MmhA1R
 hcuFBO9f68UC2Vs4nzyywACaTywQy/RGfSzUyOgQMjT4QMQf60XNeAbG1a3dDaQkAD
 PSBNDXX5NfvnQm+xHHNsK7Z8UlrrBtPNYM1HvXOU=
Message-ID: <f2182772-661a-c021-061e-642ef3aea942@linux.microsoft.com>
Date: Fri, 6 Jan 2023 19:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, bmeng.cn@gmail.com, philmd@linaro.org
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
 <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
 <871qo7pszr.fsf@linaro.org>
 <CAFEAcA_9db5ijSTW1JBiC7kLUe+E=+OCAHg0xaoa-0p09Wbt3g@mail.gmail.com>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <CAFEAcA_9db5ijSTW1JBiC7kLUe+E=+OCAHg0xaoa-0p09Wbt3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -226
X-Spam_score: -22.7
X-Spam_bar: ----------------------
X-Spam_report: (-22.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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


On 1/6/2023 17:28, Peter Maydell wrote:
> On Fri, 6 Jan 2023 at 15:44, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> The semihosting API, at least for Arm, has a modeflags string so the
>>> guest can say whether it wants to open O_BINARY or not:
>>> https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst#sys-open-0x01
>>>
>>> So we need to plumb that down through the common semihosting code
>>> into this function and set O_BINARY accordingly. Otherwise guest
>>> code that asks for a text-mode file won't get one.
>> We used to, in fact we still have a remnant of the code where we do:
>>
>>    #ifndef O_BINARY
>>    #define O_BINARY 0
>>    #endif
>>
>> I presume because the only places it exists in libc is wrapped in stuff
>> like:
>>
>>    #if defined (__CYGWIN__)
>>    #define O_BINARY      _FBINARY
>>
>> So the mapping got removed in a1a2a3e609 (semihosting: Remove
>> GDB_O_BINARY) because GDB knows nothing of this and as far as I can tell
>> neither does Linux whatever ISO C might say about it.
>>
>> Is this a host detail leakage to the guest? Should a semihosting app be
>> caring about what fopen() modes the underlying host supports? At least a
>> default O_BINARY for windows is most likely to DTRT.
> I think the theory when the semihosting API was originally designed
> decades ago was basically "when the guest does fopen(...) this
> should act like it does on the host". So as a bit of portable
> guest code you would say whether you wanted a binary or a text
> file, and the effect would be that if you were running on Windows
> and you output a text file then you'd get \r\n like the user
> probably expected, and if on Linux you get \n.
>
> The gdb remote protocol, on the other hand, assumes "all files
> are binary", and the gdb source that implements the gdb remote
> file I/O operations does "always set O_BINARY if it's defined":
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gdb/remote-fileio.c;h=3ff2a65b0ec6c7695f8659690a8f1dce9b5cdf5f;hb=HEAD#l141
>
> So this is kind of an impedance mismatch problem -- the semihosting
> API wants functionality that the gdb protocol can't give us.
> But we don't have that mismatch issue if we're directly making
> host filesystem calls, because there we can set O_BINARY or
> not as we choose.
>
> Alternatively, we could decide that our implementation of
> semihosting consistently uses \n for the newline character
> on all hosts, such that guests which try to write text files
> on Windows hosts get the "wrong" newline type, but OTOH
> get consistently the same file regardless of host and regardless
> of whether semihosting is going via gdb or not. But if
> we want to do that we should at least note in a comment
> somewhere that that's a behaviour we've chosen, not something
> that's happened by accident. Given Windows is less unfriendly
> about dealing with \n-terminated files these days that might
> not be an unreasonable choice.
>
> -- PMM


If SYS_OPEN is supposed to call fopen (i didn't actually know that..) 
then it does make more sense for binary/text mode to be propagated from 
guest. Qemu's implementation calls open(2) though, which is not correct 
at all then. Well, as long as qemu does that, there is no 
posix-compliant way to tell open(2) if it should use binary or text 
mode, there is no notion of that as far as posix (and most 
implementations) is concerned. My change then acts as a way to at least 
have predictable behavior across platforms, but i guess a more correct 
approach would be to follow actual semi-hosting spec and switch to fopen.



