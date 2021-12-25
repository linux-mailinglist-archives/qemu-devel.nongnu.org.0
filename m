Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1647F1A6
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 02:52:56 +0100 (CET)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0wEw-0001Ps-NW
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 20:52:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0wCw-0000eH-H1
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 20:50:50 -0500
Received: from [2607:f8b0:4864:20::533] (port=44713
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0wCu-0004bc-Fi
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 20:50:49 -0500
Received: by mail-pg1-x533.google.com with SMTP id m15so8728985pgu.11
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 17:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=twKLpRcCXRoy2/+EQBhs/08HWsqxmmql6pJAnO90LXo=;
 b=GkHMj/qj4vj2OiX50/0qOMvy7VjPw4AccvSF5GXISHWfgrtXyveRLdhlwHw5RcsGhM
 IWWXeG6RoRiC1+/MV/1KYvAFV7sxJoalgnm/e2VWGfoICkTC1OOiP74ub7Lt34vLJ5SX
 jMeZDg3Omytq0DH283HitBl3VZ221XOZFZ4UQewEvGqYbZv1e1puB2QS/k0MwWTdjHO8
 VQHx5p0gfAtrWU/87FlLKWMknL60xqvMsf0wTjDr7Jmp5WU30GOACXf0YnZ7rEBnWK4M
 XpTBMOLRJQkmQwBqwWU6GKEH4k88iyKvrqycxst0GsgcXJ0+Tr3R1JO5b+QK5M8FncT4
 GIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=twKLpRcCXRoy2/+EQBhs/08HWsqxmmql6pJAnO90LXo=;
 b=K3ep2SUknP4leEtdBoblnqe6Oo81RIuKU10pfaGY5IDRsKuNg9oMY1d0Y9kSE1EAXd
 NQ4Db02ztJC8GRYvcl8hLRzOpzxbmIxMiML4aoNU1Ce9w8ZsAY6nRXGklj3ybQLdSC+d
 86w04TZ+ZSz40DZw1WI5kB/BrWGDqlsf8d++6KJw75VwNXJTvSmXC8mf2KRayc+ZGr9y
 DM0mW9+JLtg+aVIHaPRFKpASz98bSTdBmEEZzVNRUoPMCnKDVWC174qzxm4F4IzjoXfD
 cWPTiQoj7GtmZcN5mgzxoQYi782wo87rmiW1BMQSL1N/b9k9/hkuQG7mBAu1Ko9N4KqZ
 2Mbw==
X-Gm-Message-State: AOAM533Eba4f1ATvpsDMEC6ebp6USEvPgn2j4zp9XmB/nVTwYbwLt+uo
 EG+x7lr/nevZpsq0OZMa+kMpFQ==
X-Google-Smtp-Source: ABdhPJyI1ItxLq3lSt9gSUEpq8y8EizJKz362xIZw00d5Qz4U96Ss6V1aiRirxAiMZGFS2VY8UfxFQ==
X-Received: by 2002:a63:703:: with SMTP id 3mr7966582pgh.128.1640397047047;
 Fri, 24 Dec 2021 17:50:47 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id t3sm10187370pfj.207.2021.12.24.17.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 17:50:46 -0800 (PST)
Subject: Re: [PATCH 3/6] linux-user: Add code for PR_GET/SET_UNALIGN
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-4-richard.henderson@linaro.org>
 <8e28ad1d-33be-e938-01c8-17b48458cc97@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9a02b8e-4508-ce25-2828-53f3b9744241@linaro.org>
Date: Fri, 24 Dec 2021 17:50:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8e28ad1d-33be-e938-01c8-17b48458cc97@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 2:31 PM, Philippe Mathieu-Daudé wrote:
>> +    /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
>> +    bool prctl_unalign_sigbus;
> 
> Could we forward-declare a UserEmuCPUState structure in this file,
> use it here:
> 
>         struct UserEmuCPUState *user_cpu;
> 
> and declare it in include/hw/core/useremu-cpu.h (or better name)
> restricted to user emulation?

Eh.  I suppose we could, but at the moment it's one byte in an existing padding hole.

> I'd rather not mix sys/user emu specific fields in CPUState.

There are *lots* of system specific fields in CPUState.


r~

