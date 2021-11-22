Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301224591AD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:52:14 +0100 (CET)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpBc5-0002UA-5H
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpBae-0001jQ-MJ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:50:44 -0500
Received: from [2a00:1450:4864:20::42c] (port=37762
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpBac-0007iw-9y
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:50:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b12so33549917wrh.4
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fWvPmdqBh9xucPvdUH22UlRpOYYHU1lC3eXjWDYnP6U=;
 b=o7RdvfkJp1zgdRhwKWf7oCDMgNozyKuBCp+fct8d0nGHQZEfRS8Ba+qTRhNgnPpP/3
 Qq6RCNubJJeD9axIC1NTb2A6JmxG4odB/osqtCmKnDBUXRT7HoB+ZBHLOl3omX5XzQUY
 d9vbBvGhjiINuriujyKH9F8mupUhDkuAug/7ELffAsKVo1YQmfIIZoRSUn7xcWuL7ITc
 3iggYOIynjtBG8uAoLO1FtGe3f3VehnLz5pdZkqNijtk+FHBUPQ7WuIyoYNExtZekT0N
 PUD/fE2VYcnlFoG6QLCsmu5FE1GY6kUeQTXjh17ULtorE/FOyFp8XyJJ+1wzP/9FCkK9
 2bUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fWvPmdqBh9xucPvdUH22UlRpOYYHU1lC3eXjWDYnP6U=;
 b=js/Jvk8jy5kI/d5+lvYL3OCdcB1xRRz1Z8GuOreUbD5nPc3lpd3p4INS5QS56Rd7Rv
 JpuyYG7gdDHU/YJkuZ5hYv4EAuAhkgvkPZjrmYku6Rml/Az4mtN/SjLh4r/ZHul+RT28
 MZabSnlz9dLIYjdM+n8uu7Thh58tygKvvoTfHF7VrWyb6F1g3btyqZ3O4VqVPPxjm0+5
 3nQmLDQlo2roXnZZEqoHpCpxDJeWxq2V6i7GebAuO3IAhhd6jbAE7GnibxuSDg1QEVjE
 PYA5WkOXABx754DOEkMrzeSZdrMMngP6+J359/CzIqpQC2wzvUDLHOhan2H8FpD593io
 NZOA==
X-Gm-Message-State: AOAM533mAeFhyB/80pKLWkgMJ6J4RyElPac9I8DZKWHz8fgRwc5dw6yv
 fRlsQguLjImGWsdT4gYSs7GFzZyQggu7FvDTMJQ=
X-Google-Smtp-Source: ABdhPJzX4b8xRjWxKTwCRoKCdQfswJbiUaQnxqjYELdmn3jddCAkT1URvwVqBY9mctp50xh+RixYmg==
X-Received: by 2002:a5d:6d0b:: with SMTP id e11mr39291142wrq.16.1637596240503; 
 Mon, 22 Nov 2021 07:50:40 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id g5sm13539991wri.45.2021.11.22.07.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 07:50:39 -0800 (PST)
Subject: Re: [PATCH for-6.2 0/2] linux-user: Create a common
 rewind_if_in_safe_syscall
To: Laurent Vivier <laurent@vivier.eu>
References: <20211122131200.229286-1-richard.henderson@linaro.org>
 <38b341b4-1aae-91b5-9f4c-aa451a6f4157@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <336a43f3-2d24-8848-16b5-a241d995d492@linaro.org>
Date: Mon, 22 Nov 2021 16:50:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <38b341b4-1aae-91b5-9f4c-aa451a6f4157@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: raj.khem@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 4:43 PM, Laurent Vivier wrote:
> Hi,
> 
> Le 22/11/2021 à 14:11, Richard Henderson a écrit :
>> This is a re-packaging of two of Warner's patches that
>> fix a build issue on aarch64 using musl:
>>
>> https://lore.kernel.org/qemu-devel/20211108194230.1836262-1-raj.khem@gmail.com/
>>
>>
>> r~
>>
>>
>> Warner Losh (2):
>>    linux-user: Add host_signal_set_pc to set pc in mcontext
>>    linux-user/signal.c: Create a common rewind_if_in_safe_syscall
>>
>>   linux-user/host/aarch64/host-signal.h |  5 +++++
>>   linux-user/host/aarch64/hostdep.h     | 20 --------------------
>>   linux-user/host/alpha/host-signal.h   |  5 +++++
>>   linux-user/host/arm/host-signal.h     |  5 +++++
>>   linux-user/host/arm/hostdep.h         | 20 --------------------
>>   linux-user/host/i386/host-signal.h    |  5 +++++
>>   linux-user/host/i386/hostdep.h        | 20 --------------------
>>   linux-user/host/mips/host-signal.h    |  5 +++++
>>   linux-user/host/ppc/host-signal.h     |  5 +++++
>>   linux-user/host/ppc64/hostdep.h       | 20 --------------------
>>   linux-user/host/riscv/host-signal.h   |  5 +++++
>>   linux-user/host/riscv/hostdep.h       | 20 --------------------
>>   linux-user/host/s390/host-signal.h    |  5 +++++
>>   linux-user/host/s390x/hostdep.h       | 20 --------------------
>>   linux-user/host/sparc/host-signal.h   |  9 +++++++++
>>   linux-user/host/x86_64/host-signal.h  |  5 +++++
>>   linux-user/host/x86_64/hostdep.h      | 20 --------------------
>>   linux-user/safe-syscall.h             |  3 +++
>>   linux-user/signal.c                   | 15 ++++++++++++---
>>   19 files changed, 69 insertions(+), 143 deletions(-)
>>
> 
> Richard, will you take this series via one of your branches or do you want I send a 
> linux-user pull request for it?

I have nothing pending myself, but I can send this if you'd like.  I mostly wanted your 
ack on it.

r~

