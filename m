Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36671375629
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:01:43 +0200 (CEST)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefVV-000114-VS
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lefRl-0007fk-1I
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lefRh-0004zB-P0
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620313065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyIxY1ohvh2Vr+4gsSzPvJplNzaIO6PYXkp2+1UYBHg=;
 b=VhqJ2zFbs5CgUKiNV88l0SvVgmMMTGSOWqlqcPU72412334puBXRsLmDHA25IeGNN0DkxP
 W3BY2wlc6/fn/EBGYWZNc0pGATibAT2N5qUkwasHPExVOD1LVha/gv+zXae3oKdu7XOcKC
 3aGAkk0Dk0osx+UVbGdODcp1A/UKA/A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-daC_HWb2NXK95Z2zkb_88w-1; Thu, 06 May 2021 10:57:41 -0400
X-MC-Unique: daC_HWb2NXK95Z2zkb_88w-1
Received: by mail-wr1-f71.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso2310907wre.8
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 07:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lyIxY1ohvh2Vr+4gsSzPvJplNzaIO6PYXkp2+1UYBHg=;
 b=rUb9dH9RX2u+GTk3l+zYqAaPsmVhgHpyb9UJTQfqGwWJ2QLEOF73AwZb0uvIVsjeV6
 rVVg0wK9N8cGYlOltJmTi9jlyy9AGWC3VfQMViVg6jdxVnMDpbqhK+8aDRNFS2CNd49l
 OzpaQJZOZmh7ryZUBoZvEBdBvIvRFvIMuV48DkgkABKZUm9MB5jcNBOtZsx7QT8rdFTT
 wc2fYCDpbBnM0GO66kkYL0/zjpJQgO4b0cRlRF9SRdT6FXcmGd35lsGHBGwuFr4nVsfb
 rsQG7nO/nipQvSDqX/f58beT3IboRhdALS+P7DMgHVKJmeIt4v/hUMoodgs58HILFhtY
 /z4g==
X-Gm-Message-State: AOAM530D8P3JkkiMzV0Qdxq3+VH8dMBrb1VLxhwfgiCae8v+ZPsII9uo
 dOBe4SuOjlqdvEYIVhHWpf/Sr4rPhlxoSJbdY9yKFF69l37qzw1kdK+7LGqQjTgR5NlXdXXmTvj
 45uOM0iNRP8P3kt0=
X-Received: by 2002:a1c:1dd5:: with SMTP id d204mr4430926wmd.21.1620313060101; 
 Thu, 06 May 2021 07:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwungeHCyrKF1CRqOuFagaX0vPn3NhcHfo6YfU7kbw68ds20olEQalC73cXhHw28cCXTSCXQ==
X-Received: by 2002:a1c:1dd5:: with SMTP id d204mr4430899wmd.21.1620313059832; 
 Thu, 06 May 2021 07:57:39 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id e10sm4858890wrw.20.2021.05.06.07.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 07:57:39 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <CAFEAcA9VL_h8DdVwWWmOxs=mNWj-DEHQu-U4L6vb_H4cGMZpPA@mail.gmail.com>
 <CANCZdfpXjDECHmZq55zP43g32OVhnfjf9W+ERtPMFeDs2MmvXQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <994028a8-8d62-0355-0343-f721d6f256f6@redhat.com>
Date: Thu, 6 May 2021 16:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANCZdfpXjDECHmZq55zP43g32OVhnfjf9W+ERtPMFeDs2MmvXQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 4:48 PM, Warner Losh wrote:
> 
> 
> On Thu, May 6, 2021 at 8:21 AM Peter Maydell <peter.maydell@linaro.org
> <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On Thu, 6 May 2021 at 15:17, Warner Losh <imp@bsdimp.com
>     <mailto:imp@bsdimp.com>> wrote:
>     >
>     >
>     >
>     > On Thu, May 6, 2021, 7:38 AM Philippe Mathieu-Daudé
>     <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>     >>
>     >> The ALLOCA(3) man-page mentions its "use is discouraged".
>     >>
>     >> Replace it by a g_new() call.
>     >>
>     >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
>     >> ---
>     >>  bsd-user/syscall.c | 3 +--
>     >>  1 file changed, 1 insertion(+), 2 deletions(-)
>     >>
>     >> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
>     >> index 4abff796c76..dbee0385ceb 100644
>     >> --- a/bsd-user/syscall.c
>     >> +++ b/bsd-user/syscall.c
>     >> @@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env,
>     int num, abi_long arg1,
>     >>      case TARGET_FREEBSD_NR_writev:
>     >>          {
>     >>              int count = arg3;
>     >> -            struct iovec *vec;
>     >> +            g_autofree struct iovec *vec = g_new(struct iovec,
>     count);
>     >
>     >
>     > Where is this freed?
> 
>     g_autofree, so it gets freed when it goes out of scope.
>     https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#g-autofree
>     <https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#g-autofree>
> 
> 
> Ah. I'd missed that feature and annotation...  Too many years seeing
> patches like
> this in other projects where a feature like this wasn't there to save
> the day...
> 
> This means you can ignore my other message as equally misinformed.

This also shows my commit description is poor.

>     > Also, alloca just moves a stack pointer, where malloc has complex
>     interactions. Are you sure that's a safe change here?
> 
>     alloca()ing something with size determined by the guest is
>     definitely not safe :-) malloc as part of "handle this syscall"
>     is pretty common, at least in linux-user.
> 
> 
> Well, since this is userland emulation, the normal process boundaries
> will fix that. allocating from
> the heap is little different..., so while unsafe, it's the domain of
> $SOMEONE_ELSE to enforce
> the safety. linux-user has many similar usages for both malloc and
> alloca, and it's ok for the
> same reason.
> 
> Doing a quick grep on my blitz[*] branch in the bsd-user fork shows that
> alloca is used almost
> exclusively there. There's 24 calls to alloca in the bsd-user code.
> There's almost no malloc
> calls (7) in that at all outside the image loader: all but one of them
> are confined to sysctl
> emulation with the last one used to keep track of thread state in new
> threads...
> linux-user has a similar profile (20 alloca's and 14 mallocs outside the
> loader),
> but with more mallocs in other paths than just sysctl (which isn't present).
> 
> I had no plans on migrating to anything else...

I considered excluding user emulation (both Linux/BSD) by enabling
CFLAGS=-Walloca for everything except user-mode, but Meson doesn't
support adding flags to a specific source set:
https://github.com/mesonbuild/meson/issues/1367#issuecomment-277929767

  Q: Is it possible to add a flag to a specific file? I have some
     generated code that's freaking the compiler out and I don't
     feel like mucking with the generator.

  A: We don't support per-file compiler flags by design. It interacts
     very poorly with other parts, especially precompiled headers.
     The real solution is to fix the generator to not produce garbage.
     Obviously this is often not possible so the solution to that is,
     as mentioned above, build a static library with the specific
     compiler args. This has the added benefit that it makes this
     workaround explicit and visible rather than hiding things in
     random locations.

Then Paolo suggested to convert all alloca() calls instead.

Regards,

Phil.


