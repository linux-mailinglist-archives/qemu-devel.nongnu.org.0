Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7C33D7DA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:42:33 +0100 (CET)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBq4-0001Vj-B1
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMBmi-0008SH-GF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:39:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMBmg-0004Sm-Rr
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:39:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x13so7667799wrs.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2IGamStY/X8kalQMIiWJtVXJrNHzv6EquJ+lKuZ126g=;
 b=Bc1U09fUgtptsBARFRiTtDpjbA9LHLUOSfOOpc/T/tnryfm4GI9XjcM/gV6TbD9vXH
 BDb7e5fPVvuAX7jyg3E0MAQ8NNBnayB8q9DTn15VaOxA0u6b+H4aJ2JKgB2DQ2bG1Rmh
 z1SOj5yLIDKjNf/PIC/sDUM93RGWWMARLbnJL4r7onZFhhvKRAUnjNpytx7Vc35Pgl2U
 Kbp6ntdwRGY5rFZNLZqWCWt9zkHyfqxAEKswogj8Ihb8LUwWofRi6Ic7n1mh/afBWBCu
 ucWVoOeYPUWGZ78Jp3roejqQ9YIP/H7xi8r8bEVuMwIN8dybX3UFb9OCfcsk1kzfGcdL
 ++EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2IGamStY/X8kalQMIiWJtVXJrNHzv6EquJ+lKuZ126g=;
 b=HdW2vOU+49ZS7iPHCQjxsVSuoG2ImAxMvPThdKUv4j0LRmiZ7sZvHxKlxQtqmWoS0U
 c0TJ25YCdamT2WEhXeG4ABltNzCshtlh5Jo9TusnnFr+fAbqjoR5ADAfgonxAgw9fP8t
 1YrWAQ+96l1qNnw7Cfb6Qs4aFHON+Z5an0YIIIshoeNKTDg8G7UgwrzbSvHbrwHzXGxp
 MEraFWWXqEi9LOs45eHIgoiMomT0EpJyZPPkyxmXmtuXHnr9Uns2W+gcBZCLFNtP8thK
 FJ63SIUnEVBf8oyEKH32lOXvaQ14UGvn3TtUq347KJQSEjB6H6NmH5H965gwio0E0ib5
 cz8w==
X-Gm-Message-State: AOAM533xMeU6zPJ+Khb8SnaBQZgCN9nyCrXVluilToxozIGPqeGGADHl
 oBh7Cb5bKBZhJ2nZyrRfWUM=
X-Google-Smtp-Source: ABdhPJze6PKvXQt0IdVj3ElK/L8z3peQELqWSqZAjHfEmnPoZM0q6a47O1ehfKc17W3KdQ0AOIIEgw==
X-Received: by 2002:adf:8151:: with SMTP id 75mr5536584wrm.152.1615909140913; 
 Tue, 16 Mar 2021 08:39:00 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o13sm26200651wro.15.2021.03.16.08.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:39:00 -0700 (PDT)
Subject: Re: [PATCH] target/mips/mxu_translate.c: Fix array overrun for
 D16MIN/D16MAX
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210316131353.4533-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3cef46d5-4776-30e0-229d-54c1fc07ce95@amsat.org>
Date: Tue, 16 Mar 2021 16:38:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316131353.4533-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Craig

On 3/16/21 2:13 PM, Peter Maydell wrote:
> Coverity reported (CID 1450831) an array overrun in
> gen_mxu_D16MAX_D16MIN():
> 
>   1103     } else if (unlikely((XRb == 0) || (XRa == 0))) {
>   ....
>   1112         if (opc == OPC_MXU_D16MAX) {
>   1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
>   1114         } else {
>   1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
>   1116         }
> 
>>>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
>     index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
>     (which evaluates to 4294967295).
> 
> This happens because the code is confused about which of XRa, XRb and
> XRc is the output, and which are the inputs.  XRa is the output, but
> most of the conditions separating out different special cases are
> written as if XRc is the output, with the result that we can end up
> in the code path that assumes XRa is non-0 even when it is zero.
> 
> Fix the erroneous code, bringing it in to line with the structure
> used in functions like gen_mxu_S32MAX_S32MIN() and
> gen_mxu_Q8MAX_Q8MIN().
> 
> Fixes: CID 1450831
> Fixes: bb84cbf38505bd1d8
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: tested with 'make check' and 'make check-acceptance' only, which
> almost certainly don't exercise this code path.

Not it isn't indeed.

I'm adding testing where users show interest.

For Loongson SIMD I have 2 images, Fedora and Debian, and watch
a video stream with ffmpeg. I have in my TODO to add a tcg plugin
to check the instruction coverage. Maybe it already exists, I haven't
checked.
Why I'd love to get this integration testing in mainstream, I gave up
because of the artifact storage problem (it doesn't make sense to
rebuild a full OS to test a single package to test an ISA).

I don't have anything for XBurst. Craig was running some
testing 2 years ago, but I have no idea what it was.

>  target/mips/mxu_translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/mips/mxu_translate.c b/target/mips/mxu_translate.c
> index afc008eeeef..fb0a811af6c 100644
> --- a/target/mips/mxu_translate.c
> +++ b/target/mips/mxu_translate.c
> @@ -1095,12 +1095,12 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
>  
>      if (unlikely(pad != 0)) {
>          /* opcode padding incorrect -> do nothing */
> -    } else if (unlikely(XRc == 0)) {
> +    } else if (unlikely(XRa == 0)) {
>          /* destination is zero register -> do nothing */
> -    } else if (unlikely((XRb == 0) && (XRa == 0))) {
> +    } else if (unlikely((XRb == 0) && (XRc == 0))) {
>          /* both operands zero registers -> just set destination to zero */
> -        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);
> -    } else if (unlikely((XRb == 0) || (XRa == 0))) {
> +        tcg_gen_movi_i32(mxu_gpr[XRa - 1], 0);
> +    } else if (unlikely((XRb == 0) || (XRc == 0))) {
>          /* exactly one operand is zero register - find which one is not...*/
>          uint32_t XRx = XRb ? XRb : XRc;
>          /* ...and do half-word-wise max/min with one operand 0 */
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

