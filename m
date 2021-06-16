Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2283A9E10
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:49:43 +0200 (CEST)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWrO-0001ah-Cw
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltWqJ-0008E1-Mb
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:48:36 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltWqH-0000AU-F3
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:48:35 -0400
Received: by mail-pl1-x62a.google.com with SMTP id v13so1224403ple.9
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=32pqaTxgg3BxWMsnSFEhRoTzSscOmx7UfD5g4dKam6E=;
 b=Rb+rM1Bc+pqmuSN6Vd3bxb+Ydei9PHA6VYRmSM8ctkd8Oeq/dki+Ro/gcFjzsKT3Ty
 1P3zu8gCAVRrA/AmnClcK5Ufnc9kab/xuOmTjldfYaZFby2m30bij2T82vyjBrUKJQG4
 4fCgPIkHOdddaPuPcocqkhDY1GmY2EbAjBs4djEQ0xy+x1pTpTATD6nMaDhAvphqCa1m
 mNqUso9WOuqzlZypoUQzwonpqsdXKb0tB6TZKtjtfIKqwRziCc1aBQiC3kCnwUFs7L2p
 Xona8YkcQK4tKIKk1CP7o+bG1gGXtcF2kvh/l8bG2Wg8UyX36DvmQ3LCMCNc8C2frBVD
 PyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32pqaTxgg3BxWMsnSFEhRoTzSscOmx7UfD5g4dKam6E=;
 b=dGuFeEvfhm+ZbYiho1g0bLQtzmcshhJP5IZdL8AQvaykzBTOnRUcY48mwTA7NKh2l0
 Df/6Vf5YqrPEAHSnEaupio9QCI5g4mklQqa4wCsQp/CbfthkO30rnBYr79H/dQDfl1bs
 9F9a2n7VQwfN+nH739gh8SU73Haw0eiI+JsD/ageAx12CSzbNfVCDtb5GSmZ4W7r+iAu
 6ftgy70BNB/hnWmbcSyvxSwl0IMrKL5FD53sljjx62LtxukC9jZB91p3atJlAoq2EGxi
 9X6JmpczcNOrY8a4/X9YaU8JRkKlDxGf6lZVcYXGJrn8hYuvVA9Bshq6+eSmJkK7+e2s
 71aw==
X-Gm-Message-State: AOAM532m3aYyXksCaTgtifu2FcYfPkr2bZJgtI3SkddBvIBBZp2hBCtN
 8pdGM2UkiUo2rpGoojAPhYLP3g==
X-Google-Smtp-Source: ABdhPJzXDayqVHrdy2IIjqpdsDbhBXa3Wl/abZe/U4J9hEVS28DAKJRQC/4rHqvZRaiwNH8mmvsNHg==
X-Received: by 2002:a17:902:d4c8:b029:102:715b:e3a5 with SMTP id
 o8-20020a170902d4c8b0290102715be3a5mr9255434plg.83.1623854910983; 
 Wed, 16 Jun 2021 07:48:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k30sm2683783pgf.59.2021.06.16.07.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:48:30 -0700 (PDT)
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
To: Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <87sg1jiiku.fsf@linaro.org> <87lf7aw0un.fsf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdb3b491-600b-5f1f-52a4-20ca41d5f918@linaro.org>
Date: Wed, 16 Jun 2021 07:48:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87lf7aw0un.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, qemu-s390x@nongnu.org,
 jonathan.albrecht@linux.vnet.ibm.com, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 3:38 AM, Cornelia Huck wrote:
> On Tue, Jun 15 2021, Alex Bennée <alex.bennee@linaro.org> wrote:
> 
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> The PSW_MASK_CC component of psw.mask was not handled properly
>>> in the creation or restoration of signal frames.
>>
>> Still seeing issues running on s390x machine:
> 
> (...)
> 
>> However running on x86 backend everything seems to be fine.
> 
> (...)
> 
> So, in summary, this improves things, although there are some remaining
> problems?
> 
> Asking because I'm looking to queue this.

Alex is seeing something that I believe is unrelated.
And also, I have a patch set out for that as well.  :-)

r~

