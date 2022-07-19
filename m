Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178C579294
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 07:42:15 +0200 (CEST)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDfzq-0003wv-1x
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 01:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDftV-0000gN-Ej
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 01:35:41 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDftT-0006NN-Nm
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 01:35:41 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 q13-20020a17090a304d00b001f1af9a18a2so6161231pjl.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 22:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JtshPouvxUVvSftN6LYEkL58plBERQqOuhWZ0iS3OPs=;
 b=wPVSC9EMTo/nW38eLmGomfK6REsV+lrK2L+S0eACMIzeEW3FKmCvtxPRilcvwnVaCL
 UG88AnhT0d3Jv2RGXNq0cJVf9ilMb1cZjxyL25wUhVQJWWODR91zOaHPcdR4uAEkdw8t
 m5ENyRzQbOTWepbffTzUL1kZwVeJfIEbRAPb4S4a2iI/FOrbIYL/Lo3xcVDt6K6p21E6
 SJ7rNduvIDGGdvQH9890CB/ohjGsbk9ImDN0vgcXVspI7PlIGZbY4A+oQkUxFUsLZ20G
 5ic0TJwyWazI+WQkDhInKRsTYbXIIhx41qHdBANlv6gN+07CtBTuu7pXZOQFuW9PWt5X
 khZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JtshPouvxUVvSftN6LYEkL58plBERQqOuhWZ0iS3OPs=;
 b=DAW2niVRRWoo1AMj9gRY3OoNsprHEmXgfonhAM69L+/JQ6NSFAtuG3W8H8K17eW8/w
 GZ0OCpk8U0XibTeX1HFeA4kk081Cu29zK6A35yz6y3NamKYtwkMj9VqPxwqscmf+hsy3
 6ZUbuG/ADOsupK7j3HAgI4n0Mxm04HUhX3yixDtnkm549P4QhzFkwj0Fzl8QNyKuamet
 g7xqDxfBVESwfbkv8AMBCHMcJ+pAjuDJ94adroX6OQ8FD/KvduXUuBHUCpH3KQuyh1zK
 ax/gEIFmo9wxix1Hb0fpKYIDfXILAyTTI/WLYnGaEEO/pHmDMj/rGkAz6eHNmpl0wQqv
 fBdQ==
X-Gm-Message-State: AJIora86pDq21tKhwB4s0MplFyJRIx12M5+8M6FJh8jKrPsoz0Wd1gcf
 YQH0QSNlYBexJWcDwuvJ0yHYZw==
X-Google-Smtp-Source: AGRyM1vKsAubKdSYjC3lLM22T3HLGvm3VJdLMKnqRVZ5kKdJ2SylfdEaoJxlXq0OJGnMcJMAg7bXtA==
X-Received: by 2002:a17:90a:590e:b0:1f1:afeb:996 with SMTP id
 k14-20020a17090a590e00b001f1afeb0996mr13868012pji.205.1658208938305; 
 Mon, 18 Jul 2022 22:35:38 -0700 (PDT)
Received: from [192.168.113.227] ([123.231.102.160])
 by smtp.gmail.com with ESMTPSA id
 133-20020a62178b000000b0052ab37ef3absm10246306pfx.116.2022.07.18.22.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 22:35:37 -0700 (PDT)
Message-ID: <11a2bc8a-4c6e-99b4-5c4f-e2faf6436254@linaro.org>
Date: Tue, 19 Jul 2022 11:05:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] target/loongarch/cpu: Fix cpucfg default value
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220715064829.1521482-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220715064829.1521482-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/22 12:18, Xiaojuan Yang wrote:
> We should config cpucfg[20] to set value for the scache's ways, sets,
> and size arguments when loongarch cpu init. However, the old code
> wirte 'sets argument' twice, so we change one of them to 'size argument'.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 89ea971cde..4cfce8c9d2 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -406,7 +406,7 @@ static void loongarch_la464_initfn(Object *obj)
>       data = 0;
>       data = FIELD_DP32(data, CPUCFG20, L3IU_WAYS, 15);
>       data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 14);
> -    data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 6);
> +    data = FIELD_DP32(data, CPUCFG20, L3IU_SIZE, 6);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>       env->cpucfg[20] = data;
>   
>       env->CSR_ASID = FIELD_DP64(0, CSR_ASID, ASIDBITS, 0xa);


