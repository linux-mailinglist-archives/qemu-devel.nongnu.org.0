Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312E339E70
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:10:55 +0100 (CET)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL4yk-00079b-9U
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4x4-0006Fx-34
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:09:10 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:45015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4x2-0006CV-LB
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:09:09 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso2888451oti.11
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5pcxvrIICngOwhebXJMUXYZy4q1d20VltkG+RwNeZJ0=;
 b=EAHCWrt6BO6s2rYr5aK1awkakRryZkGnAYj5lTnOvpnSyKyXxhbbhnwoisGgo7ELug
 N0YhLu+109zHG+tfwBmVn8MQyZH47PRabKizdyoitoceITD8DlyoUUmLw/4pzRNQWjNw
 gHgNLHuwZ8EUMT0cIX6HHXTcYyapcHvlJs3ruitAl2Kp7NMTYrpFCBj9Cje6XkJYT6Lu
 62iuWh4z1Jydzff5cHWjzzDwpNgEL1xXMxJDunlC9aQz6WPleXdqcxcUt6Q7or8M9IqG
 rki9P1xCDcq4jItXrr7MuUmYEH5X5XgxA3Fdk6JTzXAg4F9LM+qKnz4F+jJ8Zgan9zCs
 sZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5pcxvrIICngOwhebXJMUXYZy4q1d20VltkG+RwNeZJ0=;
 b=lXSrLbMg0jM/4/7nWVODkvwLI/I0dMBhaQo14C0EPPgX7ulb8NpX4usAjA8BMudRs6
 BypXpzUFxuu+tQZJTVf7RL8Xb2wtJDjkixHOcnbiingi5LzmZDRAae5PdC3TCim9ChF+
 c6dY6HTzXUbhv/sEwSozFyWLtQO7KepuwiV31UwQccT6EKyB1TMLWWgGu5MtL3L/zeWK
 sUd476ZFC3eAiLsbZy6qzw9K91ERyEcAKRfQJlUPizJxE4LPK28MqcsI9np9rP0I5G0n
 OY9y74c8Ufpu1ZSVWY9eAf5zFS9Ka14xRLQrcv7LvncpzKt22g72HTpkfXY+eF4UZnpp
 5a7A==
X-Gm-Message-State: AOAM533FXk9lNutmrrZX//4cQAuva4k6AFh9goAJFEP0hEn67pQgWzWa
 0D+NQHDPdO1xV0RIFCcpuM+hBA==
X-Google-Smtp-Source: ABdhPJxHHGsa2+sV86/CoA28kk6wJqGnPwoJedkSDgUTHT9X9KUBZVySH1CBy+srWYjFAz3fwVzGTQ==
X-Received: by 2002:a9d:7ac1:: with SMTP id m1mr7502994otn.186.1615644547657; 
 Sat, 13 Mar 2021 06:09:07 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x17sm2187273oie.5.2021.03.13.06.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 06:09:07 -0800 (PST)
Subject: Re: [RFC PATCH v2 13/22] target/mips/tx79: Introduce PCEQ* opcodes
 (Parallel Compare for Equal)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
 <20210309145653.743937-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2d367ea-f905-1eed-55b1-9f4a89ce004e@linaro.org>
Date: Sat, 13 Mar 2021 08:09:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:56 AM, Philippe Mathieu-Daudé wrote:
> Introduce the 'Parallel Compare for Equal' opcodes:
> 
>   - PCEQB (Parallel Compare for Equal Byte)
>   - PCEQH (Parallel Compare for Equal Halfword)
>   - PCEQW (Parallel Compare for Equal Word)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


