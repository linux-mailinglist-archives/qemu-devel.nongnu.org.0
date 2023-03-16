Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FED6BD4EA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:16:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqG5-0004Lj-UA; Thu, 16 Mar 2023 12:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcqG4-0004LO-GU
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:15:16 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcqG2-0005Js-95
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:15:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id iw3so2288897plb.6
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983312;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PQDDb4C/FeUQ0xgtaRmBgH7tkekHTBXXnSZZNYn6luc=;
 b=HtcvST/07ydQTTCkUrHAwxrpU5vi8MuHCt75GEVW6AHPPvrNtSPw99WCvTO7RNCffQ
 f41lxadjzd3WR7Kqg8d9WYuM+NERkOKTP3cAwBItoxjRH1BYitLczSVu+FyzxGAOP7Iw
 cIZUuGolhS/NKLUEQv/I55xc6y69HR3mT4kucWMojLjsdvAvJhuThAfkGqcjo3JetU7T
 /ZwWkz3c0rJDhnbFIuQu/4mbgkr9/6fI1Iy7OhCNpvWLGqfJECWFdwGf9DKrlFodpuBz
 9O79e6bRgLy73O0WXpzbiaEVnE5x2qGobWCIZBUcs6rPdeojMCaRrPuf1C1aKvMX6XmH
 pilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983312;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQDDb4C/FeUQ0xgtaRmBgH7tkekHTBXXnSZZNYn6luc=;
 b=2XkZ9OLflEAJPM9mZGZaz8Dj4vwtfBo4tSs/zjB6YiE8a/OwrEQF8YKEW/gtpjZThR
 MhOZWrOQBw/4fwt5nxFHjOoLIvApukURSkvJ4Z52g8z+GQqO8hJbKFZBcDUgjjnC95Sq
 y8nMfG/uJoqUGIJn3aMw/1AaLv59PUpUNLHG2LYw52QGKZJ+6mUovnSTW7stsnPtGFAO
 6CXV3/rYbPlJclBDE8YF5TmQVX3fkGYXwbcLiTfHoske34ZJfzR4ZU3AlI1Y+Fj4mHkU
 bRhS38a83yauqtnoLLJFwZnuYKW7sCXenij+bvKNR/1zewIHGOlVlBjneEhTM+flLhxc
 2u4g==
X-Gm-Message-State: AO0yUKVSFFxTyOujc2+A7z0J0RELjhXXHVGPiMLSWPl9UIYJ5sbhjYD1
 2cC3hMKEj38ee/OkVpkCdGO6UQ==
X-Google-Smtp-Source: AK7set8tEiLzyOUjBLIBVF+S4MgO7Yd5+C1CwNjmVE8RhsxcrFjbAGZJM1IGrNHB2Ifw6sJ1Qve95w==
X-Received: by 2002:a17:90b:33cd:b0:23f:3:49c5 with SMTP id
 lk13-20020a17090b33cd00b0023f000349c5mr4767466pjb.2.1678983312234; 
 Thu, 16 Mar 2023 09:15:12 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 g6-20020a17090ae58600b0023317104415sm3377180pjz.17.2023.03.16.09.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 09:15:11 -0700 (PDT)
Message-ID: <16b374f8-c5ad-7bd1-4a9b-ab6ce43d08f5@linaro.org>
Date: Thu, 16 Mar 2023 09:15:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/32] tests/tcg: add some help output for running
 individual tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230315174331.2959-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 3/15/23 10:43, Alex Bennée wrote:
> So you can do:
> 
>    cd tests/tcg/aarch64-linux-user
>    make -f ../Makefile.target help
> 
> To see the list of tests. You can then run each one individually.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target | 7 +++++++
>   1 file changed, 7 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

