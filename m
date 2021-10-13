Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F142CC85
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:07:47 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malTW-0004yK-P5
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malRA-0003Gg-1l
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:05:20 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malR6-0002b2-4K
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:05:17 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w14so2680797pll.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HfT+65h1ZcddbdibfTsTiK7noUxgeyx7zlvb3JGyI14=;
 b=fmplYo9uTbZznUxAmchFoZcD6+vZPgtPToii2JCt9RKvJpQsuMKHa5RIzZxhXrsmPu
 LhPnoAVpBf3VNcrABt+zxNgt73/B5waRN85KO1ZLvvZoLWVwT9voKUDAKehLNZmYNEEH
 xSn6Cu2HTYLuo0qOP3zFfo3vclAF2I1i6DmPDTkK5RXX4zVf604i9nOLP4SaU5VwB8jF
 Yi8ar2wyrvKwh5VyLYlU6Plk8GzTgvzPlhW+1zKdfmS+tG3MIeRfPYCsTpwxBqJEhT7X
 nC+Y/Dh9BggUVmu1+BHCnLck5kZDIdVXvv+UauC1PNPdwIRGpAaFJtSbdZ2PKWBBN5Nb
 HxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HfT+65h1ZcddbdibfTsTiK7noUxgeyx7zlvb3JGyI14=;
 b=1Kaz/yFERxMq5WgUrnlre0rg5uRjelwsCNY/isRHNP04y91v5ma/mEhvNDStyxGlU0
 iz/ztnJFNY39hk9PrfWQKDXf25xGkMOwVBDw66EwM5YrePyFF4LQnwSkXUcjQcFogLg7
 J3ClB1noVUgUYOrQpjTsaVcQ6nW9rXKDhAJrOmXl8NuZPCvNRqF1xUios7MIsf1kAzo3
 rSPuBDf53HnYKCWQJ8ddrbESRP0c7+TIPdtzPdJgI2jOQPobHlN7XcQZseNZLVovvs5S
 scJst/Fr0F46rlLgEX5T27ilNE+NKo+4AiNDCR5nmg4Lb5GGo7msmboQcDlQEZRUOz3e
 afQg==
X-Gm-Message-State: AOAM533wK9Dv4/PI0X9ZhU8qrgkMxj29lE4/h+al61Xg8ej7m3smqiww
 ArwLY4cxRDSmm5MtoEJMqhqEA6ObYAduRg==
X-Google-Smtp-Source: ABdhPJxP3OV3tx42c2EVBDGXGhpqnfDNl7Da0K7GNv2xg3JmkyGi9EkgOGpZOyHCBJz5TDk+VmhEBg==
X-Received: by 2002:a17:903:3092:b0:13f:663d:f008 with SMTP id
 u18-20020a170903309200b0013f663df008mr1397743plc.13.1634159107234; 
 Wed, 13 Oct 2021 14:05:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l19sm357226pff.131.2021.10.13.14.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 14:05:06 -0700 (PDT)
Subject: Re: [PATCH 6/8] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-7-richard.henderson@linaro.org>
 <877dejyhrb.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6fe6e6ef-bb07-98b9-da80-8b88a2b91809@linaro.org>
Date: Wed, 13 Oct 2021 14:05:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <877dejyhrb.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 3:28 AM, Alex Bennée wrote:
>> +    if (TARGET_LONG_BITS == 64) {
>> +        return 3; /* LSL #0 */
>> +    } else if (signed_addr32) {
>> +        return 6; /* SXTW */
>> +    } else {
>> +        return 2; /* UXTW */
>> +    }
>> +}
> 
> If this is is going to be a magic number we pass into our code
> generation we could at least wrap it in a confined enum rather than a
> bare int we chuck around.

Given that it's used exactly one, and commented, and matches the ARM, do we really need an 
enum?


r~

