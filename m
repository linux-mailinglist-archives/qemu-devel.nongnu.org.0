Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A481474E71
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 00:08:45 +0100 (CET)
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxGua-0005oc-0d
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 18:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxGrx-0004I3-TV
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 18:06:01 -0500
Received: from [2607:f8b0:4864:20::52b] (port=43610
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxGrw-0006WA-0r
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 18:06:01 -0500
Received: by mail-pg1-x52b.google.com with SMTP id q16so18482070pgq.10
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 15:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x7FoNi4DB0uixUZVAQMbHKIUpSxANJ6tl1BJWHFJP2w=;
 b=MNQzVgWDQDO+adiLK4rGNtBDgRSC9TqWbFdDvPs7677r72k+6Apisq4+9XMARxbFkI
 NtKKEKnlDzugsvyvSc8rhUa64YdK7u71sQ24r2vTZc/RVGnRgVkXb5lIRvr8Ymf1oTZm
 CyEyCLMOEaGbFtTycjhtYa+wlK1dLZnoBnfidh7Qvl9jOWyjD9SjdKCm7qslP89r5nfv
 ojol+ow5hkdIZbDGds2gytTlGwmqSMqlqGZjx5tuploxIpCrBtIFvc3Stj0E0WrY+QDn
 jKDr2tWtu/dqzugu1ikVmPNAg6Z5yIPMRXpYz9e2DXbnv8oVFucF24zep7t4eowfuZfF
 px/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x7FoNi4DB0uixUZVAQMbHKIUpSxANJ6tl1BJWHFJP2w=;
 b=kGB84aZdVHj9iTUhgBfdbOLjiWJZMT6SCJv1EJPB11aDErsuNGl0gvSRqsenl1svZm
 FkWbCWXDJiAHm6LkOHz10phkTAVJ/leCp1NilmXXJFyvO7EwokRgOuaLeISAyR1wEqUY
 GooyBAeXi1vbxEn8H8Sj/pt9hufDRn4SkPVMe48goBZ3CH00D0IL8OrwoShoPZmQ6iPj
 KV/B6ZbJ/LD9CPkk7Jdt6VVx3MQS2Owi8fTyhcSctsDT5+kc1dXIuCxDyEQI8RXv+fze
 HYnD/Pro6vVqd17mwD5cRnhmPVJeO27cx+lfSs3ugp8ZpKpFeVtirgUfZCFrh+o+lJ+W
 UOwg==
X-Gm-Message-State: AOAM532gPaYLIY99OeYLu8pYhh0tcngng8l6PpUMSxXE34VRVbfYoYkY
 JEatP4CyNGUKwR4Bb2b9J73YCA==
X-Google-Smtp-Source: ABdhPJwiDV8L/tRrJB+36B+Im3O4IEXjQxKIRNtogwK2acTOkoy6DwhIYDqsz7sd+H4BD0wtK3Uajg==
X-Received: by 2002:a05:6a00:b49:b0:49f:cc01:10ff with SMTP id
 p9-20020a056a000b4900b0049fcc0110ffmr6460403pfo.42.1639523158393; 
 Tue, 14 Dec 2021 15:05:58 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id om5sm53931pjb.5.2021.12.14.15.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 15:05:57 -0800 (PST)
Subject: Re: [PATCH v7 04/15] linux-user/host/sparc64: Add safe-syscall.inc.S
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-5-richard.henderson@linaro.org>
 <affabe18-4ef4-90ee-a2d3-2ad970d076cc@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef036613-424a-8a78-787a-8abc4d2020a3@linaro.org>
Date: Tue, 14 Dec 2021 15:05:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <affabe18-4ef4-90ee-a2d3-2ad970d076cc@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 7:30 AM, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 12/14/21 01:25, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/host/sparc64/hostdep.h          |  3 +
>>   linux-user/host/sparc64/safe-syscall.inc.S | 89 ++++++++++++++++++++++
>>   2 files changed, 92 insertions(+)
>>   create mode 100644 linux-user/host/sparc64/safe-syscall.inc.S
> 
>> diff --git a/linux-user/host/sparc64/safe-syscall.inc.S b/linux-user/host/sparc64/safe-syscall.inc.S
>> new file mode 100644
>> index 0000000000..bb35c64cfc
>> --- /dev/null
>> +++ b/linux-user/host/sparc64/safe-syscall.inc.S
>> @@ -0,0 +1,89 @@
>> +/*
>> + * safe-syscall.inc.S : host-specific assembly fragment
>> + * to handle signals occurring at the same time as system calls.
>> + * This is intended to be included by linux-user/safe-syscall.S
>> + *
>> + * Written by Richard Henderson <richard.henderson@linaro.org>
>> + * Copyright (C) 2021 Red Hat, Inc.
> 
> Are you sure this is the correct (c)?

Hah.  What a cut-n-paste.


r~

