Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A276DB0D9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 18:47:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkpE5-0006oe-NS; Fri, 07 Apr 2023 12:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkpE0-0006o4-Mb
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:46:09 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkpDw-00082L-ST
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 12:46:07 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso43727350pjb.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680885963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DgbsEaXI4Wq86bxyeLkmEroMw/0Ve5ErEZb4ol0PQXI=;
 b=J6K8e80qMZgPE0NHu/+4sA3B967ZKjonWL9RozvGANH0XyNoO4MPSjXI2HSXTOSH8P
 f03sQ9d0Wzy3gpstvLFKdvgewFWu6BPeCw0V8lhFhNyC+k5J7navVJeqFSCNV0bdC9ZF
 o2b1H9MrZNCfl5qvsHZABtbrwvlNsSDfOSjij7SuSxP5RqR9WHy06Nz7C8+5U8ZpY23y
 adm0klrYxW0ALp/KGS6pkyFWEOXdGqGnnJoCvfp+loCXRl8ibYsZnaKAPDujcuaPaJTW
 TeY3sg+aXddxvfLCG4RO5TZXdrLg0Su5BZzewZmsZfG2E+loMnX0FFCoX8OFecW7soNb
 hWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680885963;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DgbsEaXI4Wq86bxyeLkmEroMw/0Ve5ErEZb4ol0PQXI=;
 b=4L2i+itQM6wjv1TPlzejoHA24EPIBD5RXfQ493ER35RaCTlozMG/q6CeoSdNdd0IEm
 q6VV4rZ2wypq5kxdVvjsoSdon2h87Ijn6kJyzQ7H0lJUW6ueomP1ZEUkCIAdV5i3kb5D
 O5Z3yhrWm9A0fCjDIREosOTCLghBldHUhAdM+iFsr+3vQwYD7U1TuRbbnpckZzTKYH51
 htB4J2FG2cYj48TvqBkZhYFtTzERvZ4452+0OJoHA+OR7KIP09IV7OFw6jjc3P3B3j01
 5DgrSMXndryQ77TTdRd6bnyWSphh6uUf0GKUUPsuqDFsr4hRb7YzJ/QH/EoqXbI0H97m
 JQSQ==
X-Gm-Message-State: AAQBX9fKasFXwOCxKBSS8kBMXK+outNrn7yNVggUqWRq3vBoBAcNJORw
 jZlUR3B5ft5d13Ly0+7x25zABQ==
X-Google-Smtp-Source: AKy350bMD3RRRpRTitmUsScdRoCCNiYJzA5K+uLn5+I6Wkn70ngZ9N9kSmCTHSpQMDn5D0mozxCeRA==
X-Received: by 2002:a17:902:f90e:b0:19e:7b09:bd4d with SMTP id
 kw14-20020a170902f90e00b0019e7b09bd4dmr2504645plb.47.1680885962818; 
 Fri, 07 Apr 2023 09:46:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170902988b00b001991f3d85acsm3107007plp.299.2023.04.07.09.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 09:46:02 -0700 (PDT)
Message-ID: <962561ec-f3e1-0c25-67e0-1130f1f3e63f@linaro.org>
Date: Fri, 7 Apr 2023 09:46:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 30/44] target/loongarch: Implement vclo vclz
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-31-gaosong@loongson.cn>
 <d81762ea-f939-ac48-018c-826c581e5fad@linaro.org>
 <cee17e01-4f4a-6c1d-9808-08f7ca083ff7@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cee17e01-4f4a-6c1d-9808-08f7ca083ff7@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/7/23 00:40, gaosong wrote:
> 
> 在 2023/4/2 上午11:34, Richard Henderson 写道:
>> On 3/27/23 20:06, Song Gao wrote:
>>> +#define DO_CLO_B(N)  (clz32((uint8_t)~N) - 24)
>>> +#define DO_CLO_H(N)  (clz32((uint16_t)~N) - 16)
>>
>> I think this is wrong. 
> It is wried,  the result is always right. :-\
> and  (clz32(~N) - 24)  or (clz32((uint32_t)~N) - 24) is wrong.
>> You *want* the high bits to be set, so that they are ones, and included in the count, 
>> which you then subtract off.  You want the "real" count to start after the 24th leading 1.
>>
> Yes,
> and  we use clz32(),   how about the following way?
> 
> #define DO_CLO_B(N)  (clz32( ~N & 0xff) -24)
> #define DO_CLO_H(N)  (clz32( ~N & 0xffff) -16)

Ah yes, I see.  My mistake.  Either old or new formulation is fine.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

