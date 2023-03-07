Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4F76AE9BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:27:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZb5a-0006d4-GC; Tue, 07 Mar 2023 12:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZb5X-0006co-AO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:26:59 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZb5V-0000vB-I1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:26:59 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x34so13989012pjj.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678210013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r5HL/zDEupCfD04npaTSt3t+eFUwSjlN8sdppzQ0iw4=;
 b=axXRp+Ghj9RS9o263XGB+OGcX16Aq9qqcfEaTVOCoVq4iV1RIeAkuIqZlN3c7pq9SA
 kg4cGRRTZ2r8kG6x7tIa0RWfJI2eeimTHEMIs2l4lJpjNR3kWc5TxImhCb83uS59i3Ht
 aeZpvd9tle0skNXiUadnpw+UeoTZVgqlFewHvgauQYKOgDd0IOFN5RaASJDeYHw4tWh8
 kDSFO5gYAGr1DIHNWOzCDW0s/EKRuixYo85asqNs4JaAN0MRqfZL8EwUKF3zyidBOl9y
 WtCsm4Vaw+OsRuhVowkoIK2l0YDEHqAQONeBI2qiaa7tkPe374Ae8qznMHwJlkKYQRtP
 zMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678210013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5HL/zDEupCfD04npaTSt3t+eFUwSjlN8sdppzQ0iw4=;
 b=uFbRlng2eWH4K5IE9GTtJumFGMFyN9W22En/n5eNb2HZUZaT1QcYsRzIYKGiIGAYVG
 SS+qOqJztCs88NFmZMaU9rPfhletUpD76dgUyQC7tmfsA2fAA4/muQuhT/8XtEL3+dx6
 8agHTnKQA6lYFs8yHArO75/BBiQicQ8Nse6SGyl6/tq9QHkRhHW4GmH7De3xX6rqkdbe
 1l9hQeDWEd9RpZMXFFZkCFmoxtjfAEHgFkx0KuN5B4N97QCXH3YdD3kuSiwB4INBmAzC
 sQxPoE16PICdDg3rvdLg0SnMq7ukWgznbCRNOjLSV+WtTTYtgFD37NJC042SpI2mH0xC
 X0Og==
X-Gm-Message-State: AO0yUKVI5lr1sKyWotYkmW2yFMFRkhsIljllgwgeb6pl6eFVjsZJ2p/d
 aIYfBBTVE56Zq3Y5iPh2n5zGWg==
X-Google-Smtp-Source: AK7set8gMXNA3WALHnYHUX/rAxQ4XzFGzLvpvuM6q6f10AqkzOLrn8QHZUA1X5vH74U918WJBd9OtQ==
X-Received: by 2002:a05:6a20:4303:b0:cc:692d:92de with SMTP id
 h3-20020a056a20430300b000cc692d92demr17608966pzk.44.1678210013305; 
 Tue, 07 Mar 2023 09:26:53 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a634858000000b00502fdc789c5sm932249pgk.27.2023.03.07.09.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:26:52 -0800 (PST)
Message-ID: <aa14b8ad-8756-082b-3694-3c6177f6d46d@linaro.org>
Date: Tue, 7 Mar 2023 09:26:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/9] async: update documentation of the memory barriers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-9-pbonzini@redhat.com>
 <10e49543-b4f8-f22c-a9ab-e6340c6a0074@linaro.org>
 <12ea9d46-1e95-62a1-70f7-d77a66b44bd0@redhat.com>
 <d661c4dd-309b-be7c-e60e-a035ae787c14@linaro.org>
 <d33a6fda-5b38-c136-9ec0-3c07b2031cd4@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d33a6fda-5b38-c136-9ec0-3c07b2031cd4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 3/7/23 09:00, Paolo Bonzini wrote:
> while QSLIST_REMOVE_HEAD in the dequeuing thread is not ordered at all:
> 
>          y.store(0, mo_relaxed);           // QSLIST_REMOVE_HEAD
>          x.store(0, mo_release);           // fetch_and
> 
>> As I read aio_bh_queue, this is exactly the situation you describe in patch 1 justifying 
>> the introduction of the new barriers.
> 
> Only store-store reordering is required between QSLIST_REMOVE_HEAD and atomic_fetch_and(); 
> and that one *is* blocked by atomic_fetch_and(), since mo_seq_cst is a superset of both 
> mo_release.  The new barriers are needed for store-load reordering.

In patch 1 you say:

# in C11, sequentially consistent atomics (except for seq-cst fences)
# only affect the ordering of sequentially consistent operations.

and the store in QSLIST_REMOVE_HEAD is not a sequentially consistent operation.
Therefore by your own logic we must have a separate barrier here.

I think this is mostly a compiler-theoretic problem, because hardware will see barriers 
that affect all memory operations, not just seq-cst.  Only compilers can be so literal as 
to decide to reschedule the two because they have different source-level model.

I wonder if your definition/description of smp_mb__before_rmw() isn't actively misleading 
in this case.

- We could drop it entirely and be less confusing, by not having to explain it.
- We could define it as  signal_barrier() for all hosts, simply to fix the
   compiler-theoretic reordering problem.


Thoughts?


r~

