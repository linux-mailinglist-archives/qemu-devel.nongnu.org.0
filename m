Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9866AD340
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:23:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZL71-00026G-0K; Mon, 06 Mar 2023 19:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL6z-00022k-0E
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:23:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL6w-0006Dx-CJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:23:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so6264694wmq.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678148600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8eiAeSolVQI18uIFOs6HobNFu/RILK/fSRKCEoKLRCM=;
 b=k42FnOdvQeNfAykJkdKLAMy023o1kbNULKJly99BuhmhkBZ5J3rJIA00aeUqqUZNhp
 NJ2z0N7K/RYJzuB6ZavvZxY9ybTjmA5XNDPFiUJV+okw8bBBECbXia+W7GB935vLUx8G
 C+SHu6ymDDrTV2APNKDmw+7ikz44SMbGbt4NhKHPyzPMYjZ8T0NC/f+vWtFlP8E2N8/7
 pryKr34zJgQJCS0F/6jHzgkmSUUmkpfSndfZursz+P8i8gYCKtKPCqEgsZeagO7IZLG4
 dD3kRFogunx8rK5iWOnSYgpJFKHUN58uYCZCH+KRZYSrfk7Vjr4thn79I8P0P9vyWZJw
 GGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8eiAeSolVQI18uIFOs6HobNFu/RILK/fSRKCEoKLRCM=;
 b=EdEi4U8ecbOlDpNLqp/S4XG9YfnNciL/Pv1FopfVt5xrUw+QgmihZ6Zp8f51FWccpT
 9QMGMiryW7+6foh0aPRhRN5S/dV3oAKoUi/N3I+KwhQU7WLeb6IORRzWtzt8s1XcUQGf
 44A4gNqtPsWClI/QSdEI9CkB5iD059fLehSRP1XyTVd/ps4VmMxtyE70OoiXu3ssORMq
 Qy4S7oh4lDpg6Lc2l6uiXNpYTG/zmztlihg9TrC923hh85E9fP1bEqaxNvIJ2Xd1AQed
 k91GJ26oNhCg/E8mLigLEnV9Iv4ubRD0k67s/LyUP+1LxHq1Aq3n/ywS4nPf5Ia81j8H
 TjXg==
X-Gm-Message-State: AO0yUKVYX13WjUi1w+nckOEps8uJDb+jpQWXgDE/Zm+E5fo42brI6KMp
 JIkC41T8uyC8KoQWqE3HnUSqQw==
X-Google-Smtp-Source: AK7set9P7Cmd1hHKH+dzz1S8iIWz/H/mTBNWpmtLryH/VsXVvBnVmM4OB36ljLfM3MLiAZBHt2sCuA==
X-Received: by 2002:a05:600c:4593:b0:3eb:29fe:70df with SMTP id
 r19-20020a05600c459300b003eb29fe70dfmr11961673wmo.35.1678148600608; 
 Mon, 06 Mar 2023 16:23:20 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b003e204fdb160sm16292163wmo.3.2023.03.06.16.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:23:20 -0800 (PST)
Message-ID: <f455f031-5d7a-604a-3e6e-6f2b17807509@linaro.org>
Date: Tue, 7 Mar 2023 01:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 52/70] target/sh4: Avoid tcg_const_i32 for TAS.B
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-53-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 27/2/23 06:42, Richard Henderson wrote:
> Since we're assigning to cpu_sr_t in the end,
> use that as the intermediate temp as well.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sh4/translate.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



