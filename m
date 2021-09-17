Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E0440FB8D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:15:18 +0200 (CEST)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFa9-0006L8-KD
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRFWb-000207-Uc
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:11:37 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRFWZ-0006rx-Lr
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:11:37 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q68so9881562pga.9
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oQHP6l3W8x5D7sDgHrPpL7MSreUMFDbLCZjrn5fnWwA=;
 b=P8bmAe8FE9nRm5gkKYh+b4/jLUDJr8i/BINvONc7JAPJGUd48f0mOzZJUvODOU+xob
 yfHjuq1W3FA5OaysVchuPFhnUkSC8jznBYjl61fesoJadMrMV+Sw2tES/XtkRp9Uy+tf
 hn24t2Tc948YT1fHcDBnyZsJZGDOsuBjzCypQ33bIx0liQA857WuroGgl1cN4M7rTNFA
 YRMn5IaX9TttHl7pPiZhG+TTr2lFwbrLy0vcIgFMQxR0IXAjb6IlkmRzl+N2EOd6BFQU
 M579BNNOgtJlgyYZFtQSS2qKXZdAxgk+6Ul89LkQ23DTJ+/pDK9+t6cshZ74I4Zy9peX
 og2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oQHP6l3W8x5D7sDgHrPpL7MSreUMFDbLCZjrn5fnWwA=;
 b=F0iasw2JKxQO0T1Av0ShoLJ6R6ijZbY9Su58VBqJoTZD7Ms9zQljQwV87ZruOdPyyH
 9cQEIL1cvRE9SccILdUSLcEj08OoCdcnxLD44XqYhg0BwE3T1pIoPenvPUTYHukZif8q
 1FY6RC2nGnY8Bo6KVCY4Ggq8UgC7klMVhDypBT63n8bvri1US7mzeyk195l6bZZeTmXY
 kmrcs9CdU8zbf35Why47RH2+rGSHsT26gpDxSpC9kuFTJ9/Wp234Ms5F0lWnIcoiqT82
 PkO3RqLX3YWLAiSbtTvCRIt2j4zMlnSbwcM+hqZxvbnfW1W5k9NJFDi9qFsVutLymVbz
 aDKg==
X-Gm-Message-State: AOAM533IKu9cNRQDW1ShtKvRnAWwrYwoJ+eGpBua/ATtbw7D7hOOQxIU
 aKqlNdveQTImb/PSfNOh6aOufVlC4aNSiQ==
X-Google-Smtp-Source: ABdhPJwXzhOXjnH+14Cyr6QXTK/xbT+swLhDBo+cm1giKD82pB7Om5xAS065ATRYuSQdoDTqMJd1SA==
X-Received: by 2002:a62:7d45:0:b0:445:545b:4d0e with SMTP id
 y66-20020a627d45000000b00445545b4d0emr1681413pfc.1.1631891493111; 
 Fri, 17 Sep 2021 08:11:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n23sm2107030pfa.178.2021.09.17.08.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 08:11:32 -0700 (PDT)
Subject: Re: [PATCH v3] target/ppc: Fix 64-bit decrementer
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210916143710.236489-1-clg@kaod.org>
 <CP2PR80MB36680A1BE91AFABE9DD3295BDADC9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <a0661690-bdb4-f002-3862-306458b36d3d@kaod.org>
 <CP2PR80MB3668712B5A367E87089D724BDADD9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <b8545741-185f-c74c-f572-ad4b5372e825@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62ad0cb4-0e41-4994-a52b-533b24b46401@linaro.org>
Date: Fri, 17 Sep 2021 08:11:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b8545741-185f-c74c-f572-ad4b5372e825@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.488,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 7:10 AM, Cédric Le Goater wrote:
> On 9/17/21 16:00, Luis Fernando Fujita Pires wrote:
>> From: Cédric Le Goater <clg@kaod.org>
>>>>> +    target_long signed_value;
>>>>> +    target_long signed_decr;
>>>>
>>>> Since these values will be the results of sextract64, it's probably better to
>>> define them as int64_t.
>>>
>>> but then it breaks the code doing the logging on PPC32 targets :/
>>
>> You mean here?
> 
> You need to define PPC_DEBUG_TB and compile the ppc-softmmu :
> 
> ../hw/ppc/ppc.c: In function ‘__cpu_ppc_store_decr’:
> ../hw/ppc/ppc.c:883:12: error: format ‘%x’ expects argument of type ‘unsigned int’, but 
> argument 4 has type ‘int64_t’ {aka ‘long int’} [-Werror=format=]
>    883 |     LOG_TB("%s: " TARGET_FMT_lx " => " TARGET_FMT_lx "\n", __func__,
>        |            ^~~~~~
>    884 |                 decr, signed_value);
>        |                       ~~~~~~~~~~~~
>        |                       |
>        |                       int64_t {aka long int}
> ../hw/ppc/ppc.c:51:32: note: in definition of macro ‘LOG_TB’
>     51 | #  define LOG_TB(...) qemu_log(__VA_ARGS__)
>        |                                ^~~~~~~~~~~
> cc1: all warnings being treated as errors

So use PRIx64, as you're supposed to do.
Or, in fact, change this to a tracepoint.

r~

