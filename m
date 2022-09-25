Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E35E9213
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:24:15 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOo2-0005dF-HN
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOiq-0001m1-Nf
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:18:53 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:38554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOio-0004Bl-Hj
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:18:52 -0400
Received: by mail-qk1-x730.google.com with SMTP id 3so2622030qka.5
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=8lacXhpDy2SA6NaDs9PUyJ/7mVkTZQOmvIVZj4dGSts=;
 b=x1L3vuJgnSYemfmDmp/qbt7/7c05XFUH09CUQTqCBhjQZTdvZiFLl22IMOj1hq4gjv
 9wlpW2FL3GM0PivCUzcH3uLRjRDAL372boAiYCfy6V/bE3iyzcpOJo3cScYtGwVkJY6e
 gdUOYoSH0zohozCwBHUJDy7Zw8SY7CKpvqI2UU1q09n7CEJQB/7GSPkyshLo2VCfISTl
 qfZ+T4lepvX+x03gS8IdqS3CB2GVV7Hyf3HncaA6cKSz9Bf1a7pLSSdJPR1EiyBgIn9g
 DVBnWLcmHb7jb0PLQeG/ix97Or/EzK87jMTp8AaDpF1J3Mt62c/DKHDawqvWi+H7fMOp
 /+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8lacXhpDy2SA6NaDs9PUyJ/7mVkTZQOmvIVZj4dGSts=;
 b=hegdDyLv0LCldZLmhPHZ//yls62rGKHKEwHDU9syou2rhPpnCUsvBKhcXv0AHJ7a2e
 bbFMP0XObHrTe2yV8SG3sDP0snfdJFLkfglfnIFwGij+zmKlLa+A94uPq80ozyiUUn/x
 kQwk891hxsbby1lPZJfbMDeBnquNECP355Fe1LN4I+tDbN057iYhe9FSkhXKLe+4BtbP
 5QgOSl+pHCr1HGqCpuaIUcETHOZVPU90i3iwT7E/rseGyYbBzZkdLMQWt8nZXGF5o3+x
 PRlgsNoICPHy2h7+2ODZbZ2pBs0jx5/Tzk2pO87HLWigkDti8cztaj/Zri6XBfWW6mkc
 pCFA==
X-Gm-Message-State: ACrzQf0JPlL5hAehiDRI35PgosEyQuBTIuUWBHoHjcWZQTntFatL1ZSW
 xC0nCZkpoVQdcGi5HhpBJZmpfA==
X-Google-Smtp-Source: AMsMyM75jZIeOfaxLw4TJzv2WBXhoA3ivr9Na52KxGf8I4oQ4ZFYd1StaXqr1f6MXBh6pKpsvF/DpQ==
X-Received: by 2002:a37:4553:0:b0:6cf:4dbd:b5f6 with SMTP id
 s80-20020a374553000000b006cf4dbdb5f6mr11112482qka.339.1664101128113; 
 Sun, 25 Sep 2022 03:18:48 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80a9:5c0e:1ec2:d482:4986:8538?
 ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac87e91000000b0035a6d0f7298sm9466373qtj.35.2022.09.25.03.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 03:18:47 -0700 (PDT)
Message-ID: <b4066f96-8cf1-e301-5167-f256d4a3a35e@linaro.org>
Date: Sun, 25 Sep 2022 10:18:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 8/9] gdbstub: move breakpoint logic to accel ops
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/22 14:58, Alex Bennée wrote:
> As HW virtualization requires specific support to handle breakpoints
> lets push out special casing out of the core gdbstub code and into
> AccelOpsClass. This will make it easier to add other accelerator
> support and reduces some of the stub shenanigans.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Mads Ynddal<mads@ynddal.dk>
> ---
>   accel/kvm/kvm-cpus.h       |   3 +
>   gdbstub/internals.h        |  16 +++++
>   include/sysemu/accel-ops.h |   6 ++
>   include/sysemu/cpus.h      |   3 +
>   include/sysemu/kvm.h       |   5 --
>   accel/kvm/kvm-accel-ops.c  |   8 +++
>   accel/kvm/kvm-all.c        |  24 +------
>   accel/stubs/kvm-stub.c     |  16 -----
>   accel/tcg/tcg-accel-ops.c  |  92 +++++++++++++++++++++++++++
>   gdbstub/gdbstub.c          | 127 +++----------------------------------
>   gdbstub/softmmu.c          |  42 ++++++++++++
>   gdbstub/user.c             |  62 ++++++++++++++++++
>   softmmu/cpus.c             |   7 ++
>   gdbstub/meson.build        |   8 +++
>   14 files changed, 259 insertions(+), 160 deletions(-)
>   create mode 100644 gdbstub/internals.h
>   create mode 100644 gdbstub/softmmu.c
>   create mode 100644 gdbstub/user.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

