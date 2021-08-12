Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2613EA86E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 18:19:09 +0200 (CEST)
Received: from localhost ([::1]:58734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEDQC-0000dY-R5
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 12:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEDL8-0000k0-GD
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:13:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEDL3-0002HV-RV
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:13:54 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so4993228wmi.1
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X0CHug0Iz1KWunKwrCkY4nCnELycFpTXk137EVvNgeM=;
 b=hQH7UrQRCHujmrtftsN2jjsW648pOHenho1Y6b0FrXgBfDi4zNL6HdhGZFFza0hY1l
 OpuvJ64ZJqhDhr3zPRhH1VBzTtrycuUa+HZSOAR5m9TUQg7SGxwhXPkmoU3IdykRAWp+
 4D39LWyUAiRpOJ2ScPsjTyvqKQKVqqEbE11va8V5I++sXWxcNbgF7I84pvXwuSuqHYZa
 mbh5j4U0uvAtO670IGsB7YetEMaI5XLKjew9LhtMp/iflSMKIbdNT5/2wNqk6ie5XTFk
 KZ2Wt+Qg65cfSvlFVHieRveD78+Nq81TaNGlQSqLLdhUOs6YZdkyF16s2VUs39ww6Nbm
 GfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X0CHug0Iz1KWunKwrCkY4nCnELycFpTXk137EVvNgeM=;
 b=T6cuyIuBfW0GBbzrUBUYoRpps6lYhFTW5nH6kMBKIu7w2opdpWV26WMGbTv9ncq6HN
 kfTLEMpF72QocDzv3NJx+D0VVslbIKbxAwnWeOuORIPgOC4CM6nIt3J1JiiD07fS3BiO
 GamJOwzR/6si0WCYQF6EXhsQ9enZXQVADDortdgKv55ZTvToBwENDMuufiPta+IaslI5
 TnIO4F6do+ZJV/zFvNBANEqlirx07FWTdLXaKhcoJ8/E2S2tprkKjVBuFf7YpOn5mAv5
 JDOc95fyZMpwza64/p1l5eX6g6R4GTKa2P0z0Yd4XJwV3pgpEhCUfhorGKyrzTvLKz29
 NRHg==
X-Gm-Message-State: AOAM532XYSeCH0z2tKZ9bpRDNwuZ14wkPbT35KR6Y/7K23XwXAh5iw4w
 4B+wZlb9161XIpdL5BX5rqOth8+sLyM=
X-Google-Smtp-Source: ABdhPJxmYIxqi2V/shkbXO+927y8qPDQ8EXXRUQaGrr7QLDm7ExQMVC70zCU3RP6B+OCXj6pPedvwQ==
X-Received: by 2002:a7b:ca4e:: with SMTP id m14mr15791420wml.17.1628784828174; 
 Thu, 12 Aug 2021 09:13:48 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y192sm9406803wmy.1.2021.08.12.09.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 09:13:47 -0700 (PDT)
Subject: Re: [PATCH] hw/core/loader: In gunzip(), check index is in range
 before use, not after
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210812141803.20913-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <15095481-4d77-37b8-3923-dc1e0ebcf7c6@amsat.org>
Date: Thu, 12 Aug 2021 18:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812141803.20913-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 4:18 PM, Peter Maydell wrote:
> The gunzip() function reads various fields from a passed in source
> buffer in order to skip a header before passing the actual compressed
> data to the zlib inflate() function.  It does check whether the
> passed in buffer is too small, but unfortunately it checks that only
> after reading bytes from the src buffer, so it could read off the end
> of the buffer.
> 
> You can see this with valgrind:
> 
>  $ printf "%b" '\x1f\x8b' > /tmp/image
>  $ valgrind qemu-system-aarch64 -display none -M virt -cpu max -kernel /tmp/image

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  [...]
>  ==19224== Invalid read of size 1
>  ==19224==    at 0x67302E: gunzip (loader.c:558)
>  ==19224==    by 0x673907: load_image_gzipped_buffer (loader.c:788)
>  ==19224==    by 0xA18032: load_aarch64_image (boot.c:932)
>  ==19224==    by 0xA18489: arm_setup_direct_kernel_boot (boot.c:1063)
>  ==19224==    by 0xA18D90: arm_load_kernel (boot.c:1317)
>  ==19224==    by 0x9F3651: machvirt_init (virt.c:2114)
>  ==19224==    by 0x794B7A: machine_run_board_init (machine.c:1272)
>  ==19224==    by 0xD5CAD3: qemu_init_board (vl.c:2618)
>  ==19224==    by 0xD5CCA6: qmp_x_exit_preconfig (vl.c:2692)
>  ==19224==    by 0xD5F32E: qemu_init (vl.c:3713)
>  ==19224==    by 0x5ADDB1: main (main.c:49)
>  ==19224==  Address 0x3802a873 is 0 bytes after a block of size 3 alloc'd
>  ==19224==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>  ==19224==    by 0x61E7657: g_file_get_contents (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
>  ==19224==    by 0x673895: load_image_gzipped_buffer (loader.c:771)
>  ==19224==    by 0xA18032: load_aarch64_image (boot.c:932)
>  ==19224==    by 0xA18489: arm_setup_direct_kernel_boot (boot.c:1063)
>  ==19224==    by 0xA18D90: arm_load_kernel (boot.c:1317)
>  ==19224==    by 0x9F3651: machvirt_init (virt.c:2114)
>  ==19224==    by 0x794B7A: machine_run_board_init (machine.c:1272)
>  ==19224==    by 0xD5CAD3: qemu_init_board (vl.c:2618)
>  ==19224==    by 0xD5CCA6: qmp_x_exit_preconfig (vl.c:2692)
>  ==19224==    by 0xD5F32E: qemu_init (vl.c:3713)
>  ==19224==    by 0x5ADDB1: main (main.c:49)
> 
> Check that we have enough bytes of data to read the header bytes that
> we read before we read them.
> 
> Fixes: Coverity 1458997
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/core/loader.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)

