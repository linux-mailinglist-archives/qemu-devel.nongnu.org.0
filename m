Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACAA6EBE99
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:28:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWx4-0006Dx-4E; Sun, 23 Apr 2023 06:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pqWwz-0006Dn-Q0
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:28:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pqWwx-0005LA-7D
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:28:09 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2802C40146;
 Sun, 23 Apr 2023 13:28:05 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 77BE595;
 Sun, 23 Apr 2023 13:28:04 +0300 (MSK)
Message-ID: <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2023 13:28:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: get_relocated_path: the configured paths are not looked for?
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
 <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -89
X-Spam_score: -9.0
X-Spam_bar: ---------
X-Spam_report: (-9.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.047,
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

20.04.2023 08:29, Akihiko Odaki wrote:
> On 2023/04/19 16:32, Michael Tokarev wrote:
>> Hello!
>>
>> Today I discovered an interesting issue here: I copied a system-installed
>> binary into another directory, in order to debug an unrelated issue. Just
>> to discover it does not work, being unable to find any modules or data
>> files.
>>
>> Here's how the strace of typical qemu-system-i386 run looks like (the
>> relevant parts only):
>>
>> access("/tmp/qemu-bundle", R_OK) = -1 ENOENT (No such file or directory)
>> access("/tmp/b/../lib/x86_64-linux-gnu/qemu/accel-tcg-i386.so", F_OK) = -1 ENOENT (No such file or directory)
>> access("/var/run/qemu/Debian_1_8.0~rc4+dfsg-3/accel-tcg-i386.so", F_OK) = -1 ENOENT (No such file or directory)
>>
>> (the executable in this case is in /tmp, obviously).  And it fails with
>> error "fatal: could not load module for type 'tcg-accel-ops'".
>>
>> This is despite the fact that qemu has been configured with proper --libdir
>> and other --foodir to point to actual dirs such as /usr/lib /usr/share etc.
> 
> Some files in QEMU installation is closely coupled with the binary so it does not make much sense to copy only the executable to another directory. 
> You need to copy all of the files QEMU owns to relocate a QEMU installation. QEMU uses relative paths to find such relocated files.
> 
> That said, it is indeed confusing that QEMU uses relative paths even if you specify an absolute path for --libdir. I prefer to require to specify 
> relative paths for --libdir and other options to make a QEMU installation relocatable, but I didn't dare making such a breaking change.

Well, quite often it makes little sense still.

For example, in debian we had to (temporarily) move qemu-system-i386 from
/usr/bin/ to /usr/libexec/, replacing the /usr/bin/ one with a shell wrapper
(to decouple xen hvm build out of main qemu build). It was just by a chance
the directory nesting is the same still, - I wanted to move it to /usr/lib/qemu/
instead.  But at least this one still works.  Ditto for the actual xen version,
the binary is in /usr/libexec/qemu-system-i386-xen now, I was about to move it
to /usr/libexec/xen/qemu-system-i386 instead.

I see absolutely no reason for the binary to look into /usr/libexec/share/qemu/bios.bin
if it is told to get all data files from /usr/share/qemu/.

Quite often I debug issues and have to compare "old" qemu with current one
(exactly like I did in this case), extracting the old binary into /tmp/.
And wonder why it breaks in other ways.

And I still don't see how this turning absolute paths into relative (behind the
scenes) can be useful. If we put qemu into /usr/local/bin for example, it
can be configured to look for data files in /usr/local/share just fine,
there's no need for this "magic". On the other hand, if we really want
to use a different data dir, we can pass a right -L option.

I think I'll just remove this (very questionable) behavior at least from the
Debian package.  I already patched out the previous version of this, when
it looked at ${exe_path}/../pc-bios - this at least made sense when we
needed to find firmware files for just-built qemu, in the source dir. But
it makes no sense (in my opinion) to do that for the installed version.

Thanks,

/mjt

