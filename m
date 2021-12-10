Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C074703E9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:32:38 +0100 (CET)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhsz-00049s-71
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:32:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvhop-0007xw-BR
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:28:19 -0500
Received: from [2607:f8b0:4864:20::1033] (port=54106
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mvhom-0000VC-Sf
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:28:19 -0500
Received: by mail-pj1-x1033.google.com with SMTP id iq11so7070150pjb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HXdL9Wxu8vJBtlrwI2yuHfy/5s/Kql+/SWzhOlK7YO4=;
 b=jp1R95KgIML3TQMBubHygrP+fsnhwjAnsegKzgRkX+UNAx54szLM/e/uuvynFeCqGK
 wcag7Fi51ouHZa8Eznms7qnk5x9IkwUrIUCu9/5+nuCQS7qCYPlgBaDMQJoupBQoPPj/
 VZm2rotJeD9/RSCHTD83JZPi3ImkmYHbarLdc6Jy9SM7mgVi1GIjuvvhdBnmp+FDQ+d0
 ZGkT3uuRP9T9H4vEbEmGJ/OXa++UYWV8zylgwmiti9n741Iy4bsqVa0PYDak7zeFLPbG
 5qYjn3URZclwj3Wsh20bjqaRRQzI0I6+FQzwUJHE6pdpwR8FCgsyfsjagYQxeg2hu/6i
 6xbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HXdL9Wxu8vJBtlrwI2yuHfy/5s/Kql+/SWzhOlK7YO4=;
 b=pNbSpuNHHEI20S8f8Wc4GsDikb5FhNHyjkbjI6qFUvF9EWuXPDtFimq6zIZsUdYamw
 PtugsuegiSA5RJ18OTHIg2SU2uxq5zH8znJLl8ZwRS8yPpiWxPUFoq5ddahDnconAFSV
 XGPNRfU2/Nzbo2h2QVldcwVkcPaS9IWhylY9ym9Svrd/HWLC1b0kb3FuOXN90BB3FTlq
 G9+kwiNenUvVgsX6llLY8Or2GSULMP4qMuNh5zNSyCokJD2sEfHHAoQnQdf8VoqYMXQ6
 WpmFjKc87ZU/Os/qzVdUxiBP0xwohdJu2BC4ZgFZxP6+ctWMZ3gRfD1qvW0l47uTxPe2
 ZXIQ==
X-Gm-Message-State: AOAM532Ii2X6GGHxNecjF9L8vO+z9CNDAmTPOmdynp/Vrzea3cASqUaL
 dWObK2efzlaa+NNBJpCtGjm5Qw==
X-Google-Smtp-Source: ABdhPJwl856RlVd8/Y9QSt9wECXY9zb7JigiAUijcFXSAAC/Zo/ZWBhfHmBE8leyPMP/rLrS18Qo5Q==
X-Received: by 2002:a17:902:e544:b0:144:e3fa:3c2e with SMTP id
 n4-20020a170902e54400b00144e3fa3c2emr76960689plf.17.1639150094374; 
 Fri, 10 Dec 2021 07:28:14 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id ne22sm3240433pjb.18.2021.12.10.07.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 07:28:14 -0800 (PST)
Subject: Re: [PATCH 1/2] target/riscv: Set the opcode in DisasContext
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
 <20211210062638.824672-2-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2088e128-a1d7-b46c-68db-a625bb75e998@linaro.org>
Date: Fri, 10 Dec 2021 07:28:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210062638.824672-2-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: palmer@dabbelt.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 10:26 PM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/translate.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

