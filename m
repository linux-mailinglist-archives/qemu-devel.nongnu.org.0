Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EEA6A0E1E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEcN-0004we-KM; Thu, 23 Feb 2023 11:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEcL-0004wB-Dw
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:38:49 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEcI-00015S-7S
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:38:49 -0500
Received: by mail-pg1-x52f.google.com with SMTP id p6so5954188pga.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NY9G8rxE6IQUjO489qCLtpUNI2Ga7PjqJ7IJfhnTtjg=;
 b=geq/A24Md7YZxO0gXYpg8pDU0eBKvvcb3rT4dHgNQm6zc2iJPnwPVjZT1UVvw9lix8
 ghVQKEKVYaLNRWVBKFoVJNYaRyTHKYjS03lRHRYkZ4wSOz+Tg8HK7qslelLYOlA5mb0f
 6B7Q3ZG62LlYBLmJ46h5NmTU08JoWStdbTASxWCaRWkF4nZbhZPpz2NtS2JEYO1VY/uU
 sk1nkemsM4GM69gDmgPUGgVhRyWcNMGFls5ZCb6gClGwIHiVh684VnkXQlvS/qvTzsqD
 WVY//0J1Q8LeHl3WGRrGG5j0NTfhDt2O18XCTtpamhR2r6Pv4DZi9+/DIyvEaUIGNkXm
 lulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NY9G8rxE6IQUjO489qCLtpUNI2Ga7PjqJ7IJfhnTtjg=;
 b=ftGE2i7HdsknQe78v0i/l2lHFDalG90zkpq12Q4ookjx7E+neRDL6n0n3TadHFiWrT
 FZ+LqQSgWgrmGCXTmTb6CNy+t/giTxuccyoRDKhVJ/vecZZZ02HMjGZZWOKk2+JlbEoS
 9rX8lJ+01PaIvq98so0n6jILHphba3YKidhmMdBXSJlB7dXoqxu4ZMQSGEwm/7SrGD4L
 6eeyXVUUGZ4U+nQY771ORjaGyfwmg5GHxW7/JLiSHlfj6EosThQKPobsJTCcKzKqkplN
 s3iSYsmVjfjP5/BQFJPF+SIQ0OJW/Jzl0qQwtNF5UuYUJRZQB6FkiBe0ZTd+tuaitEiB
 XRlA==
X-Gm-Message-State: AO0yUKWhfuIKsTbliCWloF0GP7gbxcDtOGnRwJfR4+/ELiEMHaoLj9qp
 m209S8faSU34qwTP3VF8wbjFyqpRxC+eT9QDxT8=
X-Google-Smtp-Source: AK7set9XcZMfCbFJ4jff+v0nLi4XLEne5G2ncNY4W+6k9BPDhg4cx6D1f5pZ9PIu0FkK/eewaaUUqw==
X-Received: by 2002:aa7:9e87:0:b0:5cb:ee71:5069 with SMTP id
 p7-20020aa79e87000000b005cbee715069mr10517376pfq.16.1677170323183; 
 Thu, 23 Feb 2023 08:38:43 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e21-20020a62aa15000000b005a8b4dcd21asm5341229pff.15.2023.02.23.08.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 08:38:42 -0800 (PST)
Message-ID: <6496736b-2518-e715-3555-6db017df6d15@linaro.org>
Date: Thu, 23 Feb 2023 06:38:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 14/19] target/arm: Check alignment in helper_mte_check
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-15-richard.henderson@linaro.org>
 <CAFEAcA_N1zcgg44v7AmKgHJiuE=Od0cCV8q1OW1YS9_hJFAYhw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_N1zcgg44v7AmKgHJiuE=Od0cCV8q1OW1YS9_hJFAYhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/23/23 06:28, Peter Maydell wrote:
> Also described in the text: the I_ZFGJP priority table lists
> MTE faults at priority 33, basically lower than anything else
> except an external abort.
> 
> Looking at the code, is this really the only case here where
> we were mis-prioritizing tag check faults? Have we already
> checked things like "no page table entry" and all the other
> cases that can cause data aborts at this point?

Well, yes, we do the page table lookup in allocation_tag_mem(), while fetching the tag 
memory against which the check is performed.

If there's another mis-prioritization, I don't know about it.


r~


