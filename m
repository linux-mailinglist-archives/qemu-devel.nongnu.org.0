Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1736FC80
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:35:24 +0200 (CEST)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUEk-0002lK-Q3
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcUBd-0001RV-B8
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:32:09 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcUBb-0007PY-3A
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:32:09 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s22so28433269pgk.6
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bytwH3ziV/k4zrQhxKLJStT25YArCP3WG6MqI8zuFCE=;
 b=z5nr2FXtCwNnuqUF/SmKoUOoS0rY+QDF0dZqjFj8rgKKkRHFUypv6PKMqvc2p2lp0Z
 YMtKun7bS931TYKTG+NmfB6wn7ldZXjqBdY2mqNiZMXX8QpJhDTqndTpW1Y7fY6jjqsW
 zmnppFKEe3eUAHYTbMGr5D4EXNDtcmhEQU0IrbcE91ljhGWiHQBukeatfcxp7rNcguNJ
 NYFYmrPFY1Ed/zAXKDPdJCeAzGhK2nj7fpMHzOVjAFuyEDIfBgKOySCDA+lEYcrU17x+
 E0ocQVb+IEUl8uIKYnWdpTSXbqxDoKvbOrRZ9z4VChfsryYJbgdeWS/vOXpFpz8IbT8z
 bIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bytwH3ziV/k4zrQhxKLJStT25YArCP3WG6MqI8zuFCE=;
 b=JviT4I/MEcZUs1Cu1Z1IzQEmCGedmw/Tz3PLdMRoNHqFiDRRNgYjrP4Ns8yMs1ZBvb
 vNOs2J8vPRTyTQQCi9QPOzJfInN6WMNHCbmJLyOe+P5dxzNEQiugW8Qx44JPaJpg/rUb
 afOHcjbzJgDLYmaTIt7uLdnaamn+vAV2TD8SCC4EzhGpOuNu4ZpQ3c967m+r+pDpGedf
 MKlO3ebFdxT1P1K9q7zaKGXH1hvgu/VUucP7cm23VmG+9UF52Z2WoNw7i2f7Pptdr0bM
 dAWXxJ1q/fgeIBll4wAr19MpfcASRyjuA+mKG5PqI/OCk0NSVJIHmaLHvKHa30OjVpW/
 VH3Q==
X-Gm-Message-State: AOAM533vlvVRKIQJs5/ty9ZeTVIgpCOvkzICL7wZubGCv2fFZhyD8kAl
 X/cDJke2gt+HHDEUat7yi1hmWQ==
X-Google-Smtp-Source: ABdhPJwcx8PpAkRUUqnx5g+ff9JNCKKT2Y8bzR6PJdhj7c7mW+S5VVTuY3j8lrsISj3ljUn8MqW1rg==
X-Received: by 2002:a63:5b5c:: with SMTP id l28mr4858260pgm.363.1619793118004; 
 Fri, 30 Apr 2021 07:31:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u6sm2339553pfi.44.2021.04.30.07.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 07:31:57 -0700 (PDT)
Subject: Re: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <0ed61faa-327c-68a9-d449-541a6a9f3224@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1c975ec-d698-e055-3166-68f8bdf4fbee@linaro.org>
Date: Fri, 30 Apr 2021 07:31:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0ed61faa-327c-68a9-d449-541a6a9f3224@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 7:05 AM, Matheus K. Ferst wrote:
>> +ADDI            000001 10 0--.-- ..................     \
>> +                001110 ..... ..... ................     @PLS_D
> 
> I'm not sure about this. It's a bit surprising to find ADDI here, and the 
> comment that explains why is likely to be ignored after the big copyright header.

You could move the comment closer, and replicate, e.g.

ADDI .... \
      .... @PLS_D # PADDI


> I'd prefer to keep a trans_PADDI like
> 
>  > static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
>  > {
>  >     if(!resolve_PLS_D(ctx, a)) {
>  >         return false;
>  >     }
>  >     return trans_ADDI(ctx, a);
>  > }

But in this case ADDI probably doesn't use PLS_D.  You could use

static bool trans_PADDI(DisasContext *ctx, arg_PLS_D *a)
{
     arg_D d;
     if (!resolve_PLS_D(ctx, &d, a)) {
         return false;
     }
     return trans_ADDI(ctx, &d);
}

making sure to use int64_t in the offset for arg_D.

> It's the middle way between v2 and v3. trans_ADDI code is reused, it'll 
> probably be optimized as a tail call, and resolve_PLS_D is not called when it's 
> not needed.

My version won't tail-call, because of the escaping local storage, but I don't 
see how you can avoid it.


r~

