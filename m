Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46B6AB1E2
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 20:37:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYu9m-0002AK-UO; Sun, 05 Mar 2023 14:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYu9k-0002A3-Mb
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:36:28 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYu9j-0003VY-7O
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:36:28 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso7024910pju.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 11:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678044985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i7Bml0enZKea1ASVMp87cpL2X0fx2QbH5EQoc4hZHy4=;
 b=C//Mu7D0ca/8lVo0ZkV1lvTStvsqsD8Fe1nMncSvn4y33ycWxyj1/ihxxRsIzjt/It
 q0Lx8yOYNZIeDX8ix5GqwEkXpKVlJ5atav4tfaMSb+VWhn8puTLTCYUGWEWQd/IgjUeb
 22Ej5nehZxuP03Fbwz7buj2l/SOeXLKSdv9X6LgdjiCBtzKj5+EQbPok5YhLdxX46rai
 tkXzAKUQcebpUTH1dwrVk14pX1U37RZ0e8suW1fy/oXPRUaL03t9pzao9e38Bx+J4164
 D+T55P3vURftqkkG1Lt3AMgHXjZXnz/Oky8/vp3VXzJq84Nef4+L/Q7xGx++s2GKwtv6
 +3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678044985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i7Bml0enZKea1ASVMp87cpL2X0fx2QbH5EQoc4hZHy4=;
 b=5pVkZ58U/sRkaK8IYcdwjHCUpO5753Uj3kgT86ug5tWOeH+PQ6HtgMaJpUBjqNmJKD
 FA0NVlCbGVv2jSwumrPDlORH/h+IDh9JJbhwXDpBpyJWbWWwn3f15iA0OlAd1YztzhEc
 gbUTmWVp90Qz1RAm5E3CBD2/XBrhn8IKSA2SDMtHaXgdYTi8wrQO2nket+K5+Sopyjnq
 cLfS5XqjHkfEt91cTg5K9C1PIvHpCdqfjCB4tzAzJomijPIiJwUkou2Ex3ltV9Xj5Lwp
 sZHcIBVNn8rL9LnjALaUb7c9FWViybuw6yVJWnI6mIp7r5CeNZXJ0GUlL29CNtNULBDj
 NUdQ==
X-Gm-Message-State: AO0yUKX05pItXmaUREtrvJoqZr1nLqy/x2zl74SqEmWIH1TRE1N7MSHo
 qEjQzSIRTH6AGASImPjv7p/WKA==
X-Google-Smtp-Source: AK7set8NjqmxQ9fK+xJ6vtY0pB68fzwLcSlCLx3sTeo4t9xyn6NOBbM8ej3+LlAM/XD5oKbf937ITQ==
X-Received: by 2002:a17:902:ab90:b0:19d:1e33:a60d with SMTP id
 f16-20020a170902ab9000b0019d1e33a60dmr7574014plr.25.1678044985583; 
 Sun, 05 Mar 2023 11:36:25 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:d15:390f:de71:e264?
 ([2602:ae:154a:9f01:d15:390f:de71:e264])
 by smtp.gmail.com with ESMTPSA id
 ka14-20020a170903334e00b0019ccded6a46sm5090249plb.228.2023.03.05.11.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 11:36:25 -0800 (PST)
Message-ID: <ea7a70b3-829c-9725-f960-f942b68d5279@linaro.org>
Date: Sun, 5 Mar 2023 11:36:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/8] qemu-coroutine-lock: add smp_mb__after_rmw()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303171939.237819-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 3/3/23 09:19, Paolo Bonzini wrote:
> mutex->from_push and mutex->handoff in qemu-coroutine-lock implement
> the familiar pattern:
> 
>     write a                                  write b
>     smp_mb()                                 smp_mb()
>     read b                                   read a
> 
> The memory barrier is required by the C memory model even after a
> SEQ_CST read-modify-write operation such as QSLIST_INSERT_HEAD_ATOMIC.
> Add it and avoid the unclear qatomic_mb_read() operation.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   util/qemu-coroutine-lock.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

