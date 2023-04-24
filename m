Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9DB6ED11A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:15:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqxtL-0008Vc-H5; Mon, 24 Apr 2023 11:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqxtJ-0008Un-Bs
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:14:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqxt3-0004CQ-9L
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:14:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso23496255e9.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682349231; x=1684941231;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tZjFpsjH9KwRGs1Xw7KVm4iOu5s5Wg9hcgInk3Dpzyo=;
 b=wwat/lrOq+6KJuHy+kVpqjWgZUIYPBZohLAmgp0K1NV4xAr5v2kcaQFfiyhUrFBwIY
 trvKY7b7U1vj4iUyZbnlEEra8y2y9sK8eWXc0Th/EtoTK+Pq2h1g8DMqqRNacob0waAT
 7odltxd9exXWlENxGkGkOqFWS5m/gmopBv5ymdfQvEw4R+cfYDFfC7/xs6UTl1z+QqHM
 3Y/6w7h+9ejCf3+AudKGqNgtUkRx+WaeLBf7FQgOPTebg/uqYQ3mJ0/j63CsO1Cf4aKw
 zMxudbJV6YFHopMqQayF2Y9VB7qI6PUxSpNJe+Tc57by8XiKac9Zh70PtQyZ7SEbVqW4
 IK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682349231; x=1684941231;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZjFpsjH9KwRGs1Xw7KVm4iOu5s5Wg9hcgInk3Dpzyo=;
 b=baTmN1yodkAVs59rAjwfdlP+fObU7E8c4BxFE++uPift6ett3KRXO79Pb5aDfRc5al
 wYBPSrGghzxLQFmIJ+hn1VjI52VXuDiO0aGIMJgbbVkqMHVffLYMdXxzRrdLi8rqOJ5O
 nbD9CCW0z1KLMAz8WFdFhflUOCY0RXam8ega2MdPCZxfJ7+dwoRtnzkyChh7h//9pzFy
 nkBazYyQuMbBFYZZ/LPBpodlfYIaZV//2tYfDuHoTqAJ8f4Xqnf6pEVOiEdqpvPTXue5
 qaw69bJkwj0FEptreR4ruZ4fq1Gx0QlahX1YRMLDmSNJZ/buRuhQ1mT6FhzO3XGOnDzz
 DHIA==
X-Gm-Message-State: AAQBX9erkmafepgCl9JSKsqwpk4XodQnVNkdYjx0GNXgWwEUyRQNikI5
 ZXJMopxYzilHps1Q5J1eL8enuQ==
X-Google-Smtp-Source: AKy350ZQDrXGhxcTDhtS9cvekzhebDccSpmtEh+IT6qOU7r0ntt35KFdDKtMsAyCQhSnS+dqPsvaMQ==
X-Received: by 2002:a05:600c:364c:b0:3f1:95af:172c with SMTP id
 y12-20020a05600c364c00b003f195af172cmr5718297wmq.41.1682349230937; 
 Mon, 24 Apr 2023 08:13:50 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm12328850wmk.20.2023.04.24.08.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:13:50 -0700 (PDT)
Message-ID: <c3c71863-b67d-efb9-2edb-35166b34bbf3@linaro.org>
Date: Mon, 24 Apr 2023 16:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 20/44] target/loongarch: Implement
 vmskltz/vmskgez/vmsknz
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-21-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-21-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/20/23 09:06, Song Gao wrote:
> This patch includes:
> - VMSKLTZ.{B/H/W/D};
> - VMSKGEZ.B;
> - VMSKNZ.B.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |   7 ++
>   target/loongarch/helper.h                   |   7 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc |   7 ++
>   target/loongarch/insns.decode               |   7 ++
>   target/loongarch/lsx_helper.c               | 113 ++++++++++++++++++++
>   5 files changed, 141 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

