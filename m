Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE6698CB8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:16:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXYf-0000oj-28; Thu, 16 Feb 2023 01:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXYW-0000kP-UY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:15:48 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXYV-0001fp-0A
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:15:44 -0500
Received: by mail-pg1-x531.google.com with SMTP id x31so626969pgl.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 22:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=isQpYzDMoscS3of64waeamYirjZt/NA5adPeybb3Q3I=;
 b=WPCZs8JqTZ1yfheWsmJPy2ATfe+eczPUUrGdz/0W8HCWbr117vS+n/YJa1yMN+YoBp
 B5oKdIWjHiTpkRL8HzwWH07bGdq9U7QiBONj/hwcf28nLrVmir5Dj1VcgLgOV34zra/5
 2WRU9mvDXlEv5Na+V9DzDHlmJWXK+Up5zhmRfaNG6yfHHiLH+wSP4C9QCWLngD3Wy5z2
 pXeUpcVFkHiBcNRGR1GzleJUyRCOkqbJir9cXkQeZja8wUTaRgtikiejUQ2y6zSgDH8+
 oy6D05FjktiqAkaOy3Ui5nJMEyMSqiDhbCkCsx2AUDD98HzI2cmLfQ1OtC1XOT57CsfL
 ePNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=isQpYzDMoscS3of64waeamYirjZt/NA5adPeybb3Q3I=;
 b=jqCSVJW/7m/Q3Z8xs4S5N7DcORMiD9289ty0yBEe1wJ52MJyuaJU8qU8NaktZsCsaz
 0x5rKgSO9hy6tdgmVlSw0m0NmRXza07P03tUnotjNZQPbK8gtFNuMNpCK54bYwTYFgAy
 MiLFEPprQanfWEPlEQcVqqKDSZ06bChYyXKLwQPaYPVMf3V+Ror0TnD8bRwfH8eDqyDx
 XQ+Eg3i00u6X+cJGUPWYq9BR9YkY+N3znGre8FdNGTOCsOVKxYkCu7k6h+w21N1LFbv3
 Gyv19B/zop2L3TOTHTzt3Qa1No76HkkW82lRapEX7H8HhuygdV9d68B2fNdYWvEJNpQv
 LRKg==
X-Gm-Message-State: AO0yUKWdT9+2fmZc35YaAG08UgVYZwcIjl0a7njay3epe6+h+nZsV7y6
 NeY2ZH/G7nGJC0cuQxebYdTe60J933WK5Cp1YqI=
X-Google-Smtp-Source: AK7set/kd7Qsdd+aszofIbCZaZOQ2ZQcnpenaLovSh6zDb9JmhqtUh/0dNabSE1iaYpNcIugidtARw==
X-Received: by 2002:a62:7bd3:0:b0:593:cade:6376 with SMTP id
 w202-20020a627bd3000000b00593cade6376mr4212513pfc.2.1676528141459; 
 Wed, 15 Feb 2023 22:15:41 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 x23-20020aa79197000000b005a84e660713sm380596pfa.195.2023.02.15.22.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:15:40 -0800 (PST)
Message-ID: <abd9ad4a-d2b7-fd3e-1e67-db9d067bd0c0@linaro.org>
Date: Wed, 15 Feb 2023 20:15:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/27] tcg: Simplify temporary usage
Content-Language: en-US
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <Y+Y6Dt03hwfWLd5J@cota-l14>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y+Y6Dt03hwfWLd5J@cota-l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/10/23 02:35, Emilio Cota wrote:
> I ran yesterday linux-user SPEC06 benchmarks from your tcg-life branch.
> I do see perf regressions for two workloads (sjeng and xalancbmk).
> With perf(1) I see liveness_pass* are at 0.00%, so I wonder: is it
> possible that the emitted code isn't quite the same?

Everything that I checked by hand was the same, but it's possible.
It's a tedious process.  You'd definitely want to turn off ASR.

My current branch has __attribute__((noreturn)) added to all of the liveness passes, so 
that they don't get folded into tcg_gen_code.  But I still would expect 0%.

r~

