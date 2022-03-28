Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5864EA2E3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:30:52 +0200 (CEST)
Received: from localhost ([::1]:40704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxsx-0000yo-N9
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:30:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxrH-0008Nd-Ey
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:29:07 -0400
Received: from [2607:f8b0:4864:20::42a] (port=35825
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxrF-0006Ck-V0
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:29:07 -0400
Received: by mail-pf1-x42a.google.com with SMTP id f3so12917486pfe.2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CSSdcMERBCEktciMW60QXOoEmVwcc/B5AeVeJXFnSPs=;
 b=c7y1INaOZjlB6ZKkyWy8RhhFtJPQ9Z6JwcBd++hgH5l5AH6l+2F8S7KrqPCrcz8Izp
 Va/jeq55MYRreMn/uOJy+qCs5ELOrE2t5/pWBOfRWmTj4mu2F47wwZEFloY9ypwbGkby
 LOkYPT601QTpJkgULZ9ifMgifomgRLOFVBqOpFyGJvZtHdKljFBl4dx0zw2lRiSeIxxp
 7IA4f1cEOOXWY0C2FRjpWm6GQzc/NeTSS6X49Y4drVQ24XZ1qx0xp68AyL9vC59ic9yq
 W+HwPtNvjqKmkTSMmEFlh0WgTnOG/Y051vEjRpz7EJV7ReDS3M8BV3x1pcs7Dkb+al+b
 JjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CSSdcMERBCEktciMW60QXOoEmVwcc/B5AeVeJXFnSPs=;
 b=xW0l3eyhQUup1ZeOhodOQjza1Fq1oYGehgGhcaPZ73pFiptNsAy75Tyrwl23XJ65gB
 y4tfXHru+Sx7Dr323rrVwZwiu7QgfG3Y9f/SG3gmTfcMwkxy95F4SK2MhAI4rNU3U87c
 eJ7rFjIyRy2kxFzEVRy8cmqfOGQiY4h/9ZIzLyq7cvq3YuGpd4iCZMeaU2/1AOtYsYdA
 UO9fFgn+054YcyWWOdfTaz+AiKL4sweiiWOmQtd5DcXwUZUDaPVdH3kpo5VTtuLaZkaf
 ZO4ph3mMrnZSEfS1fei7TXnDHVqVjUPNamwKSEYSQVS3ov0aUf1T2tDe8pBbmdAhPZRj
 fiuA==
X-Gm-Message-State: AOAM531XkE3egao4ugFeYB+tf7rgYKeEsmm9TcQssIPC8oe+NFxpNtlU
 VfQ1hJST/eXQjHCFF/jEkJTf8Z3Up7kYWQ==
X-Google-Smtp-Source: ABdhPJyzTDi91VuzpXPNXlXzFbixttgDHFG4WXWwx6j0pV18HhB3xNQRN5zOg2LXau+ShNqhg7pXBA==
X-Received: by 2002:a63:4919:0:b0:382:6f3d:e48 with SMTP id
 w25-20020a634919000000b003826f3d0e48mr11549108pga.613.1648506544539; 
 Mon, 28 Mar 2022 15:29:04 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a633605000000b0039815688655sm8236559pga.0.2022.03.28.15.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:29:04 -0700 (PDT)
Message-ID: <5f9bbd9b-3a47-8936-6cd9-8b25393504ff@gmail.com>
Date: Tue, 29 Mar 2022 00:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0 v3] qemu/main-loop: Disable block backend global
 state assertion on Cocoa
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220325183707.85733-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220325183707.85733-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/3/22 19:37, Philippe Mathieu-Daudé wrote:
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
> v3: Reword (Akihiko)
> ---
>   include/qemu/main-loop.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Queued to darwin-fixes.

