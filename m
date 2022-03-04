Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4801B4CDEE9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:51:58 +0100 (CET)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEu5-0007H8-Cv
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:51:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQEsM-0006Yv-87
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:50:10 -0500
Received: from [2607:f8b0:4864:20::42a] (port=36488
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQEsK-0006gQ-JW
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:50:09 -0500
Received: by mail-pf1-x42a.google.com with SMTP id z16so8594365pfh.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=snx9eLFhU/rbiU5KA5pEsfAXaCZ/t4eSMrmZiwuRnbc=;
 b=Eex6dCt+wr9+3+pV9xBqbpyaNCCwGDju+klpzOx25j4E9v/g+5GmdHoOed3KqqApfs
 VtsiL4ttA8b93+8htbDgz4zRWp+Y7cndayx8ze0bCeTDvXYjc+hecl0MxazqwDhJpPeV
 wyxcT5/NMA26Hs49oXI5S/4uQ+fFUyAiMdBs+t45aYH7gnC4DTsMzT9Nn+N7SaI0aXxb
 +77eVUkO9Z6DXtzLYnX7JSmVG1hh8Omtp2NthFLyO2KD0os0dJehpmS86IAXUKL+pbJa
 Vu85wO1r4pxodEaBsfe3uzj2dPTejtaPxhv5HzeY68yS4w5RRwcchO4a4wf3X60SLVXf
 rqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=snx9eLFhU/rbiU5KA5pEsfAXaCZ/t4eSMrmZiwuRnbc=;
 b=Php5cUx11qnwg1ue+oLJNr5on6cnBcoa+KzGG/txNnDXv8amcW0dFK4obWS3nrN9SL
 XVjkmzLnyGSLukubgTvXzePOrFp7YAb3hlHqmBvclenpvHvShxMm3G+JXBdvbuONS2+W
 pXC4VfFiHR494zCAkxMjjZlVcyowoWytjtDiRho9oj6Hv00/njH4/OQfdP0RmlCj5MDP
 aGPX2xrCn1sMDmDZFbJLir207q3CpkXWHq72lvA0RVr0qq2DUwxqlfWnYWOMABTLKLA9
 qujk23IinwD2yPi+lI31Qg1d7qrml9fqo+BTiziZ/McCoTSMkQZpS+ezzGLGB5G9DHuK
 NMNg==
X-Gm-Message-State: AOAM5311y7EzcaESxx73/JAAKk7WLJSP/oJMQImeU7GfL/KaHfLPasKZ
 61BR+K1PcgWDb5ah1+MiJb0IPg==
X-Google-Smtp-Source: ABdhPJwnyhtgkQP3G02bZhWwEazr8ePGS8hmRvpqvC/y7TFf4e+glthXphPFUKqr6H1RYSUYQQ7WNQ==
X-Received: by 2002:a05:6a00:1503:b0:4e1:d277:cca with SMTP id
 q3-20020a056a00150300b004e1d2770ccamr557685pfu.4.1646427007198; 
 Fri, 04 Mar 2022 12:50:07 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 nm14-20020a17090b19ce00b001bf2404fd9dsm2845722pjb.31.2022.03.04.12.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 12:50:06 -0800 (PST)
Message-ID: <0de2304e-7902-dc63-4a77-b16786beaac9@linaro.org>
Date: Fri, 4 Mar 2022 10:50:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] qtest: replace gettimeofday with GTimer
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-3-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304152704.3466036-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/4/22 05:27, marcandre.lureau@redhat.com wrote:
> +        g_clear_pointer(&timer, g_timer_destroy);
> +        timer = g_timer_new();

Why not g_timer_{reset,start}, instead of destroying and recreating?


r~

