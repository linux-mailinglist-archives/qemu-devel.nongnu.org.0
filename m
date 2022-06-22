Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47F554EB0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 17:08:11 +0200 (CEST)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41xi-00052S-F4
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 11:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o41uw-00043A-B6
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:05:18 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o41uu-00038k-Pb
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:05:18 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 68so10910524pgb.10
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 08:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VbXWPXtSqYniO/KkPa0pjcqsfjrgY2Qzrj3A8+GB4Qg=;
 b=q++VRDuQP7zf8VahoPxxdt3DGA/QK2g+h+XmqQ8YTrcMEiWktT2oIdHixWL+EQFkXs
 Y+5sTSyi3CgVCeDo6nkmMruRMHPrmJ7pycgHtwZQ1UEE2ANof0TMhQ9ruDt3AgfXvec4
 0RtaBoVPRb4Fzm419pw+hb/Naiw/Vw/ygbAxzcVGi0bbhw/zCJC6oy0npgAb6EBc5upJ
 gMjY/3ABAElQIbFSw3p8Fv7n40+uHqofDR+np6Nc59zlUYyRoiLNYSDBRU703NuURKT2
 1gy2b4F+VMSYaWwToPp8ORfWTaRM71+mVIrDywjDt9Gs6K3DiyADBvwe/9bNQfwVqgE6
 fWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VbXWPXtSqYniO/KkPa0pjcqsfjrgY2Qzrj3A8+GB4Qg=;
 b=ZWsEgC9B7/+1e6B/rLiKPKcj/A457ZjsZ2JkSYWMDFpj26RndRxtDHgOxflWsDqE3L
 cNjLOSyJ/D2R4/tpd9oRTDAJ/fl9bLct3slQcm63Zx5EjZnlrDWdFpat2h2RJRaKL0bO
 h1ZJIzH2qmkhyvajCo7ToxxI1AD3sXphFZPM49ZvRkIn64KXBv2b62gEEhB1C5kima8V
 DPn8TUsjR8PKPjsWj97isbUDOV3EfOBLXm4DW98JjTTalxa3NDqPAC0nGRwMiBbZGYN7
 cg4LGAgnPfsQPp0WT5mXdJgEDvJnvSsrYwpoEaK7WjyPFOZZYmUkogQukb5G9tsMPYVu
 zEug==
X-Gm-Message-State: AJIora+q6yyT5EWIMbbNhzJO9RT/oWXvypk+zCCL1DK9ZYcChPlXd6Sw
 n+9e5g9n0ktR9mFvBC/Yby/lt8bsTA7HYQ==
X-Google-Smtp-Source: AGRyM1sEAbG6gQPdblxLHNyBq22txpWvFcwv62Cew9VhDHwkpjnkA8Mo5qwpo9tEb7R2eGXZRZZLBA==
X-Received: by 2002:a63:6f8c:0:b0:408:bdc6:7726 with SMTP id
 k134-20020a636f8c000000b00408bdc67726mr3407338pgc.110.1655910314776; 
 Wed, 22 Jun 2022 08:05:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:4bf9:2153:b33e:91d?
 ([2602:ae:1543:f001:4bf9:2153:b33e:91d])
 by smtp.gmail.com with ESMTPSA id
 ay1-20020a056a00300100b005252433bdbdsm6747009pfb.95.2022.06.22.08.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 08:05:14 -0700 (PDT)
Message-ID: <b94b96f6-5109-f518-9fa8-1a52f99ae6bf@linaro.org>
Date: Wed, 22 Jun 2022 08:05:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 27/53] semihosting: Split out semihost_sys_open
Content-Language: en-US
To: Luc Michel <lmichel@kalray.eu>
Cc: qemu-devel@nongnu.org
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-28-richard.henderson@linaro.org>
 <20220622093509.GE28991@ws2101.lin.mbt.kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220622093509.GE28991@ws2101.lin.mbt.kalray.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/22 02:35, Luc Michel wrote:
> On 13:45 Tue 07 Jun     , Richard Henderson wrote:
>> Split out the non-ARM specific portions of SYS_OPEN to a
>> reusable function.  This handles gdb and host file i/o.
>>
>> Add helpers to validate the length of the filename string.
>> Prepare for usage by other semihosting by allowing the
>> filename length parameter to be 0, and calling strlen.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/semihosting/syscalls.h |  25 ++++++
>>   semihosting/arm-compat-semi.c  |  52 ++---------
>>   semihosting/guestfd.c          |   5 ++
>>   semihosting/syscalls.c         | 156 +++++++++++++++++++++++++++++++++
>>   semihosting/meson.build        |   1 +
>>   5 files changed, 193 insertions(+), 46 deletions(-)
>>   create mode 100644 include/semihosting/syscalls.h
>>   create mode 100644 semihosting/syscalls.c
>>
> 
> [...]
> 
>>           } else {
>> -            hostfd = open(s, open_modeflags[arg1], 0644);
>> -            if (hostfd < 0) {
>> -                ret = -1;
>> -                err = errno;
>> -            } else {
>> -                ret = alloc_guestfd();
>> -                associate_guestfd(ret, hostfd);
>> -            }
>> +            semihost_sys_open(cs, common_semi_cb, arg0, arg2 + 1,
>> +                              gdb_open_modeflags[arg1], 0644);
> 
> You're missing a unlock_user(s, arg0, 0); here

Good catch.  Fixed.


r~

