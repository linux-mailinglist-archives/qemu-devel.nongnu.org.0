Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99226502D7
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 17:54:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6wv6-00085K-V6; Sun, 18 Dec 2022 11:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6wv5-00085C-OX
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 11:53:47 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6wv4-0006tr-0S
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 11:53:47 -0500
Received: by mail-pl1-x634.google.com with SMTP id w20so329081ply.12
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 08:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OhDBv06nkmkvt9U/G3g/UCU9upkG8DDk7PoGuouTjoo=;
 b=Uxh+vHofnFWopOGnoRKneE4xW5tZBZhrxfIPN3Wly2cljURt7/HypgMqKc+Us44TVv
 ADyT4ow2Baul4y+q6glja3vTOeiNr1LMT4pwWzZPtzGzEY67Vq1Wa7VYBcphpcMXNLh5
 6wqYnJOMo0/aFKeIKMNnZuRWpDALrTwZIYSTM6h0ujOukVlaD13SwDvZo+WFKBuaJ9wG
 Yq67koXqnLaduB0Q+fx6KvE1ETZq1BAJQsspYgMlOMnSp3XeevtuISJJxyiXj6suT7qK
 0Gp02K6KWNFdHY/QrduSTt2JSXQEte3J5ng3t+9jJTeCxVlAmUAx+6dyS/hsqakfVu1Q
 52gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OhDBv06nkmkvt9U/G3g/UCU9upkG8DDk7PoGuouTjoo=;
 b=vuQfnyFcfJBKyUT2zlMWIWF4/yU7qkQbTLAEVbLU5zAatw1oo4yei2ALOpbNHC9GUD
 XTjgVlhpC8SdRSgP7z7aouFoINxZYWrGzG6o1xq0FGLONvs6C93JSKit97CXkBaF2UUs
 XsacQbdyL/4lgCcBOGyhsjLEX29K7JBOyX4vSx0gbfkVPtTRWg48xmRqtWGUCNWw2VOE
 2c5eg5Yhqw+4Jj3QxJ8Qj11MTSL6hhAH6SJ8LEHnLIZKLG/ONEtbQe8jNeqSDOu2QvCh
 80eZz5+9SCFSRucGJLUeQm4BrlY6ss5UYYBNwh5Nn+j75qpuJF+FmCC/9/h4ZfKUYn1f
 R1nQ==
X-Gm-Message-State: AFqh2kpO6em2sK6xCLjJ27BKFCL9N4F9EL2DTPzbB7iMl5RTRUKuTcYm
 txGhP1eo7P8qM5foE+k4m4r/Xw==
X-Google-Smtp-Source: AMrXdXvDTeN2fovib7DUmHTMdyX8YmDKQXkUp/TsScASV1l1ezIp5m+cuN0zzDZZ78NbbZMDXEe/Tw==
X-Received: by 2002:a17:903:493:b0:191:bb:c207 with SMTP id
 jj19-20020a170903049300b0019100bbc207mr9243439plb.37.1671382424253; 
 Sun, 18 Dec 2022 08:53:44 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170903120500b0018911ae9dfasm5288208plh.232.2022.12.18.08.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 08:53:43 -0800 (PST)
Message-ID: <2f0247c5-0824-0157-94ed-10296ba7b5fa@linaro.org>
Date: Sun, 18 Dec 2022 08:53:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
To: Peter Maydell <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <CAFEAcA-Tr-RU0TjsXpn59EJPy9rnT6tVdkcyAENYHjxaXr+2VA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-Tr-RU0TjsXpn59EJPy9rnT6tVdkcyAENYHjxaXr+2VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/18/22 05:52, Peter Maydell wrote:
> On Fri, 16 Dec 2022 at 20:49, Taylor Simpson <tsimpson@quicinc.com> wrote:
>>
>> The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:
>>
>>    Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/quic/qemu tags/pull-hex-20221216-1
>>
>> for you to fetch changes up to 585a86b1041a45c3b4074440c7f1b54944570867:
>>
>>    target/hexagon: import additional tests (2022-12-16 12:30:28 -0800)
> 
> 
> Failed to build, s390x:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3492490152
> 
> Program scripts/decodetree.py found: YES (/usr/bin/python3
> /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/scripts/decodetree.py)
> Program flex found: NO
> ../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found
> or not executable
> 
> Can you get the CI requirements sorted out first, and then
> let me know when I can try re-merging this, please?

Our s390x host won't be affected by any of the scripts,
it simply needs to be installed.

Alex, can you please install flex + bison on s390x.ci.qemu.org?


r~


