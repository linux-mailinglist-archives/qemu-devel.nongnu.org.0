Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27816CCB21
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:00:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFUE-0006wG-Rk; Tue, 28 Mar 2023 16:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFUC-0006vk-Vh
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:00:05 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFUA-0000vf-Ct
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:00:04 -0400
Received: by mail-pf1-x430.google.com with SMTP id u20so8799248pfk.12
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680033599;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MXJ6vH/BfzX4iLvu6/D73tX3kAt3biSKwijnuaxFwo8=;
 b=SccqoRny/KviAKV+WMj0/9KER3me4UKnxzfVN/ABu+V0YmZMrRsZI2yYoAQnQEOZVk
 iZURspJQ1EzAW17w8gWqlbjkSTXegWBJ/DBXntMw/17RvAGGgYHPiamgh9rShWiTBdUf
 Fxl3gBi9sUDsYZNYHyOlaIxn/wYFabi0a2KAci0iwbtnzdAmVukChSfjyjs1D8OBaWgD
 Sv/TPY5EJMKo86UB/A20ELEvRSKYYEmXfMheSiij3P0d1gbfiIMwI2Ao2W14UijijEAb
 O5AJsMc5k/sJMuWGZQ0JWRYEPayL5yJHzquEoNtAATiWVOYmb7/ufU44lJ1DONcgkFz4
 1OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680033599;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MXJ6vH/BfzX4iLvu6/D73tX3kAt3biSKwijnuaxFwo8=;
 b=HiTPYr7IE72JuXJajRcDuu9VALlVjoBY7eOthguu12A8adGMgKdshXJg4B6+R0t2YN
 SY9S+q2YjnKwFvpUhclQ+DGMOdQ0uYHXLF+L3evwfCb/iyfQJX7UzpdzN7QRb8mw/+/I
 J3hk5YhkjbD/ghhEcZows1G1O+RhWvX+M2yC30qdmnqk6eL5ujmsmWZNFKijlMv9M5Fw
 24eXI+hxSUiQUQm5hbmciMgtds9WtN1EjGnshIQLtxOCUPc3o+799osY7gFpnB35NNET
 J9RCB9UG5hwGDeMdIgMy65IJTT+7C+YkxXpXcmAtzJm3jGGg2xqKjdBZRezQ3HrWnl8L
 TW6A==
X-Gm-Message-State: AAQBX9e+4+8kLnyoOZoiu2WnyGcQa6G1Xt/77V0CJYoo4gK919d5vghB
 7qccGQYYD6rDUiC1SkUWmDKG0w==
X-Google-Smtp-Source: AKy350YnyCWMRPw5eTZWg+3QHzGMKzJ28A6nHw7mJ+x6u7TD8qw73i0Zck+S4HrhPNgqApWns0F4vg==
X-Received: by 2002:a62:3041:0:b0:627:ee6a:2a40 with SMTP id
 w62-20020a623041000000b00627ee6a2a40mr15752189pfw.10.1680033599495; 
 Tue, 28 Mar 2023 12:59:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 y6-20020aa78546000000b005cdc64a287dsm21518379pfn.115.2023.03.28.12.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:59:59 -0700 (PDT)
Message-ID: <550e1fa3-ee78-a6dd-7b84-457886a2292e@linaro.org>
Date: Tue, 28 Mar 2023 12:59:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 05/44] target/loongarch: Implement vadd/vsub
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-6-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-6-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 3/27/23 20:05, Song Gao wrote:
> +    func(mop, vd_ofs, vj_ofs, vk_ofs, 16, 16);

Oh, reading about ASXD and 256-bit vectors makes me wonder if it would be better to plan 
ahead and have a function, or DisasContext member, for the length of the vector.


r~

