Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5D40F984
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:48:23 +0200 (CEST)
Received: from localhost ([::1]:42898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREE1-0002pV-Tn
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRECC-0001Uz-5Q
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:46:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRECA-0002O5-M1
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:46:27 -0400
Received: by mail-pf1-x42d.google.com with SMTP id w19so9195376pfn.12
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ggmYzqZZFKQLVlMqfXGVDW4Iw0KANZi8ex7DgwbASMc=;
 b=VEvMtNKR3NpFKzTcytGdoH4rU3Q57jkfza5YRJy3ayFFHUNi9TaTe/hQLt7F/hnTuz
 30BWUJ6RRRGOqfL1jkzjvVbvDhs+WhcQaal/wEmdQRZfrfM5lA2lUbxctOZroi/1tgPj
 qKoy/OxFu3DcZWqBliVFQltvQYkVg+DwGNn5fbAvvPcLNQ51hJai6uELx7G3rTCWdMMp
 YIrcPiO21wIe9jrVbQ2693kguyfS+tCe4JsGQv+jRwn19tzjJdq8vQ3I0tX3I9iBIDFT
 AWnn/AItTVQznozN9EuEDJg+w+Mtq132MWEcGnKusxX7vNXCKCPlLXjzp/NV4+eKuGpO
 qgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ggmYzqZZFKQLVlMqfXGVDW4Iw0KANZi8ex7DgwbASMc=;
 b=56g/avm55Os9V7N02vkvV2wWsYa8ROJ3dYFU8xYMhJRzQIJJr9FIm4j0z0+kGcCW7D
 eoi2GgPs8eacspYu7qbAY8cPSI4CvtMZ9fTFAGbdf2PZKjDB23Pmf/RwmStSey1gEhfi
 ki1yCGT/Amg5WgUh3Na0h5f8hPaDdGm8mv00tjfj5JciZz8DBzw1skABl0cHrbR+pAyE
 b1kxxRO0fq+3htwmgx3sM/k8gKR+5MHyEyfvcUjK1XjN8LQ+AFbr+KxNIPLrV+1Ha7uv
 8cYlD4PqI6MIqedaiq3KTFvU1q5wpIm+QBAKuWy3kjiE8jvysIBc3iLrXFpaCpwLTfjz
 SdsQ==
X-Gm-Message-State: AOAM532lS4OosQvDUPY8BuXpNrk3cIcc1iyWvYMngR8gOuVk0SQvqj5D
 xzJ0DIvlvFs7ZkJGfZEcKE5xbw==
X-Google-Smtp-Source: ABdhPJxbaB+VLBwE/2Fkdphdu24mxyR+DIliCk1D3QmM5/tEK9eQLcqDDLQWIOSuVYfh3jE4YGP7hw==
X-Received: by 2002:a62:5406:0:b0:441:c46a:ccb9 with SMTP id
 i6-20020a625406000000b00441c46accb9mr8324883pfb.52.1631886385166; 
 Fri, 17 Sep 2021 06:46:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a20sm10436603pjh.46.2021.09.17.06.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 06:46:24 -0700 (PDT)
Subject: Re: [PATCH v5 01/16] tcg: Expand usadd/ussub with umin/umax
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
 <20210915213114.1923776-2-richard.henderson@linaro.org>
 <d5d876e5-e22b-290c-1510-3c77cc29f357@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <12bb1aa2-bcf2-47e7-4d97-70047ee181f9@linaro.org>
Date: Fri, 17 Sep 2021 06:46:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d5d876e5-e22b-290c-1510-3c77cc29f357@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.488,
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 4:24 AM, Matheus K. Ferst wrote:
>>   void tcg_gen_usadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
>>   {
>> -    do_op3_nofail(vece, r, a, b, INDEX_op_usadd_vec);
>> +    if (!do_op3(vece, r, a, b, INDEX_op_usadd_vec)) {
>> +        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
>> +        TCGv_vec t = tcg_temp_new_vec_matching(r);
>> +
>> +        /* usadd(a, b) = min(a, ~b) + b */
>> +        tcg_gen_not_vec(vece, t, b);
>> +        tcg_gen_umin_vec(vece, t, t, a);
>> +        tcg_gen_add_vec(vece, r, r, b);
> 
> I think it should be
> 
> tcg_gen_add_vec(vece, r, t, b);

Yep, good catch.

r~

