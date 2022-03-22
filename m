Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3434E3A85
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:24:53 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZox-0001wa-Sq
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:24:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nWZo0-0000W7-BC
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:23:52 -0400
Received: from [2607:f8b0:4864:20::1029] (port=40793
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nWZny-000231-BH
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:23:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so1823874pjb.5
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mH+WQHfULkLRgAb74+YCQZgyeB9JJxhDWfEezYuB1pE=;
 b=gFHVSr9FnXJpZVIRXTtk1fcuEpNiIL6tlqDunoX/oZTV2fvWlxgNMNKGMbj+0ZvMc1
 4gNjw1BCvmouhhO78qDKTp6lAOYoP5+6usSpUo8KmUv5PTzzdrKqpHdG0lkB8uI6Jiw6
 J09O8HFlrPSVcDry2sQWjR/0hs1/UcKbiH0noNM0lFON1L8Rd/EVBWAuhHXo4Ncnsz7u
 gUxV53RV03P+f1WG3+TWENOZa7g/Dij2ebaCA4t3e2lhZCtfffJ41AjrbxZgb8LrQNkY
 tftyHw59W45gmg1WHka+VfwFguMHyKS4fIx72Cof7S3r4HnvoC9OoRTBbe4nceu9IxfC
 B01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mH+WQHfULkLRgAb74+YCQZgyeB9JJxhDWfEezYuB1pE=;
 b=wJd5/Azyf2BriuBnKDUl0+2t4UEEvryk9xmSn0ijHxXg5S/+2QBWV4GKnx+9WSlHf/
 +AMIOa3aJgYmoBAl2ZkYMDtmnnRRxnn5DW7R9GijPKDVg/PUHqvC1toTuf3bEWuEq7ME
 xN+hSUVj2RPwGV3e6kic/p9VoCFhIM3imlSonRrmIPS+tQ+iyokx8OxY/rsPu0gBFwhD
 cBLzQ/yMUes4QHVy6fn7cqxT6dfLOsMhIjkJnNfeSBbxh29Y6bw365H+JebzSN2/ky5n
 Pb5fKAHXDr6/RV9f2hgf0mL7aBvWOaCsUgXEDnspJBzHzFh7dlaUNLttXqCA/eZiHirE
 rxWA==
X-Gm-Message-State: AOAM533QbshfOAUndKbp5Y2WQ7dVyOGviu7TRZMKZUoaTpQ0V3SAw+mP
 7xSu+/YWhq7VE3VVmLb+3ew=
X-Google-Smtp-Source: ABdhPJz57Pfwkvmw+A59XeE672smGsmlZGqk9VLsvB0TzGMNy0DipgLB8ZoTssqyRXSF/pido8he7A==
X-Received: by 2002:a17:902:7784:b0:151:a83a:5402 with SMTP id
 o4-20020a170902778400b00151a83a5402mr16945720pll.21.1647937428468; 
 Tue, 22 Mar 2022 01:23:48 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 cp24-20020a056a00349800b004fa8f09a7b9sm8413486pfb.108.2022.03.22.01.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:23:47 -0700 (PDT)
Message-ID: <051488c8-b2c0-f27b-74bd-3c394d71ee6e@gmail.com>
Date: Tue, 22 Mar 2022 17:23:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0 v2] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220322075400.8627-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/22 16:54, Philippe Mathieu-Daudé wrote:
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

It is better to state that addRemovableDevicesMenuItems() is called from 
a thread different from the QEMU main thread and the main thread is 
waiting for that.

> + */
> +#define GLOBAL_STATE_CODE()
> +#else
>   #define GLOBAL_STATE_CODE()                                         \
>       do {                                                            \
>           assert(qemu_in_main_thread());                              \
>       } while (0)
> +#endif /* CONFIG_DARWIN */

It still says CONFIG_DARWIN ;)

Regards,
Akihiko Odaki

>   
>   /* Mark and check that the function is part of the I/O API. */
>   #define IO_CODE()                                                   \


