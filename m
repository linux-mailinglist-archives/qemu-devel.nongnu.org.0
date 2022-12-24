Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADEF655AE1
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:55:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98jp-0001rJ-VQ; Sat, 24 Dec 2022 12:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98jk-0001qu-KX
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:55:10 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98ji-0007Tz-Uu
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:55:08 -0500
Received: by mail-pl1-x62b.google.com with SMTP id m4so7586373pls.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xpF5hMx71HdKh2CSsU4/TBwVuLRCcCOJdH4NFoX6uUk=;
 b=uMJXnluAMKcqtOh4bOsX5HZzvyiT3YArK2ltpN5BPkpVH1hcVRgGN3vmnqmHXqMOIV
 /nKYNCqgY499SMgW3sQhlQFnJz3GIaxStzcDEvB6v6zyRdDkEMA3keqHoB9TOnaqZylS
 BleLN7iLekbREhxcQdkhPIGlhr0iA9dpMoDeHRkTjfX+W2K2U0ULcEZL4DHo2GSY+X8F
 wMQDVHhRGMCzEndt68H/sqWm/St8iJduVMdhngTNyXrF9LCMpXr25s6PDnloBIAL8wAY
 cGgNAJZyoGoI4ye+4C0PMZZ0Dvjty4McCGhlNvHBPYbRYA3aDVqZxG2m0pnoWhYIQh5K
 7dRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xpF5hMx71HdKh2CSsU4/TBwVuLRCcCOJdH4NFoX6uUk=;
 b=wEebszUUVFwc/jVM0ikSURRIPxQGdSUOGr380tHLmZrl1PbQMGgi14lKCejBz+Q/+U
 kcl9S2y8GS77d4J//JRRewayRqEjeqF1M8ud0Zsgp6b5bOhKotHEgeDBgfVl6yU1wu3d
 3jRI7q38yjnE7WlCP/KchrURK7/fzHk0wF/0qYdxYDGtEuG+fvZmu8P/7gqsMTpQxjXq
 D1GC8Ld4KtJDWcqsNTKrWVsNpfWcRej3GsvkeCm5MtoGM8iPhFiP9EgZd/fZ0t/TsCxY
 +7QEzZQTXOcfT0eGHvDufqLtMiNaeF8eeLMVHo6jnwEdA3L1xxzL8cUKYTARg8y7SO26
 LA+w==
X-Gm-Message-State: AFqh2kpiWEI4CuP9egaGkWmSLKEYKxD4kb7sLkdkeJLDQ/Z/BQBrpy8m
 MhZ1LnQQIpkAPnwC2TfiUQsapA==
X-Google-Smtp-Source: AMrXdXvKqY4byv44UZn0EApW6RTwwlpMrOCT66E9i0PIcvqWgaTwmRVAH2C79Wml1xJM6waEoYk69A==
X-Received: by 2002:a17:902:8693:b0:191:e0b0:f8df with SMTP id
 g19-20020a170902869300b00191e0b0f8dfmr13207743plo.58.1671904504985; 
 Sat, 24 Dec 2022 09:55:04 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a63fb43000000b00476799699e4sm235556pgj.30.2022.12.24.09.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:55:04 -0800 (PST)
Message-ID: <3aa06248-df51-b385-6736-4a8cb2065fb9@linaro.org>
Date: Sat, 24 Dec 2022 09:55:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 12/43] target/loongarch: Implement vabsd
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-13-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-13-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:16, Song Gao wrote:
> +INSN_LSX(vabsd_b,          vvv)
> +INSN_LSX(vabsd_h,          vvv)
> +INSN_LSX(vabsd_w,          vvv)
> +INSN_LSX(vabsd_d,          vvv)
> +INSN_LSX(vabsd_bu,         vvv)
> +INSN_LSX(vabsd_hu,         vvv)
> +INSN_LSX(vabsd_wu,         vvv)
> +INSN_LSX(vabsd_du,         vvv)

These can be implemented with max, min, and sub.
See e.g. do_vabsdu in target/ppc/translate/vmx-impl.c.inc.


r~

