Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E640660867
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 21:43:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDtYG-0003Ed-00; Fri, 06 Jan 2023 15:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDtYC-0003E2-Rr
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 15:42:52 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDtY9-0003CD-Hp
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 15:42:50 -0500
Received: by mail-pg1-x52b.google.com with SMTP id r18so1917291pgr.12
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 12:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BTCWY0WKEFMX3SLzeCpnw17eGaWDIwaCrEjVUjBh9GU=;
 b=aevSl8TQyoWbI34Nvi4/ME5Tvwd22nASXj6YN2H3A0StUbxd4xBZhslSxZWB5nDk+l
 BlSyax90Nysyv0r1fZaymIXAeDAIkn3nsPTV64es+zvZFBTZ7QGrEuW57VAQwebQfL+d
 KVqEuLbrW2AYKAO6eyDePYJ9C0H3cHNhbSIKFKhC1cBwlK9kNwERuEX3KYp7cfTUYMu3
 llKoCo2IccXGFKHcmskc+BklNID6kRooTgAHq48RvP3eyDRH9mEY7BWCPgvlH9zDKZE3
 JIOObYfJtdpNw7wlom1EC8HiWtUSA46CNSW5gpnKc5kaLTTjuMTJ6DOYrHwepOLQk5xI
 4RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BTCWY0WKEFMX3SLzeCpnw17eGaWDIwaCrEjVUjBh9GU=;
 b=4GdR9vnm3Pl55McFjmSQ7VxZ8GY8AckbxEybYYL9XJZyCkt2Y462oyhHWIm0eynhKN
 oS/V9RJithdGcU7T3PDXV50uM50FmOZBgescwtzlSfgW3m01Q5vU4FDPcD6TEEiwwkxD
 P4aZT/bjNqna5YP4uRmEvO354XawuGTrlIFlbJpjbx4LoSHWx/WZpUVIowstb4SgCJVk
 yUGbW59yzKyamStU078bSiQ85i4fjqguxo1vr72nrCiQ408SO8zH+oGsGsgoVO/AZKYX
 h3uBcotWGSy3bHVko2m7cixSfLLBVTdqv9xo9Ip+GZNGr7gg+wGJrleUcuybGrCkjej4
 TMjQ==
X-Gm-Message-State: AFqh2ko2ksy0ke73R3s7WWMDepbZiPQpCZOk+BIW0z+UPmkpvVhieH78
 h7U542hZ+qQH8wshq39W11zCCNqI0gFCLwzv
X-Google-Smtp-Source: AMrXdXvMQ2J5L+WWMEDYM7XnfqTjCTGdYU1pQ8pTnPrVd0nS+rc22dFqH4YIHyABwTlcoAFJGxIfmg==
X-Received: by 2002:a62:1614:0:b0:580:dd4d:43bc with SMTP id
 20-20020a621614000000b00580dd4d43bcmr47351172pfw.26.1673037767946; 
 Fri, 06 Jan 2023 12:42:47 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 h185-20020a62dec2000000b00580ea7211c2sm1471276pfg.208.2023.01.06.12.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 12:42:47 -0800 (PST)
Message-ID: <0daeb57d-28ec-4595-8b2e-32e4e01348d8@linaro.org>
Date: Fri, 6 Jan 2023 12:42:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 06/21] gdbstub: move GDBState to shared internals header
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 08:43, Alex Bennée wrote:
> We are about to split softmmu and user mode helpers into different
> files. To facilitate this we will need to share access to the GDBState
> between those files.
> 
> To keep building we have to temporarily define CONFIG_USER_ONLY just
> before we include internals.h for the user-mode side of things. This
> will get removed once the state is fully moved.

You don't have to have this hack if you don't ...

> +typedef struct GDBState {
> +    bool init;       /* have we been initialised? */
> +    CPUState *c_cpu; /* current CPU for step/continue ops */
> +    CPUState *g_cpu; /* current CPU for other ops */
> +    CPUState *query_cpu; /* for q{f|s}ThreadInfo */
> +    enum RSState state; /* parsing state */
> +    char line_buf[MAX_PACKET_LENGTH];
> +    int line_buf_index;
> +    int line_sum; /* running checksum */
> +    int line_csum; /* checksum at the end of the packet */
> +    GByteArray *last_packet;
> +    int signal;
> +#ifdef CONFIG_USER_ONLY
> +    GDBUserState user;
> +#else
> +    GDBSystemState system;
> +#endif

... nest these.  What's the point?


r~

