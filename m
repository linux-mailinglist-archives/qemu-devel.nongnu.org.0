Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E204F5110BB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 07:57:17 +0200 (CEST)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njafs-00083w-K2
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 01:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njadl-0007DV-9h
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 01:55:05 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njadj-0000fr-Ci
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 01:55:04 -0400
Received: by mail-pj1-x1029.google.com with SMTP id iq10so608541pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 22:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=L88opZZB+RX2PvcQGJvmmr0YSogbZBemdEa8C2Pd/b0=;
 b=p6DH2056z1p+5DcfESEgf1QcLsElzBe5vhb1kR6/fP1SbY9ixg/zI2hoUnxsQjVVv7
 14sh4G7xAze/1K3j2DA3IEgZgCvXMJN2uu5+a5QVrTmxBaBkqb/f5DpYMQLW0dVdzVKd
 jX67Ts8z2dgwc/oXc9og08wnicfeFC5H6PkaYUuRGkvWN9oNmwzKTEethPCnhMBQ1gwM
 dd925s+neiTuiEqW0CvR7Y5K0RRGkE2yJW/HIvKcquoNBcBJRPQk9mzIRPcEJgGiTb8l
 nmxcfddo7VyC9DKvHLq11p/Trh8guQvtG5Stgto1b5boUV/TNVkZcCuhAbpPbXfqQGU5
 hr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=L88opZZB+RX2PvcQGJvmmr0YSogbZBemdEa8C2Pd/b0=;
 b=Vd798s42Y+1gemu4b6QkY3vBwtBmbWt4OBUnv0HoEIuWUTx4oYZD8RQYqOq/mYzp5a
 kYAoDfnWoGdux9OZ2JGTO7tYMd0kHgeTTM4MV8y3cv1NsKsGF0rUbzi/Xykui6UJqtPr
 o/RGiaA7D3HSh12hxLqf4vFH/PA5Qj3V4VME9uMyYRGx7cmTUng14YVJTrWI+sMli92n
 VNZejHE7+mpSp/7zW5A07Jas0viC73IoVEDfg9g3yHJOtmAmbEfnspbxmFgyqNoXvFpS
 jJVRfJx7ktHTIDIHDGLVV800K0SMd9tJfdVenRAHymlCnlETK2MNSgJNTdyyNsN59df5
 0nEw==
X-Gm-Message-State: AOAM533W7RNWv0g04CUZOuOGBIzwq6i2PhibWtPD56IQDAa3rO1BxFrl
 h4Wdti7RHVfwlAVyefaeDhbv4tV3C5QcNA==
X-Google-Smtp-Source: ABdhPJzotxa3oaiflrsuDtpErRmE/e1skidvwVSW6eyxxTWWbQhVAhLoMya21kTYlarPC+Mqnq7thQ==
X-Received: by 2002:a17:90a:4bc2:b0:1b8:cdd3:53e2 with SMTP id
 u2-20020a17090a4bc200b001b8cdd353e2mr41151488pjl.219.1651038901683; 
 Tue, 26 Apr 2022 22:55:01 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090a748d00b001cd4989ff42sm1022877pjk.9.2022.04.26.22.55.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 22:55:01 -0700 (PDT)
Message-ID: <027a957c-9f50-6f52-aafd-66c8a701ecaf@linaro.org>
Date: Tue, 26 Apr 2022 22:54:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/6] Coverity patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220427043942.294654-1-richard.henderson@linaro.org>
In-Reply-To: <20220427043942.294654-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 4/26/22 21:39, Richard Henderson wrote:
> The following changes since commit a72d9008092e39c2c37e47a91bae4e170d0f1b33:
> 
>    Merge tag 'pull-nbd-2022-04-26' of https://repo.or.cz/qemu/ericb into staging (2022-04-26 14:39:09 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220426
> 
> for you to fetch changes up to dee3fcfbb399a0e4ccedbf737b5b0b7f56ecd398:
> 
>    softfloat: Use FloatRelation for fracN_cmp (2022-04-26 20:01:55 -0700)
> 
> ----------------------------------------------------------------
> Fix s390x ICMH cc computation.
> Minor adjustments to satisfy Coverity.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Richard Henderson (6):
>        accel/tcg: Assert mmu_idx in range before use in cputlb
>        target/s390x: Fix the accumulation of ccm in op_icm
>        target/i386: Suppress coverity warning on fsave/frstor
>        softfloat: Fix declaration of partsN_compare
>        softfloat: Use FloatRelation within partsN_compare
>        softfloat: Use FloatRelation for fracN_cmp
> 
>   accel/tcg/cputlb.c           | 40 +++++++++++++++++++++++++++-------------
>   fpu/softfloat.c              | 20 +++++++++++---------
>   target/i386/tcg/fpu_helper.c |  4 ++--
>   target/s390x/tcg/translate.c |  2 +-
>   fpu/softfloat-parts.c.inc    | 11 +++++++----
>   5 files changed, 48 insertions(+), 29 deletions(-)


