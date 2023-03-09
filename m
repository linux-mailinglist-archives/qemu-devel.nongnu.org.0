Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E56B2F51
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 22:10:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paNVC-0002pA-F0; Thu, 09 Mar 2023 16:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paNVA-0002oa-7Z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 16:08:40 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paNV3-0003OU-HG
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 16:08:39 -0500
Received: by mail-pj1-x1030.google.com with SMTP id bo22so3296790pjb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 13:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678396112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tQgIRPCOvB+FFaD16a2KBOxq1e9Afym3b0gP0+ZSGXw=;
 b=DaDW8qaCdRR/B8oR3xDOF6825s1YPo9AWgzt7YK0fWEk45T+CxesdX9EVsqUmog9Tn
 hi/GJTqTnMZkjsX0taXYIOTcvi1zZrY8hmZX9QhMjkhRQLQeWghPqMZrCW/sy2mfUokk
 1d6oP710ALIgMXuqTkQZdnqrvAr4AatFpUvre68NdU6ONeX7BoBn65ri4TD5imqBzH+7
 A0o8JZIWjqi0lXs/UKs1CxBYdDI2EP/JywCezRu2r9xkl3v4SBkzaf8vNuY5OvmS5EvV
 JN6HS0FXshC7jeIqtwjwFF8S8RQJpu6R6+cyPm+8Cg8AAVckkuLFOu49e1J+WTo8U2ub
 6QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678396112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tQgIRPCOvB+FFaD16a2KBOxq1e9Afym3b0gP0+ZSGXw=;
 b=D+VG/nnDYgIpwJCZY5k/4smSNPnzmv6VS1i4s1VkhSv6/k8ZFguzlHYxfPMYT+uFCA
 pw4BINHD6L9UPkxO2gJhKH+SBDRQ/9SGt6ZxZH/kP/GHFSBR+yK0MXd8AgedYzq1qTAc
 Z85GGWD67ZqMj/BkMERAO5xe1jVEDq/+kDNYNtDPi6Kov96DOsTxSoXabhyDd8xjhc03
 T6Eq9J/SpQtdCo0ZtYWBLyq8Q7X7kk2hajAK26D4Cd3SMkyqaYF4D+YFnaCnWQHDSRRZ
 7swa0Mj72f+GIbHTmTw+h1s7WkFqupAE/zjsr1DeIR1jdNstc2KGip+G84cu/UkamMq0
 GENw==
X-Gm-Message-State: AO0yUKVmJjJEb/BtyjCnoO/FR6Z0MoqFXzhUMTwBSjzL6ycjxyEJ1ccC
 9LuXORvc8EAnVOLNmacN2gtMVw==
X-Google-Smtp-Source: AK7set8p9nj7Bqlw/gkdiEB6HptenghYiKjKpKITfN8xpPnqWjVNqcTjvwYixgAe84nH5AF5J3NqaA==
X-Received: by 2002:a17:90b:38d0:b0:237:24eb:99d8 with SMTP id
 nn16-20020a17090b38d000b0023724eb99d8mr24701999pjb.19.1678396111782; 
 Thu, 09 Mar 2023 13:08:31 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:bf7f:79a0:a976:bdaf?
 ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a170902bf4200b001991d6c6c64sm82696pls.185.2023.03.09.13.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 13:08:31 -0800 (PST)
Message-ID: <3f660759-b37a-6b9e-3eaa-1f879db5ed48@linaro.org>
Date: Thu, 9 Mar 2023 13:08:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 03/11] target/arm: Move aa32_max_features out of
 cpu_tcg.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-4-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230309201434.10831-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 3/9/23 12:14, Fabiano Rosas wrote:
> In preparation to moving the cpu_tcg.c code into a 32-bit, tcg-only
> file, move the aa32_max_features function which is shared between
> 32/64/tcg/non-tcg into cpu.c.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu.c     | 69 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu_tcg.c | 69 --------------------------------------------
>   2 files changed, 69 insertions(+), 69 deletions(-)

I'm not keen on this, as it's completely tcg.

Perhaps it would be better to let -cpu max devolve to aarch64_a57_initfn when tcg is not 
available (i.e. qtest_enabled())?  Move all of the tcg stuff out of aarch64_max_initfn 
into tcg/cpu64.c.

Thoughts?


r~


