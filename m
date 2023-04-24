Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D796ED13B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:24:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy2T-0005Ek-IC; Mon, 24 Apr 2023 11:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqy2R-0005EJ-ET
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:23:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqy2P-00060E-Lm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:23:34 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so82705715e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682349812; x=1684941812;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=28WUAgZR1eOtsSlbE7IyJ+d2WBLb93mnfTJiGuv28yQ=;
 b=ricjNHpTf4O6luSaG8mPlw50JiVzWs6AljKt8Oqm4nuz4ntdRJzyG5+GtxuwEp0snI
 tQQaSn1TMFnbuVDniiAuLXpsHjGlcCYm7YFk8Sxi8qQFZlt5iNZun7BE+mvQQ/C4qGVQ
 utFX4pAGwbyVuDsBqRVbrZFKyhw7/Oexe22+YR7yiogyPf1wvWqVMzNeBpbv5qtGXaWc
 5QBGPfMnDV8RZj9kw7RPUJh9dGjwoBqnvhERs/3hgeuTodzQ1rXYpASZ+jKQ5kMyEgg8
 /ydtcdArjAw5CtCb4xwk1tTvGWZuAy6xanF9JUmhyL5Shk+wllz9fF1OpaK9E36yflP/
 xQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682349812; x=1684941812;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=28WUAgZR1eOtsSlbE7IyJ+d2WBLb93mnfTJiGuv28yQ=;
 b=Bk3BiqOvjMF04UyuV6zDUHC7rW5c2VRJh37kajOkqp7D/aXuw0SHY9xkOyV/1wMNgh
 d+RO5rMQhhckkhrMeWiCQDi4bNhKxhGT5q3lY/4Mt7fcLFjWuj419SqypiM1FxlrZ0Op
 Qk4xcBTrFIqDTiS1WBxMzb4XnvOm1eyWZLYydIVnaHmRXm9DHvSXvrOl4aFsbqhtZKI8
 jNLY6mM0I9z8nmKtGmCwcndtEW84bvSTNpaZrvChIRwd02NjsFc3Q86vyqsBVrGqP74u
 0hcqZHqf+teh+/dgIoRCdcktUChC67bv40W74c0gl2HF633LsaBUddGuRatfTh/87CA2
 A5Jg==
X-Gm-Message-State: AAQBX9fb06K2SrEkHJCWUPVm9cn+jX57dKh+8XilvNat2TDoB8kSImCj
 K9nlflwDHf8dVBmHhEcsT+mE7Q==
X-Google-Smtp-Source: AKy350b4fRr2jOWfURhw7KfD6hl0UhG0OWN83zgJiFIQpRSYnFW8CyKJAFgELqXbFbj88E5Xd7e8Bw==
X-Received: by 2002:a05:6000:c:b0:304:6d34:8fc9 with SMTP id
 h12-20020a056000000c00b003046d348fc9mr5256538wrx.2.1682349812014; 
 Mon, 24 Apr 2023 08:23:32 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm11025724wrz.75.2023.04.24.08.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:23:31 -0700 (PDT)
Message-ID: <e45ee1b3-a1b8-cc59-93a7-f9761e88aefb@linaro.org>
Date: Mon, 24 Apr 2023 16:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 21/44] target/loongarch: Implement LSX logic
 instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-22-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-22-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/20/23 09:06, Song Gao wrote:
> This patch includes:
> - V{AND/OR/XOR/NOR/ANDN/ORN}.V;
> - V{AND/OR/XOR/NOR}I.B.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    | 12 +++++
>   target/loongarch/helper.h                   |  2 +
>   target/loongarch/insn_trans/trans_lsx.c.inc | 56 +++++++++++++++++++++
>   target/loongarch/insns.decode               | 13 +++++
>   target/loongarch/lsx_helper.c               | 11 ++++
>   5 files changed, 94 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

