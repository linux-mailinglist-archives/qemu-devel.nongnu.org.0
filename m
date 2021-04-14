Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538A35FCC9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:39:23 +0200 (CEST)
Received: from localhost ([::1]:52078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWmIE-00036D-M9
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWmBw-0005Ob-El
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:52 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWmBr-0004sk-Sh
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:32:52 -0400
Received: by mail-pl1-x62e.google.com with SMTP id e2so6495080plh.8
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 13:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MQ5nPdO7w+Bt1xhJo8G5O9APYJstk4YFylF4jcF5WcI=;
 b=A/+WXzkE9P5nUwj4F4QHRDv9opGTm5678WQkEIe1T4v30ho4aSQoVkdkrkISVrP2ZJ
 dggy4Rnu7P8/7jv+xlo6gNVMxfxvjs+Hsw3/CDvpO94aAx+V+2ElCzKgleyMgCTwr75e
 PuoZX3bxYmDZJjvsr6MKFc9pd8Jj0KEKAPfrrvaynRP/U5BkCLGpSdSSyoEl4mJNOnqb
 yRaqh02yISvGMn/ELTbkU07mTmQgXFPdjFWq+WeA+4VxXLbd2mXZ7NOl6UViKdOcLVr3
 GedwRq0ugpN9onYvEhpEHBKnddYA2xeTlTprX/diNn3B7bfrg1jnH6Z1TjzMjxM0vhrO
 yhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MQ5nPdO7w+Bt1xhJo8G5O9APYJstk4YFylF4jcF5WcI=;
 b=a8R7G98IQnf23yni268u/Q4jpDToRpUUYCGllMS5bIjF++12TMBMUTp+Uxw/0RjnaV
 Nqp7ItJy1MB99O804NNLgMHZgTeZjOZaRs41gJYbkUgmT6MQQHwt6FG3sg8coBQ5i/mU
 EfkqL726GvrDaQtNajZsBV+Kt036r4duxYKvm5xRgibj43Z79xmwHn74EuVVS87yBC3W
 4G+8C9iuGzPg6u+ksPJo8JfMndecQiFK9hzj1/oP1sXqyUEliOWHDLM5qgADEYn3bAnB
 T8U6y4vlxDD5usP4pxWDbsdlmexxFcwcWe358MakojphAgvfd6yMGE5lyn4umeubn2xb
 Lcjg==
X-Gm-Message-State: AOAM532YzTrYfpx88DOOtmC3shkh59/aiPmssintWFl/uLzmdFVjfWHZ
 T1Vfr3M2IPXMnUpTf3JGe8tZKQ==
X-Google-Smtp-Source: ABdhPJzr9qilAkY/sv/HnMt0HkvQMAAxjivy8mD2ttISz9RYsHVbSx7HzVZa43wwAMHkQqsVKhEW1Q==
X-Received: by 2002:a17:90a:f3d1:: with SMTP id
 ha17mr5614903pjb.123.1618432366176; 
 Wed, 14 Apr 2021 13:32:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w3sm235287pjg.7.2021.04.14.13.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 13:32:45 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
References: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
 <7f935c45-21f2-91b2-f787-dd528858c838@linaro.org>
 <CP2PR80MB449939F026D6CAD8915F2180C74E9@CP2PR80MB4499.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc9931fc-3288-6014-723a-166406057243@linaro.org>
Date: Wed, 14 Apr 2021 13:32:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB449939F026D6CAD8915F2180C74E9@CP2PR80MB4499.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 1:07 PM, Bruno Piazera Larsen wrote:
>> I think it would be worth moving all of the SPR code out to a separate file, 
>> apart from cpu_init.c.  There's a lot of it.  And, yes, I would move everything
>> that you can that is related out of translate.c.
> 
> Yeah, now that I look at the SPR code, I'm starting to think it's easier
> I think it's what fabiano had in mind too, but we'll probably have 3 files,
> spr_common.c, spr_tcg.c and spr_kvm.c. It's a bit of surgery, but it's
> probably worth it, to avoid a mess of ifdefs.

Sounds good.

> While waiting for a reply I tried this. It's really not, it creates about 6k 
> errors.
> I ended up moving everything that used it from cpu_init.c into translate.c.
> create_ppc_opcodes and destroy_ppc_opcodes ended up going there, and
> I added prototypes to internal.h to call them in the realize and unrealize
> functions.

Moving into translate.c sounds like a good option.


r~

