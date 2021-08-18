Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A8B3F0D32
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:16:02 +0200 (CEST)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSun-0003kW-Jr
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGStH-00034G-SS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:14:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGStG-0002f5-7R
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:14:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso5283646wmc.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uek6l9+FBJTeCkkw6q5NedxhnL0yV4f5FDQVbZp32O0=;
 b=q9tCkNCpmaIP3H7sTRgJc7dWYFdqgZAwPuPz0ovCVvxVnBxRkPqg6RrWR0J3Dfmy/B
 te9TAbRfMD5V25IS9ohCg0YIad/CplxY2Pjw0B3nvF1b2ecY+ska/U7MjJGk9fSZchiO
 XIsdc8pdVmOaAhv7pzHzwqs3Y2nW7ZSUsOc2USsbyk9hKbFXlORUHp9qpoc0M0UBdLfR
 QyGqe8139VSPKMBHHpQyCnFH/pfJYBu9JfkcWLtsTefRd+5iYiOaJP0mLTwpvDB0sPuL
 QN68+IbSrELM9C4xSJPUBXI9wc6mOx1D8qMLqTCuAmXf1itOJgkhjePtXut/ezSEyyzJ
 XBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uek6l9+FBJTeCkkw6q5NedxhnL0yV4f5FDQVbZp32O0=;
 b=O0vt0TpM79Zz0/oo9LTZGIrjwaacjI50WyfiLIm2xrdHksHoQvFKbhZw8qS1xw31BD
 yo7R5BOaa02/CKJJ+RTDc58qrxLIDmQEK4sZ3ndJIHi/jo+My4lnlwTl5i9FRIg8f/2Z
 5bVbLvsW1fhdJYhK0LUYLLO/zNI1ZqgQz64mllLuoL6/BVpZu00BXjbV/eMsPFtOgY7U
 RNrVGX0/pGWbMXPpjh0v03jDIKnMWvBCQoja/7oHzRDHJbOglR6FUchI8vh1z1GODy4/
 UinFQyDWAdlSW51zvigpD7xvUCUK6epZ5ejtYu68eTW27lIvBk548gcrR9RYBYJEB0zK
 yIaQ==
X-Gm-Message-State: AOAM531y/BY1eIjGXTknEjMr+HxqMrwN+RT5SE081oAX0/NhxmVqy6XD
 uooJdG8g8q4fHXKbowEzyoJTX5PtlAk=
X-Google-Smtp-Source: ABdhPJy2HZ45uVSwyoaXWuQSDCKQoJ3NZ4S264KL7VUxtJpncxOWhpCPo80wf6Uk0s43t1VhwG6O7w==
X-Received: by 2002:a05:600c:1d06:: with SMTP id
 l6mr7119414wms.18.1629321264496; 
 Wed, 18 Aug 2021 14:14:24 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v17sm1026792wro.45.2021.08.18.14.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:14:22 -0700 (PDT)
Subject: Re: [PATCH v3 22/66] accel/tcg: Drop signness in tracing in cputlb.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <db0b195c-3383-e22f-e7d8-bbd574acd0dc@amsat.org>
Date: Wed, 18 Aug 2021 23:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818191920.390759-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 9:18 PM, Richard Henderson wrote:
> We are already inconsistent about whether or not
> MO_SIGN is set in trace_mem_get_info.  Dropping it
> entirely allows some simplification.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c    | 10 +++-------
>  accel/tcg/user-exec.c | 45 ++++++-------------------------------------
>  2 files changed, 9 insertions(+), 46 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

