Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111EF64F5FF
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:21:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Kwy-0004xc-F1; Fri, 16 Dec 2022 19:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kww-0004us-42
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:21:10 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Kwt-0001e3-E9
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:21:09 -0500
Received: by mail-pj1-x102f.google.com with SMTP id js9so3998660pjb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Br5edP5bw72vTBBV6krhwvbgkDsEO8SBVZgWwmDAdk0=;
 b=QZpfF57ilo3wuzdUGPogQChMg/mmDaflC2b1BxbtnyFVItClH4Rr0zZ800ILePsYop
 op4gArMBBjdNT4LgzfLsNIahuFIm3FPkGIUsYJDLLIcjab+ISMOx5IHstrxo4ia8siQb
 qWPDlQAYuLzce6al2th2j73VD7dFepFr8tFs5fNQly4oM7p2NZsK01mgFP8Eudh5+TyX
 ozxnA+jODbe0h4uMui6R07qkrHUXoJuFvC4n+muRP6LbAssTzYiEUtXqArMyUPOvu+tl
 RY8mWqSrMYVqJeEX6rS4ivwsa4GrcX9KjDlCgyOFaAC1y/f770/I/Ocesr9klJ04M5jn
 2UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Br5edP5bw72vTBBV6krhwvbgkDsEO8SBVZgWwmDAdk0=;
 b=wShDnlRnfS1NTn6BWijUJ5JYS9A+cq0OIm2qBLr6lnEGGE7cjuJ8RX52GMfv6vNAxd
 aG5YwXmS8VLMHdRHxPO08ZcriwyLv8FMExJfcCsojpxwA4uXMPZ01MvZWSmeUcNm4Ab6
 L88tK53dFcJbvm0kkh/5w/KR+OsHzqp3tFj6uea9dbu6wjORI7PFx6sa3Lx4m9khGE8P
 g5KnDldsykY/SR2Sh800Exk3lfQY8+w23+RfS/B3fBoF/O/OfWC1V5TTpKGlB3HYO1jP
 nlu1XOWFErL9uW0pGNVZ3QL+WVlbmVdyW5tplsikGRUH6I82VEZ6LkO8Uk9k3iZz5BWr
 tafA==
X-Gm-Message-State: AFqh2koRgPpVFTlrlvmlR9E/V1NRbOtoCAnRyIviR0+9E00GXvNmHOjJ
 v8U7aqwCtgrQSgOHuh9M1XV1/g==
X-Google-Smtp-Source: AMrXdXuglF18syXPPjhd0R0IMP9eRamsl0EruHaKdlUa3VB3Ec6h3ZugpiJsy5/3liZljGt3t6+0og==
X-Received: by 2002:a17:902:e845:b0:188:fc0c:b736 with SMTP id
 t5-20020a170902e84500b00188fc0cb736mr316050plg.67.1671236462369; 
 Fri, 16 Dec 2022 16:21:02 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b00189667acf19sm2199043pli.95.2022.12.16.16.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:21:01 -0800 (PST)
Message-ID: <ed86c02a-d554-27ea-9a31-f93380c6c93f@linaro.org>
Date: Fri, 16 Dec 2022 16:21:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] target/i386: Remove NEED_CPU_H guard from
 target-specific headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>
References: <20221216220158.6317-1-philmd@linaro.org>
 <20221216220158.6317-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220158.6317-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 12/16/22 14:01, Philippe Mathieu-Daudé wrote:
> NEED_CPU_H is always defined for these target-specific headers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/hax/hax-i386.h | 2 --
>   target/i386/hvf/hvf-i386.h | 4 ----
>   2 files changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

