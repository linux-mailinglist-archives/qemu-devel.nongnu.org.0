Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E876AF8F0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 23:35:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZftg-0005Ya-MV; Tue, 07 Mar 2023 17:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZftd-0005Us-QJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 17:35:01 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZfta-0004ve-Vf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 17:35:01 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so254009pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 14:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678228496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Gjv4TLOj/AtD/0nJ6/du4jNAJdDGyEoM4GFY1A3Qpc=;
 b=Ehcxjcp0OvHuOaZemwJj0HqkwLYL6wosWg+5EkXbkORhzE3OPbtXg2F2AAT0d3qeo2
 Rry+3/ybPhlNkLyayrwqtr9qUXp6LTZGPD9c0erLIZ3ulZjg4MuOJA3AvmOuef1KHMgH
 0z/ITgvfGFf3s2TpRJtzuKigFkHzUW8p7C/xoExuDv3355G73+ChESGjpYynndJIFoxq
 NZkZJU4OazAl6OE8Gzz6mG4Q2xvBQo6SvynCglIDrS/QypVlIWLNnQ3nXsPFxtyVDYjs
 hRkCEt15uEUYZGTABN6lpVfKT7fj4ixVvUjSkAf1Gu6IXNVm+ysTej/kS6wDrfbwoKMe
 Lv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678228496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Gjv4TLOj/AtD/0nJ6/du4jNAJdDGyEoM4GFY1A3Qpc=;
 b=pdNXYYFVLJOYDgB3Ktc5DCtvpUzPnZxrxJf8n5IliYPwZ/keAVOEznRh42XbTkdB06
 GwSC/IJ3EM7+SR+P3N0p89hIlqoR4RAFcDui3J3pbo1O6UK8232+yBJWOM1B5z55PzZO
 UvAi02g7nobuItQP53MKcS3LscCKhWxsJxOKdBUX/AGNV7MhdgJNKpfnwpGum3hecfNx
 dT4kY1jf/8i46cs5tIRNAqqsCqGvFB+ZHmq5Bl760bcV5c/ykc1SDsbeNyoswBQQ8KNs
 cJIj+u1T1cWrH0900/QHfGIDEe0Im/F8XtBjI8ndmOcZ/rc6/ewqahk7/thGhhZ6bsNW
 O6ig==
X-Gm-Message-State: AO0yUKW7eA0ZHiM8rUc88yHu8KtHwebLemxDAcLqESP5mOoGTEYNkO9x
 jsX7DrORWw3vpPW1FXXtUDHmbw==
X-Google-Smtp-Source: AK7set+tTEynyDweAjg/qR7Nm4FzVDIXq0JZAcRJaf7cSoscmDzyhugNhwiAkTb7gsKiC022FT6nGg==
X-Received: by 2002:a05:6a20:440b:b0:cc:773d:4fa1 with SMTP id
 ce11-20020a056a20440b00b000cc773d4fa1mr21004435pzb.27.1678228495844; 
 Tue, 07 Mar 2023 14:34:55 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 a25-20020aa780d9000000b00580e3917af7sm8345438pfn.117.2023.03.07.14.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 14:34:55 -0800 (PST)
Message-ID: <854d84a1-830b-089c-979d-17dac7131bb1@linaro.org>
Date: Tue, 7 Mar 2023 14:34:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 20/25] target/ppc: Rewrite trans_ADDG6S
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-21-richard.henderson@linaro.org>
 <4951ac67-2bfd-b6db-4cb6-94d7ead96325@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4951ac67-2bfd-b6db-4cb6-94d7ead96325@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 3/7/23 13:51, Daniel Henrique Barboza wrote:
> 
> 
> On 3/7/23 15:34, Richard Henderson wrote:
>> Compute all carry bits in parallel instead of a loop.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> Hmmmm the function was added by 6addef4d27268 9 months ago. All tcg ops you used
> here were available back then.
> 
> I guess this existing implementation was an oversight on our end.

I seem to have missed the whole patch set, which is a shame -- I could have pointed you to 
a similar function for hppa.


r~


