Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FDA410C5F
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 18:37:58 +0200 (CEST)
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRzpE-000510-QA
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 12:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRzmL-0003Lx-56
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 12:34:57 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRzmJ-0001BG-JN
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 12:34:56 -0400
Received: by mail-pf1-x433.google.com with SMTP id 145so36378pfz.11
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=90lgPDHa4LiGn9eoSjLtuyVQoULt57f9/hLve0hbrT8=;
 b=S4xJd4tNktBd2u6EPFZ5dlOiRW6IGSZsgx/gO1w5QyWXnG1A21gtPWXBpeIwX5KDNr
 EpjEtG2swOKNY/evaRt+hDbppU3moXXYZC/BB/tY6Yy/xYC4YT5dVKFbKlpPLRaYPXNo
 hYVjeHotqTDoebIOKGPWBzS8c5pNm74ENijFrmHmc7IWl2pmQ1YJh3UWrTIQKMQ3w2nQ
 GloPfo877d5Xz3V/tByktfTo4VXQWfJMqttbkrJUnRsyn+juFSz74kDvQoHZ6tof5phi
 tdAMN/jCzVuNMOusPELGQn8K+p008QkEiW3FehEt6sdWaRHmwQSVZ6SJry7Ws9M3pVc0
 6tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=90lgPDHa4LiGn9eoSjLtuyVQoULt57f9/hLve0hbrT8=;
 b=QCVJlsY5KOu+bK47gTsfOLdswo0skA2EsHQDu7BmiyfSXrqVF0tZ+1R1kZ30R+bea1
 +dVtAgbbLxXG40xXp4hpBTsajnbikMmwQwYJE4DF/2JMPtlzC8CYHfxi7GrSD2Ftdsv6
 8b+MuLBlvT+e0BxWZJrBoTu3jDvJ/gXh9++jFBAi6r7Pq/aT2zo8ZEQicplr9FoDO897
 7vWa5bmJOR5QwdxT8+UxeThNAG9j/UsNvaw74nP9zLPFjCrdk/mLshnqv+aoc8SK+539
 eqhK06YNpupaKYUSOh23dZCZJGXfnZt4R1aZQ6Ftt1VG12yPKU7yz6n4L+52r5FLANQ2
 Qoag==
X-Gm-Message-State: AOAM532JBnDMbEL2LBy+qoDVYsKFtfaNaL42srueJHZEP1bVoMSzxN6a
 pEEBzM5Wx3Ly6xtv0F7DuRdvyQ==
X-Google-Smtp-Source: ABdhPJxfUosO/CJZuBKVbFFj5H2d8bcrbmApcit8kDEvfThtFtuezK70zYgt5VaKvQS7b+Xv8yps4A==
X-Received: by 2002:a63:5663:: with SMTP id g35mr19690782pgm.368.1632069294218; 
 Sun, 19 Sep 2021 09:34:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t10sm12767977pge.10.2021.09.19.09.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 09:34:53 -0700 (PDT)
Subject: Re: [PATCH v3 00/25] linux-user: Clean up siginfo_t handling
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210919015718.466207-1-richard.henderson@linaro.org>
Message-ID: <91de1c9a-e39f-72f5-cb1e-ca40d5359f02@linaro.org>
Date: Sun, 19 Sep 2021 09:34:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 6:56 PM, Richard Henderson wrote:
> Based-on: 20210918184527.408540-1-richard.henderson@linaro.org
> ("linux-user: Streamline handling of SIGSEGV")
> 
> which is in turn based on at least 3 other patch sets, so:
> 
>    https://gitlab.com/rth7680/qemu/-/commits/tcg-siginfo
> 
> Changes since v2:
>    * Rebase on top of sigsegv cleanup, which eliminates about
>      half of the places that needed updating to force_sig_fault.
>    * target/mips cleanups+fixes for EXCP_BREAK and EXCP_TRAP.

Apologies to Phil and Peter, who gave me r-b on v2, which I failed to pick into this patch 
set.  I'll remedy that for v4.


r~

