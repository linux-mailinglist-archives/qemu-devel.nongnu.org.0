Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7084420D6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:28:34 +0100 (CET)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcyv-0002cO-J5
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbdg-0001TH-7T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:02:32 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbde-0001Yo-3y
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:02:31 -0400
Received: by mail-qk1-x72a.google.com with SMTP id bk22so10603661qkb.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZULscigEOHCo3XZAB3j2TZi34Vn6nCZmA6/Lz5iwgjo=;
 b=BJTTDCiZ7hZfMCQMQ8/iHPG/wfun/gNMohsj2VTdlrCfLWbtHiBaL988kqVoElJUzn
 ++lCNRPE43qHqqgPpTkzj9pP3v42AOYHfWePYQXH/TmWR3mupRPyD5u8OvqB11siJfib
 UKxNz5xnc2R9LFkcwUx/OMJ+3dVfzfTiQ++Xxmskc2XdmaN25rLwe+bYu45lI1P5RPMw
 O7exyHCB3z9WsSUDpTfq91VnyXOhZ/5+KYr7l4BUYnpwUOLkXmB6y2uPpx40b9QjU6Ao
 5+sOjzWrmhVi0F+kTf3Ypfx01qq/IvnfFmEpsWp2bt8ExQZ0qMk17cLbQ7w2jKIfMk3g
 7K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZULscigEOHCo3XZAB3j2TZi34Vn6nCZmA6/Lz5iwgjo=;
 b=RPGl5Fx69Y+/EQC/kDEmAfnGUSYuqdK6uVGrCDtLx6JmG/+lZIIqedXtX7A31Ne1mV
 jgKxZtjDUbMjoIhmEN7KuRBqH+l9utOaA01gDz3MPvUqlasYnKoVeYOb6ahuar8+33xu
 wMTXCCkFlngcwgQdQXpHs/Y6JxEDaRR7866L+nt0g0xa42poVJuY32S+b4sf06LXJXQC
 qRzZ40cm2hznc1ePCor54eLfW1jazIRsnYTG3pptRKGWFb+jcFYIAJumFcMUvRlF+HAn
 oU8PMm8b6sJAOl2bs4RVCKqxshebF1nOzBjl+WmXVtqWoT8YP1vxUAoHifAaJ3IQcgjm
 HSlg==
X-Gm-Message-State: AOAM5314hAnZOBFaaErKpXDWPcPS5lWjOEhcN0h/uIjqOZ768YIb6lxO
 jUCWa5dIaTPSUJZJZfDOR0nW9A==
X-Google-Smtp-Source: ABdhPJzzWidWnonhkzC0gELjWVlAXmxo1LGO68PpE4hwUogTMEk1nhpCL0XCQwSLiB5/5/KQzeiW+A==
X-Received: by 2002:a05:620a:298d:: with SMTP id
 r13mr23751575qkp.428.1635789749124; 
 Mon, 01 Nov 2021 11:02:29 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h20sm2967501qtk.93.2021.11.01.11.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:02:28 -0700 (PDT)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211026071241.74889-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0cd15efa-d00e-fa85-47c7-6e3d11058cf4@linaro.org>
Date: Mon, 1 Nov 2021 14:02:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026071241.74889-1-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, kettenis@openbsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:12 AM, Alexander Graf wrote:
> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
> into user space. For MMIO however, these have no meaning: There is no
> cache attached to them.
> 
> So let's just treat cache data exits as nops.
> 
> This fixes OpenBSD booting as guest.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: AJ Barris <AwlsomeAlex@github.com>
> Reference: https://github.com/utmapp/UTM/issues/3197
> ---
>   target/arm/hvf/hvf.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Thanks, applied to target-arm.next


r~

