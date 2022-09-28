Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0DF5EE80B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:11:55 +0200 (CEST)
Received: from localhost ([::1]:38242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeLS-0007Ov-8E
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odeH3-0001Tg-7q
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:07:21 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odeH1-0004ar-Ki
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 17:07:20 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d11so12749521pll.8
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=rQuSXL2Y65tBj2ZoUqSKWDzHKLWHwNNGTlmHY27FNnc=;
 b=m5/fx7EgNAS82uGigg4B57PEWmMe0/aX8IQuFniXr3nFXPqgaw6/3pqWfOGJQY1gcc
 4PtvbxxHweJVE8JJc00DZqrGaSyyWTZ/FSliSijJCnm6BOrjioJyDF/YhR3YEUzdciTw
 nnOQ/6+nj2Y0mtZ/1CkG9fa/gwQrYLoG3mbu/EzGsdJ3ZoBIM/V+gq+RMUti8yAm4NzR
 WkNIL1OHEJXZYG9Nq+Z8Nrco14fzbJ8+otUV3Zet0wJZdJoX7vOdmrD24+xY7B64LwyS
 jfC5Z6ZjWm7QiytN5i9XSmd57tq51j8gHbju02qXmNh6KTaJx0sU0rSGlyG4fZYsSbmD
 00Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rQuSXL2Y65tBj2ZoUqSKWDzHKLWHwNNGTlmHY27FNnc=;
 b=rqcqkdBINPbQutJn7xLYuymezhsd4a5FaLKUwb4FzA6sCoCp1C8n75IV5nhS1G6Isq
 0khXmGE5lDFmwmBrC3O0VY1/kCNwG9zCYcjIfxKay9btII2b9+EyM8Q7Jx7dCRwpwsuo
 aXsWJvBjAQS9foSdQ7ch3Upy7m/eHbTdRqh+p8vdIHbdXbAJ//nC2Z9ZHtIbEDnex2vG
 Z4J0j20V4rez/v78dUkrNOyGkqHvIG9j4yV7djfPEJPg6rmsBotPce8cl9QwN0Xuu8qS
 Dqebt6FhJE+r2CNeIO7f8SchVCuozOE/XAQsXy4Rdc1YQJ31BVDpjBKm3QAPdiuJ7IuZ
 Nv4A==
X-Gm-Message-State: ACrzQf1s0GZslGQvgnVP4ZYF7ge3W153D5k7OWuqpymNyef9t/WljeOB
 tvS4AnngsIguMuw1Hm2yzmix2jwTQnhGmA==
X-Google-Smtp-Source: AMsMyM7ImIrKZa5YfyAu1DRO1MxPb6P2N3ov4TNIctC2PwaZhPjyflvCjld7i4aEDCpinvPzAtRX2A==
X-Received: by 2002:a17:902:ea0e:b0:178:3d49:45ad with SMTP id
 s14-20020a170902ea0e00b001783d4945admr1614565plg.103.1664399238200; 
 Wed, 28 Sep 2022 14:07:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a170902f38900b001783f964fe3sm4092409ple.113.2022.09.28.14.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 14:07:17 -0700 (PDT)
Message-ID: <b499724b-b3f4-d52e-1075-d72cb771398f@linaro.org>
Date: Wed, 28 Sep 2022 14:07:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] semihosting: update link to spec
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220928190444.204118-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220928190444.204118-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/22 12:04, Alex Bennée wrote:
> The old link has moved but it seems the document is now hosted on
> Arm's github along with a license update to CC-BY-SA-4.0.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

