Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D4602E90
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:33:49 +0200 (CEST)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknfA-0006tr-06
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@bonslack.org>) id 1okmIA-0007HC-4a
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:05:58 -0400
Received: from bonnix.bonnix.it
 ([2a00:dcc0:dead:b9ff:fede:feed:2935:e3c8]:46500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu@bonslack.org>) id 1okmI4-0000jU-0Q
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:05:57 -0400
Received: from [10.0.0.70] (93-46-176-134.ip108.fastwebnet.it [93.46.176.134])
 (authenticated bits=0)
 by bonnix.bonnix.it (8.14.4/8.14.4) with ESMTP id 29ID5Nbh017658
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 18 Oct 2022 15:05:24 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 bonnix.bonnix.it 29ID5Nbh017658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonslack.org;
 s=20220805; t=1666098325;
 bh=W0Lq7589b7TvXWH3CdBp/PvkdwK6i0CEBwbMiJ81rXs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IprevDZF+TWfdGwWbAqBS6qy2WIfW+HLwUgM+22orjVq7uzDUaG401/NHLlNnHOHL
 6CwAOEQ+fANyQ2hU37yFw7GNrdFqkhTqjCDzXcPYz4x1cyBi34eFMP11OLa+Ue7HzJ
 tGiqvOuYLp28rA3/jpbClWyGWYLtQSCjmJqdcmx8=
Message-ID: <99174e4e-cf9e-b685-0911-d0f60a4e13be@bonslack.org>
Date: Tue, 18 Oct 2022 15:05:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Implement faccessat2
Content-Language: en-GB
To: Michael Tokarev <mjt@tls.msk.ru>, Helge Deller <deller@gmx.de>,
 WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221009060813.2289077-1-xen0n@gentoo.org>
 <f47945b7-afce-f0e3-2ca9-6c6cd119cae7@gmx.de>
 <a69ae272-b0a3-cea3-b9a7-a678af274c2a@msgid.tls.msk.ru>
From: Luca Bonissi <qemu@bonslack.org>
In-Reply-To: <a69ae272-b0a3-cea3-b9a7-a678af274c2a@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:dcc0:dead:b9ff:fede:feed:2935:e3c8;
 envelope-from=qemu@bonslack.org; helo=bonnix.bonnix.it
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Oct 2022 10:13:48 -0400
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

On 18/10/22 11:58, Michael Tokarev wrote:
> 10.10.2022 11:53, Helge Deller wrote:
>> On 10/9/22 08:08, WANG Xuerui wrote:
>>> User space has been preferring this syscall for a while, due to its
>>> closer match with C semantics, and newer platforms such as LoongArch
>>> apparently have libc implementations that don't fallback to faccessat
>>> so normal access checks are failing without the emulation in place.
>>
>> https://lore.kernel.org/qemu-devel/YzLdcnL6x646T61W@p100/

I think this one is the more complete and simplest solution.
Only change:

+#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)

with

+#if defined(TARGET_NR_faccessat2)

(not necessary to have host __NR_faccessat2)

and replace "faccessat2(...)" with "faccessat(...)", so it uses glibc 
implementation, that uses __NR_faccessat2 if host has this syscall, 
otherwise it falls back to faccessat with the addition of fstatat if 
flags!=0 (obviously, the definition of syscall4(... faccessat2 ...) 
should be removed).

> For loongarch64 users this has become essential, because this is a
> new enough arch so that userspace does not bother using older syscalls,
> in this case it uses faccessat2() for everything, and simplest programs
> fail under qemu due to no fallback whatsoever.

I agree that it has become essential. Development with qemu-user is much 
faster than using qemu-system, with all the benefits to use chroot on a 
shared file system.

I tested (and currently testing) the above patch with Slackware-current 
build scripts on x86_64 host: all works fine!

Thanks!
   Luca

