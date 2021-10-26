Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032343B5F4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:44:43 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOd0-0007hk-7f
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfOQz-0002sk-F5
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:32:18 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfOQx-0000KG-K0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:32:17 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q187so14525688pgq.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q213Kifig3UTVdE+XD+Ul+2suBIkrM7GJzTHFuzu+is=;
 b=EI0G3t8V0Kde5OIuxbjVEFohpVyUz354mHAPmgXI+jkh9O/Kr76IR8g+mV4ADKkYWN
 ExcMQf4tZKg8zFgBt0kKioqMai/CO23F9Toyzy3Vg56bsUS5WmkvBrcZSARSq6gaxkO6
 d14EKEydDbjp4HL1m/WQEaLxkqvPMVD/g+/YwghckjFbCH58fCmsOfuPeLXGUHyAElDc
 6BXUF2l1pceaxD1to0TI1Nb3BXU4v7Pbg4ZEhbFXqPfXNhlz4t29VsSKJJXI7niUjqdv
 o5H9g7Q4YYdsgmUK0wfXtLa6+uu3ucZOm9YVt4iro69Sdy/4qzjDH0USJRybpY2vyoYe
 KQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q213Kifig3UTVdE+XD+Ul+2suBIkrM7GJzTHFuzu+is=;
 b=MzlWznF3vcqen6CbDcfzj1zuMh2NZpTLOFXyrGzSVQGDjkA3fdhjKqN8OfjURkI0o2
 8EU4iOPDSejzjz5DOJgzxGQ+VhPPGXnjf4YWVjNmAh2C3dGug7uRNIpYfmUmdr9JdVWP
 VwBoxElYknDmRuw/nmyoRL0rLHriurhW5yu7768TMooxslJDH0toi6AAGUOK0BKjNKaa
 Jgs+fZlUiFHjcqSXcxGZZa5sawgspAJRKmgG+8WnldzWx4YVmfjfhsLelCCN7+M8dl0m
 I6EU/4s/sTrk7/u4NSUuDHbM1ufOjV68bo49+UolSed9N/fB9S615tuj6eKW+ZDLnBFP
 YBHw==
X-Gm-Message-State: AOAM530iYchJ7GPyr4UqAAAVobuVQfKSebk8hZQ2nKzwkIW13aCGZOAb
 gVq2Ikeqjqp9ayiQHISIUJnbLA==
X-Google-Smtp-Source: ABdhPJy78qYCC2LMl+DlDGn8+MXZ2Cs2P5VBHJxz0SZFhDNoVekQLXMRCWGr7eWw3zuD8RJQGqOAUg==
X-Received: by 2002:a63:2cd8:: with SMTP id
 s207mr19529726pgs.312.1635262333810; 
 Tue, 26 Oct 2021 08:32:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k22sm23114519pfi.149.2021.10.26.08.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:32:13 -0700 (PDT)
Subject: Re: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
 <20211025140716.166971-2-stefanha@redhat.com>
 <fea06711-f4dd-9932-5b2d-06a408c7adf6@linaro.org>
 <YXgC2N+sc76WNhLE@stefanha-x1.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fbb0c0b9-ba15-c714-553a-9059fefcd854@linaro.org>
Date: Tue, 26 Oct 2021 08:32:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXgC2N+sc76WNhLE@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 6:30 AM, Stefan Hajnoczi wrote:
> On Mon, Oct 25, 2021 at 10:19:04AM -0700, Richard Henderson wrote:
>> On 10/25/21 7:07 AM, Stefan Hajnoczi wrote:
>>> Compiler optimizations can cache TLS values across coroutine yield
>>> points, resulting in stale values from the previous thread when a
>>> coroutine is re-entered by a new thread.
>> ...
>>>    include/qemu/tls.h | 142 +++++++++++++++++++++++++++++++++++++++++++++
>>
>> Better as qemu/coroutine-tls.h, since it is needed for no other purpose.
>>
>>> +#define QEMU_DEFINE_TLS(type, var) \
>>> +    __thread type qemu_tls_##var; \
>>> +    type get_##var(void) { return qemu_tls_##var; } \
>>> +    void set_##var(type v) { qemu_tls_##var = v; }
>>
>> You might as well make the variable static, since it may only be referenced
>> by these two functions.
> 
> Oops, that's a bug. It should be declared extern. QEMU_DEFINE_TLS() is
> meant for use in header files.

No, QEMU_DECLARE_TLS was for use in header files, and it of course does not globally 
declare the tls variable at all.  Only the definition here requires the tls variable.


> Nice. That makes me wonder if it's possible to write a portable version:
> 
>    static inline TYPE get_##VAR(void) \
>    { volatile TYPE *p = &co_tls_##VAR; return *p; }
> 
> But the trouble is we need &co_tls_##VAR to be "volatile" and I don't
> think there is a way to express that?

No, there's not.

Anyway, with those four hosts we get coverage of almost all users.  I'll note that both 
arm32 and s390x use the constant pool in computing these tls addresses, so they'll need to 
keep using your functional version.  So we'll still have testing of that path as well.


r~

