Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC616EBF28
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 13:48:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqYBh-0003gM-SR; Sun, 23 Apr 2023 07:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqYBe-0003ZM-IY
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 07:47:23 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqYBc-0004T4-Ea
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 07:47:22 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5208be24dcbso2730829a12.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 04:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682250439; x=1684842439;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6gpUvbGM2AE4ezqwrLeLvdFdAZIHC3UCUfHpbMKtfbU=;
 b=Wsd+SoZWSU1fhWGytKDFahoVmClf14NzVBlWkAdhdGzcljC4HSpFHLvo3qg1qz51Ll
 iJS+MRvyj1+7gPGz1fBx8VTi6HLC1XwUETu2H0/Ft8iRzJr/GuqOtPbHFtwESLMHBZ1U
 A7Nvl+00kqWoUl5pQE/3NJZY4UAqszQWBXL1oWhHXgnYyH8YrAtfikK8Od2XN9W3uO3g
 nW96JbIwyOMk7sKtDsNMtjDkBzuzhUe1f5Pa96RCwSXZQ3kE7tvYBOSy8HhYFi1rAefj
 rOV8s/JBxwdwZLwtdMD/s10YKwlsbH22wLYtQmg5gzHoiH802KHkCh6QUmRHXkaynhXX
 1QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682250439; x=1684842439;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6gpUvbGM2AE4ezqwrLeLvdFdAZIHC3UCUfHpbMKtfbU=;
 b=IsaxF6/2vHdFQ4LT/8zDHnURZhFW4ysidY9V33LZVLK4VuN+MNTcebSQZFwYLoJt4T
 aynkMmxhO5e6BcngqmiUxTSrfYaRKnK8lwzDVUZQz0pAXTnLlORSDutOYATzX06KI6XV
 te8PBWsVJQP2g1lOLWvHuSNJBoef5Ma0zicS1sgzbqm8zdmFbRo3OsXnsjA/jCj4KQ3M
 3JyqDtRJrLgRsuyYMT/69WN/XXHbodmZVe3Ln7o389MpmdrcNBiaDHe7PwCwmxkAvRmj
 JjBEo7lZJqff+X4ZLYSdgKBPut9wnbDEiZF2zEQ2XhXSlXuH9mIPhrUuYpjwqaST4Tvg
 DS8Q==
X-Gm-Message-State: AAQBX9cZh9jrF0WoH5imUY1dOxHtVvjdZ35eIpve/7aSswSjhukcnkwx
 YOlgoVmP7oOZRxkpTEqFa5t2fMACu4I=
X-Google-Smtp-Source: AKy350bA20jcqofQULJsQPshwK4EPwP+wjN+pp1do25pd/WVuHn+ulHyWcfBya3Peg1nOPk7mJHybw==
X-Received: by 2002:a17:90b:30ca:b0:237:161e:33bc with SMTP id
 hi10-20020a17090b30ca00b00237161e33bcmr10442160pjb.16.1682250438482; 
 Sun, 23 Apr 2023 04:47:18 -0700 (PDT)
Received: from [10.213.29.157] ([157.82.194.11])
 by smtp.gmail.com with ESMTPSA id
 ls17-20020a17090b351100b0023a9564763bsm6755285pjb.29.2023.04.23.04.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 04:47:18 -0700 (PDT)
Message-ID: <fa344795-07c0-b6a2-5666-9a44e1671b38@gmail.com>
Date: Sun, 23 Apr 2023 20:47:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: get_relocated_path: the configured paths are not looked for?
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
 <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
 <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
 <63948283-d7dc-924b-c19a-6e376096daac@gmail.com>
 <30817af4-5b21-b1ff-293c-f39196842077@msgid.tls.msk.ru>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <30817af4-5b21-b1ff-293c-f39196842077@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/04/23 20:31, Michael Tokarev wrote:
> 23.04.2023 14:22, Akihiko Odaki пишет:
>> On 2023/04/23 19:28, Michael Tokarev wrote:
>>> 20.04.2023 08:29, Akihiko Odaki wrote:
>>>> On 2023/04/19 16:32, Michael Tokarev wrote:
>>>>> Hello!
>>>>>
>>>>> Today I discovered an interesting issue here: I copied a 
>>>>> system-installed
>>>>> binary into another directory, in order to debug an unrelated 
>>>>> issue. Just
>>>>> to discover it does not work, being unable to find any modules or data
>>>>> files.
>>>>>
>>>>> Here's how the strace of typical qemu-system-i386 run looks like (the
>>>>> relevant parts only):
>>>>>
>>>>> access("/tmp/qemu-bundle", R_OK) = -1 ENOENT (No such file or 
>>>>> directory)
>>>>> access("/tmp/b/../lib/x86_64-linux-gnu/qemu/accel-tcg-i386.so", 
>>>>> F_OK) = -1 ENOENT (No such file or directory)
>>>>> access("/var/run/qemu/Debian_1_8.0~rc4+dfsg-3/accel-tcg-i386.so", 
>>>>> F_OK) = -1 ENOENT (No such file or directory)
>>>>>
>>>>> (the executable in this case is in /tmp, obviously).  And it fails 
>>>>> with
>>>>> error "fatal: could not load module for type 'tcg-accel-ops'".
>>>>>
>>>>> This is despite the fact that qemu has been configured with proper 
>>>>> --libdir
>>>>> and other --foodir to point to actual dirs such as /usr/lib 
>>>>> /usr/share etc.
>>>>
>>>> Some files in QEMU installation is closely coupled with the binary 
>>>> so it does not make much sense to copy only the executable to 
>>>> another directory. You need to copy all of the files QEMU owns to 
>>>> relocate a QEMU installation. QEMU uses relative paths to find such 
>>>> relocated files.
>>>>
>>>> That said, it is indeed confusing that QEMU uses relative paths even 
>>>> if you specify an absolute path for --libdir. I prefer to require to 
>>>> specify relative paths for --libdir and other options to make a QEMU 
>>>> installation relocatable, but I didn't dare making such a breaking 
>>>> change.
>>>
>>> Well, quite often it makes little sense still.
>>>
>>> For example, in debian we had to (temporarily) move qemu-system-i386 
>>> from
>>> /usr/bin/ to /usr/libexec/, replacing the /usr/bin/ one with a shell 
>>> wrapper
>>> (to decouple xen hvm build out of main qemu build). It was just by a 
>>> chance
>>> the directory nesting is the same still, - I wanted to move it to 
>>> /usr/lib/qemu/
>>> instead.  But at least this one still works.  Ditto for the actual 
>>> xen version,
>>> the binary is in /usr/libexec/qemu-system-i386-xen now, I was about 
>>> to move it
>>> to /usr/libexec/xen/qemu-system-i386 instead.
>>>
>>> I see absolutely no reason for the binary to look into 
>>> /usr/libexec/share/qemu/bios.bin
>>> if it is told to get all data files from /usr/share/qemu/.
>>
>> What about specifying --bindir=/usr/libexec/xen?
> 
> It will try to find other binaries in /usr/libexec/xen/, which are 
> actually in
> /usr/bin.

So you want to place only qemu-system-i386 (and perhaps 
qemu-system-x86_64?) into /usr/libexec/xen but others in /usr/bin? That 
scenario is certainly not covered with the current QEMU and it will need 
to be patched for it.

> 
>> As you say, data files are not tightly coupled with QEMU version and 
>> it is quite possible to run QEMU with data files from another QEMU 
>> version.
> 
> Nope and nope: first, I never said it (it was you who said that), and 
> second,
> it is quite okay to mix-n-match data files with qemu binaries. We're way 
> past
> the times when each minor qemu release required its own build of vgabios.
> 
> If we're to require qemu-version-specific data dir, it would be something
> like /usr/share/qemu/$qemu_version/bios.bin.

I think we don't have any disagreement here. Data files are *not* 
specific to a QEMU version, and you *can* just use the same data files 
for different QEMU versions. No need for qemu-version-specific data dir.

> 
>> However it's not true for all files QEMU installs. Especially module 
>> files like accel-tcg-i386.so are tightly coupled with the executable 
>> and QEMU is not expected to work if the exact modules which came with 
>> the executable are not provided.
> 
> The .so files are different. There are also other modules (block-iscsi.so).
> *Those* are already in version-specific subdir of a lbdir.

So that is how QEMU is configured for Debian? That's perfectly 
legitimate, but not all distributions do that.

Also, that works only if the version changed. For example, consider the 
case where you patched a module downstream. To compare the behaviors of 
the patched and unpatched ones, you'll need to copy the modules 
somewhere else.

> 
>>> I think I'll just remove this (very questionable) behavior at least 
>>> from the
>>> Debian package.  I already patched out the previous version of this, 
>>> when
>>> it looked at ${exe_path}/../pc-bios - this at least made sense when we
>>> needed to find firmware files for just-built qemu, in the source dir. 
>>> But
>>> it makes no sense (in my opinion) to do that for the installed version.
>>
>> It uses qemu-bundle directory for just-built QEMU so it does not 
>> matter for the scenario.
> 
> Yes. Still I want to be able to run tests, - this is exactly what the 
> older code
> looking for ../pc-bios/ did, and what current qemu-bundle code does.
> 
>> The scenario where this conversion for relative path makes sense is 
>> the case you need to compare the behavior of two packaged versions of 
>> QEMU, for example. In such case, you can extract each package into a 
>> different directory and run them. Each QEMU executable will use 
>> relative paths to find modules tied with it.
> 
> This is exactly what I do, - comparing qemu binaries from different 
> packaged
> builds. And this is exactly where it fails, - because the "other" binary is
> not finding the binary files even if it were built with 
> --qemu-datadir=/usr/share/qemu/
> and all the binaries is there.
> 
> It should be the other way around: if you want this qemu to use a 
> non-standard
> path for firmware, - say, when you extracted "another" package in a temp 
> dir
> and need that one to use its own data dir - you run it wiht -L argument.

Let's focus on modules in this discussion. There should be no problem 
with data files here. You can pick data files from a different QEMU 
version and it should just work fine. And even if it unfortunately does 
not work, you can still use -L option to fix it.

That's not the case for modules. Modules are coupled with the executable 
so you need to copy them along with the executable and the executable 
should be able to find them.

Regards,
Akihiko Odaki

> 
> Thanks,
> 
> /mjt

