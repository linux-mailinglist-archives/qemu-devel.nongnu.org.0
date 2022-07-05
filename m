Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE81D5664AF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:06:03 +0200 (CEST)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dZK-0005eO-SA
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8dUD-0003Qh-Fd
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:00:45 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8dTu-0006sA-Sn
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:00:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso3303135pjk.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=gmA0rLP43sa8MW4vDPS76BsTbf5FsxHTC52kD8a+YYE=;
 b=qFzwt4jqmEn+ox/CPj8NxXwz7TSY3s72xwHWbsv7XTUgIloocgPKMypg0DVOyQ5ZtV
 zWiSNHkQPsFaT96y5STcjSY4AFndBLxTuNgZEr0X0FixIR5EVJPXOljruZCVhYDLY6ZD
 U/zqoR7ZHdvVTAKSgziwsUZgJkI9YrhdgMoFZf3KmQvNYg2yqO/4VON6b5/1it6oPU6D
 vcpWZiH651wVEVVx3PoGDlznvu9VYTaD3rtHKV9xMp9SQO4tuHeXTcnzxueVp+c/d9z2
 e46ZTlCko3jLRa3agJ5SbXta8eza/hv1nEiNyOOjtTcNF7nquNMegFRhz+sFRODP3ef4
 zTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gmA0rLP43sa8MW4vDPS76BsTbf5FsxHTC52kD8a+YYE=;
 b=iB/uYIfinxBL12rfgin7p+YacNC+PhhYTxsiTQ9sKIPoEoyi9DhNxlt/NTstmO6VTp
 TtennL03zCUPlaKYBynPy7Dxqd2E293qD0BJZLpAdexQjA9syUgpMwBW+/Q5xAg5H7Kb
 OqnrOdmiyY5oezhUjSZP1FYUOBDmrBT0Z0bMK8ZPgX0nVXT4b/6kCI+Xtvb0fWta4OJo
 p01pqRjtpyk8yOOVZJVgocv+qFewb/fsuBnsD3LvE12likYiYgQJrlk4M5ekHYvFHND0
 LA/5qsaBvgsesaFsvLZLDZGe0MbE9SFyTkGZrVXxD1Zjq5PhUmM88yM8TKvTsUMjNKBU
 bSbQ==
X-Gm-Message-State: AJIora9M5+Qgm3fBthacRNg3wpsP4Q7qfGGrtqcY32aQtNmwMvIBQw6P
 k82MrZmJus339RxEnd/YkpbIwA==
X-Google-Smtp-Source: AGRyM1sX2+Xa/jKD7o0Y6GClfPULSlxDf9AsLvjjhLs8F5AAcl79Cz64wctr0vmL6BF1WbRcD+Xh0Q==
X-Received: by 2002:a17:902:cad5:b0:16b:e3f1:fd8e with SMTP id
 y21-20020a170902cad500b0016be3f1fd8emr9483066pld.106.1657008013140; 
 Tue, 05 Jul 2022 01:00:13 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170903124a00b0016a01637620sm5759410plh.76.2022.07.05.01.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:00:12 -0700 (PDT)
Message-ID: <89d2262d-7e54-3a59-de60-207d3eee7631@linaro.org>
Date: Tue, 5 Jul 2022 13:30:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/23] loongarch64 patch queue
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
 <23bcb252-3a46-eab5-8a76-1f55d5c07685@linaro.org>
 <542f576b-c0fa-73ca-f167-80534363f00c@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <542f576b-c0fa-73ca-f167-80534363f00c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 7/5/22 13:01, Thomas Huth wrote:
> On 04/07/2022 17.16, Richard Henderson wrote:
>> On 7/4/22 15:03, Richard Henderson wrote:
>>> The following changes since commit e8e86b484eac70cd86e15fa10a2f0038a536cbba:
>>>
>>>    Merge tag 'pull-riscv-to-apply-20220703-1' of github.com:alistair23/qemu into 
>>> staging (2022-07-03 06:29:02 +0530)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.com/rth7680/qemu.git tags/pull-la-20220704
>>>
>>> for you to fetch changes up to eb1e9ff8bba91674b4321f2b075c55aa8d9948cc:
>>>
>>>    target/loongarch: Add lock when writing timer clear reg (2022-07-04 11:08:58 +0530)
>>>
>>> ----------------------------------------------------------------
>>> LoongArch patch queue:
>>>    Support linux-user.
>>>    Fixes for CSR BADV.
>>>    Fix ASRT{LE,GT} exception.
>>>    Fixes for LS7A RTC.
>>>    Fix for interrupt vector spacing.
>>
>> Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.
> 
>   Hi Xiaojuan, hi Richard!
> 
> Seems like this is failing on FreeBSD:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2675891548#L4076
> 
> Could you please have a look?

Ho hum.  That's what happens when you get so used to jobs failing, they fail for some 
other reason and it gets missed.  Will do.


r~

