Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E754203C2
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 21:28:17 +0200 (CEST)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX79k-0007fm-Qh
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX781-0006V2-W2
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:26:31 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:41641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX77y-0002gQ-6x
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:26:29 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id d20so1798386qvm.8
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bOgQXIA7he1ilR2HmRh5dyHz6nWQIxDdWttK4ZUI4eM=;
 b=R9cSJqq6lnjQMgofN5jXJfIXyauMO5k9t5BOhKvtkAplKe9ilKGkeC0I1l7sIB+4JJ
 oiXLcG96/lLBTs+jyPSSYSH84NUwTGiiNmMfhLINOxhuUD3hGQF6Hm5IkQp6qgbBOo6E
 oyunwsi8DzVlbz6dMj4VCWDzyrv3duk+mgPUliTtTMVT1niU4PriFzLgT7zpAfMw+k+U
 WroOwWXqQJWlBYqtEV4kprCmBZ/mzsK3lG5aFwLN1KTA4xAJ4hHGRNDbHzjo7Tt1haUn
 rGytBWWOO9LhLyyhoL+8xkNTbU1I7wLuqOdV3E2XjR+16JBM4RXcWY7z4dQy53Nxod1Z
 t4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bOgQXIA7he1ilR2HmRh5dyHz6nWQIxDdWttK4ZUI4eM=;
 b=ZkQkQ8QUVwoFsIfarISsxtsbgpXsHhAKP45jxEmEzkt6WvD2TzuUHJ8BrS2dqaCn8V
 nUC587TTH2liGTSEV5a8KQN2vpdTXgH+lvNLpC7ekyJ8XSW058tXOZc9Aa4JTtslStED
 BA15F4980jq64nIQwo/1UWTE6JSMbfwwzoAD5wdVJLi8n6DdapW0rEnuaNaWM+tP8eGz
 7Xa3m+gi0LdTEpF7G3ug02Uvs/tSWA3jYAqjehefzzAciZnxJ/+WkQXtPiVH4SUIq2EL
 mOJ5YxjcnmdX20+9ByzVdrISzhJmc0ApmsL7lQU2yz5wpxWNAWTZDz14JBbWEoCyfshD
 u9ag==
X-Gm-Message-State: AOAM533a4Ki6p7MOF4E236Q+BuwfErbnveF7LkRHWZa5Ko2VfYoBo3pv
 Mkk8qjOqNttoIY30S6XaWvQKKQ==
X-Google-Smtp-Source: ABdhPJyL8PzTKiDISP23NDzJOF811pdwXSLvd/prFlbt15qShOqqDC8VVTMTWL0fAZljJqpQtvp7bA==
X-Received: by 2002:a0c:b412:: with SMTP id u18mr18901005qve.48.1633289184140; 
 Sun, 03 Oct 2021 12:26:24 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id d23sm7314854qto.91.2021.10.03.12.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 12:26:23 -0700 (PDT)
Subject: Re: [PATCH 3/8] target/mips: Use tcg_constant_i32() in gen_msa_2rf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003175743.3738710-1-f4bug@amsat.org>
 <20211003175743.3738710-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e5f1bad-2932-f18b-1e1d-9f5c0dcd0e81@linaro.org>
Date: Sun, 3 Oct 2021 15:26:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003175743.3738710-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 1:57 PM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary by moving Data Format to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

