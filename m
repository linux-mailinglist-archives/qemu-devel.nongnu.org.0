Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52D6EBF20
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 13:23:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqXo9-0007zr-Vz; Sun, 23 Apr 2023 07:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqXo8-0007zj-NA
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 07:23:04 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqXo7-0002nb-1w
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 07:23:04 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1a9253d4551so29517355ad.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682248981; x=1684840981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hIDDofNP9AjVX0pqVQ3fQsZ3ccL2CsY1FdAkt067NK0=;
 b=FDyHYwfNZcPKf4I6TQue8rUXlWh120bFNh726c3EVDnQ9Z3C5kN9w7/o1YQyy8GGQg
 tMxLPcuHTi8Tuh59qkTsrWevxcV01Vk6N/7cQeBgnVno/hNMzKOj5L8FGeqRBZ6QFuGm
 Z8KEqUGu5PkiYm4Il9zAdeQ0x+Q5e6/pyj+gJuJI+4XiQ5NsSnnsZ9EJnsDTr3eWGRUH
 79b3KLwR3lgoZDI1GsRfGPd5fFKYLejw39GqLMt1L+OMamvIG0698zFYhL4Kjj70hrta
 mtnIBYVHAQ/WcZ1m+MVUSVRQwmaGOAgGa3AP+/x3xjnBxQnHbeM99GqaZh+oxM0zr4mf
 m9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682248981; x=1684840981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hIDDofNP9AjVX0pqVQ3fQsZ3ccL2CsY1FdAkt067NK0=;
 b=QN/BDW+e+dUAj+qN17Bk/STRpWFRieYazTD9B79Idum3QHODpGXlYuVSMO3ZwwX3VM
 zKhbzPKLO+dYoIiBBnB1u/GLfqvYBC8QMi61X4S/0g7V/N5oOvSqmhUkKbThWxkc6m4z
 n0Di8ANfKWYmFw4JuSlddfo7BlfTnAHtwNb5DEG5qv5oIxiA2lcq3jldRG1HrVitN7Vr
 YtPaCJkelj9DzooYtB+w+KDLy34OCPQuAyDVmPl24rmG3XyEscwdWQF3V2svi3Qtg7kR
 PF1FB66wwBarmzffiFG0SUR8wRfwGYzWctHbX4sC6YmxeZ3WlWD/Uh4xK7NR/oHH1N9N
 wkhw==
X-Gm-Message-State: AAQBX9chtiWq6ztSDBNaixrjnBWPtoEqth6g1siioOyx5hLsH94aImJI
 Igpg6R/5tE0y7DZitMxlZIE=
X-Google-Smtp-Source: AKy350Z/B1d7vRCr8UUQm5p3GRM7TSPvQAhNNjyym3ubcObVYmG8Y6TKt45ufeXSgvVJbFRbF3tjkQ==
X-Received: by 2002:a17:903:32c1:b0:1a6:a375:cb44 with SMTP id
 i1-20020a17090332c100b001a6a375cb44mr12850538plr.39.1682248981255; 
 Sun, 23 Apr 2023 04:23:01 -0700 (PDT)
Received: from [10.213.29.157] ([157.82.194.11])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a170902b21700b0019fea4d61c9sm4998355plr.198.2023.04.23.04.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 04:23:00 -0700 (PDT)
Message-ID: <63948283-d7dc-924b-c19a-6e376096daac@gmail.com>
Date: Sun, 23 Apr 2023 20:22:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: get_relocated_path: the configured paths are not looked for?
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
 <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
 <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62e.google.com
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

On 2023/04/23 19:28, Michael Tokarev wrote:
> 20.04.2023 08:29, Akihiko Odaki wrote:
>> On 2023/04/19 16:32, Michael Tokarev wrote:
>>> Hello!
>>>
>>> Today I discovered an interesting issue here: I copied a 
>>> system-installed
>>> binary into another directory, in order to debug an unrelated issue. 
>>> Just
>>> to discover it does not work, being unable to find any modules or data
>>> files.
>>>
>>> Here's how the strace of typical qemu-system-i386 run looks like (the
>>> relevant parts only):
>>>
>>> access("/tmp/qemu-bundle", R_OK) = -1 ENOENT (No such file or directory)
>>> access("/tmp/b/../lib/x86_64-linux-gnu/qemu/accel-tcg-i386.so", F_OK) 
>>> = -1 ENOENT (No such file or directory)
>>> access("/var/run/qemu/Debian_1_8.0~rc4+dfsg-3/accel-tcg-i386.so", 
>>> F_OK) = -1 ENOENT (No such file or directory)
>>>
>>> (the executable in this case is in /tmp, obviously).  And it fails with
>>> error "fatal: could not load module for type 'tcg-accel-ops'".
>>>
>>> This is despite the fact that qemu has been configured with proper 
>>> --libdir
>>> and other --foodir to point to actual dirs such as /usr/lib 
>>> /usr/share etc.
>>
>> Some files in QEMU installation is closely coupled with the binary so 
>> it does not make much sense to copy only the executable to another 
>> directory. You need to copy all of the files QEMU owns to relocate a 
>> QEMU installation. QEMU uses relative paths to find such relocated files.
>>
>> That said, it is indeed confusing that QEMU uses relative paths even 
>> if you specify an absolute path for --libdir. I prefer to require to 
>> specify relative paths for --libdir and other options to make a QEMU 
>> installation relocatable, but I didn't dare making such a breaking 
>> change.
> 
> Well, quite often it makes little sense still.
> 
> For example, in debian we had to (temporarily) move qemu-system-i386 from
> /usr/bin/ to /usr/libexec/, replacing the /usr/bin/ one with a shell 
> wrapper
> (to decouple xen hvm build out of main qemu build). It was just by a chance
> the directory nesting is the same still, - I wanted to move it to 
> /usr/lib/qemu/
> instead.  But at least this one still works.  Ditto for the actual xen 
> version,
> the binary is in /usr/libexec/qemu-system-i386-xen now, I was about to 
> move it
> to /usr/libexec/xen/qemu-system-i386 instead.
> 
> I see absolutely no reason for the binary to look into 
> /usr/libexec/share/qemu/bios.bin
> if it is told to get all data files from /usr/share/qemu/.

What about specifying --bindir=/usr/libexec/xen?

> 
> Quite often I debug issues and have to compare "old" qemu with current one
> (exactly like I did in this case), extracting the old binary into /tmp/.
> And wonder why it breaks in other ways.
> 
> And I still don't see how this turning absolute paths into relative 
> (behind the
> scenes) can be useful. If we put qemu into /usr/local/bin for example, it
> can be configured to look for data files in /usr/local/share just fine,
> there's no need for this "magic". On the other hand, if we really want
> to use a different data dir, we can pass a right -L option.

As you say, data files are not tightly coupled with QEMU version and it 
is quite possible to run QEMU with data files from another QEMU version.

However it's not true for all files QEMU installs. Especially module 
files like accel-tcg-i386.so are tightly coupled with the executable and 
QEMU is not expected to work if the exact modules which came with the 
executable are not provided.

> 
> I think I'll just remove this (very questionable) behavior at least from 
> the
> Debian package.  I already patched out the previous version of this, when
> it looked at ${exe_path}/../pc-bios - this at least made sense when we
> needed to find firmware files for just-built qemu, in the source dir. But
> it makes no sense (in my opinion) to do that for the installed version.

It uses qemu-bundle directory for just-built QEMU so it does not matter 
for the scenario.

The scenario where this conversion for relative path makes sense is the 
case you need to compare the behavior of two packaged versions of QEMU, 
for example. In such case, you can extract each package into a different 
directory and run them. Each QEMU executable will use relative paths to 
find modules tied with it.

If you are removing this behavior from Debian package you may consult 
other package maintainers, especially GCC package maintainers. If I 
remember correctly, GCC also has similar logic to find executables like 
cc1 and shared objects like LTO plugins.

Regards,
Akihiko Odaki

> 
> Thanks,
> 
> /mjt

