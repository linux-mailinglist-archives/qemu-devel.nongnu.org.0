Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBCC39EA90
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:09:11 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPIr-0002jT-I1
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqPFP-0008ID-0D
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:05:35 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:47004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqPFN-0001u0-42
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:05:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id u126so10352541pfu.13
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 17:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ru4Pt11rHfbmOsc3E/fnMp57c0vk6AlAkutLtvLahAI=;
 b=FUmC/X15pJM6GwtQAcDKbl8myRwGq7jgXhEftOBFvlRPZ2/zJBOcBH2g8RH/aPa/Wo
 QXFHqJxgljE6COFarUCCWp0X2UVJ2Rn/6o1sVeLnF7zfdKGIEYaPkYsR0WyXOWhBKopG
 bBqYZB4tXNe7hIgJGrRvACI3wfjigUTmnZjYxIQUOewwM9mtBkhXcV5DKwCs8ebskOWA
 STQOt2RWsnJJiWKWlCiNPdw/iTj2xGIpkCcIXxTC2nX07bWDc5HH68HHm6dXGH8kivSO
 9+YSfzaS9YUOqDKNTKrA0kU2zf2VbV4asEbjvpMMS/GGtV7rzgVPv1KEM+RgW7yG3afk
 5bcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ru4Pt11rHfbmOsc3E/fnMp57c0vk6AlAkutLtvLahAI=;
 b=WCmwcpdlKzkVJOn7LWPaC54YaLPYG0suZ2kYOya3xcxiYLonwb2E2RGWjvTmU7Cg5V
 2XtxTZ49NFxPFyfse2s32JzeJeeunymQAYkQwy9IN5Nz6MPDXha/0iztoz0xC19XjRXn
 MlXckJJ4i2WcYOy/Aix13Jn6fyL/eLXgEBL99w2oaa3VwQM3lC6zroZWYttPEM6eaXrj
 DG0LN9LgjrY+gZeEXWZeFVNUH2yntdSNL5fGQwDSgaAFUMNwndwv3enXFlrBnmWPf9kQ
 QoFNACmRYk3WogqRco9YkUjSRftFTUvnRrym+nTVtpuDpkOqpe7m6E5T2UIgaQ//Ldni
 FT9A==
X-Gm-Message-State: AOAM530ISEagoaHHJjSc3lfegB8yRWECFKqrYN/Too38Ix1tLE3V9FKb
 hU9ipAu0D5oi7HlMHlwN+QrglY4Lg/zykQ==
X-Google-Smtp-Source: ABdhPJweM1fPz8oQYKcmeCJUgk+TowKqFLftlB3OwwDKioyYgPnsyJ4Sv5hEKVRX4SIwIUmlH1xfyA==
X-Received: by 2002:a65:5802:: with SMTP id g2mr16530436pgr.129.1623110731260; 
 Mon, 07 Jun 2021 17:05:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b124sm9065338pfa.27.2021.06.07.17.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 17:05:31 -0700 (PDT)
Subject: Re: [PATCH 06/55] target/arm: Implement MVE LCTP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a431ce0-0c85-2f40-33b9-cb012e892c17@linaro.org>
Date: Mon, 7 Jun 2021 17:05:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE LCTP instruction.
> 
> We put its decode and implementation with the other
> low-overhead-branch insns because although it is only present if MVE
> is implemented it is logically in the same group as the other LOB
> insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/t32.decode  |  2 ++
>   target/arm/translate.c | 24 ++++++++++++++++++++++++
>   2 files changed, 26 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

