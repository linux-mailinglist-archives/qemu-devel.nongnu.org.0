Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7A039224C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:49:21 +0200 (CEST)
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Oy-0001Mo-29
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm1Bm-0003FV-QV
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:35:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm1Bj-0000Fq-Ro
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:35:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p7so2553186wru.10
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LpJTulWrpVsdQqsqBpgoJqBLsVLASKbMwL5RcipON2Q=;
 b=ueusmLGrcIRwfioS8RpGhYXV0VIi3oJxvqxUiQ7esq4fahJ7lCtAu8YDCXn28IjvJF
 Ij1B1YeEK1v6SIe47UQ0jo6/Q764Qx/PWnyzqM3fJ/1RynAjtKFA/x5Q8o8ESZOquF0D
 83+I2kh8xwCHwz2K0ML1Rkb07qrORf5ZXDpMf25Q3KkeKQi5KtV3+78lmcC0TYM0d1Cb
 Y4uFU/oqSj6T5FSdMeP+RiMHl7xiffmsEkkMrcwoMN0CXDlBhjZ7U/9zSdT3a988MIZl
 7BCXsAyx9SSJNq70xiqQpATY/XPbtW3OO6vVvZ0jVxcNZz0vQmHkEcIWw4HfTv6M9uDS
 orHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LpJTulWrpVsdQqsqBpgoJqBLsVLASKbMwL5RcipON2Q=;
 b=UbQqtfX5Ys8Zzq7+BFL3JaF1lgdJjPBNEFKLExojQj9NnhmZcDzWiT8lmXecT36iKL
 Ry/I6CvXqrVMKla3DNtV9BpzgEwe3BzZjHWrsT6/XFqG6dYv74ZqSJI3NWfyJAn0GYlB
 aE9TAo1bbK/HESGW5WYX46llhzKN9Kz47AK8YpPreJsB3EbmsQDLvoDkPhNFSULYTgGo
 cAxK1lTA+7M8j3AuZq99nTEi4Wt43FBP5mF6JmJDsxxHrFLpvJuKoEH81RFZMeUADEHo
 SlcL4sfogGe4QsZSliQilI58JFifaYTuCFUnofsCcv6ndNwpvVVOYcuvRyS/QwbDhGAa
 zKjQ==
X-Gm-Message-State: AOAM530J+3D1an1xctUM3kjAUBATjPtHhFsRDs/d/okxvtJ+sUXjxEnb
 xvGO4eiq/hhmyRpoeSSZlow=
X-Google-Smtp-Source: ABdhPJx0IZuK7rAMnAIOahljNjxJOJAR/2J4SzQcNoADPGN1cI9201duSant4lEcXH8D3CqnLErbMQ==
X-Received: by 2002:adf:a44d:: with SMTP id e13mr29899wra.329.1622064937812;
 Wed, 26 May 2021 14:35:37 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id 101sm238758wrc.5.2021.05.26.14.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 14:35:37 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] softmmu/cpus: Extract QMP command handlers to
 cpus-qmp.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-15-f4bug@amsat.org>
 <f85b5ddd-2cbb-7460-d180-70827398fef6@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5108e6bb-de45-5b4f-cb13-81a187833578@amsat.org>
Date: Wed, 26 May 2021 23:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f85b5ddd-2cbb-7460-d180-70827398fef6@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 9:10 PM, Richard Henderson wrote:
> On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
>> qmp_memsave() and qmp_pmemsave() call cpu_memory_rw_debug()
>> and cpu_physical_memory_read(), which are target specific
>> prototypes.
> 
> Is there any reason they should be?

They use target_ulong. Should they use hwaddr instead?

> In the short-term though,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 

