Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAB36AE576
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZdm-0004wd-Ay; Tue, 07 Mar 2023 10:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZZdk-0004w3-Nw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:54:12 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZZdh-0008T7-PI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:54:12 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso12307819pju.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678204448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WFUFB0pO5FBxIxzipYioXrwi4SIa09oRye3k38S1CY4=;
 b=lGVKrHGZ1Fy/5I2sM7DUEmEfDY1CeYA4DiKTeB8QBb3VXRf99mEEMYPXnXnI2/RLi3
 cjUhbYooPoW7LD3PBdix4Ka7tRHWIJ1TMHb/DCxnh7UZGFVtqN88gwETygBAmIb31Fk4
 KorKP6PO6N7aCx/myUEG4hPin0ZTjfpZSzY0j+N9jSrUPk/olrKvgxaAdfV37Yu0HYeA
 8yOoyiaqVHbzGNmicBKqwz9Uyww2TF35T8gl5Paz6j8cocs30nwnpHdkTBtuOIiat89H
 wWWbi+hVwzsom9fBrlTrOfCGDg2hJgQY+Y56Ea4tJngG7r2F4DMDqz4TlIJH6MVlO6k9
 yBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678204448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WFUFB0pO5FBxIxzipYioXrwi4SIa09oRye3k38S1CY4=;
 b=EZH9xkFYFQ0TruZPVmB0BbT2YIRd7uTGwSzfgayArR5m/AdWSo7q/abWkc5DMFfK5o
 SAUdNMkc+GUkSsk4rG/dmqOLD3xMeSocNkxXsLUfzxKeQMzYMZ5s+HEge0y2q+hvv2G0
 xwndf/11YH/DgEDcRPfwAjV8WPjgFgd3t58k627jemvx4ay8MoR3M2BGxV2ZlxWnkvEq
 S4HSyuARDEKqzGSShY0+jfbUlSM/fN8lq2FKzX9s/Exp4HpTUpeMr20hCmZciFbi+dHZ
 mbrirC+78yHmf3N8DmGtkhkVz0jYpC9WkAx3raSAmj7cQdXt4tEf9gdcObK0dtz/k6KO
 rh2w==
X-Gm-Message-State: AO0yUKVz4iXfODoDtNmpJUU3pOG1dsDj/PMcGcDwvmdGrYAvtkMLvCNE
 x4XqIFfzCVwvAYAibFpRnOSLLg==
X-Google-Smtp-Source: AK7set9cdUzCEkxNf7B/kU34CQqg7TENXcnBCMiKyh4MviTb9rMbWBbRuWIzutHbenfJfSTgwvLtEw==
X-Received: by 2002:a05:6a20:6999:b0:cd:ed5c:4db with SMTP id
 t25-20020a056a20699900b000cded5c04dbmr13599163pzk.25.1678204447896; 
 Tue, 07 Mar 2023 07:54:07 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 a25-20020aa780d9000000b00580e3917af7sm8067922pfn.117.2023.03.07.07.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:54:07 -0800 (PST)
Message-ID: <d661c4dd-309b-be7c-e60e-a035ae787c14@linaro.org>
Date: Tue, 7 Mar 2023 07:54:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/9] async: update documentation of the memory barriers
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-9-pbonzini@redhat.com>
 <10e49543-b4f8-f22c-a9ab-e6340c6a0074@linaro.org>
 <12ea9d46-1e95-62a1-70f7-d77a66b44bd0@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <12ea9d46-1e95-62a1-70f7-d77a66b44bd0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 3/7/23 02:49, Paolo Bonzini wrote:
> On 3/7/23 00:39, Richard Henderson wrote:
>> On 3/6/23 14:33, Paolo Bonzini wrote:
>>> @@ -107,11 +114,8 @@ static QEMUBH *aio_bh_dequeue(BHList *head, unsigned *flags)
>>>       QSLIST_REMOVE_HEAD(head, next);
>>>       /*
>>> -     * The qatomic_and is paired with aio_bh_enqueue().  The implicit memory
>>> -     * barrier ensures that the callback sees all writes done by the scheduling
>>> -     * thread.  It also ensures that the scheduling thread sees the cleared
>>> -     * flag before bh->cb has run, and thus will call aio_notify again if
>>> -     * necessary.
>>> +     * Synchronizes with qatomic_fetch_or() in aio_bh_enqueue(), ensuring that
>>> +     * the removal finishes before BH_PENDING is reset.
>>>        */
>>>       *flags = qatomic_fetch_and(&bh->flags,
>>
>> Per this new comment, about the remove finishing first, it would seem that we need 
>> smp_mb__before_rmw here, because QSLIST_REMOVE_HEAD is not SEQCST.
> 
> Only release-acquire is needed for consistent access to the list, seqcst and 
> smp_mb__before/after_rmw() are only needed (as expected) to handle wakeup.
> 
> Just to be safe, I tried modeling this with cppmem 
> (http://svr-pes20-cppmem.cl.cam.ac.uk/cppmem/); support for compare-and-swap is very 
> limited, therefore the test looks nothing like the C code(*), but it should be ok:

You do realize that QSLIST_REMOVE_HEAD is not a compare-and-swap, right?

#define QSLIST_REMOVE_HEAD(head, field) do {                             \
         typeof((head)->slh_first) elm = (head)->slh_first;               \
         (head)->slh_first = elm->field.sle_next;                         \
         elm->field.sle_next = NULL;                                      \
} while (/*CONSTCOND*/0)

As I read aio_bh_queue, this is exactly the situation you describe in patch 1 justifying 
the introduction of the new barriers.


r~

