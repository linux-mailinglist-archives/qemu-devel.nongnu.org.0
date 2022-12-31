Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BFF65A3C3
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 12:36:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBa8c-0007Q0-C8; Sat, 31 Dec 2022 06:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1pBa8Z-0007Pg-IJ
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 06:34:51 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1pBa8X-0000r4-B4
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 06:34:51 -0500
Received: from [192.168.106.127]
 (dynamic-095-117-083-145.95.117.pool.telefonica.de [95.117.83.145])
 by csgraf.de (Postfix) with ESMTPSA id 6D3686080227;
 Sat, 31 Dec 2022 12:34:46 +0100 (CET)
Message-ID: <af4fcc32-e2d4-14ae-0edc-b70d7e877140@csgraf.de>
Date: Sat, 31 Dec 2022 12:34:45 +0100
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
 <e71675a2-e95d-8190-a9ee-32f02b96c60c@csgraf.de>
 <20221231101747.2skbmx3ipvr6xbx6@altlinux.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20221231101747.2skbmx3ipvr6xbx6@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 31.12.22 11:17, Vitaly Chikunov wrote:
> Alexander,
>
> On Sat, Dec 31, 2022 at 10:28:21AM +0100, Alexander Graf wrote:
>> On 30.12.22 19:16, Vitaly Chikunov wrote:
>>> On Fri, Dec 30, 2022 at 06:44:14PM +0100, Alexander Graf wrote:
>>>> This is a kvm kernel bug and should be fixed with the latest stable releases. Which kernel version are you running?
>>> This is on latest v6.0 stable - 6.0.15.
>>>
>>> Maybe there could be workaround for such situations? (Or maybe it's
>>> possible to make this error non-fatal?) We use qemu+kvm for testing and
>>> now we cannot test on x86.
>> I'm confused what's going wrong for you. I tried to reproduce the issue
>> locally, but am unable to:
>>
>> $ uname -a
>> Linux server 6.0.15-default #1 SMP PREEMPT_DYNAMIC Sat Dec 31 07:52:52 CET
>> 2022 x86_64 x86_64 x86_64 GNU/Linux
>> $ linux32 chroot .
>> $ uname -a
>> Linux server 6.0.15-default #1 SMP PREEMPT_DYNAMIC Sat Dec 31 07:52:52 CET
>> 2022 i686 GNU/Linux
>> $ cd qemu
>> $ file ./build/qemu-system-i386
>> ./build/qemu-system-i386: ELF 32-bit LSB shared object, Intel 80386, version
>> 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux
>> 3.2.0, BuildID[sha1]=f75e20572be5c604c121de4497397665c168aa4c, with
>> debug_info, not stripped
>> $ ./build/qemu-system-i386 --version
>> QEMU emulator version 7.2.0 (v7.2.0-dirty)
>> Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
>> $ ./build/qemu-system-i386 -nographic -enable-kvm
>> SeaBIOS (version rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org)
>> [...]
>>
>>
>> Can you please double check whether your host kernel version is 6.0.15?
>> Please paste the output of "uname -a".
> Excuse me, I'm incorrectly reported kernel version I tried to boot instead
> of host one. Host kernels are quite old, 5.15.59 and even 5.17.15 --
> where failure is occurring.
>
> I just tested on 5.15.85 and there is no failure.


Awesome, great to hear :). That means everything works as expected at least.


>    builder@i586:/.in$ uname -a
>    Linux localhost.localdomain 5.15.85-std-def-alt1 #1 SMP Wed Dec 21 21:14:40 UTC 2022 i686 GNU/Linux
>    builder@i586:/.in$ qemu-system-i386 -nographic -enable-kvm
>    SeaBIOS (version 1.16.1-alt1)
>
> Perhaps, one of solutions it to reboot our build fleet to newer kernels.
> [This maybe hard, though, since special builder node image should be
> created and reboot shall be coordinated through all systems, in compare,
> updating QEMU would be easier since chroot is created on every build].


I understand that it may be slightly painful to update your build fleet, 
but given this is a genuine kernel bug that has a fix available upstream 
and it only happens on niche corner cases (i386 QEMU on x86-64 Linux 
kernels with the bug) that I doubt anyone will use in production, I'd 
prefer we keep the QEMU logic as is :).

In the meanwhile, while you're patching the build fleet, you can apply 
the patch below as part of your build process to ensure you don't fail 
due to the kernel bug. Just make sure to remove it again as soon as 
you're done with the fleet update :).


diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a213209379..b9396bc7a6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2632,7 +2632,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
                  return ret;
              }
      }
+#ifdef __x86_64__
      if (kvm_vm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR)) {
+#else
+    if (0) {
+#endif
          bool r;

          ret = kvm_vm_enable_cap(s, KVM_CAP_X86_USER_SPACE_MSR, 0,

Alex



