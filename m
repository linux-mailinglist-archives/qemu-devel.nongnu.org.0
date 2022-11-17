Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDA62D599
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:56:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovahJ-00031i-4g; Thu, 17 Nov 2022 03:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovahG-0002zN-Dl
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:56:35 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovahE-0007yY-LO
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:56:34 -0500
Received: by mail-pf1-x42c.google.com with SMTP id v28so1126257pfi.12
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 00:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kqJAP6tjAIDgERt4KrljqFtOkRGiex31JOKGKuiDpq0=;
 b=Im/I/mYlywvsSzNCa4xHczSONgg/jyRu1M/ZL6tcHz03ekvAPI51mucQtCPUOF9LsA
 nmpRs2lfsyTNCevvh2y6CyKFkUiNQBEX8jvZGU1KrcUNpbLXkK0TIdQZ3zTURJyRUuYA
 Afbevus5EM7wSePr18J1rKlb0RpmLfTdAQlG2+zmLlDk61ACYa6aQl74cLN+MrPPZ1j7
 vTHBQjh3q5euFvRKQkvjBo/E4YO4oCApXyBCuoWYJzVVZv+F/bk3KXB+e9OOc0T25Pn7
 82mkZ70auwYRE2dsKAUjP4dwnD4bMFbDesjG8bvaIlYyLXedYkNd3HEOMxU26O4HvHFD
 NAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqJAP6tjAIDgERt4KrljqFtOkRGiex31JOKGKuiDpq0=;
 b=eK6e4pg6+3J5qnJqPQKQDPhKJswUxXaR5ZTT2I2zXUCk0qHfGD+YnGnnhgp6w3xUUX
 s8IKrOqQyC2/Q+VIydc3HdXNRRy6Zq3m/FafKcxYQD3KxZlwQGTmgxVXLunOC9WQw9P1
 K1Wrrug/mUo3ChpxiPax7uo+kKdouLlttSNZYOb9aQEIXcVpDToN9UIAcqFa066jkzcR
 kUwM75iT4qdQCFguToS89Y+EBJFAZt95FllrXa+dvvUtUET2NwdcrLValmFehrlcRGUQ
 +JX6Q0NDu0kLQlkWH+dY/2bYd3jQYI88wZ44+gOtaWm++T6B4j31S65ffhEy6tcjfoVy
 QhTg==
X-Gm-Message-State: ANoB5pk6ZXDc3xeDvDFr6JUmzaSoI1DkqV5vyYNlZRiE41qf5gCLvSik
 W2u8a9f9reJwLZivMH4TS8sayw==
X-Google-Smtp-Source: AA0mqf6BptuwrFNreB4Uvv0VabtT4vDpVMTJUu+QLx+3CcrsX+kKQTimAh+QR2iNKpIpGQyZYO8w2Q==
X-Received: by 2002:a05:6a00:140c:b0:56b:b520:3751 with SMTP id
 l12-20020a056a00140c00b0056bb5203751mr2035043pfu.29.1668675391076; 
 Thu, 17 Nov 2022 00:56:31 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a17090aa38100b001ef8ab65052sm414965pjp.11.2022.11.17.00.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 00:56:30 -0800 (PST)
Message-ID: <703801a6-b625-6af0-9b16-f21f1372e630@linaro.org>
Date: Thu, 17 Nov 2022 00:56:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/9] target/riscv: add support for Zca extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/16/22 23:03, Weiwei Li wrote:
> Modify the check for C extension to Zca (C implies Zca)
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>   target/riscv/translate.c                | 8 ++++++--
>   2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

