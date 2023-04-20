Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D26E899D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:30:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppMrX-0002d8-BF; Thu, 20 Apr 2023 01:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ppMrR-0002cn-2X
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:29:37 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ppMrP-0001sz-48
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:29:36 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-24762b39b0dso409696a91.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681968572; x=1684560572;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ImDe92unZDV8agR+sQwQfdVhezeYa9ED9iVJu+Mf1w=;
 b=IFMALRHnmxS+lp4xF4BGEGlMy2k92HWPNpfkrKXJ8Gpa60bSG/YFQ3T8syOqj0WlUA
 2ALFfwFa6VhANwndGrE9VDDjKzY5gLAEiyCGqgTUf75Z11BIgPRVw4S5Vh2umEPF8Ypr
 7ODCviiP+e7pPdZR9O7jgC++a1df/UIRPvOuT+A3UTHGs5XbJ2Pr61BPiWPU72c5hTX6
 zjmv2hotk0ouceMMNd1MBoN5O3RkCYDP0HogvBV6L6Hp/EEX76BiSWSF/tYJsNCwUbcZ
 XoJeLV3jd0vGob++4Feku2RtfBAAFRjSoJ/X6WZyuMZrBkNiKcbtWonnkd6P69VVLKnX
 oB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681968572; x=1684560572;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ImDe92unZDV8agR+sQwQfdVhezeYa9ED9iVJu+Mf1w=;
 b=S4/5kQn/KFgrp+EP/Z1na4bKVqxnFhipWxaJHys/s3qLTTfxmAiQ5f+XXeCPXLyOM6
 luxxAW9X47e5tIcIiFKvrGtanv2kYN9ivpeiqOm/+PzfCNE+0C2sLLxbUdt5iiRxVuTH
 IrdzXi471QuD52Ga+XkbbgsUnDuGrIGPxeT+JXwFn1LjOpIhdM2euXoVWWJiH4KsxnQk
 e4lLEb/CsK1gtZnKG6IF2QsiJbK7ryv5FTSNd/sZi1rDt81o++aHiLHEeyKevAox/dtN
 2bif/cNjBjIGzk/qwdT+ixeIjYBrvqVay9cuD8PDI/xe6X9OUtbjc+vRSf/u7d9oTwy1
 apaw==
X-Gm-Message-State: AAQBX9ecTtJ9NMrfs5ZCBEHePBln4ctbxEQitbpSfZGYihadVom0XhTY
 Lmk1JAUNCGrmrsyDYRSv1c83yQUmFk8=
X-Google-Smtp-Source: AKy350b1mRk9/YS2znMnGhpmvfo/ZkWhf1Irr22uaBnkFDSEQFwlaAgy3zqleEUs0g/ODmSIYOvWKQ==
X-Received: by 2002:a17:90a:840f:b0:23d:3698:8ed3 with SMTP id
 j15-20020a17090a840f00b0023d36988ed3mr448238pjn.22.1681968571601; 
 Wed, 19 Apr 2023 22:29:31 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 kx18-20020a17090b229200b0023b3d80c76csm403047pjb.4.2023.04.19.22.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 22:29:31 -0700 (PDT)
Message-ID: <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
Date: Thu, 20 Apr 2023 14:29:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: get_relocated_path: the configured paths are not looked for?
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
Content-Language: en-US
In-Reply-To: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.597, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2023/04/19 16:32, Michael Tokarev wrote:
> Hello!
> 
> Today I discovered an interesting issue here: I copied a system-installed
> binary into another directory, in order to debug an unrelated issue. Just
> to discover it does not work, being unable to find any modules or data
> files.
> 
> Here's how the strace of typical qemu-system-i386 run looks like (the
> relevant parts only):
> 
> access("/tmp/qemu-bundle", R_OK) = -1 ENOENT (No such file or directory)
> access("/tmp/b/../lib/x86_64-linux-gnu/qemu/accel-tcg-i386.so", F_OK) = 
> -1 ENOENT (No such file or directory)
> access("/var/run/qemu/Debian_1_8.0~rc4+dfsg-3/accel-tcg-i386.so", F_OK) 
> = -1 ENOENT (No such file or directory)
> 
> (the executable in this case is in /tmp, obviously).  And it fails with
> error "fatal: could not load module for type 'tcg-accel-ops'".
> 
> This is despite the fact that qemu has been configured with proper --libdir
> and other --foodir to point to actual dirs such as /usr/lib /usr/share etc.

Some files in QEMU installation is closely coupled with the binary so it 
does not make much sense to copy only the executable to another 
directory. You need to copy all of the files QEMU owns to relocate a 
QEMU installation. QEMU uses relative paths to find such relocated files.

That said, it is indeed confusing that QEMU uses relative paths even if 
you specify an absolute path for --libdir. I prefer to require to 
specify relative paths for --libdir and other options to make a QEMU 
installation relocatable, but I didn't dare making such a breaking change.

Regards,
Akihiko Odaki

> 
> Looking at the code I see this, in cutil.c:get_relocated_path() 
> (simplified):
> 
> char *get_relocated_path(const char *dir)
> {
>      const char *bindir = CONFIG_BINDIR;
>      const char *exec_dir = qemu_get_exec_dir();
> 
>      result = concat(exec_dir, "/qemu-bundle");
>      if (access(result, R_OK) == 0) {  <== should be X_OK and should be 
> dir, too!
>          g_string_append(result, dir);
>      } else if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
>          g_string_assign(result, dir);
>      } else {
>          g_string_assign(result, exec_dir);
>          .. search in  execdir and its parents ..
>      }
> 
> This seems to be questionable.  And btw, even when running qemu from
> the installed /usr/bin/ location, it does something weird:
> 
> access("/usr/bin/qemu-bundle", R_OK)    = -1 ENOENT (No such file or 
> directory)
> access("/usr/bin/../lib/x86_64-linux-gnu/qemu/accel-tcg-x86_64.so", 
> F_OK) = 0
> openat(AT_FDCWD, 
> "/usr/bin/../lib/x86_64-linux-gnu/qemu/accel-tcg-x86_64.so", 
> O_RDONLY|O_CLOEXEC) = 14
> 
> so it is not obvious why it skips the full path in this case (the 2nd
> choice) and falls into the 3rd variant (search in execdir and parents).
> 
> Why it *ever* wants to search in parent dirs relative to executable
> path? And why these !starts_with_prefix()?
> 
> BTW, the second starts_with_prefix(bindir) condition is just stupid, -
> bindir is CONFIG_BINDIR (static), and start_with_prefix() checks for
> CONFIG_PREFIX which is also static.
> 
> The whole this logic smells.. strange at best :)
> 
> How about this: if qemu-bundle exists, use qemu-bundle/dir, instead
> use dir directly?  Why do we need all other conditions? Why do we
> do different things depending on the place the executable is located?
> 
> In the past, qemu tried to look in pc-bios/ and other similar places, -
> when run from the build dir.  But since it does not do this anymore,
> we can just skip whole thing, no?
> 
> /mjt

