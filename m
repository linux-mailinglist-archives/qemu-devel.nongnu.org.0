Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9A5AD240
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:19:53 +0200 (CEST)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVB4x-0005Ro-UZ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVATf-0005hi-AA
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:41:20 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVATc-0002vQ-Qy
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:41:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id s23so5109653wmj.4
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=TBSP23KOjzk5ndDEf77hQvPy985sIv1Ji6v9MI+P0A0=;
 b=rqoesnEF0OVyxNug2EEZWsN7dEJJk4OV+03D6JofDuDhoWHYrp+X5OCiTc+K49ZqCQ
 HrWgC7mT0ZP4pmyl0e2OAeRhN6+PPte+SpTtEJoPwVDW0wKYI58l0o2qdDll7Kg2eARS
 8XUtADvlHC8KaADy07fYMj0OWmt3FgI9tUOvbdDY0NPP6nKsRfqGTbWU683TwPCrt3/z
 8GMptutcqRbo64vY90EBCEI/UziHSlnaSmBlKFH7Lc9P6JQgoUNs1A8WITi4H8dXIHZ0
 xEZgTTSOp9XjxmmIRTJsHbie8tQNMxvfqb3p8PBgsBNqUMPXZKpKREZfUBRf/3MV7VvN
 TrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=TBSP23KOjzk5ndDEf77hQvPy985sIv1Ji6v9MI+P0A0=;
 b=iMaVTapUkmUCotVizRXjQcaVvx16ZapyTtDxe4vwwAin8vXx4EU6BLJNYnjSXEoSwO
 bnpTZ6+9XPkr5yttJMyNiMyDz+wcthaF4EmdWuCuyNlhs63EHM2p2SAzUC/uDKCiDI0c
 0liT8LrbiodXUQACqZSeHjXYWkQsJObawEDRZ3vCzIhfVEBh9L6fsUsXQ5VPhMPZB+cw
 3oIHBuaJlNkoq/KensdZNOzzeXKqHuJWzhgHH80OVJHTbEpXerK+Ohzf66ly99irYpAD
 SOkY3d4om4abC9BYT+q0XlyN3xD7kTQ3FDJkO/ZhHX0l85VWyDZOhhc4rZ1zdaUv6oCC
 KnqQ==
X-Gm-Message-State: ACgBeo1MXcNafturgxKrWXzwi7ZnUnz8xb1ZtfOI6WM2uho66J2naN7t
 8PNwOSiCo0oX6DpqbC+t/P37nw==
X-Google-Smtp-Source: AA6agR4pMFSR3K0coRzUpbjh88cP9XJycM3gaTbyWnE4ntR26T6DHw7Qi7i6ZhCMWe2S+L+d/XZ7KQ==
X-Received: by 2002:a05:600c:3541:b0:3a6:28e4:c458 with SMTP id
 i1-20020a05600c354100b003a628e4c458mr10610526wmq.188.1662378075080; 
 Mon, 05 Sep 2022 04:41:15 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6811000000b0021efc75914esm2338709wru.79.2022.09.05.04.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:41:14 -0700 (PDT)
Message-ID: <a9d71c3f-a9c1-ab77-5b39-6a66fc5c1ee1@linaro.org>
Date: Mon, 5 Sep 2022 12:41:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 13/20] disas/nanomips: Prevent memory leaking
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-14-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-14-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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
> g_autofree attribute is added for every dynamically allocated string to
> prevent memory leaking.
> 
> The implementation of the several functions that work with dynamically
> allocated strings is slightly changed so we can add those attributes.
> 
> Almost every disassembly_function returns the result of the img_format()
> function, which returns a dynamically allocated string. To be able to
> free that string for every disassembly_function, a strdup() call is
> added for a return value of some disassembly functions like TLBGINV,
> TLBGINVF, TLBGP, etc.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 714 +++++++++++++++++++++++----------------------
>   1 file changed, 361 insertions(+), 353 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index cfea95130d..473c202649 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -523,7 +523,8 @@ static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
>       for (uint64 counter = 0; counter != count; counter++) {
>           bool use_gp = gp && (counter == count - 1);
>           uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
> -        strcat(str, img_format(",%s", GPR(this_rt)));
> +        g_autofree char *dis_str = img_format(",%s", GPR(this_rt));
> +        strcat(str, dis_str);
>       }

Will be unnecessary with the g_strjoinv change I suggested.


> @@ -657,7 +658,8 @@ static int Disassemble(const uint16 *data, char *dis,
>                                   return -6;
>                               }
>                               type = table[i].type;
> -                            strcpy(dis, dis_fn(op_code, m_pc));
> +                            g_autofree char *dis_str = dis_fn(op_code, m_pc);
> +                            strcpy(dis, dis_str);
>                               return table[i].instructions_size;

Will be unnecessary with the "*dis = value" return I suggested.

> @@ -1727,8 +1729,8 @@ static char *ACLR(uint64 instruction, img_address m_pc)
>       uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
>       int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
>   
> -    char *bit = IMMEDIATE(copy(bit_value));
> -    char *s = IMMEDIATE(copy(s_value));
> +    g_autofree char *bit = IMMEDIATE(copy(bit_value));
> +    g_autofree char *s = IMMEDIATE(copy(s_value));
>       const char *rs = GPR(copy(rs_value));
>   
>       return img_format("ACLR %s, %s(%s)", bit, s, rs);

All of these should be switched to directly use printf format on the integer values, now 
that's supported by img_format.  That should be done as a separate patch, immediately 
before this one.


r~

