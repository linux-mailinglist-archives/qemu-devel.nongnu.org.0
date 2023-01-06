Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49A660731
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:34:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDsT2-0004AP-FR; Fri, 06 Jan 2023 14:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsSz-00048V-VH
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:33:26 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDsSy-0004dF-Cj
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:33:25 -0500
Received: by mail-pl1-x634.google.com with SMTP id jl4so2664513plb.8
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yfj/aOfOGn5FVHMeMB5r6M7vACt0qemhPCiKlapY0lA=;
 b=M1F4KTThbY4xbHexEOpVSs15jdvHtOSY5ugA5eOP6VAomA7UYldUgWLhK8m8ulBhp8
 U4LQ46cioR22pT0EIPGrmazOU73QIJ/HWlc69cDe80Rh11foBhrQyqBL2BrAWUT7Xs0s
 8YXQ+lF3ah7LNBm/Ec18s9lQLjB/xOxxhB8Jc+S69CxELvjaFVSRiKtLNw/DsA2/69Q9
 pWHr+abDy1RtmF3qE/fG+70iV3/RgbMnkIo4ly/JX31753gqSXprw65Zik0dAqGtud+i
 zM8Y4OYNYei93z8Jb+XeEJ0EjJPYtOsb8BWsXTPv1ZkrlJLK4GaqcEgkjAHGj4b2SPYl
 ul0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yfj/aOfOGn5FVHMeMB5r6M7vACt0qemhPCiKlapY0lA=;
 b=bm8tuh9JTvvJHzK9mK213BgvTZ04kitiexsn54IBOeg/4ulOnbb80FlhiM8S5GEHpf
 aMQz+RhzmnL0xeZWS5iNFZJyFzfpLnq6bsrQfxV3l3siVwNgp0bRWkjBIuM8J+Kqdqz2
 rCTbghgyBPA1DwhYmgMG9D5iat6vSVAgMyNm1iPASJkRKMupI26oL19kOtYnmvoTqr6/
 //DLbzV19GySQW9j1RwuTrr2d71831z6C3TisQX/QbC1qPoXkJx8eL+p20t3vvXZIVHX
 bJFwSt0L/9inS7PTJuDQuJPTAZwc2SKveHPctWTETaqQfUj4w64ULIzi15a/hRPTj5uA
 ltIQ==
X-Gm-Message-State: AFqh2kou84QcjIp7qgzaJO3WwhmAK4PGyUMQYLnhDpta9xonloOf4GNr
 nv9/7H1PKCj2PBGoFEFp8jqVBQ==
X-Google-Smtp-Source: AMrXdXvBhjLKQBoY/RRiikumeFN1AIQMWZw7D11r7USeg09RdHsCktE0RZg9FkrBV83NkG4BoejNbg==
X-Received: by 2002:a05:6a21:596:b0:a3:9ca0:b982 with SMTP id
 lw22-20020a056a21059600b000a39ca0b982mr65334381pzb.26.1673033602537; 
 Fri, 06 Jan 2023 11:33:22 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 84-20020a621657000000b0058124f92399sm1418039pfw.219.2023.01.06.11.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 11:33:22 -0800 (PST)
Message-ID: <b52d4a65-3aa7-d9f1-a589-a0db64ee5e78@linaro.org>
Date: Fri, 6 Jan 2023 11:33:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 16/40] target/arm: Represent the entire MPIDR_EL1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com,
 alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-17-richard.henderson@linaro.org>
 <CAFEAcA-m32sjkQSSkM1QopiqKgn+4OLTxs+c3w-+zck8Ns86yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-m32sjkQSSkM1QopiqKgn+4OLTxs+c3w-+zck8Ns86yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/6/23 11:16, Peter Maydell wrote:
> On Tue, 3 Jan 2023 at 18:24, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Replace ARMCPU.mp_affinity with CPUARMState.cp15.mpidr_el1,
>> setting the additional bits as required.  In particular,
>> always set the U bit when there is only one cpu in the system.
>> Remove the mp_is_up bit which attempted to do the same thing.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.h     |  7 ++--
>>   target/arm/cpu.c     | 80 +++++++++++++++++++++++++++++++++++++-------
>>   target/arm/cpu_tcg.c |  1 -
>>   target/arm/helper.c  | 25 ++------------
>>   target/arm/hvf/hvf.c |  2 +-
>>   target/arm/kvm64.c   |  4 +--
>>   6 files changed, 75 insertions(+), 44 deletions(-)
> 
> Based purely on the diffstat it's not super-obvious why this
> is an improvement. What's the rationale ?

It gets rid of cpu->mp_is_up, set only by cortex-r5, and then generalizes.

> Side note, we don't currently handle the MT bit, where some
> CPUs end up putting the cpu number in the Aff1 field rather
> than Aff0. We ideally ought to handle that too.

Would that be set by the board as well?  I don't think we model cpu 
packages/clusters/whatchacallums at that level currently.


r~

