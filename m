Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD1E47B3DE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:42:07 +0100 (CET)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOXu-0006zU-6i
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:42:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOUl-0004fm-4h
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:38:51 -0500
Received: from [2607:f8b0:4864:20::532] (port=46670
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOUj-0005qF-6S
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:38:50 -0500
Received: by mail-pg1-x532.google.com with SMTP id r138so10238952pgr.13
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 11:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XlIJnEe4/EuB0SwMKCDBr1wmwFasJTbdUD4zhd/HOQQ=;
 b=IBFrLgP2U8mzotsL/Q5cRMX6NjFkcJIPBFR4d7vTPIJrvSidUKhatVL82ak5MurfP/
 1KmftcuONQuXWmw0GybV0ZHw6jEx4lGCiBHQwbqqyQuzXOI7s9TRkpjPjRVnMpTuKIb0
 85aoN9jrq+32gGsVmkGNz1j8XEjmXdRv8sijnuWEmZfjf069MRJ4nALCrqST2jqYu22A
 tyJUEqImjbQVjpxcH9kFUzBnTUskxqQ6qvbiMXXc/ru2xNTVmDEtXoEK6LTr43N3BWG2
 TS2y+y0YJ2p1Y/IwW2TZaoi9n9Oo/2FqQnjhkVnR5qBHkzpRxNLLNg6G7/vXOs111k2p
 37WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XlIJnEe4/EuB0SwMKCDBr1wmwFasJTbdUD4zhd/HOQQ=;
 b=l+2X3ZeBYTMaK7mwOhTcOSRJKv3L6KVlhu6JWhHiL80ZZ5aErNqFCcSz8AFKvdFKN9
 MwGeLDXe8KMjLe7Li1GQc1sAESm3DAoJewAEOwUIGIp3drRwXIIxF9Kz/LNeBbm20fFs
 RxbTCvkPeuTuJVAd9MqcfNJTX3FUEQlpErGPwUbufyWNRXQVNX3iyqjMF6jtUrYEHZP7
 juACOezsre+WqZ0RrK2J/UC13n3IEg0xCggStIHmd0A2wAljP8oieYjnHVzX4/1BXjfY
 UReLYxCnqGktrgrsJzubwHqmFTgdUGUQvOgf3mC/+x7xJ0nP20Iu1pOCzi72dddNHIow
 NFRw==
X-Gm-Message-State: AOAM531s+1NlBUJSUaWNEKxmkskIPekvdOQOvEthwBrxFn6/Uzf5ft8U
 LzfZiMiEZk2svJtviGZ+uqICaw==
X-Google-Smtp-Source: ABdhPJzl5IF0f7UsyeugcUJfKXeU/ZEMRtKMXke5zHBYonLJyaG1nPlssvCMUIuVwvI0EZk7Hy8+mQ==
X-Received: by 2002:a05:6a00:24c1:b0:4b8:574e:574f with SMTP id
 d1-20020a056a0024c100b004b8574e574fmr18104144pfv.38.1640029124709; 
 Mon, 20 Dec 2021 11:38:44 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s21sm19812276pfk.3.2021.12.20.11.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 11:38:44 -0800 (PST)
Subject: Re: [PATCH v4 2/3] target/riscv: Fixup setting GVA
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
 <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61eedb9c-8645-ba35-be31-370f5a13a858@linaro.org>
Date: Mon, 20 Dec 2021 11:38:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/21 10:49 PM, Alistair Francis wrote:
> From: Alistair Francis<alistair.francis@wdc.com>
> 
> In preperation for adding support for the illegal instruction address
> let's fixup the Hypervisor extension setting GVA logic and improve the
> variable names.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_helper.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

