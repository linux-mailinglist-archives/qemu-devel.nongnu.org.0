Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E005AD1DD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:55:02 +0200 (CEST)
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAgv-0000aI-BH
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVALH-0008PZ-6i
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:32:39 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVALF-0001O9-HY
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:32:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id f15so6202044wrw.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Q1TEe3OxfqUSEBMZIw7sYrqGgPFscEmTcnYyJiMB04A=;
 b=t/6JfPceqwWnsTZEV8t6G3k934I38Homwm6fHpkXwBDBRvm341X8UHj2qQ3q72o1XP
 ReRLpHnVBICnPZVWL77OFlBXl6B/Isf0gbWW9yNrQJ8m5IQGloYllFB2tUOVpLltdj0F
 J+mm3oGjkGUfMBPsVpSW+ewo/c1ksdEzpCis9zYxEmn/puMVJdpzm5m65p7/zZu1Ag7x
 QcnG5O1IDtwajMQq2Ex89M6WMZCDa4/Ac1t6VDI2zNGnXzVPvq+9vsoxLVecU/HgJoFO
 4Z9EpI7HJKh1qPhEDtg0YS+KOvCW0KnG+UUCJztVDG+1jX+oGFFeqFVdiiDmnNT6iJ10
 vRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Q1TEe3OxfqUSEBMZIw7sYrqGgPFscEmTcnYyJiMB04A=;
 b=pUvCUzNUqvySRj+ZF/rF13H/arc+pEg17Xu6KLqN4ERRD13qnQhy8MKAb35aWKVEIT
 hC5x71eBCMPZ/WWIT+g6QEnikle0JFkWop3FaAIJldcX2JHe2I60NtMGciGrt2BwYTbk
 s/2b0tpnDZ91Io7STPGCNkIA5QVg3+43vYZ1GPX5DClWd8dpdL06NHLVgSGFDXvKlCo+
 +6JlZTE+rosRSOVutajcDytk8KjReOucH590gif6IrulNy5/lfvagDeuEXxRWt4qRqX1
 qVQx8f81v9WA62Vs7IW43Ew8Wq5G7FSRF5so+Ji+Ukr6BnPW3oiEmIfYW3fcyxIk+qLK
 3KQA==
X-Gm-Message-State: ACgBeo3wKb4odHwBf6F3+sgm0/lN+XmyOMbYeMGtlbGsVyHs/VvR6o4y
 XySrBJZ2+Xu/SrsTiVZLVTBo2A==
X-Google-Smtp-Source: AA6agR4zs/Yer7y6mwrRqU48Vx7OeZEr8/Z8QBmWJziI1dxIbqh9YT624jdbabBCVgoolFjydK7bbA==
X-Received: by 2002:a05:6000:71b:b0:228:a6be:4e40 with SMTP id
 bs27-20020a056000071b00b00228a6be4e40mr1602265wrb.136.1662377554970; 
 Mon, 05 Sep 2022 04:32:34 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4141000000b002258413c310sm8590288wrq.88.2022.09.05.04.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:32:33 -0700 (PDT)
Message-ID: <dc7ac467-b881-b353-a63a-ff5a744df5da@linaro.org>
Date: Mon, 5 Sep 2022 12:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 12/20] disas/nanomips: Replace std::string type
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-13-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-13-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> -static std::string save_restore_list(uint64 rt, uint64 count, uint64 gp)
> +static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
>   {
> -    std::string str;
> +    /*
> +     * Currently, this file compiles as a cpp file, so the explicit cast here
> +     * is necessary. Later, the cast will be removed.
> +     */
> +    char *str = (char *)g_malloc(200);
> +    str[0] = '\0';
>   
>       for (uint64 counter = 0; counter != count; counter++) {
>           bool use_gp = gp && (counter == count - 1);
>           uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
> -        str += img_format(",%s", GPR(this_rt));
> +        strcat(str, img_format(",%s", GPR(this_rt)));
>       }
>   
>       return str;
>   }

This would be better written as

     char *reg_list[33];

     assert(count <= 32);
     for (c = 0; c < count; c++) {
         bool use_gp = ...
         uint64 this_rt = ...
         /* glib usage below requires casting away const */
         reg_list[c] = (char *)GPR(this_rt);
     }
     reg_list[count] = NULL;

     return g_strjoinv(",", reg_list);



> @@ -716,7 +617,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
>    *      instruction size    - negative is error
>    *      disassembly string  - on error will constain error string
>    */
> -static int Disassemble(const uint16 *data, std::string & dis,
> +static int Disassemble(const uint16 *data, char *dis,


I think this interface should be

     char **dis,

so that...

> @@ -746,25 +647,26 @@ static int Disassemble(const uint16 *data, std::string & dis,
>                                    * an ASE attribute and the requested version
>                                    * not having that attribute
>                                    */
> -                                dis = "ASE attribute mismatch";
> +                                strcpy(dis, "ASE attribute mismatch");

these become

     *dis = g_strdup("string");

and the usage in nanomips_dis does not assume a fixed sized buffer.


r~

