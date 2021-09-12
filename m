Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A634081EE
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 23:47:43 +0200 (CEST)
Received: from localhost ([::1]:36928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPXKA-0004DY-B5
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 17:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXIv-0002q0-B9
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:46:25 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXIt-0007kX-Po
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:46:25 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gp20-20020a17090adf1400b00196b761920aso5081461pjb.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 14:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R4C+sP4K0t/Vj8+v1Jgkq7mnZZF/7BXwfeDwyw2/Qk4=;
 b=w7ADt2Z73Mssry+kz1PcOi1AucxvUrv5PydlnE2V6YSC5J9296D4zkJAUbIvesat9i
 UUg5SRFrV1hEmoSmT/KLDXr6jUb6tzQNl9MwQE7AgcT5FCOaLZz2Hb+Dbm9DNaWizGd7
 mB+MrHHzbVsgNIYVR3z8GSNPyySoi0vnM6QST9sKI2TNFmVMKGMMMKmEQwIBbWsdZw+P
 LDmHTSweufzMBlNypvIe8AYoPH7u1hGYZzSPAE/kp4AbaYyhNevDZFOLWiBIjnUBJ88u
 5biniQrd9S1JM/OOOKb2g19gD5ijNm0ysEcAsr1PLA4O6lODVDoyAhmebJgSCw1rCIJh
 L0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R4C+sP4K0t/Vj8+v1Jgkq7mnZZF/7BXwfeDwyw2/Qk4=;
 b=hfNe9XI50C/c2pMC+wmnOiiQmPY/7YxdrJKloS92MrNRQgJJsqzzEBilUkoJktYOp0
 3LB1HusLNf0imvXuyzRZZ68ovHXIu9TxFGEWbMqourI/x8nu3IS2G5OjFcSNd6POnc59
 qxCgWb1Csh1uGwnali6cihMSSv3MUSrcfC30s9ZeZ2PagiktYjJujZV/FIC/cDw5IQ20
 T7Wy7rAqPdZCxeRM0+cGe1iT52lU72DRMresZLlGmb9inl9p9FE31pr0LA/8i0cGqI84
 DkQnAkfciZc28tu7+6dVVH7nxWFKP0Y8z3WR/hhzJqzeFSABAItCDWJvK46MeH+xevMO
 S6pQ==
X-Gm-Message-State: AOAM530GFLRQzWww8+XVmxoqFcsehEu5NwnSISENyeG+0ZuHBbfxM6KF
 XwMycmFjcj7ZbL473yj7D1UVjg==
X-Google-Smtp-Source: ABdhPJwlV2gLocNBH9z6S+M3ECAEoE270XNOA2HUKonHINwHdlj5OznmJeWimprrCbp2UfbhKLx2LQ==
X-Received: by 2002:a17:90a:1d6:: with SMTP id
 22mr6306774pjd.214.1631483182326; 
 Sun, 12 Sep 2021 14:46:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b27sm5557814pge.52.2021.09.12.14.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 14:46:21 -0700 (PDT)
Subject: Re: [PATCH] user: Mark cpu_loop() with noreturn attribute
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210905000429.1097336-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c482b924-99a2-c94a-b47f-1339cd224fc3@linaro.org>
Date: Sun, 12 Sep 2021 14:46:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210905000429.1097336-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/21 5:04 PM, Philippe Mathieu-Daudé wrote:
> cpu_loop() never exits, so mark it with QEMU_NORETURN.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   bsd-user/qemu.h   | 2 +-
>   linux-user/qemu.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Queued, thanks.

r~

