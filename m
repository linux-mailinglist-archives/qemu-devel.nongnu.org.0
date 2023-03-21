Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD96C3310
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecC0-0001rV-1P; Tue, 21 Mar 2023 09:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pecBy-0001rM-Tn
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:38:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pecBx-00088C-54
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:38:22 -0400
Received: by mail-ed1-x52e.google.com with SMTP id i5so12881389eda.0
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679405898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vEcyY8YPGz3mZhhjho1Ps+avAHFAMbR+XWeki8hnHmg=;
 b=V8k8r4+UIC7tk57TQA4JFsdT9doxoQsA4emzYyautbHU02X1ilbMeSXwZ50An7hswF
 sXF3HUY5cYE3yuIt/0Esuc2mD8sLEtwHHdUyfvsd4nLTZwZ19Opy02nNvZa6XrUEemge
 HCQ0SoI2l8jRmkpyLuQod/fBK1jKjyd0/fLeqnu/v5IY+wWCbezGVtdGwTv3ozJXA4oB
 jtLkxYVlYtc9m+T4m7asc6xM1ChFXJFCz1nEdpgMFzoGcmdzaF+Vki2b2cVssHnD8lHg
 bup/Kj6pMD3scN35nvNo5H4nLpI71UbCBg5cwOH1wqkqiziFjZugKoaeKshmoaLeYUgI
 4xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vEcyY8YPGz3mZhhjho1Ps+avAHFAMbR+XWeki8hnHmg=;
 b=drEmwmvgD5lWnUso1M1lbUBQmjVX/X1Btz7x3QIJz3tdgvRsBNEnotbE2VhAtAK1rK
 yZNn7GujBZZF4RfgsvGzhcgoOwNOKdEogTHlui1xJIo0sxowR5+UrKHg6ClA7D25oKXj
 QXe6yOR5kfuaLDAiD2pmkC5lZeSrUWWQ/h/eQ2iA7bRKLoGtW8vonGq5SQcOesHqi/Vx
 gwe8TbjE7aSfaXt8svTLPB+BB+kz8I2HEQRB0Nsrb+q3lnmIQ+z5mGXQljR5ldEkiDjs
 ejGrn7XXrBCCMzvZR/NjchxvfsS/NExwQ6qcTGRjqpWW4WoRukR9ZZ7Ng6Fq0zYwX5rL
 5vIQ==
X-Gm-Message-State: AO0yUKX8ZicvUzYKJm5xyuDVCv66Egb0373IrFKyOHjxGTYvSJMM5AjT
 8XjTY3GN1Ted9/O0n5rQr2fyLA==
X-Google-Smtp-Source: AK7set+g4R5jr8RuaV2XlN3X/2dvoBZloXilqjTAlR5Z605IIaZlzadym3H1Kso/SgYG7oFkxIttpg==
X-Received: by 2002:a17:906:1559:b0:933:2dfd:2f50 with SMTP id
 c25-20020a170906155900b009332dfd2f50mr3149947ejd.30.1679405897984; 
 Tue, 21 Mar 2023 06:38:17 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 v8-20020a1709063bc800b0093341746105sm4014099ejf.117.2023.03.21.06.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:38:17 -0700 (PDT)
Message-ID: <e072cbd3-f497-b384-ab46-16c88c70a12a@linaro.org>
Date: Tue, 21 Mar 2023 14:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] tests/avocado: probe for multi-process support before
 running test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230321111752.2681128-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230321111752.2681128-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/3/23 12:17, Alex Bennée wrote:
> A recent attempt to let avocado run more tests on the CentOS stream
> build failed because there was no gating on the multiprocess feature.
> Like missing accelerators avocado should gracefully skip when the
> feature is not enabled.
> 
> In this case we use the existence of the proxy device as a proxy for
> multi-process support.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Cc: Jagannathan Raman <jag.raman@oracle.com>
> Cc: John G Johnson <john.g.johnson@oracle.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 10 ++++++++++
>   tests/avocado/multiprocess.py          |  1 +
>   2 files changed, 11 insertions(+)


> +        """
> +        Test for the presence of the x-pci-proxy-dev which is required
> +        to support multiprocess.
> +        """
> +        devhelp = run_cmd([self.qemu_bin,
> +                           '-M', 'none', '-device', 'help'])[0];
> +        if devhelp.find('x-pci-proxy-dev') < 0:
> +            self.cancel('no support for multiprocess device emulation')

FYI a more generic alternative to this method:
https://lore.kernel.org/qemu-devel/20200129212345.20547-14-philmd@redhat.com/

But yours just works :)

