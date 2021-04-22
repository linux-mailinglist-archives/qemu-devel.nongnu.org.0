Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D83676E9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 03:44:19 +0200 (CEST)
Received: from localhost ([::1]:54608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZOOA-0001ST-CI
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 21:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOMT-0000Td-In
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:42:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOMQ-0004r4-Vr
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:42:33 -0400
Received: by mail-pl1-x62c.google.com with SMTP id g16so5829864plq.3
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 18:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7dwOa0AishVeIO/Id1EttEpKsccjYrr2aJNNtkOnpH4=;
 b=vs/LZ/lkLDAUqcgX5J+gJrULsQQVrRemBLmqcBflHTEUsS15TxsWeFjEVGY2aFtAax
 FKBP0nPSTwU+foCFXCDypD8xgfB4M6PvK3nV+qhcdCAnSUCQa8CSOXXajdSp+w3GEdUM
 9XHrjBx5EXuPeoarCjBKbv/WoiM84DNXt73Nh2iz38Kyk+G3QEq8TJin39XnWWGUP7Em
 MshYTUs6bnZ0C9EFncgd1eHhMpwyVCoB9WS6xO2Pw2/klxaApy2e8+ROGu0WJxYA8RSo
 Y4yXkiZX1tKiOAInSRII34UolETlltPvgkX3AfsFNcD56zM0Tse5S7vlJXuy2sZ8I6bk
 DuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7dwOa0AishVeIO/Id1EttEpKsccjYrr2aJNNtkOnpH4=;
 b=psmorpXNMuPWFd0VCFURQNQg4ybvtwfXpXhINSkCb1ToyfHcjSC2WhUgfM8X3MmGmu
 fm8SmCCfIuW+qE0jtUenlbEpRHbqekW5Jml8+qVBtPhMQ8ng21lu+umSAYylVxsWUHr0
 343wlmXj4Hqgn3vWD6ANy50rHwmocXjrojlHHtFG3fVHm411HRRlnNtEDInERsKtzwVN
 SZlS4S+9SoKTcBRWZq1OtjqUn9bRf3Yekj4Yv9D3ZBhfAVX3sbmIkG5FU1yQ2k2QoJDc
 z1fPAZk5R4r6WYqm62EKIFq8CwIPbTML/CImnde+YNPB/jAk8rmf3DZ71RkSjIxpzyfr
 8BPA==
X-Gm-Message-State: AOAM5320MjrxT1afa48afGHRFHaQ+ArHpjYiDGYxnmWZAAFzVeEQdS6m
 zSBHTYzs9y2c5gjkSKKJTxBxBg==
X-Google-Smtp-Source: ABdhPJwLuSaKh8JWL6/HZOyWLe0Lxk/KkfxkwJ3k4kji1o3SG8e7AQuu0vXgaa6pApTklO9w9OxQhQ==
X-Received: by 2002:a17:90a:b947:: with SMTP id
 f7mr14044749pjw.166.1619055746500; 
 Wed, 21 Apr 2021 18:42:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h9sm497418pgl.67.2021.04.21.18.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:42:26 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] hw/arm/digic: Open-code pflash_cfi02_register()
 call
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3de0cf22-35da-277d-2e31-9f1602988afc@linaro.org>
Date: Wed, 21 Apr 2021 18:42:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> To be able to manually map the flash region on the main memory
> (in the next commit), first expand the pflash_cfi02_register
> in place.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/arm/digic_boards.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

