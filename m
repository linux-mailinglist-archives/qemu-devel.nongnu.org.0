Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA085E8D8E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:52:05 +0200 (CEST)
Received: from localhost ([::1]:59952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6Vg-00067Y-VR
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6RB-00020P-KO
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:47:30 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:40592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6R9-0004hh-IB
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:47:24 -0400
Received: by mail-qk1-x72d.google.com with SMTP id c19so1756748qkm.7
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4bzdVO4Qs7hm9Ap3nB5RLw9zVh+Mws3oPJDheBuHWhE=;
 b=KV9TfC6jbQSuJvuZXJHFGEtT9VOnL/GOdKVBqfkLcOpuQJfpc3aQ5KlI2k6gE4/V3E
 CCxbI229C4x/en04iGAANJunZhxLdcwnC8F2YYv5HWAQc87HcPiK+HoqRlfB9mNf6WqP
 CvR/Ig9AnRUaHTzBTC7RGsswtOA8Q/0hYHJXC/684kvQBganUMINl4x3YgH8zStvObVh
 JGDYiqLHD4UoAMZjeROr3FtZWeWruFPaF7EjkZHZ9W7BkTGf545ESjzUmKXG8EwfItqo
 T4qjS+NrMbCUxHk2rc/LBx6CQQ2o6yzd01/ibT6dlyd906N4OLA8c4wbkKeItU14cTq8
 pLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4bzdVO4Qs7hm9Ap3nB5RLw9zVh+Mws3oPJDheBuHWhE=;
 b=aQUjMNvOjDtFi2dLqz3FJNPIp+ltqTyaL2IQOH1zoUJhOsXeOIhWVEZZRNFo/xm8Fc
 aTyHEx1xxGnsY/n5Nd5DZIdtuX/2yjyLcFVSk1d6FNRtvxSL2CYAk2Si1/Qi/FOTtVt3
 ynYiLuY1YJgQtM0LFxk8kDWNKE9gCX2ueFpa1W7U4DdGzwJZZVaGPGZuO4IpMgkFWi4w
 SOR0lKSwHWxuvZQ032rc76LHAfWLTBD+HsLo7SB4RIHG0IyrYmnz9SMVZ09//uh4HvkN
 8SfA60bxqKC/Xr82t09FTlLOfa/tQITOtFQzbIrjOweLk3jvnjWyBNl9YySS1c99Zwi6
 Ukmw==
X-Gm-Message-State: ACrzQf2Z1mmBRjhC4B/VWGaq4oSfN094xW2Ocg1BXtAlhZaW+3YlIEs+
 tJN6UAKndP4bicLnRbKKqaAWNg==
X-Google-Smtp-Source: AMsMyM69ljZt3pY5+2FlufspGOXCHrmDOVAPd31Ip98V140/2sHapagwqKkCiv+MKQ+pWCL0yxfiKg==
X-Received: by 2002:a05:620a:290d:b0:6b6:1a92:d88a with SMTP id
 m13-20020a05620a290d00b006b61a92d88amr9126788qkp.58.1664030841944; 
 Sat, 24 Sep 2022 07:47:21 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:1f12:b4b:2dff:20:54a0?
 ([2605:ef80:80b2:1f12:b4b:2dff:20:54a0])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05620a28c300b006b872b606b1sm8327185qkp.128.2022.09.24.07.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:47:21 -0700 (PDT)
Message-ID: <1cb4af78-f70c-eff9-bddd-6f678c23972a@linaro.org>
Date: Sat, 24 Sep 2022 14:47:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/12] target/ppc: Moved XVTSTDC[DS]P to decodetree
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-11-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-11-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/23/22 21:47, Lucas Mateus Castro(alqotel) wrote:
> +    return (match != 0) ? 1 : 0;                            \

?: operator is redundant.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

