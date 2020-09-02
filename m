Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B925B352
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 20:04:21 +0200 (CEST)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDX7M-0002qi-Ou
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 14:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDX6P-0002Hw-2w
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 14:03:21 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDX6N-0008CG-6l
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 14:03:20 -0400
Received: by mail-pg1-x532.google.com with SMTP id d19so47906pgl.10
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 11:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sGh/6pvSh445QkHwpBkvpg2uvxcbLBkSjD0rDe5zCp0=;
 b=TOx9gj7sfgjXATX51ZkcosJSvbzXwkdfmkwBc9NaBe3qatuckL2cQslhYjzZxZzxqw
 6/tNZGYf2cRSXrrJzrZ4cWRbb76/HN6N9SHnUqKQXNmc+3J7ZZAArGQ+H90cjEq06Vmd
 znu0BekT7rtweWytbDYnwH73Y6XbWa8Mo6Qo1fbMMTZv+pYP3zXjd9rzdokcjU+U0sRw
 QaqNrM5VKdNGYNvqO3Lkg6BkIHbVfaTMJPw301DDi7TxZSpruqbU4d+rfyPwlTD8cJzk
 SfcA3xo7JKdbVVG06rh+699eGogdXk3pvcUmj9hODSbjTcb6Nf5FHYH/h4yWUQsi0q7b
 Zi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sGh/6pvSh445QkHwpBkvpg2uvxcbLBkSjD0rDe5zCp0=;
 b=SkZigBEAKH75zbDyPHKt4C0VVQ774HRQANpBCFtmyl8cWV2cGBYMBhnX2OI5s0P2SO
 lx9OXEN1Ajyt1qQ1weO1HHwViFs6twuKf/Nl3L8d5PGXiEb7ZD/Edp44LLoX1Zm753nb
 SxzAsW/LQLvgfN+WraNLcvhw0A1iNdqrj31bqwLsQPS+yOG4Hl9St9ICPkAKRSh2XqFv
 2qbZfY0yoUEMkdWjM+h/Ztzx1DdDa4WSD8EdTeL6BOy3me+S3W3DR2SQnLn5Pdruq1dE
 ljAfpGb7igyMxkAA20eFeIlo/HzzJYBIB1IcwhTbI5uRWLQTx82Z6i/0qqKIlYi9kUIS
 G9vQ==
X-Gm-Message-State: AOAM530hkF6//PG8eY35w8n8zYy4Bz0RLZjFtb6/0K8rl5dzrg7R3Fgi
 ZP6VQZTxJdIvGFkMTVY3+uzQGw==
X-Google-Smtp-Source: ABdhPJyHCCFpbMg3vN8RPHi0NbeV+T8hWFdqGcYqf9lFR51qetprlbtTmQ8yt+uSLfmq8+8BJapYHQ==
X-Received: by 2002:aa7:92d7:: with SMTP id k23mr4218601pfa.295.1599069797501; 
 Wed, 02 Sep 2020 11:03:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i11sm75577pjg.50.2020.09.02.11.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 11:03:16 -0700 (PDT)
Subject: Re: [PATCH 7/7] target/microblaze: Diagnose invalid insns in delay
 slots
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20200902163559.1077728-1-richard.henderson@linaro.org>
 <20200902163559.1077728-8-richard.henderson@linaro.org>
Message-ID: <9d51eb8c-d803-ab7a-76f9-a590f5c8ef39@linaro.org>
Date: Wed, 2 Sep 2020 11:03:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902163559.1077728-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.324,
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
Cc: edgar.iglesias@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/20 9:35 AM, Richard Henderson wrote:
> +static bool invalid_delay_slot(DisasContext *dc, const char *insn_type)
> +{
> +    if (dc->tb_flags & D_FLAG) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Invalid insn in delay slot: %s\n", insn_type);

I should probably log the pc as well.


r~

