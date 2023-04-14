Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A416E251E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:05:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnK1v-0002Xu-4O; Fri, 14 Apr 2023 10:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnK1t-0002WN-Gu
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:03:57 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnK1r-0005AF-Q5
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:03:57 -0400
Received: by mail-wr1-x433.google.com with SMTP id q6so6155438wrc.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681481034; x=1684073034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n+AOBMd6/yHeweb/dMzkHyRaS5dnWynDk06BU5cIo/c=;
 b=ig1jveC69jLtcv154Cnrm3FT2qy9ya/PE3BiUIJ/C9etNxumULBFD6LOa9BTHOba3D
 tbD0TWaYZRP9bYupRyYVXfU8I4GxmBs5HVCYPtHUjwJV3UyqbWCmL1w7NY6O+Ugia6om
 rC3QMOW3H68ryFgjy57zMNsnvJmK+/SMpAoAPhRh4sOA9qdb2pTHFG+Po5n/aONxQvvM
 fWWIv8Az8GI4T6HLmMBvnByJwWmXoHSwNDwpMg07CBWqtxACWSCppTmZ/bnwy2It8Sfr
 lr9NJ1hhJdBdzimD0xJP6kxubNj4Z3uZIlGbrk8yU2UyJN7Q+PTMEDkV/ufKMzhoBJmW
 OwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681481034; x=1684073034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n+AOBMd6/yHeweb/dMzkHyRaS5dnWynDk06BU5cIo/c=;
 b=Vg5xIQAJyyM2hZ+z1jN46kfmJ1fT08kuK75UBCKrjTFNGbTNjVKxIr1zdGHaszkeBq
 XckPpZxe9tmyJHeFVHT55P5l89i/hANHZuAfR9ZZKIymzTYJgrM5dJIN0RdJhRX3F7Fu
 M11XhQsUNY6GVE/5rPqkPDd+ByotlmSWFyUhQPQ4wNFdMzl14Q8PE4PvrNtUSMUHn8WR
 7Hjdtdtp3Ra9RXDfT9M+f0EjOUelNBGVsOhK8QwiWNOymun8FXBsEBw/x0EPWtULgdC9
 oXFnwWcu0pnW70+VygtswwA92ldyT+rTdC1LpffCUPD/uqQ5QbdUCNyxhGn8AvvDLe6N
 wnOA==
X-Gm-Message-State: AAQBX9cEaIzHs3XzO77mavV+HlQ+DxoiEi4S4rJE9K04LeAoEDzS9izl
 RF4+zh2vZ6Xe41RGwAorFXZrOA==
X-Google-Smtp-Source: AKy350b3jxAU91G8S6SCHrRi/6HegRlxliSTqMuMbqOKy2pff2KxEV61JG1nk2Nxyzzb1VRnLMRtdA==
X-Received: by 2002:adf:da4c:0:b0:2f4:4e1a:bea2 with SMTP id
 r12-20020adfda4c000000b002f44e1abea2mr4334466wrl.59.1681481033783; 
 Fri, 14 Apr 2023 07:03:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056000108b00b002f013fb708fsm3674344wrw.4.2023.04.14.07.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:03:53 -0700 (PDT)
Message-ID: <6e38f2c5-5dd6-3fd6-39e6-d51d975fc582@linaro.org>
Date: Fri, 14 Apr 2023 16:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] chardev: Allow setting file chardev input file on the
 command line
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230413150724.404304-1-peter.maydell@linaro.org>
 <20230413150724.404304-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230413150724.404304-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 13/4/23 17:07, Peter Maydell wrote:
> Our 'file' chardev backend supports both "output from this chardev
> is written to a file" and "input from this chardev should be read
> from a file" (except on Windows). However, you can only set up
> the input file if you're using the QMP interface -- there is no
> command line syntax to do it.
> 
> Add command line syntax to allow specifying an input file
> as well as an output file, using a new 'input-path' suboption.
> 
> The specific use case I have is that I'd like to be able to
> feed fuzzer reproducer input into qtest without having to use
> '-qtest stdio' and put the input onto stdin. Being able to
> use a file chardev like this:
>   -chardev file,id=repro,path=/dev/null,input-path=repro.txt -qtest chardev:repro
> means that stdio is free for use by gdb.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The "not on Windows" ifdeffery is because qmp_chardev_open_file()
> does something similar; it seems likely to produce a nicer
> error message to catch it at parse time rather than open time.
> ---
>   chardev/char-file.c |  8 ++++++++
>   chardev/char.c      |  3 +++
>   qemu-options.hx     | 10 ++++++++--
>   3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/chardev/char-file.c b/chardev/char-file.c
> index 3a7b9caf6f0..263e6da5636 100644
> --- a/chardev/char-file.c
> +++ b/chardev/char-file.c
> @@ -100,6 +100,7 @@ static void qemu_chr_parse_file_out(QemuOpts *opts, ChardevBackend *backend,
>                                       Error **errp)
>   {
>       const char *path = qemu_opt_get(opts, "path");
> +    const char *inpath = qemu_opt_get(opts, "input-path");


>       file->out = g_strdup(path);
> +    file->in = g_strdup(inpath);


> diff --git a/chardev/char.c b/chardev/char.c
> index e69390601fc..661ad8176a9 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -805,6 +805,9 @@ QemuOptsList qemu_chardev_opts = {
>           },{
>               .name = "path",
>               .type = QEMU_OPT_STRING,
> +        },{
> +            .name = "input-path",
> +            .type = QEMU_OPT_STRING,
>           },{


> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c5..31d08c60264 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx


> -``-chardev file,id=id,path=path``
> +``-chardev file,id=id,path=path[,input-path=input-path]``
>       Log all traffic received from the guest to a file.
>   
>       ``path`` specifies the path of the file to be opened. This file will
>       be created if it does not already exist, and overwritten if it does.
>       ``path`` is required.

I find "path" vs. "input-path" confusing and would rather rename it as
"output-path" for consistency; or at least add an alias.
Possibly deprecating the "path" alias. Maybe matter of taste...

Can be done as follow-up, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    If ``input-path`` is specified, this is the path of a second file
> +    which will be used for input. If ``input-path`` is not specified,
> +    no input will be available from the chardev.
> +
> +    Note that ``input-path`` is not supported on Windows hosts.



