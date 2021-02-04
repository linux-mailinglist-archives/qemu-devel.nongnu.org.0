Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5830EAC3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:15:07 +0100 (CET)
Received: from localhost ([::1]:45666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7V6o-00081s-BJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Udv-0006oH-W6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:45:17 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Udr-00056B-3O
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:45:15 -0500
Received: by mail-pl1-x632.google.com with SMTP id u11so934032plg.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HVrx2gmT35Bp2SSEzr9LKX68i6VKnUbv9/0+/+6F0wY=;
 b=bPD8UuEYu8Inm1ATfreQcvYvlb8h94f5VT4iWZWTxqrLYIKcE7QDTvxsciSp0F/Ldv
 4Q36XS6p9wKH/C60yWdXrZ49prRIYwBgli1Lf8DBI/LuRIY/lK5ExTpj1UGD7RB8EpUm
 zW+MtejE9NW87Ik9a6uXN/JTIxYQDKHSHvBHpa3SnJVM94S/X4tE4cf/qlxQLOno32ts
 cxHGg2pbq2RUo0HmgxlHsEtIfvnUa6ZgCvwQU8QcAen6uZScw4lCvm656WHC6OTgUFSa
 byFys0g+SFvnFktMAQSqC6hPR7XJSx8wwr1WfHbG8t0qZbPGShOpx/kz+cdgcLweBo34
 6kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HVrx2gmT35Bp2SSEzr9LKX68i6VKnUbv9/0+/+6F0wY=;
 b=gyDFeMw48ES7jP+ATBjdsIVb1qZj69RoXE82E9sWtBW1b7F+QsQw4+epA5Zx/TAhOx
 DnDtMkGc3rq5CEaqCvF2n2HJ31kNh7OyNQL/7mfz7zb/b+RoCXi1tmislgsB0dngQNkR
 /1wW+DMnCxRBqRt4pjMuryZdzHK1CC+Pec+4FMrQPCKJlRX7y/jNijTPnFB66qYBLYX3
 T4ThbJju4cRn8n0bcaI4s9bJv6TKiCWJ/P2RVtk2kYUPw10aYdAXiJc5VHrsQsn/0utu
 UpdntQs9srilnDf5WS4LwG05/Exi7xzTQUkVwKpRH0EfGnO244vpdOeaUIrUSde/Exbb
 ck5Q==
X-Gm-Message-State: AOAM530uyRaVMB6ik6VYyfGyiVan7XA2h0/Tbts3pcdzDKc/bvOo1gFW
 RMWMhEmnaHnqUkVL6RQJ9Et3Vw==
X-Google-Smtp-Source: ABdhPJwzYO4896gAaM6ynIr4Otl5vibvcAtU3lJQiv7TnWV5WTh3dEw9nxuehfMe5eyjqDsBEOSRLQ==
X-Received: by 2002:a17:90a:1542:: with SMTP id
 y2mr6327172pja.123.1612406709730; 
 Wed, 03 Feb 2021 18:45:09 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id f71sm3801490pfa.138.2021.02.03.18.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:45:09 -0800 (PST)
Subject: Re: [PATCH 2/2] target/nios2: Use MMUAccessType enum type when
 possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210127234119.3537399-1-f4bug@amsat.org>
 <20210127234119.3537399-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1738e3da-7b19-dd69-9e76-a1bf4af404ce@linaro.org>
Date: Wed, 3 Feb 2021 16:45:06 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127234119.3537399-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 1:41 PM, Philippe Mathieu-Daudé wrote:
> All callers of mmu_translate() provide it a MMUAccessType
> type. Let the prototype use it as argument, as it is stricter
> than an integer. We can remove the documentation as enum
> names are self explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/nios2/mmu.h | 3 ++-
>  target/nios2/mmu.c | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


