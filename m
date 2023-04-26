Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C0E6EF7AB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 17:20:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prgvE-0008KC-28; Wed, 26 Apr 2023 11:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prgvB-0008Jq-4X
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 11:19:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prgv9-0001pS-4Y
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 11:19:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so157101075e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682522341; x=1685114341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WH+KiGrmZ6FI65Mxdrixx0o2TsPNI2o2Nt4l8zaDlXU=;
 b=Nh+WJ9pczPHmMQ8lJAKUMUpNr4178Vmxrr3rqJNnBO+2N4BrhMW+mIg2ghPbslMd19
 kCWw1mMWiHQPw3D6VwGa4oK0VRY4teeZljFq1jJ7JiucxxsbNhwMcxhQN/ftgyWT8Wzm
 N/q9B5isEZP4/Dlw+QRTR29eFnJfwSeyGIhZKxH7pZOpU7z4oz1kmyM9hbS8vESywS8g
 YPQbtYb1JbG0oYN7tgvBImr3tfKHsR56V4M6oz2zaCxxCn0K1naDxEEaHhYHvmEAGiS3
 VzK0JcRX1v+AOBQbHhvThTQZpm5Ywc+e/zpezoth1MbUJsG2b00EbMecCOeo9zOXxSU2
 9ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682522341; x=1685114341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WH+KiGrmZ6FI65Mxdrixx0o2TsPNI2o2Nt4l8zaDlXU=;
 b=RK3iAKwLjOKPyXSDDJ1ynw2E30WLYXC/DYGL2uNwesB8oPmDza/WQjWptxmo9AW20a
 3obXV+zO2EXmf4R4TMTPT2+hIbBuh0BJBYTalJ4k+7Ne62hZHX/JKNWJPozPzorkOEPs
 3hjZ0e8Su/55RydRBtP11RtwNstsmirMT3qboR0MPPnfeC9a1VMsGsw1b1DNV/a10v/n
 M6m55L7sjhdsFb00Xtm5VWdRJthjZtkSmD4v0kSPGLBLHv2ENg1wvW4l8x6qVe90fz5I
 JVynVwzfc38BhnfcRHjvnaCVgxo7BQBR/YB60tTLQMlpknTzHQd9/eBNuBPnGQxG2EuP
 K9tw==
X-Gm-Message-State: AC+VfDwTEMYmhN/A96NeIZMpC0sDEUFP/ItwsIxe45BKvXo5DQBruJCp
 xqeEJje5U0UF2P1Lv0OmrD62YA==
X-Google-Smtp-Source: ACHHUZ6LRX2BqoF5ULHoqS72H8alRGX4g4t5ymeCD5RetMoy+lijdK27hGc32XsvtZyRsN3Aa00nAA==
X-Received: by 2002:adf:fd87:0:b0:2f1:b74:5d8a with SMTP id
 d7-20020adffd87000000b002f10b745d8amr1741532wrr.5.1682522340790; 
 Wed, 26 Apr 2023 08:19:00 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003f1733feb3dsm22005713wms.0.2023.04.26.08.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 08:19:00 -0700 (PDT)
Message-ID: <dbecb9fd-ff52-2c3b-9ff7-a9bc4495e53a@linaro.org>
Date: Wed, 26 Apr 2023 16:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/2] tests/tcg/s390x: Enable the multiarch system tests
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230425224850.2116064-1-iii@linux.ibm.com>
 <20230425224850.2116064-3-iii@linux.ibm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425224850.2116064-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/25/23 23:48, Ilya Leoshkevich wrote:
> Multiarch tests are written in C and need support for printing
> characters. Instead of implementing the runtime from scratch, just
> reuse the pc-bios/s390-ccw one.
> 
> Run tests with -nographic in order to enable SCLP (enable this for
> the existing tests as well, since it does not hurt).
> 
> Use the default linker script for the new tests.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.softmmu-target | 40 +++++++++++++++++--------
>   tests/tcg/s390x/console.c               | 12 ++++++++
>   tests/tcg/s390x/head64.S                | 31 +++++++++++++++++++
>   3 files changed, 71 insertions(+), 12 deletions(-)
>   create mode 100644 tests/tcg/s390x/console.c
>   create mode 100644 tests/tcg/s390x/head64.S

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

