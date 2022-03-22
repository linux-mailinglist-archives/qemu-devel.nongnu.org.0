Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C5B4E3ABB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:35:41 +0100 (CET)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZzQ-0001jZ-9g
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:35:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWZwR-00085g-IH
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:32:35 -0400
Received: from [2a00:1450:4864:20::534] (port=43530
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWZwP-0003XW-4k
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:32:35 -0400
Received: by mail-ed1-x534.google.com with SMTP id b24so20709923edu.10
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7wib3OhlcvAQtwnYdk1wtDhHRSnBtSohxOAZp8s9IKs=;
 b=X7Htbt2erUloEiwBLljcb5+lgf+lSIGwiK74zRg0a6w5LshHjjRfrpQ4Njxuk/tLYC
 6IhbzEn0e5lPRGWgYc7snOlPDGXIQl2ZthEEiuQhu1WeqRGuYLG9s/gG3SH9SiMelXBn
 2hyYpzygj4Ty7eNRwN4VfNhSixlK0KhuxN86/6rIKTum4xUXtxX+BgE8m784LPU4PRXU
 SLjniofRk9MP+b2Mks2T1tkSmjpy7utTp+ZVLXD1gYiS1Ht39FM2b5dcIHQr5N2bjbiK
 XcvfDG0Nvz1Woa0NXwnkjLqvd1QAKLNVd79dOazdrSVvC1Pckp6C3fjyqbrmdOF6/E2Y
 cV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7wib3OhlcvAQtwnYdk1wtDhHRSnBtSohxOAZp8s9IKs=;
 b=Q0nqk0YbQp2uQwhQyt8okKzBGL+ZveFvk+8sk/ueXJtHxHGim5VA31rHxDHWNY49yt
 stSkdUlDLADPmOYn9U8xMCo+IplkdFUssTf6MT8y7P8wbQjYRYwlyJvwW3ULg0vF49x8
 L7LWxGMPW7Y9hYhOgk0SluigLLVQHs9a0lSfNtBPN/91nOqEtBguPKGyr/JqHqPt7fwN
 VJlSwQLdxYbC8/vjllPGPKjtI24b33C8+DIr4SIBYyVlYMGNDd1aigjzvnhaXINEG1RZ
 Zf4LVVaCJtW/PsR5eLqtCvARUzbHUr7NNAO6E/alc9acD4STVEUAopLgO0OZ9m46+MYF
 gSkQ==
X-Gm-Message-State: AOAM532qpJ5WIPWG+/HRVqCqoiE2kc7AzJWIE2MYVwcyl/r69oeu9riY
 R2NcFXP0gREkalNWvz/qSS0=
X-Google-Smtp-Source: ABdhPJzeD6xGUczJGQoNUDOKVtem9at0m04eS9wYWvrwpHFxdWrWy46FLP4P6apKfrpOLPRvB75fyA==
X-Received: by 2002:a05:6402:50d0:b0:416:a2a6:5443 with SMTP id
 h16-20020a05640250d000b00416a2a65443mr27341639edb.410.1647937951343; 
 Tue, 22 Mar 2022 01:32:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 b5-20020a170906728500b006db8b630ebdsm7857314ejl.209.2022.03.22.01.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:32:30 -0700 (PDT)
Message-ID: <7230eb78-0d9c-b636-f412-328b874280b3@redhat.com>
Date: Tue, 22 Mar 2022 09:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH-for-7.0 v2] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 08:54, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Since commit 0439c5a462 ("block/block-backend.c: assertions for
> block-backend") QEMU crashes when using Cocoa on Darwin hosts.
> 
> Example on macOS:
> 
>    $ qemu-system-i386
>    Assertion failed: (qemu_in_main_thread()), function blk_all_next, file block-backend.c, line 552.
>    Abort trap: 6
> 
> Looking with lldb:
> 
>    Assertion failed: (qemu_in_main_thread()), function blk_all_next, file block-backend.c, line 552.
>    Process 76914 stopped
>    * thread #1, queue = 'com.apple.main-thread', stop reason = hit program assert
>       frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1
>    at block-backend.c:552:5 [opt]
>        549    */
>        550   BlockBackend *blk_all_next(BlockBackend *blk)
>        551   {
>    --> 552       GLOBAL_STATE_CODE();
>        553       return blk ? QTAILQ_NEXT(blk, link)
>        554                  : QTAILQ_FIRST(&block_backends);
>        555   }
>    Target 1: (qemu-system-i386) stopped.
> 
>    (lldb) bt
>    * thread #1, queue = 'com.apple.main-thread', stop reason = hit program assert
>       frame #0: 0x00000001908c99b8 libsystem_kernel.dylib`__pthread_kill + 8
>       frame #1: 0x00000001908fceb0 libsystem_pthread.dylib`pthread_kill + 288
>       frame #2: 0x000000019083a314 libsystem_c.dylib`abort + 164
>       frame #3: 0x000000019083972c libsystem_c.dylib`__assert_rtn + 300
>     * frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 at block-backend.c:552:5 [opt]
>       frame #5: 0x00000001003c00b4 qemu-system-i386`blk_all_next(blk=<unavailable>) at block-backend.c:552:5 [opt]
>       frame #6: 0x00000001003d8f04 qemu-system-i386`qmp_query_block(errp=0x0000000000000000) at qapi.c:591:16 [opt]
>       frame #7: 0x000000010003ab0c qemu-system-i386`main [inlined] addRemovableDevicesMenuItems at cocoa.m:1756:21 [opt]
>       frame #8: 0x000000010003ab04 qemu-system-i386`main(argc=<unavailable>, argv=<unavailable>) at cocoa.m:1980:5 [opt]
>       frame #9: 0x00000001012690f4 dyld`start + 520
> 
> As we are in passed release 7.0 hard freeze, disable the block
> backend assertion which, while being valuable during development,
> is not helpful to users. We'll restore this assertion immediately
> once 7.0 is released and work on a fix.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Supersedes: <20220321145537.98924-1-philippe.mathieu.daude@gmail.com>
> ---
>   include/qemu/main-loop.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 7a4d6a0920..48061f736b 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -270,10 +270,22 @@ bool qemu_mutex_iothread_locked(void);
>   bool qemu_in_main_thread(void);
>   
>   /* Mark and check that the function is part of the global state API. */
> +#ifdef CONFIG_COCOA
> +/*
> + * When using Cocoa ui, addRemovableDevicesMenuItems() calls qmp_query_block()
> + * while expecting the main thread to still hold the BQL, triggering this
> + * assertions in the block layer (commit 0439c5a462). As the Cocoa fix is not
> + * trivial, disable this assertion for the v7.0.0 release when using Cocoa; it
> + * will be restored immediately after the release. This issue is tracked as
> + * https://gitlab.com/qemu-project/qemu/-/issues/926
> + */
> +#define GLOBAL_STATE_CODE()
> +#else
>   #define GLOBAL_STATE_CODE()                                         \
>       do {                                                            \
>           assert(qemu_in_main_thread());                              \
>       } while (0)
> +#endif /* CONFIG_DARWIN */
>   
>   /* Mark and check that the function is part of the I/O API. */
>   #define IO_CODE()                                                   \

I don't know, it seems to me that the reorganized initialization code 
had only advantages.

For now, it fixes the regression and makes the Cocoa build much more 
similar to the others.  There is an easy way to fix the -runas 
regression, by moving the code up to the call of -sharedApplication in 
cocoa_display_init.

Later, in 7.1, you have time to move more code out of 
-applicationDidFinishLaunching:, remove the bools that are copied out of 
the display options, etc.

Paolo

