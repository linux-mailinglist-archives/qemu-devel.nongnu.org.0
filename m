Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176D6D5744
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 05:45:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjXaw-0003uz-Nq; Mon, 03 Apr 2023 23:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjXau-0003ur-K2
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 23:44:28 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjXas-0000Tc-F0
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 23:44:27 -0400
Received: by mail-pl1-x62d.google.com with SMTP id kc4so30055929plb.10
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 20:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680579865;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zF/xjxbUr7dVZY/KmeT6YVX8dEu4y5S97Kh4pAwyiUM=;
 b=IFwl9WD3wuL9bIrBsTlXLH+/A+22Jvb41N2YMrNJzwxR9DkUfNWcEipoTVWoiSzFWv
 G7ZyS9RUXL0hxOoI3HEKZWGbHiB/Sw0aQTbNzZcxHwrO+p3Ycjt0a8kZwMJukQ6jeJse
 D0xC+Ikw/NkxZQ5c9/ZkX5fpxA2Mxlqmg8roUIdjPRzEoQx+bkFq2Yg7i2qy1d6ffFV4
 E7FAExZ/Fd7lrJ6morccxorUjW0LeMFD9Hyx/VQ0LoJ1AZYfYViC4v9yE+YEUWH5vKFI
 2ACN6JAJvYycyrZrmjTCPLVtsytfajgz0HoRAQqrN3LTvXZBqSOvaiQu/nnbr4YT86po
 jnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680579865;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zF/xjxbUr7dVZY/KmeT6YVX8dEu4y5S97Kh4pAwyiUM=;
 b=CXQS4Ih+9ih/lPlhWZrv4sXlZipcB5ge7dM8+aHWO3Tc1NG/zfdTM9RxwECaBODjDA
 nP2Bk6HG1GFPflawcMT6uRqua4xMRduvBEGJhlmKnwa+V5n72NQH2PUhMJkfiaRPBrbu
 TvTGtMH9JEcYzZETxck0HW2ms1Jrpp9hd7m4O21Bj8d0N/e8MAuHyVKVIKjVQGrtkp74
 ntO0QBtLjsAdDCib/VBfNBRNWnOyA4SmRkyuY0XiXioQmrA++VanStS1ZvMyUFMrjeQu
 vswiN2ohS0oKm32OymkRAeYhtsT5cKOggZQ+UgXmCb8KVzJ2p+93gjFipthRKDxziRt9
 c0hw==
X-Gm-Message-State: AAQBX9dXRf+4zgupiwxKQ0EFusQsNJBtHwCPcSnmgq/6b9Jea7SjgeZP
 QTdtwbYvHHimrwc9IipfIR1WSg==
X-Google-Smtp-Source: AKy350Zuyn4mcNb8UiFFVSALxob1DWdg6ZsmPdQ2yar+DfE05ZTZM7e9CckWkpVn31VFKnzva7EWYg==
X-Received: by 2002:a17:902:db11:b0:1a0:422f:39d9 with SMTP id
 m17-20020a170902db1100b001a0422f39d9mr1447905plx.39.1680579864740; 
 Mon, 03 Apr 2023 20:44:24 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 jj6-20020a170903048600b001a1add0d616sm7403240plb.161.2023.04.03.20.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 20:44:24 -0700 (PDT)
Message-ID: <56d58b1f-08da-9a66-d33e-a5117d38947d@linaro.org>
Date: Mon, 3 Apr 2023 20:44:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 44/44] target/loongarch: Use {set/get}_gpr replace
 to cpu_fpr
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-45-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-45-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
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

On 3/27/23 20:06, Song Gao wrote:
> Introduce set_fpr() and get_fpr() and remove cpu_fpr.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   .../loongarch/insn_trans/trans_farith.c.inc   | 72 +++++++++++++++----
>   target/loongarch/insn_trans/trans_fcmp.c.inc  | 12 ++--
>   .../loongarch/insn_trans/trans_fmemory.c.inc  | 37 ++++++----
>   target/loongarch/insn_trans/trans_fmov.c.inc  | 31 +++++---
>   target/loongarch/translate.c                  | 20 ++++--
>   5 files changed, 129 insertions(+), 43 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

As previously mentioned, patch 2 must be last, because without this patch you will 
generate invalid tcg.


r~

