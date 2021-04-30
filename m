Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30837010C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 21:14:26 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcYan-0005yk-0C
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 15:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcYY3-0005Aj-VB
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 15:11:35 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcYY2-0003h0-C1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 15:11:35 -0400
Received: by mail-pf1-x42e.google.com with SMTP id a12so6823108pfc.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3in09NyUIHzCxbRG9D3V089EDNVeWuEmRSSauyaIclU=;
 b=Kih7LITMlMkB6KzQl9KtfnXHRTwmrDUnyinSVo11yml0Owe4p1CK2AxVhbI3295Pgl
 pr+5aeHwOtkqRcif4FIRZqxVP52D5fdGRoR+YkBMpstfyrFOFmyxHynqXU866UBAtGoC
 zjfNTB9tnqoMoiGsAAGVtzAo5ivXo65L26nKUvGfId8ZGgH7sV9mOLvER1iS9IiA/cNo
 iPS2hmMBYlM2CM9CqGHph1vYNGZIqEMyu6PiMvhGlBj+2lAQp/W5oRMgH438UuNKCAlE
 qELp70/qEv3uuAXyyDTcKwe4dYM0kiOEsKU1K+JvzWUn0xBXLBQmWts+Szidv6wCJFnK
 K48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3in09NyUIHzCxbRG9D3V089EDNVeWuEmRSSauyaIclU=;
 b=uJ19eksJcvVlPslQNI1xuI3H002/dBqEmPtht7nGuDX4jHx3Ce2YXx+qCYb9QhC0k9
 ebG7j07X+oY0ekCF8lEWRCxWxlz9XISW+58N8VT51zpZ1txiBQzGSw6uO4Xq/zzzTfS7
 MnWh3PuoMzqBDT0RCUekBf2pJAw+PbKr/xJMGI19jtEE5HZq+1ExoGNGR1dhEIE7N02F
 9PWNLt1AMLzP5EWT8yDy2Qpr4lTD8G+gtUaa9cZ6KH9qWSNWyuZNZv8zh0eHjYVs9wU2
 weU5rjlUGQPRRvkJXcnzU22daZhSi/7PkrIFudUNqxANvIUkpOstHrxXEDC+fPLPtQmu
 aqwg==
X-Gm-Message-State: AOAM5333d5zM9YKrn6jxCyo4WL5D+SgAxNKNPDUSYfUfN7X4jP/M+q5h
 K3XsK/Kv2/BjeKjKFuhx0Nf8uw==
X-Google-Smtp-Source: ABdhPJxEFDe0JWfBM5Sq8JcOiUv5PsEFMaqc1g9exa892l4Iq8aLFo0hO7gxI4Y9yFFQcbJK8yzMLQ==
X-Received: by 2002:a62:2d6:0:b029:204:9b3b:dced with SMTP id
 205-20020a6202d60000b02902049b3bdcedmr6316860pfc.36.1619809890952; 
 Fri, 30 Apr 2021 12:11:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b25sm2913998pfd.7.2021.04.30.12.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 12:11:30 -0700 (PDT)
Subject: Re: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
 <CP2PR80MB3668052FF0C559D6D092B0C7DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <dbe523e8-3482-1ead-082a-7829c1551be9@linaro.org>
 <CP2PR80MB366816D43C01D14799FB3325DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <88c4159e-1272-43d7-b0c5-cbac16f8fbec@linaro.org>
Date: Fri, 30 Apr 2021 12:11:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB366816D43C01D14799FB3325DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 11:45 AM, Luis Fernando Fujita Pires wrote:
> I think we can already pass multiple files to decodetree.py and it will handle them correctly. I just didn't find a way to do that from the meson build files, which assume decodetree will always use a single input file.

Oh, riscv does this via extra_args:.

r~

