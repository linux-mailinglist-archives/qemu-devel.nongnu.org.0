Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1D6DF1C6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:14:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXUB-0001vV-Jr; Wed, 12 Apr 2023 06:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXU9-0001rZ-BY
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:13:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXU7-0007qd-5J
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:13:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id m8so19894682wmq.5
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294429; x=1683886429;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0z9VYG2+4kdq9tFbd3amLX02lx1HCk6tawdp3/CMn+I=;
 b=H9hY0SymXHzfa1wZ9uE8eKZOTQIH7uMHdLoJgYaaB6DM/sl0xmabpNam7TSi+ub2Dh
 fM+AtIjWgmLmoXUvCvfc1Y2vbNEqT6ekO6obW3fsE4G4+ihMD9H9Dt1wSLq2MOmoAmFL
 H5WhF8s0rT4LfZVz4UX3+QMInSFJDZgefA8C4+8gJexFJ4xuwtbWYqGnJIk+XvCodW3L
 HNUDv2X+MklJzX857ow61hpPFjgRwUJpPU/RicuVO7ypLiAeI5sNGYNxQjg6nClWh1jJ
 yU4Ijgjsq/An2mNSvNDvfVBJ4qbQNZRVMps4+9zatj820kSGIt19iKO5D43WkUx+7Rc6
 bglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294429; x=1683886429;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0z9VYG2+4kdq9tFbd3amLX02lx1HCk6tawdp3/CMn+I=;
 b=S4ed0qIhBis2YRTR2Yduro24zEldP8uRVwD1t/kCuabvAbde4MV3BJ7ETPSldMFxEd
 OLqMbebchxoIYkQftFZrxv6EwmYYtAPyCSZv4wwb6bXirxc6autAdzDJbs1GMXd+sUA2
 iNlqu+DZLuju1o/Yc7isdPExbZTT2Ep6A77AjaeLrJW6Jbc1nod4hIcyckhdpmhZp+5w
 YDWr6yPL01J9V3SbVX/hJMckwmtUxhTMgVGw4EDFOR6opX4NFsh+j2wTThIYipL7bQzs
 O6vMQ0qRHNYE4y2ATZBWdhYslUUnJt8XWqbLVBNX9M2hJT67UuBLmWZhMl5Kwm323o0Y
 +p2A==
X-Gm-Message-State: AAQBX9fY71S48Xi0h4QJul4VPwt+vqm9GgGJ3TmIifEonFJD4nTe4mSB
 P51A9oAzbTeSisrzOCOWBq2V3Q==
X-Google-Smtp-Source: AKy350bkNPEhrIasgh68eqi6e8yPvBKWDFf0qSDU5vZUtp8/dpfjE/6GujVOPTic7cDeeG7fi0OtuQ==
X-Received: by 2002:a1c:770c:0:b0:3f0:310c:e3cf with SMTP id
 t12-20020a1c770c000000b003f0310ce3cfmr9494655wmi.37.1681294429330; 
 Wed, 12 Apr 2023 03:13:49 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 f5-20020a0560001b0500b002cfe3f842c8sm16732138wrz.56.2023.04.12.03.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:13:49 -0700 (PDT)
Message-ID: <61f30596-0c71-0bfc-1623-b3c275f3a12d@linaro.org>
Date: Wed, 12 Apr 2023 12:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.1 0/3] Make softmmu/qtest.c target independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230411183418.1640500-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230411183418.1640500-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/11/23 20:34, Thomas Huth wrote:
> For being able to build universal binaries one day, we need certain
> files to be independent from the emulated target. qtest.c is one of
> these files. Rework the target specific code in there so we can
> finally move it from "specific_ss" to "softmmu_ss".
> 
> Thomas Huth (3):
>    softmmu/qtest: Move the target-specific pseries RTAS code out of
>      qtest.c
>    include/exec: Provide the tswap() functions for target independent
>      code, too
>    softmmu: Make qtest.c target independent

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

