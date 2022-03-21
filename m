Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555074E3295
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:11:58 +0100 (CET)
Received: from localhost ([::1]:32978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQFp-0000N4-E3
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:11:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nWQCR-0004YL-BL
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:08:27 -0400
Received: from [2607:f8b0:4864:20::634] (port=44844
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nWQCP-0004ia-Oe
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:08:27 -0400
Received: by mail-pl1-x634.google.com with SMTP id q11so13888816pln.11
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ddf7ftXJmx/TRo9txIxGawoe3B1XUWGF3JBjN842l+g=;
 b=hb24yUcBssJzGpB7iA7hhXXyG9p9Kd0lgvKoG2/UTSTVFDIu36B9Xk6U78OrZXrHoF
 1oDHE+OYg0RD40ArkIceYujwiNTyM7ltrVt+UUJBHxgVGu6//KsZzyZEQPVjFxIzjLQo
 QPA45xJC5KcliL+qAcmj0qrH5+4nNVGf+wC2A+t4JHpRVLTblp7enbF94fg5Vem71Ct0
 iUEY/1ydQJqYFXH9ortWn48I0JJ3kDpk/3nf67RXtnMjgXEVph1UxvqKhVCJGWrTXwlO
 j3tPqI/h3b71QeCls9os5/oHSz1swSskeLtIl4EPKRHNSECivXq2URddJcxode6Wma0Z
 HpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ddf7ftXJmx/TRo9txIxGawoe3B1XUWGF3JBjN842l+g=;
 b=PkI0oZOgyW4sJ+Q5AStI2ZyZVkPPLV8IED0pHL+AFS2ON3ovI9cYV5QGBsV0tNZVLP
 fWDuRyJYV+Iyfo3Up8FVVHJmYfJpf6g0Z/qySwPRQnV2yGzg5OlDtXFd/KB3twv+Sbj0
 Jkwk7oEta5HuoN5B5jCR06yBihLGc5nGS1Y1odf9kFaM/kuGoUVGhS6WzbybwLSgDwRB
 kFhVsLFpEk7Cc91CALO7T004SeD3BJC3zglaTOGJpVgCV5ZSk8CzaRIVimknWgNr0I/a
 6Cul5lE5xv6737G6N11B3xZKt6f2MVX2sKUAhL0hnLklDyEFftSnKT9Hxlj4wJTvoKMA
 JIxQ==
X-Gm-Message-State: AOAM530RCvv3UgVpjsp3OIdUdYYXC7mVfH1hVhE1MuJYJ/Pm2OgcJi7q
 EW6t/PZ0MG7Q6yoyvS41wdU=
X-Google-Smtp-Source: ABdhPJwyujKn7186iYeL4xiBXuh1ujwqZlWaz5QsNaXsGwT7BmkD1n9F8pJBxjS7p19FfK2Z4dBKng==
X-Received: by 2002:a17:90b:38cf:b0:1bf:42ee:6fa with SMTP id
 nn15-20020a17090b38cf00b001bf42ee06famr1321648pjb.9.1647900504467; 
 Mon, 21 Mar 2022 15:08:24 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a056a00231600b004fa7eb1e85esm10440978pfh.180.2022.03.21.15.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:08:23 -0700 (PDT)
Message-ID: <223681b8-ae67-8e9b-c41c-1538d7319da9@gmail.com>
Date: Tue, 22 Mar 2022 07:08:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0] qemu/main-loop: Disable block backend global
 state assertion on Darwin
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220321145537.98924-1-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220321145537.98924-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x634.google.com
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

On 2022/03/21 23:55, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Since commit 0439c5a462 ("block/block-backend.c: assertions for
> block-backend") QEMU crashes on Darwin hosts, example on macOS:
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
>   include/qemu/main-loop.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 7a4d6a0920..c27968ce33 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -270,10 +270,14 @@ bool qemu_mutex_iothread_locked(void);
>   bool qemu_in_main_thread(void);
>   
>   /* Mark and check that the function is part of the global state API. */
> +#ifdef CONFIG_DARWIN

You may use CONFIG_COCOA instead. The assertion can still do its job on 
Darwin if ui/cocoa is not in use.

Also, some code comment is nice to have since the intention is rather 
unclear from the code even though this is temporary and few people would 
stumble upon it.

Regards,
Akihiko Odaki

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


