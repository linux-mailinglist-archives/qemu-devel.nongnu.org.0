Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808613FBEA1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:58:00 +0200 (CEST)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpHz-0001yn-Ij
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpFZ-0000OI-Vb
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:55:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpFU-0004O3-Ny
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:55:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id u9so24412617wrg.8
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qjkXnS+UFv4aI6I7n2Lnn/XT+4sWjNnJhRCaP0ewaOA=;
 b=u5/3aYy+drqSu6bQAU424thkkDpi1LNGj/NhZwbOz/6L+vNyhUbtuh5Jrgq1YE5jbx
 iW2qlEaf7Up8UB7XE/8AuqBZE/JFQRxiSFW2L1NXuW6C9QfzwBlbv9RudPOfMt7Fy5FI
 KJBrZoPmngMCvmTYHZW9ujkiOgqvMBE3lN6ryx6juyrMOuCcVz/clOFB4aTbhWE/jIgZ
 Cs48r839DK6IB4XmSNNvkQ6Zqh1c8sJGHewYUbsbGwGaJIMkYVQJ8FDl0h0IuZVjrbju
 Cbt2OG5WRbQJ87RIQ0x6kjlJf9Ln2Lc9m4Fc1hnlXOjZgeWWz5cmAK57x6cStRt02BJP
 CsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qjkXnS+UFv4aI6I7n2Lnn/XT+4sWjNnJhRCaP0ewaOA=;
 b=nL8VLvVouHuAX2lkRDiRsaMjgBcpdooRsXYL3MhAWCYqwzERDWTLYtafx4XuiCzjcU
 xb3IzEVUTSceVDhPLDjo26eYa1A6p1gul/Yu1Cp3KhGvnxAmDHv8AUG+DWyMy6L2wOZf
 Vl9EE1bz19iSKqoRn0eNOo3W083wSjeVwJzjG7YfWBckJ82aj2YA1MXgQHW0itW8pSUN
 zSgrDrjTvzM6mP4vOV/nviin5irobqcI9GqB9f+E6DQgobyjb+iEEnyXpkG8oONhwJjU
 1qt1LXNHvdAUbBMfkV5yhG5Ca7GcrNNfc+TWnj5+jFQW18YkdCNdhZq+sqnPIeJHLwfp
 fP0Q==
X-Gm-Message-State: AOAM531MhF82Ip46RMVCodlt4rfunL7kJr7FT/8M/O1wfRPuSYaqJDiP
 h42P5bopQkMd6/yvhx/p14zg3eAfqC4=
X-Google-Smtp-Source: ABdhPJx9/x5t0Wd3QNmol6sclVex8dzWwAN2aETC4XSdoC6+29kZRo9Rr//0iHxD0f2+6cK8f3BPQg==
X-Received: by 2002:a05:6000:160f:: with SMTP id
 u15mr28390749wrb.166.1630360522962; 
 Mon, 30 Aug 2021 14:55:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v62sm80679wme.21.2021.08.30.14.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:55:22 -0700 (PDT)
Subject: Re: [PATCH 31/48] tcg/optimize: Split out fold_xx_to_x
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
 <20210830062451.639572-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <100854e2-2b29-9b13-2412-6455c930caad@amsat.org>
Date: Mon, 30 Aug 2021 23:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Pull the "op r, a, a => mov r, a" optimization into a function,
> and use it in the outer opcode fold functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 39 ++++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

