Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8AF438C06
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:17:00 +0200 (CEST)
Received: from localhost ([::1]:59158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mekrT-0002C0-KP
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekqT-0001X6-Mu
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:15:57 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekqR-0002Yo-0L
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:15:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6921940pjb.0
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f8JOrNneel1cc8ufmXqvE0QfZ92M/aitzktHwFeAZk0=;
 b=PBptdMdY4S24RLmrWwVSulFq3+Xq8nxQQ/y4BzSu+BFcOSLi3cHVlmy4By2MjJEgfX
 lWG1HEttRbqCQVeJIKr+hWTFjS0vpwzXK/SgofzTKx93lK/LzcXy2ia8nLGlsmJDmFev
 uia+zUDKCWdPM4+qYt5P+tVR5SFdhonaEjX922ZrRGqEWoX38haC/ci8sidUmhp+eX1Q
 WDE3O5UWI2SbWsxY6+p4wbcUtJI8phXeGT1X2Zx9a9g6lTeR/AOztjm4PIsl4lTSpHO1
 gqfhEPoUG6XRcChiHh4FzoeFvqnOzLFQs06891V+oHHQX2GVOqRFYhf7AIVOAMhFl6Gg
 FXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f8JOrNneel1cc8ufmXqvE0QfZ92M/aitzktHwFeAZk0=;
 b=mSwahXftQdusIVabj06Gb659ZBVUrAgLeTCyEiPAy+SYPkOQ48pHGHI77Y2ZI+y8Qz
 pQz4bKLIokfpPdYYTvui4Wc1Y30HEtE9eUWD3ihAP7qZ2DUu92sU15iEzbmplth6wZUQ
 PPPgRe22Vadyv0mgIbWYL7o5Qwvyi1iPXP5HaQIzgKLqEeX3sbx22EmJZqnmyf66n+04
 phKTvcDszZVCcqCBuaKEipOanluGevY6bjJy8Bd7Jl9Rm3FazUYo5tqElVmEtH6sVpgJ
 YYrb/9Yt7R02qxt2UxNTggJEFooQrcBjVSA5WP02cBpDukb1M5i+p9ObEb52haicqV+s
 iuPw==
X-Gm-Message-State: AOAM5310opJS7qmd66bdBN7aynwLngG/mrhHynk7Dpsh+sYUlL8mXWbT
 ywr/fI3JpTRCmgW7Ci/ClJyKwA==
X-Google-Smtp-Source: ABdhPJywOYuHtncp+5ORriiVNrMhxh1MRAzB5y4yzJp7Ol2f16LMhXTEJdf28Xg3Jse6T+C/Ix3lkg==
X-Received: by 2002:a17:90a:2acf:: with SMTP id
 i15mr26206483pjg.91.1635110153350; 
 Sun, 24 Oct 2021 14:15:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x27sm16104516pfr.181.2021.10.24.14.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:15:52 -0700 (PDT)
Subject: Re: [PATCH 30/33] target/mips: Convert CFCMSA and CTCMSA opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-31-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e4c47b7-d345-61de-ad65-555bcee9bd7f@linaro.org>
Date: Sun, 24 Oct 2021 14:15:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-31-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:48 PM, Philippe Mathieu-Daudé wrote:
> Convert the CFCMSA (Copy From Control MSA register) and
> CTCMSA (Copy To Control MSA register) opcodes to decodetree.
> 
> Since they respectively overlap with the SLDI and SPLATI
> opcodes, use decodetree overlap groups.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode      | 10 +++-
>   target/mips/tcg/msa_translate.c | 95 ++++++++++++---------------------
>   2 files changed, 42 insertions(+), 63 deletions(-)

There are a couple of tcg_const_i32 that should be tcg_constant_i32, but otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


