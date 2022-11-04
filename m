Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7177D61A408
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 23:25:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or56M-00067Y-GF; Fri, 04 Nov 2022 18:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or4y9-0001hG-Ee
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:15:25 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or4y7-0007XH-Sh
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:15:21 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso3427179otb.6
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 15:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rmvNDdrfQ2QxyRNNY54OIZrVWGtBRK2kFgdH7mpjHRY=;
 b=J4vV5krCt3f3MKiHRDl7+/UUya0pqgqPS6+hB2F6nmOXOqV4NnK8YM+ISP8So7U3Hp
 UvdrWp+zG3q2SLeWfPCHGFuxHz4M7kL4gWnjEMNnxZM11xiGiT0BldKrTh1B41lrzecn
 msaPMxbP7cbyJetcWabYPtHH+jB+IKh9KayzkBBbKEYszrplJGJ3tSFHQAz7ckAFNWx2
 xiFNQg39SKD1DlI3wQSWuEyOxTS30VFrykBf7VFyM6veUwY9/Ta9V7DTYnpRAMiqDb2/
 D+RjFrmleFXqjIvm04uc2ATfWlBg7qqBKiwrGgaleKZOGJO5kMjg/+A7uEVUeXz2Ceer
 4OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rmvNDdrfQ2QxyRNNY54OIZrVWGtBRK2kFgdH7mpjHRY=;
 b=KbV+ktyIqf8uQ/XA+tlzUduvNL53Lw+goN/BF4vxckjXEPRMtXU0fH5zHtI16xl2LZ
 XiXEPR9L4vpdqH21T3hwBut75z6NauTlKXZ9aXMWgcsdORQAJFWLAW7SDId24IPi516j
 y1tRoxjPeApkMFSk5+EOS7+Hak6hzOZ7Of004Ct0/UTdDrzRiw5N0DKw/gq0KznF+WP+
 AdI+/Dsfi0io0YSvtZcfOhzLyLMosS4M5/CuIcNohbNb4WJ6F4LyQFW2PuI6MO5g80yc
 PeEq1D77jLpao/nrl8a7FsK2hZ+ubHa+h3RoZ+wMbo5seCzgBOyTV3UCkbVUB7Od1mJ4
 6hIQ==
X-Gm-Message-State: ACrzQf115J26H7dTEKE/Qj5Jct2orN5WzeIuLAaTBmMtbr4h0lsU5RrD
 9SNYd/YdUuqGtaOx7MNzguWDvg==
X-Google-Smtp-Source: AMsMyM4hTcVbPL/gy65B5A96B3jMvKY/+HYDKmIn/k1GPiL0s9CvxKUc37sy4+w5hM7bTTAXB8WJXg==
X-Received: by 2002:a9d:6959:0:b0:66c:543e:48f0 with SMTP id
 p25-20020a9d6959000000b0066c543e48f0mr13790437oto.75.1667600117630; 
 Fri, 04 Nov 2022 15:15:17 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a056870470e00b0012d939eb0bfsm107428oaq.34.2022.11.04.15.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 15:15:17 -0700 (PDT)
Message-ID: <59013583-f6fa-e6eb-8394-231f6e4d50dc@linaro.org>
Date: Sat, 5 Nov 2022 09:15:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 2/2] target/loongarch: Fix emulation of float-point
 disable exception
Content-Language: en-US
To: Rui Wang <wangrui@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 qemu-devel@nongnu.org, hev <qemu@hev.cc>
References: <20221104040517.222059-1-wangrui@loongson.cn>
 <20221104040517.222059-3-wangrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104040517.222059-3-wangrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 15:05, Rui Wang wrote:
> +#ifndef CONFIG_USER_ONLY
> +#define CHECK_FPE do { \
> +    if ((ctx->base.tb->flags & HW_FLAGS_EUEN_FPE) == 0) { \
> +        generate_exception(ctx, EXCCODE_FPD); \
> +        return false; \
> +    } \
> +} while (0)
> +#else
> +#define CHECK_FPE
> +#endif
> +
>   static bool gen_fff(DisasContext *ctx, arg_fff *a,
>                       void (*func)(TCGv, TCGv_env, TCGv, TCGv))
>   {
> +    CHECK_FPE;

Oh, sorry, I just realized this is not quite correct: CHECK_FPE should return true, not false.

Returning false indicates that the instruction has not been matched, and the decoder 
should continue searching.  If we reach the end of the search space, we raise EXCCODE_INE. 
But here we have successfully matched the instruction, and have found that the register 
bank is disabled and should raise EXCCODE_FPD.

The difference will in practice not be visible, because the code that will be emitted to 
raise EXCCODE_INE will not be reached, because control flow will have already raised 
EXCCODE_FPD, but it would be better to not emit the dead code.


r~

