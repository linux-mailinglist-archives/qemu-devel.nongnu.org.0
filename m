Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A1665A35B
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 10:30:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBYAG-00021A-Q8; Sat, 31 Dec 2022 04:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1pBYAE-00020t-JP
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 04:28:26 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1pBYAC-0002IQ-II
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 04:28:26 -0500
Received: from [192.168.106.127]
 (dynamic-095-117-083-145.95.117.pool.telefonica.de [95.117.83.145])
 by csgraf.de (Postfix) with ESMTPSA id 24C706080317;
 Sat, 31 Dec 2022 10:28:22 +0100 (CET)
Message-ID: <e71675a2-e95d-8190-a9ee-32f02b96c60c@csgraf.de>
Date: Sat, 31 Dec 2022 10:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: qemu-system-i386: Could not install MSR_CORE_THREAD_COUNT
 handler: Success
Content-Language: en-US
To: Vitaly Chikunov <vt@altlinux.org>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Alexey Shabalin <shaba@basealt.ru>, "Dmitry V. Levin" <ldv@altlinux.org>
References: <20221230142222.r3ahbntnlvj7jpc2@altlinux.org>
 <13D59483-BE6C-4AB5-AAB8-78B3A03D96E7@csgraf.de>
 <20221230181659.obkhfe7g6jn2wkb6@altlinux.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20221230181659.obkhfe7g6jn2wkb6@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.146,
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

Hi Vitaly,

On 30.12.22 19:16, Vitaly Chikunov wrote:
> Alexander,
>
> On Fri, Dec 30, 2022 at 06:44:14PM +0100, Alexander Graf wrote:
>> Hi Vitaly,
>>
>> This is a kvm kernel bug and should be fixed with the latest stable releases. Which kernel version are you running?
> This is on latest v6.0 stable - 6.0.15.
>
> Maybe there could be workaround for such situations? (Or maybe it's
> possible to make this error non-fatal?) We use qemu+kvm for testing and
> now we cannot test on x86.

I'm confused what's going wrong for you. I tried to reproduce the issue 
locally, but am unable to:

$ uname -a
Linux server 6.0.15-default #1 SMP PREEMPT_DYNAMIC Sat Dec 31 07:52:52 
CET 2022 x86_64 x86_64 x86_64 GNU/Linux
$ linux32 chroot .
$ uname -a
Linux server 6.0.15-default #1 SMP PREEMPT_DYNAMIC Sat Dec 31 07:52:52 
CET 2022 i686 GNU/Linux
$ cd qemu
$ file ./build/qemu-system-i386
./build/qemu-system-i386: ELF 32-bit LSB shared object, Intel 80386, 
version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, 
for GNU/Linux 3.2.0, 
BuildID[sha1]=f75e20572be5c604c121de4497397665c168aa4c, with debug_info, 
not stripped
$ ./build/qemu-system-i386 --version
QEMU emulator version 7.2.0 (v7.2.0-dirty)
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
$ ./build/qemu-system-i386 -nographic -enable-kvm
SeaBIOS (version rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org)
[...]


Can you please double check whether your host kernel version is 6.0.15? 
Please paste the output of "uname -a".


Alex


