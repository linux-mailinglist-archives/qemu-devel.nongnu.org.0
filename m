Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A139227F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 00:03:35 +0200 (CEST)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1ck-0001Ka-Ul
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 18:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm1NM-0000cZ-VA
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:47:41 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm1NL-0007IN-B4
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:47:40 -0400
Received: by mail-pl1-x62e.google.com with SMTP id v13so1292544ple.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EjQn+nLjvCCapbNDcqcPpwSNzGq+H42HH1GF632UbzY=;
 b=OPrOJ7YZY+UsTEYn3Okdly+IwfNhJA8gQTD3+MEX0rKN+vLksDAKlwB/mlQfsM/I1z
 Y5bXQm6S3UFzFVkY6LW69L18n8hoaEUCYs9dVGmKf1PC/RvEOsz/Z0TIgUC8/zz1SdeC
 jBIDcTvgMbPOl86W93WhyWIBlflMYLx3jT4fAwpKkW1oMbAkSoLwFFhosCCBcbAaFp69
 Qf3+SWKHBr/RX6ZV4dGex970/EY1R67i42eHzbaOQ5+ZAy8Z5/wPMZzIoMov6/5Xa4TJ
 YVCmRixvD8AADuc6CWI9z43nUTp3Ok4mL7NACcqQLyBQuat2IYpAdiMfWJpztSs6GCfc
 SUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EjQn+nLjvCCapbNDcqcPpwSNzGq+H42HH1GF632UbzY=;
 b=boNxkJB8QRn/LkuIV15nEIvWWXEk/s62QQvFcVAvRRoQZjX24nYq0EJYwMudk/irzi
 gxiRFouhvOgsFL3cT0cSdRu544Lq04vSNF5JdUfUuyGK2hevOhNA2lkO5Oguk75NO92u
 s4K1bjiK5vufXPJHl9Wl+MK8KMMCq+0pIV7X9c+6Jy9grVaF1X0yCi0uS1O0taMAcaLA
 mhJ9NGSiLT93TtRaYrjKV13Xvfne8rjM2gmqmCOFyzTHy57C4PYve57M/2mZk41+1UQM
 zn9CeERnIrVhWEG6/Rf9+w3ytF7tGmJ+5DGkByWIhlLtCdWnWsfP3yZqL2B16CgXMy++
 5Irw==
X-Gm-Message-State: AOAM531sLu8luGCEwYIHONq2WTEIv4VJg1AhWD27O+6c4x2LEK7vBp2q
 clQ5JF0WSuFKZgRXMafrIgq9Wu8RrM6IKw==
X-Google-Smtp-Source: ABdhPJzSxTsae8B9i53damV6hYmAFpErCEThoK3Jyf4F8yU+Bhu3NKb/a+G94GZ9y87bfCJjzysdkA==
X-Received: by 2002:a17:902:8c91:b029:f3:b4da:4600 with SMTP id
 t17-20020a1709028c91b02900f3b4da4600mr168232plo.30.1622065657826; 
 Wed, 26 May 2021 14:47:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 n21sm163778pfu.99.2021.05.26.14.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:47:37 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] softmmu/cpus: Extract QMP command handlers to
 cpus-qmp.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-15-f4bug@amsat.org>
 <f85b5ddd-2cbb-7460-d180-70827398fef6@linaro.org>
 <5108e6bb-de45-5b4f-cb13-81a187833578@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e60348ce-30bd-dae3-fe6a-bad94dd4ffe4@linaro.org>
Date: Wed, 26 May 2021 14:47:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5108e6bb-de45-5b4f-cb13-81a187833578@amsat.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 2:35 PM, Philippe Mathieu-Daudé wrote:
> On 5/26/21 9:10 PM, Richard Henderson wrote:
>> On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
>>> qmp_memsave() and qmp_pmemsave() call cpu_memory_rw_debug()
>>> and cpu_physical_memory_read(), which are target specific
>>> prototypes.
>>
>> Is there any reason they should be?
> 
> They use target_ulong. Should they use hwaddr instead?

cpu_physical_memory_* should use hwaddr.

cpu_memory_rw_debug uses a virtual address, and so could probably use uint64_t, 
as per my comment vs patch 13 about not using hwaddr for virtual addresses.


r~

