Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7494CDD01
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:54:18 +0100 (CET)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQD4D-0002fw-6N
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQCxx-0005Nu-8V
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:47:50 -0500
Received: from [2607:f8b0:4864:20::52c] (port=36745
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQCxv-00016b-O0
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:47:49 -0500
Received: by mail-pg1-x52c.google.com with SMTP id t14so8250425pgr.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 10:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4igLOcFBxSteDHVUcWP4MUQjJu9aP43KI7TWJtdETPg=;
 b=HMtGcDtRTkxjrnK8CZNwiJeukcjHFWtqxfpRyruPOIVTj79ajSQfPkYZpzQ81cSRXf
 i2Xd+vFov4WLR9727fQ7JCCq5yl6wB7HZZi0VioNt+v3Wvq5/MI7SMdsUWZa6rrjZbu+
 oBaKxI1KKPLzN0JBY/a/25UoIPcqq5fJePwtRuo+mveT/oEarOLH1j/rFPrBrpum95GZ
 hK9RxiDaZowhY6Ou+020wOquwFg1x4sg9mEWuAKod+3dL9chdKZIcuQ59OI81uMOdDkn
 WGBbhhof5MUpYYhZsPKNnnN/X0PInoJw+N4CeGh6myOdbpejNBCRI+u+U54Yj8agtarx
 QEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4igLOcFBxSteDHVUcWP4MUQjJu9aP43KI7TWJtdETPg=;
 b=22tt3f+UX6WTN4eiCJ4ItMAqg08YoS1dCPnBNHs9l3Mq82fjnwM2QU3X/uRC79YfUd
 LX6gCn2Zi/cBeB2OXejkHbfK0VPKdCcIMmOU0RYhfU0/KBypCSr48/R8Jok1ggmeprLH
 rnyy6BQeKJs6XjfZ7wCp3pRNqSBbBnUxcj6utneXbLxyL0pfYWYG+6RXX7e1riZ7DAxS
 tLqGDUcJS+9EadcA+rEZ2StyrpsSIx22e+SGLs98QcERpl4SB2JQqSrBuOZQySsuD3xH
 2B5kMqbnwpI6lKMlOBFTx9US0mIxUOSR2ik3KHVQYe3JaiaZbPVhdoKwDfReqPxPF6fn
 MC8g==
X-Gm-Message-State: AOAM5331ZyaXhnqAkfNNKKL3dtsscw7hfR/KOcHpabz93rDy5I7cyIqe
 pk/dGimvgkdAAD/GSlI8ODSI6Q==
X-Google-Smtp-Source: ABdhPJw12gJEtYxMMyXNfnSD1hVeuxTxEs5EveUO3xILNL4CPs2ZoPdG0v6VwFagVDQq+nVjMO+lPQ==
X-Received: by 2002:a65:6941:0:b0:372:b6bc:4328 with SMTP id
 w1-20020a656941000000b00372b6bc4328mr35644848pgq.106.1646419665733; 
 Fri, 04 Mar 2022 10:47:45 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a627b17000000b004f6cf170070sm315320pfc.186.2022.03.04.10.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 10:47:45 -0800 (PST)
Message-ID: <0212da77-3bed-3e06-6b55-cda90dd27779@linaro.org>
Date: Fri, 4 Mar 2022 08:47:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/30] tcg patch queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
 <CAFEAcA8EWNdCa7cAaVKQpuuj+0-KLfYaybjjQYUtyy+k7MVrSw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8EWNdCa7cAaVKQpuuj+0-KLfYaybjjQYUtyy+k7MVrSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 05:22, Peter Maydell wrote:
> This causes the linux-user tests to fail on the aarch64 host:
> https://gitlab.com/qemu-project/qemu/-/jobs/2163919769
> 
> All the qemu-i386 invocations fail like this:
> 
> timeout --foreground 90
> /home/gitlab-runner/builds/CMuZxyfG/0/qemu-project/qemu/build/qemu-i386
> sigbus > sigbus.out
> qemu-i386: Unable to reserve 0x100000000 bytes of virtual address
> space at 0x8000 (File exists) for use as guest address space (check
> your virtual memory ulimit setting, min_mmap_addr or reserve less
> using -R option)

Hmm.  It works when run standalone on aarch64.ci.qemu.org, so it must be something within 
the ci environment.  Alex, any idea how to replicate this?


r~

