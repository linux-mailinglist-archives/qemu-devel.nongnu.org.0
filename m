Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEB6D67C6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:43:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjio5-0002z0-A3; Tue, 04 Apr 2023 11:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjio3-0002yd-6w
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:42:47 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjio1-0000Ao-Lo
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:42:46 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso36553146pjb.3
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680622964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WZYh3/SnjZIkVFtooDb5knlVWLbDd1+a73Ge139Zy7o=;
 b=O+TDnc2PUGJq3ytNL40txMShbizWmkWAqFqPkBD7l3b0Wa4sn9k3F1LVFPVLP6FkcH
 1dCIQ3py/elQGXKSBeih6K+mqpfuKrI7c4uu+SUDCFW07Xrju3CfK6XLjDIIrYVBgOHv
 EeyaSSGGeggi5omPKkMndwspPv1DIwnNmtk4JzfJTZrQtcdgVIXnGhTN6sfAuUDkvnSR
 W+tYGb+cQld62cuwt2z/uVgJE9Hnb7q0i80dDMybWyrViSeIuG4Iq0EUV5ISJ46vz4j2
 TReGHOwIR9XyakfhTb0QWpAwH2647WMGSsvuxIUs7ZkHDPsbxzrB0P/qD4XElcwdaFhP
 ooGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680622964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WZYh3/SnjZIkVFtooDb5knlVWLbDd1+a73Ge139Zy7o=;
 b=1W7BJn7U8KfiFLx4XinpLG5H7+UAJknBPah9YrlPH/iI+B9lSEtzHz8qJpUEcQfyTt
 HqxBuCviEBxMj5as1iFRn4TIHyU+AVR1ozYyC+x2OL7ZFdNKRpb/jesIUGeJxUFeeiNW
 BFguc5JDE5Cmk1B0CP8E7BeH7f212/ogdZWdkDfnXTFJpaNrOOR0MTvzn8uWDZpVDmKD
 9Sk3ty9KEcLqWN2VIHbWWs6d9LCUNpixd0CJoDZ8332zRuYOFVtdUhur9KQBv1yK0HAi
 rLjNptFfNQ0vXqS9tu41aIyPRQjVhJD2PE4n9MBhzX7lzBGk4vUJG40HNsdUOzdnEoO5
 Zc3Q==
X-Gm-Message-State: AAQBX9faYcY7LAmvNQQHywP3y1TmT3Go1OD/CM2vFvl/gxry2wzv4WTo
 BEtRSMU63q/a6JK429yDRobx5g==
X-Google-Smtp-Source: AKy350ZG8YcWSxsrhvlYVkIlXO4AouSxeRPWNR4qY5Co9iC6E4oIvPRmogLNKqCpoGziWyWlHSr9Jw==
X-Received: by 2002:a17:90b:4d06:b0:240:95a9:923d with SMTP id
 mw6-20020a17090b4d0600b0024095a9923dmr2950745pjb.48.1680622963745; 
 Tue, 04 Apr 2023 08:42:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:1d41:7730:d7dd:6f41?
 ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 cu6-20020a17090afa8600b0023b3ebedc17sm8068289pjb.46.2023.04.04.08.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 08:42:43 -0700 (PDT)
Message-ID: <026bb7f0-1031-25e2-3bef-53802b2ed23f@linaro.org>
Date: Tue, 4 Apr 2023 08:42:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0] tcg/sparc64: Disable direct linking for goto_tb
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, philmd@linaro.org, qemu-devel@nongnu.org
References: <20230404150435.1571646-1-richard.henderson@linaro.org>
 <87pm8jll13.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87pm8jll13.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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

On 4/4/23 08:32, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Something is wrong with this code, and also wrong with gdb on the
>> sparc systems to which I have access, so I cannot debug it either.
>> Disable for now, so the release is not broken.
> 
> Why isn't this a revert then?

A revert of a228ae3ea7f6 wouldn't build.
This was part of an infrastructure change.

> So the result it we never patch the jump so return to the main loop
> after every block?

No, we simply perform an indirect branch to the next block.
Slower than a direct branch, but way faster than returning
to the main loop.

> In so far this won't break anything else and I suspect you are one of
> the last people who actually uses the backend:

Probably.

> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks,


r~

