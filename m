Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D9458E36
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:23:47 +0100 (CET)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8ML-0005MK-Jd
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:23:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp8Jv-0003yk-Kv
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:21:15 -0500
Received: from [2a00:1450:4864:20::435] (port=36851
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp8Js-000622-5R
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:21:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id s13so32382126wrb.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e5kOScGmMwHGJdUVGqMAZ+Dp7+85ewPH5nQw6JJXU70=;
 b=EVLU2u88CwLWmCd4RBa8H245mneo3MlWFl6o6DxkFBR5J6trAY7S7RIuLQxwFfxW8F
 1IGbpmd9Gski/ooHjnX+PPqTxp7TAuvU1vAI4V4tmPTP8mL98yFMk1GemlpHSLkoyRsp
 pELZUkVXxAQGRjvO7I91EeKgmgSqp4Ucz978MK8Ek5S2Q9Bypn0m5rpKweelqCnKNzBT
 HL+Kwm6csgVbboJGXApBjhD3kigv7VIB4HpmjWuL3sB42mVMJSciqdA8/O08pvKBg5xj
 PCi6/T9BLQStfSNHvYi8s875IMCmZZnoHOq/lFGXk4rSfnnvbH2fumY3gmGGppP8wcD3
 qAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e5kOScGmMwHGJdUVGqMAZ+Dp7+85ewPH5nQw6JJXU70=;
 b=E5u4vImmjikSV4o01BuTiRWWC9bG/bT3yohc1jcfGrU1nxM3/2i4pSFvpd6pTM/Rlg
 9GQt2irnJLJ9OERworahitkEq1iAaJuzVNzIp2lXFTCOcKas4WUacuSGJ7miQ9JPHWj/
 xGM84Qrdi6OnRc0McAX4cjVeaffHkaOBJInoDO6m/ptKreO6r1ppGHyp9Dnl5VzOpoET
 Pb6AIDlSMep4QOzp5pgVzgnVnyw4jZdZlhCGdE7iOzN3T9A11NF9DUpvuqssSPnljbtJ
 GMbfNjj2QEhub4ABJMXWV7niIi/PdvxLhRzWmi8SU5QTq00nhQsBEFJMjcDVbTXjUTNp
 w0Vg==
X-Gm-Message-State: AOAM531bligVU4htrxavtLfmkzvU+3E77TTbktTitw+Ay+IDFicwvOhw
 AWzNl2UweCDn6g9I5NYbDiOHgFfGcP8IvY1k0oM=
X-Google-Smtp-Source: ABdhPJz+ZWxEEQzEWn57TNFErsE4c59uQgmi++dj9x3RbGxHkCDBf4IjMt0EnbqvyeZELxwLdmXTNw==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr38364635wri.8.1637583670576; 
 Mon, 22 Nov 2021 04:21:10 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id p14sm20358338wms.29.2021.11.22.04.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:21:10 -0800 (PST)
Subject: Re: [PATCH v5 04/17] common-user: Move syscall error detection into
 safe_syscall_base
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-5-richard.henderson@linaro.org>
 <CAFEAcA-cCdFSHVg6hKARipde9yLw=owNm3EZTfwbE5Bo8M0sFA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70c52554-ca05-5035-98a0-0bc9f340244a@linaro.org>
Date: Mon, 22 Nov 2021 13:21:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-cCdFSHVg6hKARipde9yLw=owNm3EZTfwbE5Bo8M0sFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 12:55 PM, Peter Maydell wrote:
>> -       /* This is the entry point for making a system call. The calling
>> +       /*
>> +        * This is the entry point for making a system call. The calling
>>           * convention here is that of a C varargs function with the
>>           * first argument an 'int *' to the signal_pending flag, the
>>           * second one the system call number (as a 'long'), and all further
>>           * arguments being syscall arguments (also 'long').
> 
> This comment text needs updating to mention the new errnop argument.
> (Applies to all the similar comments in the files for the other archs.)

Yep.

>> +       /*
>> +         * The syscall calling convention isn't the same as the C one:
> 
> Looks like the indent here is wrong ?

Irritatingly, these files are a mix of tabs/spaces.

>>           * we enter with x0 == *signal_pending
>> -        *               x1 == syscall number
>> -        *               x2 ... x7, (stack) == syscall arguments
>> +        *               x1 == errno
> 
> "int* address of errno"

Arg, fixed some of these, but clearly. not all.

>>          /* code path for having successfully executed the syscall */
>> +       cmn     x0, #4095
>> +       b.cs    1f
> 
> Shouldn't this be going to label 0f ? We need to do the 'neg',
> and unless I'm misreading the diff there's currently no path
> of execution that gets to that.

Oops, rebase error, where the fix landed in the next patch.

>> +        *               r2 == syscall number
>> +        *               r3, [sp+0] ... [sp+16] == syscall arguments
>>           *               and return the result in r0
> 
> Don't we wind up with a potential issue here with 64-bit arguments
> due to the calling convention wanting to put those in aligned
> memory/register locations? Previously because we had just two
> extra arguments the arguments started at r2 and had the same
> alignment behaviour as the syscall wants for them starting at
> r0; but now we start at r3 so if for instance the first argument
> is 64-bit it will be in [sp+0][sp+4] but should go in r0:r1
> I think...
> 
> (Stopped reviewing here because if we need to change the
> way we call these functions there's no point my reviewing
> the fine detail of the asm.)

Oof.  I missed that detail.  Yes, that is a problem (I think arm is the only such 
supported host).  I think the best solution would be to *not* pass in &errno, but to have 
the assembly tail-call to

long safe_syscall_errno_tail(int value)
{
     errno = value;
     return -1;
}

Which is probably more efficient in any case.  I'll re-work this.


r~

