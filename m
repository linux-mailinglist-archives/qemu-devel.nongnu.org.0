Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C542698431
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:10:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNAP-0007Ie-D8; Wed, 15 Feb 2023 14:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNAJ-00076F-1H
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:10:04 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNAH-0001B3-1d
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:10:02 -0500
Received: by mail-pg1-x535.google.com with SMTP id y186so1245634pgb.10
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+pUYMm0qWppqaGF6tJQM8SJGX3NzaPpwXgbOwByn9p4=;
 b=KccViyztqr+AlLw8Nj1yr4c54G3umReWCqkn8HHMs/UIHALEoM7zMJNSyF5PbN7Vk6
 Qq01f0e1eaU9QsepIejWmaxQHeSmpbHIaAkL5sCj9kxDjkDx2iuYA3NdZchH36Zd9Lg+
 qi/iymMpQAvUDsC6IzfblFLWX+zEUvSZpGKvjuI4W/XeUKXbNKiw4ZJN6KjDAoPdAMWc
 7qCl9uugzKBWg5ZA+Oik+V0oSjWab38cUwCD2t+qKjF4zuH9LS0yEsMflGuCRHfaKJNe
 wy+5JgWT3nr8Cc3tQqT3kfEylG9lCkgTs8+CTxwTbE7TQOQ/BT6pnSp8aLJldHAjEWZq
 wzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+pUYMm0qWppqaGF6tJQM8SJGX3NzaPpwXgbOwByn9p4=;
 b=ItFCSOpyEOZ9bauIU+e3rWbKtRDw4zpgleXpwjEpbMxhP+ist59UsqrW18v32i1Fct
 Fod07984MnIJ847qAYgr7yJ0DNhivdSiuK4dLp+XHoTbPeG9TnQ54TXxgHehv1YwOJOB
 urvGXG1CGC70RWCb+jjyQGDedN/oGmR0TUs9KJU6Q1shDAjMdHpcjvB7GMHaUD+l7RoK
 6pSZcmfdXYT3kGCVz3QtxuX+WQGdqka2qaFne/fnz8DjskSDBl31DVzTeOG/zhZiyT5Z
 dllcIg2+pJFmRijslukqFbG8J9NI0mMLB36mZ1gzMnct1f4H6j2e6kwX69AVPkHFm7wr
 KVEQ==
X-Gm-Message-State: AO0yUKVBug2uhTE8Y/LctgGWToDVhdK8v40XkSgXcO4nUOuLOFtbyYW6
 Xd4RVOg+T38EHyzGJZfHZm1AXw==
X-Google-Smtp-Source: AK7set+iKvRNC9ND+mSQfAPRjW3wAXkZtn/a31uLFmG7A8vKHxhgGx0+E/Ve3IwW/moBexfY1NcStw==
X-Received: by 2002:a62:384d:0:b0:5a8:bee5:d0dd with SMTP id
 f74-20020a62384d000000b005a8bee5d0ddmr2679111pfa.7.1676488199691; 
 Wed, 15 Feb 2023 11:09:59 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 q22-20020a62ae16000000b005a8aab9ae7esm7022559pff.216.2023.02.15.11.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:09:59 -0800 (PST)
Message-ID: <78900a57-8d3a-824e-1ec5-db2b7e13e49d@linaro.org>
Date: Wed, 15 Feb 2023 09:09:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/20] hw/ide: Include 'exec/ioport.h' instead of
 'hw/isa/isa.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> The IDEBus structure has PortioList fields, so we need its
> declarations from "exec/ioport.h". "hw/isa/isa.h" is not required.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/ide/internal.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

