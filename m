Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB1C3D0368
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:53:29 +0200 (CEST)
Received: from localhost ([::1]:48500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wk4-0001bD-Ir
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5wis-0000va-60
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:52:14 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5wiq-0003Uz-EC
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:52:13 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so2701582pju.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nR4VXaRy4yfmqqIfvoVXJKWanAOIjxs0GVzLypmQXgA=;
 b=KEZgVNQ1nTEZMCwJZKBJsWYy7ABksYOml5+hnofaFzHGi4qhMacpSzjREbSvIxFBcc
 vtoF6QMWboBjAIbikRWf2yizMMSZAPmP/jMzCtM3OkjIsm6sPsCj5SrJaSdvZFR7SVB2
 8EAlPgxoLRkHno7A56le+jme5uCgpj793Mx2Gu8bYtujdsUD4qwsaAuvvuK81vyga65z
 KsgRD8XbVzjM+doH3vLcnUMTi1zfj5iW6a5vE3SptxgVjG9SzLEzRDJ/WnjYPe4ixC3H
 FCJrh0lviyONOPyXC5KSH4tjctNBjGCnBg+X+9VvOpu0ayMCVa3we8hyETPo4re/+3R9
 YIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nR4VXaRy4yfmqqIfvoVXJKWanAOIjxs0GVzLypmQXgA=;
 b=hZFXneNOgp3jmS4jcp/3DTdEa7FaEIvH7q6Wq2sZMV3mxVx5Ppgx96T9c++LkXJRa7
 zyc1flFJs9s5YEYNY7dFRQQCJeIco+qumgRYaiRnXL2iaxR9nEClc+q6ZDH/kSTInjSc
 Cus1sx/as60kR37HY2fHcgz9Z80JQ/WEGbxLJPlHX2qy2ap39bqqSFQgPCnU/c7XdANk
 +mvEGT9h/ydqrBydj5bZCcB7Jj3A3s2/F9fkq3VHgOjBjRD6m2uYdKMMyrzg8yJQWFFs
 v+qnlqWfWYEqGqRXuIhIwbGlwSqcfw2orxCqcUt6SyX+O1/z1IbQauYQkUuOZO12/5CN
 EhTg==
X-Gm-Message-State: AOAM5335djptz7HZf/1R76a6Abu2fJdduUo9GhUneCtn1zHDyOpuLJ7K
 NynOFA8HFA5uvQS/G0Ux+PsMYw==
X-Google-Smtp-Source: ABdhPJzg32bZnoj8bdbKO3hl7YXeTADScb4QJYS38TMrHp44KmSQiGX/ua57k0NXw6urxzunnLg4nw==
X-Received: by 2002:a17:90a:6686:: with SMTP id
 m6mr31196240pjj.109.1626814330850; 
 Tue, 20 Jul 2021 13:52:10 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v10sm25724772pfg.160.2021.07.20.13.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 13:52:10 -0700 (PDT)
Subject: Re: [PATCH v3 03/10] qemu/atomic: Add aligned_{int64,uint64}_t types
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-4-richard.henderson@linaro.org>
 <CAFEAcA_hqt7R68nmuvaoAKAOqX6OA75dnymoYQ8h1chQjqC2hg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <accdfbc2-4979-e671-34ef-34948fdfe4bf@linaro.org>
Date: Tue, 20 Jul 2021 10:52:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_hqt7R68nmuvaoAKAOqX6OA75dnymoYQ8h1chQjqC2hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 2:39 AM, Peter Maydell wrote:
> This cast is OK, but it took me a while to verify that:
>   * we check that 'addr' is 8-aligned further up in this function
>   * we check that guest_base is at least page-aligned in
>     probe_guest_base(), and there's no way to avoid that function
>     getting called if you specify a guest-base value on the command line

Yep.

> Is it worth asserting that the value we get back from g2h() really
> is 8-aligned before casting ?

No, I don't think so.  I think the check on the guest address is sufficient, and Just Know 
that guest_base is not going to misalign anything.


r~

