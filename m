Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF36660A32
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 00:19:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDvzp-00024h-HK; Fri, 06 Jan 2023 18:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvzm-00020w-Vk
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:19:31 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDvzl-0003YK-1r
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 18:19:30 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 b9-20020a17090a7ac900b00226ef160dcaso1645120pjl.2
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 15:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9E4VwV65bm/RLd00P9ufqecKrT9phkPiqsIqjXeYYIE=;
 b=BJ5TZ6XlvSA3ysQLdD22hrhsUWBEoL/VCAXJnLEDannE8Ocjvb9qTEeBCxj/oYXAft
 7TMDIANsPF/hNmwHQfPteV8nCb6lnSYvC+M81l56wuZX6DO7OvbQL3jMKklMsTeJ/Au5
 SlSc1YhFsHG1v7GPRzwtVLaKU2Oyreh/LTb1GS8eKeB8eHxwu6Fz3AjKqytcRZsKiID+
 lzzxYm5Fq6nemoMQNpJ8QF8CC9YxmHzax2a+0LzHiWgvISmPZqwaoENU+7aMilZdPLJk
 rLtklTFGfC5H+CbmNqmTZkMoVAs6FKtjAfzpnqfLR/KPFTglvSmXycWsrrjtsy068zQS
 5Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9E4VwV65bm/RLd00P9ufqecKrT9phkPiqsIqjXeYYIE=;
 b=0DPFSLe3Ik4we1L3TcgzM65sA3sWeSeFvRLJDEQ1+CWuh245L90PDM+vLqnScoGop1
 /wEu1NZJNZhqz7XwkulpN/Q8VIR0M1Gbx7JosodS2tMmkJ2HMnYcbF1325+wAqKLpcW/
 2jJQxSqcXe+D/8d/yFS2IIpYKOjV+3tbobM6KVPJZljT3BahjBvOaZ/GUAwFGv6Jzrsb
 frfD2BzBH4CPAtD45mq673hIFsgDNnCVwbwoko8eBaGxwTTUyJ32QWPj4WArKo5viom+
 WJ9lsut/rSq/dGU9jQ5GalnNMRg++axdFQO8elRYpsZtD7+WHuyYwoA+oI//t9VmLYCL
 nlDg==
X-Gm-Message-State: AFqh2koqn5TFlDwdgj0DksuBX4zxSdNmMB5LImTkBVFZzntgpvsMGJaQ
 Vp10ERDWkI3obDQ70L7IUvUz2jXQ8D4jmOmw
X-Google-Smtp-Source: AMrXdXtVzdvgkOJJLbbkpuJ5aKVc5dKLzxkpkQLBW1S1ksHPtaRWpNQJ+QYPcJCI4IPw3Auqogy/Qw==
X-Received: by 2002:a17:90a:ba04:b0:225:d450:2ccc with SMTP id
 s4-20020a17090aba0400b00225d4502cccmr47638253pjr.30.1673047167594; 
 Fri, 06 Jan 2023 15:19:27 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 gl1-20020a17090b120100b0020b2082e0acsm1424283pjb.0.2023.01.06.15.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 15:19:27 -0800 (PST)
Message-ID: <0983fc65-816c-7ae4-b553-75f63f343830@linaro.org>
Date: Fri, 6 Jan 2023 15:19:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 17/21] gdbstub: fix address type of gdb_set_cpu_pc
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
> The underlying call uses vaddr and the comms API uses unsigned long
> long which will always fit. We don't need to deal in target_ulong
> here.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

