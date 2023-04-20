Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5442E6E8DBB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:13:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQMH-0003id-4k; Thu, 20 Apr 2023 05:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQMC-0003hy-9k
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:13:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQM9-0004wC-D0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:13:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id he13so898457wmb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681982011; x=1684574011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W1zTJLARu1+I1MmrRrdXSfhEXdt+FxgpmIAdCOWmpW8=;
 b=VfVjZIrHPNsqlqSTbrvwCyI8pHXibHgaYaLzuIxncS3UUnfyADBUB8N9KcwtvL/D4/
 exNOjwVm2suBwm5rsO8LVSD56ovNxCQ4xVePsDw9Fzx+fB5J39qY+OUuXDj1/PVF52Cx
 LN/oWyywt8LZyRP1Z/hywCfAmOmYCsroJRNPT4EOfB+hMQzBvrboRCKLeXiHW8Gf+kmD
 E+1TOYxiisOWObRDx36h1692t0QYT0AO+03Sr7NRcC1znHajqVi7tWIQB/GBOzJh6z4s
 NyK+q4jGwIGuLbZ9q9HhaHGJh4Zb4fuNC2xtmxyDox3tbQV/HwSNO5iTWtZNhse3aALI
 Ly1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982011; x=1684574011;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W1zTJLARu1+I1MmrRrdXSfhEXdt+FxgpmIAdCOWmpW8=;
 b=TVJncoJ7shLpR9RiP9/PL2Kt43wNqR4sj5pz+Iw0rBuQZyOoJ9aozosM9bnEyCEDVF
 Z+taM8KLJN5wNhnwHBpyeUPJrUv7LvlhVAud0TG+5QjovZFPljZfhoc9PBDJ3Ste09YX
 gmkKmtFD8q8CY1VzCaBhT7Lk6xX5EvHNX17X2toK9aBm6/LOW5RAccv7ivR0KChrk5HQ
 TKIHW6vyEzha3s++mGdbbQqxoQnp5wX7bjaQpqhjClhjje+t+yshM4LJl4uBRJYcLEQV
 R9Hw0ldH8PdG2rFc90cAVMsMSVdU1xLMkTOnpHfLJKNwiwdLpu0Mvg+g4+lJZkraQeq1
 N2hw==
X-Gm-Message-State: AAQBX9eskfdcs1w1tFohzRFKZJYG3/wUOOuT43jG4xTeT78FZvL2izSg
 VkSzvOW9seLgOF4aI+R4CqCMeQ==
X-Google-Smtp-Source: AKy350Y68uE6y6JdnXrT3XCUiABZICga0Lz74tF0kgekernuUz2+qGdnVWS+y3DF1e0GdUJCBWU/rA==
X-Received: by 2002:a7b:c7d7:0:b0:3f1:71b2:9445 with SMTP id
 z23-20020a7bc7d7000000b003f171b29445mr773243wmk.15.1681982011229; 
 Thu, 20 Apr 2023 02:13:31 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k3-20020a7bc403000000b003f1745c7df3sm1433737wmi.23.2023.04.20.02.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:13:30 -0700 (PDT)
Message-ID: <eae62bb6-7c94-21be-f69e-8dc90c254297@linaro.org>
Date: Thu, 20 Apr 2023 11:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 04/10] linux-user: Add '-one-insn-per-tb' option
 equivalent to '-singlestep'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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

On 17/4/23 18:40, Peter Maydell wrote:
> The '-singlestep' option is confusing, because it doesn't actually
> have anything to do with single-stepping the CPU. What it does do
> is force TCG emulation to put one guest instruction in each TB,
> which can be useful in some situations.
> 
> Create a new command line argument -one-insn-per-tb, so we can
> document that -singlestep is just a deprecated synonym for it,
> and eventually perhaps drop it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> ---
>   docs/user/main.rst | 7 ++++++-
>   linux-user/main.c  | 9 ++++++---
>   2 files changed, 12 insertions(+), 4 deletions(-)


> @@ -500,8 +500,11 @@ static const struct qemu_argument arg_table[] = {
>        "logfile",     "write logs to 'logfile' (default stderr)"},
>       {"p",          "QEMU_PAGESIZE",    true,  handle_arg_pagesize,
>        "pagesize",   "set the host page size to 'pagesize'"},
> -    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_singlestep,
> -     "",           "run in singlestep mode"},
> +    {"one-insn-per-tb",
> +                   "QEMU_ONE_INSN_PER_TB",  false, handle_arg_one_insn_per_tb,
> +     "",           "run with one guest instruction per emulated TB"},
> +    {"singlestep", "QEMU_SINGLESTEP",  false, handle_arg_one_insn_per_tb,
> +     "",           "deprecated synonym for -one-insn-per-tb"},

Maybe worth mentioning QEMU_ONE_INSN_PER_TB too here:

   "deprecated synonyms for -one-insn-per-tb and QEMU_ONE_INSN_PER_TB"

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       {"strace",     "QEMU_STRACE",      false, handle_arg_strace,
>        "",           "log system calls"},
>       {"seed",       "QEMU_RAND_SEED",   true,  handle_arg_seed,


