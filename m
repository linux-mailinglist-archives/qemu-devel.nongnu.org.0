Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CEB60C33C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 07:28:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onCR1-00036v-K6; Tue, 25 Oct 2022 01:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onCQz-00036S-Jn
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:25:05 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onCQu-0000H2-UF
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 01:25:05 -0400
Received: by mail-pg1-x531.google.com with SMTP id q71so10540904pgq.8
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 22:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oqBmqReHGfEzGqIGVt1nPXsS0CDpG6ycZ7J51Eb6H4M=;
 b=OO7CJCSLwjaXehqGS3jdZBGB4OJ2VDi9QqLQpOPIs/bGCqTU5RnAa8VgNBmpCKIUDT
 ITEhpWLFDRNtqCSDZ5tskEQB/yVFyUhZNJP9NlrUmeuhpmRazIKiMu2CLqrjhyO4DHXG
 I8eOTeyq2xTPj32mFpEsGOihGJ82jXUPsVa4+bWACg5OKuvQ5i8+SrwdOH7ZpEuGgeuk
 eSt+diVmmaX+WkDdpF2nsOLFvzPCM6vN70uZrJ6wcFxB6t/1OT4QKHt186IROvem4nTD
 GvalRSm+GKsr6gt1PLAItOaOWX6RmNv1SrtvBZNqU0jQbWBc5zd1bN5qWv+/lVLwxwNt
 Ge0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqBmqReHGfEzGqIGVt1nPXsS0CDpG6ycZ7J51Eb6H4M=;
 b=EDwq8oQI8tlWZhN02YfGD45LcT7nqPgmM+qWGQ1EdYkJDLTBKWXZ7z3hI6OXaRQTfN
 lpYXHA5qhTQSKnZJqinY8Y1lWDdIkxmrKzEQU/Q1xo8ZNhfD/A9uFDlNjj01oB5q0uS9
 eAzHTe8LOwVtL1JDEYaWtxAL1gSVsQcimssqqff1tSQNfKtgejN1dLTp2D7EGckqDNwx
 tffCiEyBi4ir73XWp1Tv+eQPwCLFFkacDYrAL7+5+iQ4e219oD6DR+fBb99f0yt6sb8/
 neB1dQyZ7LWTo0r/eMH+ytqQTIZQEBja4tV6XGjrpewFTf9tHnAzPfuMfeUJLhB/z1MG
 Sz6Q==
X-Gm-Message-State: ACrzQf1Hrv17pG1ELRjQN41fQA+wb8UbPomkSf+XbJkYtvWxLOOl4E2O
 CDpzTuCvOOL+o2nIePM5NgFiTw==
X-Google-Smtp-Source: AMsMyM7wj+IruN4+2/9rW5skNSlW9CapoGJOo3pJO0MUexNYdKJoKUM7RFSObZwAh9zQe1pQf3MdWA==
X-Received: by 2002:a05:6a00:1389:b0:566:1549:c5bc with SMTP id
 t9-20020a056a00138900b005661549c5bcmr37488078pfg.8.1666675498966; 
 Mon, 24 Oct 2022 22:24:58 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6216d5000000b005625ef68eecsm653715pfw.31.2022.10.24.22.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 22:24:58 -0700 (PDT)
Message-ID: <187daca0-b513-9eba-05b9-5f07eeab634b@linaro.org>
Date: Tue, 25 Oct 2022 15:24:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] linux-user: Add guest memory layout to exception dump
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <Y1bzAWbw07WBKPxw@p100>
 <8c348149-6edf-c6f7-f539-d40a4479c46c@linaro.org>
 <07dbe94d-c215-2be3-1769-4f2a8290573e@gmx.de>
 <e3d81adf-d47f-98ad-9f41-f55c1f73e9c8@linaro.org>
 <f7136170-74ea-fe88-4053-4c38be1541fe@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f7136170-74ea-fe88-4053-4c38be1541fe@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 12:51, Helge Deller wrote:
> On 10/25/22 04:25, Richard Henderson wrote:
>> On 10/25/22 11:57, Helge Deller wrote:
>>> On 10/25/22 00:35, Richard Henderson wrote:
>>>> On 10/25/22 06:18, Helge Deller wrote:
>>>>> When the emulation stops with a hard exception it's very useful for
>>>>> debugging purposes to dump the current guest memory layout (for an
>>>>> example see /proc/self/maps) beside the CPU registers.
>>>>>
>>>>> The open_self_maps() function provides such a memory dump, but since
>>>>> it's located in the syscall.c file, various changes (add #includes, make
>>>>> this function externally visible, ...) are needed to be able to call it
>>>>> from the existing EXCP_DUMP() macro.
>>>>
>>>> /proc/self/maps has all of the qemu mappings in it as well.
>>>
>>> I'm not quite sure on how to understand your comments above.
>>> Just comments or NAK to the patch?
>>
>> A question.
>>
>> Did you really wanted the host mappings included?
> 
> No.
> I wanted just the guest mappings.
> 
>> If so, fine.
>> If not, pointing out there's a better function to use.
> 
> I'm not sure if it's the better choice.
> It depends on the targetted audience of such output.
> 
> This is linux-user, so if someone runs a program he would expect
> output of crash dumps like as he would see them on a native machine.
> Showing "external host emulation mappings" seems strange.

Oh, I see.  My comments above confused read_self_maps (host) with open_self_maps (filtered 
guest).

I'll note that the output of page_dump() could be improved to exactly match 
/proc/self/maps format (which would probably be less confusing), and then re-implement 
open_self_maps in terms of that.  This would avoid read_self_maps entirely.

It would also fix a bug in that the host page permissions do not exactly match guest page 
permissions, and you're reporting host page permissions.


r~

