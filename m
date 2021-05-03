Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F5372378
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:15:27 +0200 (CEST)
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhmg-0007DG-Ig
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldhFU-0007v1-EA; Mon, 03 May 2021 18:41:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldhFS-0005fA-Em; Mon, 03 May 2021 18:41:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id l14so7242216wrx.5;
 Mon, 03 May 2021 15:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QJ8JEA4YLp6jenaC5JnqQEXShs8rbjFHDOYrlM/Twmg=;
 b=TUMKWC4c7sagkSxQTfXPHT2QCEhKWEo0bSB+rueECUxvZLJAO/8SLX95EOOEsekGyD
 FUUMt0agVXd2fi3IBENoaK7JHT8JfaN8oe962p/AR0PIeqJmUMnDzv0Yt0zVZjvhIAjZ
 MITctgIzhV4AskIvwhfiAng1c3mltG/zni3/O5WX9pQ2c1upBi2e/dnd8UIvK/ttShKi
 AaU5jULeRsTTv07845tKpFPOdqwXPX9EdfFJ0XEAbFOs8xzFDM4O0J4cTrLL2xdW9tjh
 8LUPm1HYvYnrZt0MrjpomEZwU2p/p7QS9UZq/LqnLLBvCqGw6IZYwI2RLyCrxuav4ZVk
 2z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QJ8JEA4YLp6jenaC5JnqQEXShs8rbjFHDOYrlM/Twmg=;
 b=NKRpL1s8AU4JPZGoyNrFqCqgJ7JDTVnLKkaXRtKoE4z9Uq+nK8bPHxwGya+6oKnK2Z
 a+xijFPqzP69Y2CzyhFjSAxVTpJbT5zAMz83ynEJhv9y7XAxLRzYykMf9WV45GwnRkpt
 ebN8jcaBgAQpBsDIk6Bc5Ah/bQDxKJMimeq+5tHYbqvz3jXB1i02nhXPYWOu6ofdt5De
 OALgH7rlvtb4w4NG09NwgwnAeQESH/M+vY/yRjSXX8RCuhGSSyV1MRyahVXnVWSz+UiD
 Jw3jQLRJq1zVq3CFKY6ADdUBKuHCVgWb7cMRJhGkgx+2A3fsUSee5Ou44RuoLfRO/Cek
 u8RQ==
X-Gm-Message-State: AOAM531374zltZdcP8guxg/94O46YObPbE8axO2rRH682xCExZDfjdw7
 g27cACd2BF8icnl7qEhjZiI=
X-Google-Smtp-Source: ABdhPJyrnXTKb6UenhhPztRfsTaJcs6jlBOok8WybGeys4xWuGk3BqFX6wCJhOTpei/qmo7lz2CzSg==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr17456363wrw.309.1620081664572; 
 Mon, 03 May 2021 15:41:04 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id x65sm813496wmg.36.2021.05.03.15.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 15:41:04 -0700 (PDT)
Subject: Re: [PATCH v3 26/30] target/ppc: Implement PNOP
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <454bc1d5-eb06-9304-dc34-c6d3cc63409c@amsat.org>
Date: Tue, 4 May 2021 00:41:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430011543.1017113-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 3:15 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/insn32.decode                   |  2 ++
>  target/ppc/insn64.decode                   | 11 +++++++++++
>  target/ppc/translate/fixedpoint-impl.c.inc |  5 +++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 52d9b355d4..2ed25c7e67 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -17,6 +17,8 @@
>  # License along with this library; if not, see <http://www.gnu.org/licenses/>.
>  #
>  
> +&empty
> +

> +static bool trans_NOP(DisasContext *ctx, arg_NOP *a)

Matter of taste, I'd rather use 'arg_empty'.

> +{
> +    return true;
> +}
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

