Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1D34B74D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 13:47:56 +0100 (CET)
Received: from localhost ([::1]:57038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQ8M6-0005k2-Mg
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 08:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQ8Ke-0005Ac-Fi
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 08:46:24 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQ8Kb-0003rc-5G
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 08:46:24 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so7817826ota.9
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZNA2PjzQOa8Mewtq4uwnCiLG1HmKVMh0ekqhqxPfWyQ=;
 b=XYmZRxHgFQL/2eM3N0Q4Xe/IqEdzZ1fc//aP7FPdSkB4BEGxx2/sG2OKxguUHZjl8w
 y2nmDMXrorUZqfUKjAlFWjeSvdt0SISJ1708ieghMGCxYw+cIh1dmtRoT6bE8FAb+OUX
 c5mrSjbeiSyZyPH1Bu17QP1Pyzw83XnjImc6xme1rT+RBggl6Z48TgNIlm9d6aLf4Tf+
 6kani3bFmP7Q37TnkHaPVJhPgdDuClX3yeF9yqwAXWIDI6uy/HQoigo9cV+ZJZWqSuuN
 FTo2/HJs1lfQRAAQH48/0zB68SusXDG9PgMVM/A45LTWdEVd47qmJMoY5aCj1gcUadWd
 xrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZNA2PjzQOa8Mewtq4uwnCiLG1HmKVMh0ekqhqxPfWyQ=;
 b=gTKQcymbmlucG7JTaNfvWN/rYmJKtJ8EDPeoYl2+kJIEnXn9dtkd2n4W8Y2DnezRO3
 /tC5Fq0FV7oyw5RaCAOnidP57F7YyE//U/LbfbGX3XITqZgv27FTECj49XUK/JoAKI8U
 NiXd4lahb5oWwx1lVAmktSlqxf8p63QGSiI0CozQEK98T57u5c6AZ7qgVrjZEI5PxEVq
 Tn33Gy4WnJVCHBDxIDMzhGB8GGacEKwWCqchrKp16lmH/g4YNFEiaKfLjqNsxlDFAk+T
 ergoq8EoYxDrD35BsEHYLG5H8Gx3I6j/ktLCDZahN9iYx5W+zb8CM77xk31zJEyrZlZu
 1+PA==
X-Gm-Message-State: AOAM533HPZ4kYpkkLoyjiBmrq+Zw/zv8W4d44Mn+qcai7nnKATASFleB
 7MZnqkWcEhuZJ4ae0fqzYCQoBJ6UTS2+19ZQ
X-Google-Smtp-Source: ABdhPJzUBuZHKepMDyLE5VLw7QDDHGiq7haiycZOvE8f/YKEIly4rSB4H1P5xhstViUeUhNoPMeDMg==
X-Received: by 2002:a9d:71de:: with SMTP id z30mr15728770otj.266.1616849178975; 
 Sat, 27 Mar 2021 05:46:18 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i4sm1923044otj.56.2021.03.27.05.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 05:46:18 -0700 (PDT)
Subject: Re: [PATCH v5 10/10] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
From: Richard Henderson <richard.henderson@linaro.org>
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-11-richard.henderson@linaro.org>
 <YFqD5JOVEXVFv9Tr@yekko.fritz.box> <YFxONrbZarGMH34O@yekko.fritz.box>
 <0ea867e5-e2f5-954f-a07d-5a71090985e3@linaro.org>
Message-ID: <4c323791-02c4-4ad3-be58-3472ed23e21c@linaro.org>
Date: Sat, 27 Mar 2021 06:46:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0ea867e5-e2f5-954f-a07d-5a71090985e3@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 6:41 AM, Richard Henderson wrote:
> On 3/25/21 2:47 AM, David Gibson wrote:
>> On Wed, Mar 24, 2021 at 11:12:20AM +1100, David Gibson wrote:
>>> On Tue, Mar 23, 2021 at 12:43:40PM -0600, Richard Henderson wrote:
>>>> Verify that hflags was updated correctly whenever we change
>>>> cpu state that is used by hflags.
>>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>
>>> Applied to ppc-for-6.0, thanks.
>>
>> Alas, this appears to cause a failure in the 'build-user' test on
>> gitlab CI :(.  I haven't managed to reproduce it locally, so I'm not
>> sure what's going on.
> 
> I guess you mean e.g.
> 
> https://gitlab.com/dgibson/qemu/-/jobs/1126364147
> 
> ?  I'll have a look.

I haven't been able to repo locally, or on gitlab:

https://gitlab.com/rth7680/qemu/-/pipelines/277073704

Have you tried simply re-running that job?


r~


