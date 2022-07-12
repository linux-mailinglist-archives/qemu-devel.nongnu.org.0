Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624A57111D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:12:26 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7G5-00067q-95
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB74z-0002oK-6a
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:00:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB74x-0001GY-L0
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 00:00:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso6746792pjj.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 21:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0HRb+Azc4p2o11CbDKWFf2Mh+ooq2uXuIk/74tbO3CE=;
 b=rvju08WMUhVIwRXO0V6r8OrYTg5D+VQG0CTc2UinPXXsGedRQFCFWGkh4nkj9lEtRJ
 8snbmr/dGzQ0rS85mCjZEPwtbeUEBFLD4rC4s2JTPNNYc8RiN3BSf/P5r6yA/vTcsgDe
 vCu16e16RM6FDOep6FpWt6qVOlXrcnBK3eg7uthXRd/sYS4HDVOc2TixIUnZCwtqmyX7
 CU2wQVDJPMAfhWl47dImn9q4XeijVMVz9IgAR6SgqLJWmZleniaYYkKwHB8FhSwBUzZf
 p9yzG9tHepQgsswXG00AM6NzP3dAUBbpA5+mTPT6DvibICycYubAR56c05fQWJV6k9NW
 qsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0HRb+Azc4p2o11CbDKWFf2Mh+ooq2uXuIk/74tbO3CE=;
 b=FKYH6/e1Q40TyCg+6uy3A95r3xRq84FQt92P/LG4tLwf1l9tr1DfxFnTn5930nka2q
 YeHToOxK72v8yl4lJi8VcVoXn4NZoaAhEbu5oEK73++H47UI4mMnvTDTGc2JSQ3shIEv
 SDc4v3rHzPNVY8AttGhyXfW8ABx8cpKK4X1843+yvS/23R5l/IuLtqKv9djPv48bp8Yo
 uj9QtvcjdKCSbVCauZQ2TnFFnUrBScskN1+VwOKdYD3wox8cXV7iPSZMUKVV7xwoToG0
 4KT+ZjhsM0XIfe3s+Lurob8Nq1RLcMUhjHqUqbHSkh9X9I4RkBK6ZUBlqm02M5ODIZYs
 1uPQ==
X-Gm-Message-State: AJIora8uXHJjI5WRLASRzZbnQBVo30/qEfsj2YsjWYqiJlyuLJ8OeAFh
 bXICglGE4T0TBOCXJmrFwW1O9A==
X-Google-Smtp-Source: AGRyM1v5nlYoz4T9KfquCpFfKVkYRXahVu2d8kUGWMpVE+zYZcdqF2Gf20iEnpU8TQTdU355+moVfg==
X-Received: by 2002:a17:903:11d2:b0:167:8a0f:8d33 with SMTP id
 q18-20020a17090311d200b001678a0f8d33mr21836518plh.95.1657598454239; 
 Mon, 11 Jul 2022 21:00:54 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a170902d58400b0016bf5557690sm5550227plh.4.2022.07.11.21.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:00:53 -0700 (PDT)
Message-ID: <7aabac5e-cdff-c1e8-a9bb-a4fe276ed91c@linaro.org>
Date: Tue, 12 Jul 2022 09:30:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 08/12] tests/vm: add 1GB extra memory per core
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-9-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220708153503.18864-9-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 7/8/22 21:04, John Snow wrote:
> If you try to run a 16 or 32 threaded test, you're going to run out of
> memory very quickly with qom-test and a few others. Bump the memory
> limit to try to scale with larger-core machines.
> 
> Granted, this means that a 16 core processor is going to ask for 16GB,
> but you*probably*  meet that requirement if you have such a machine.
> 
> 512MB per core didn't seem to be enough to avoid ENOMEM and SIGABRTs in
> the test cases in practice on a six core machine; so I bumped it up to
> 1GB which seemed to help.
> 
> Add this magic in early to the configuration process so that the
> config file, if provided, can still override it.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/vm/basevm.py | 5 +++++
>   1 file changed, 5 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

