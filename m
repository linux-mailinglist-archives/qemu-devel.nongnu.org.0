Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDD46EBF24
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 13:32:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqXwh-0000pj-OH; Sun, 23 Apr 2023 07:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pqXwU-0000p1-Fs
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 07:31:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pqXwQ-0006K2-QV
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 07:31:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3826B40146;
 Sun, 23 Apr 2023 14:31:33 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 733CB95;
 Sun, 23 Apr 2023 14:31:32 +0300 (MSK)
Message-ID: <30817af4-5b21-b1ff-293c-f39196842077@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2023 14:31:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: get_relocated_path: the configured paths are not looked for?
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
 <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
 <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
 <63948283-d7dc-924b-c19a-6e376096daac@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <63948283-d7dc-924b-c19a-6e376096daac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -90
X-Spam_score: -9.1
X-Spam_bar: ---------
X-Spam_report: (-9.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

23.04.2023 14:22, Akihiko Odaki пишет:
> On 2023/04/23 19:28, Michael Tokarev wrote:
>> 20.04.2023 08:29, Akihiko Odaki wrote:
>>> On 2023/04/19 16:32, Michael Tokarev wrote:
>>>> Hello!
>>>>
>>>> Today I discovered an interesting issue here: I copied a system-installed
>>>> binary into another directory, in order to debug an unrelated issue. Just
>>>> to discover it does not work, being unable to find any modules or data
>>>> files.
>>>>
>>>> Here's how the strace of typical qemu-system-i386 run looks like (the
>>>> relevant parts only):
>>>>
>>>> access("/tmp/qemu-bundle", R_OK) = -1 ENOENT (No such file or directory)
>>>> access("/tmp/b/../lib/x86_64-linux-gnu/qemu/accel-tcg-i386.so", F_OK) = -1 ENOENT (No such file or directory)
>>>> access("/var/run/qemu/Debian_1_8.0~rc4+dfsg-3/accel-tcg-i386.so", F_OK) = -1 ENOENT (No such file or directory)
>>>>
>>>> (the executable in this case is in /tmp, obviously).  And it fails with
>>>> error "fatal: could not load module for type 'tcg-accel-ops'".
>>>>
>>>> This is despite the fact that qemu has been configured with proper --libdir
>>>> and other --foodir to point to actual dirs such as /usr/lib /usr/share etc.
>>>
>>> Some files in QEMU installation is closely coupled with the binary so it does not make much sense to copy only the executable to another directory. 
>>> You need to copy all of the files QEMU owns to relocate a QEMU installation. QEMU uses relative paths to find such relocated files.
>>>
>>> That said, it is indeed confusing that QEMU uses relative paths even if you specify an absolute path for --libdir. I prefer to require to specify 
>>> relative paths for --libdir and other options to make a QEMU installation relocatable, but I didn't dare making such a breaking change.
>>
>> Well, quite often it makes little sense still.
>>
>> For example, in debian we had to (temporarily) move qemu-system-i386 from
>> /usr/bin/ to /usr/libexec/, replacing the /usr/bin/ one with a shell wrapper
>> (to decouple xen hvm build out of main qemu build). It was just by a chance
>> the directory nesting is the same still, - I wanted to move it to /usr/lib/qemu/
>> instead.  But at least this one still works.  Ditto for the actual xen version,
>> the binary is in /usr/libexec/qemu-system-i386-xen now, I was about to move it
>> to /usr/libexec/xen/qemu-system-i386 instead.
>>
>> I see absolutely no reason for the binary to look into /usr/libexec/share/qemu/bios.bin
>> if it is told to get all data files from /usr/share/qemu/.
> 
> What about specifying --bindir=/usr/libexec/xen?

It will try to find other binaries in /usr/libexec/xen/, which are actually in
/usr/bin.

> As you say, data files are not tightly coupled with QEMU version and it is quite possible to run QEMU with data files from another QEMU version.

Nope and nope: first, I never said it (it was you who said that), and second,
it is quite okay to mix-n-match data files with qemu binaries. We're way past
the times when each minor qemu release required its own build of vgabios.

If we're to require qemu-version-specific data dir, it would be something
like /usr/share/qemu/$qemu_version/bios.bin.

> However it's not true for all files QEMU installs. Especially module files like accel-tcg-i386.so are tightly coupled with the executable and QEMU is 
> not expected to work if the exact modules which came with the executable are not provided.

The .so files are different. There are also other modules (block-iscsi.so).
*Those* are already in version-specific subdir of a lbdir.

>> I think I'll just remove this (very questionable) behavior at least from the
>> Debian package.  I already patched out the previous version of this, when
>> it looked at ${exe_path}/../pc-bios - this at least made sense when we
>> needed to find firmware files for just-built qemu, in the source dir. But
>> it makes no sense (in my opinion) to do that for the installed version.
> 
> It uses qemu-bundle directory for just-built QEMU so it does not matter for the scenario.

Yes. Still I want to be able to run tests, - this is exactly what the older code
looking for ../pc-bios/ did, and what current qemu-bundle code does.

> The scenario where this conversion for relative path makes sense is the case you need to compare the behavior of two packaged versions of QEMU, for 
> example. In such case, you can extract each package into a different directory and run them. Each QEMU executable will use relative paths to find 
> modules tied with it.

This is exactly what I do, - comparing qemu binaries from different packaged
builds. And this is exactly where it fails, - because the "other" binary is
not finding the binary files even if it were built with --qemu-datadir=/usr/share/qemu/
and all the binaries is there.

It should be the other way around: if you want this qemu to use a non-standard
path for firmware, - say, when you extracted "another" package in a temp dir
and need that one to use its own data dir - you run it wiht -L argument.

Thanks,

/mjt

