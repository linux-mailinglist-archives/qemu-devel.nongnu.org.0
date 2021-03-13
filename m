Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB465339E6B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:06:31 +0100 (CET)
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL4uU-0003Ok-G8
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4sd-0002mp-GB
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:04:35 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4sb-0003Py-SZ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:04:35 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso2889642otq.3
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TncOW+yGMVuN5ohxHCFtEv9i/18sNjKn+l2pMLaURfk=;
 b=SFM7LB7CJf/tuXzwVm5/5owABLXjtO8Vy68+tmIydulQE/JkPTVv66z+hUOWy7oxe6
 QEwleD/P691U2ouluFEfIKN61N/J28z+ryH6ehvziJmujKo4OmwcXblfnJ5g4gjkWI6u
 72sPExRNHJdwupOPQaw9TmQcjJ/wEp1oGpVfa95N3hm5+5LbTUHlHv4qxjo9MwpYQ+Ti
 wC6ldgr2E4zFjBeGTrc8rCft5F7cqZE8zVLs8amycZlr62CFG7ufx1miERPvwHHb1FRZ
 TLfLD94MD5r9sLWO2u5FMC7rMw5+1FOFHdWqHlWkfGvo9N9l1Mcj7EiPMuJGJucWCwuM
 tLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TncOW+yGMVuN5ohxHCFtEv9i/18sNjKn+l2pMLaURfk=;
 b=BVM+O6QgtcyUmQNu8+qlJK5BhDWNNolAyucnc4+PE4iT7oMH7loBj0sMttG70Wi4bK
 Ox8clPSKNhNZN6z3kauB/HJZSbo92eeutzkSqmVdkaT8ssoOD955g5JypFE6ON/mZ9g3
 gxScrgunjfTRN8L8tFT2VkvxJC//Sh9+FyfEe9WNwM/DYNVjVQYeHwH+nbQYOa4T22zG
 8cirx1QQP9bhWTrHf/dhJFrRw1yqijGnvXZpTxM7JWdq+SkB8nYy0/WqhdB/qcV+6nQm
 udElSiPT+MnnBxRrOAX1NQhrqa0i6Ykj96XctVkn4zJbIaS50aHJr6xGo1CkoyUEO7WV
 ctww==
X-Gm-Message-State: AOAM533k+tPd1KeAHxXJvPdmkYgHZMK1BJTFmdMSX82747N2uNIyvd4V
 k0+5wQ+ZeEs/hZQLJVCwL0Yapw==
X-Google-Smtp-Source: ABdhPJzEnwpN/O75gT8/FOw5aT7pXgWofQRxfrrZvS54qJiXEaHT96Yk72FJp+JOAhy3EcL0BnVODg==
X-Received: by 2002:a9d:3c1:: with SMTP id f59mr7192312otf.330.1615644272507; 
 Sat, 13 Mar 2021 06:04:32 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o23sm3581358otp.45.2021.03.13.06.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 06:04:32 -0800 (PST)
Subject: Re: [RFC PATCH v2 10/22] target/mips/tx79: Introduce PSUB* opcodes
 (Parallel Subtract)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
 <20210309145653.743937-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c445baa-4552-bedf-1c5f-880e24f9c05d@linaro.org>
Date: Sat, 13 Mar 2021 08:04:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:56 AM, Philippe Mathieu-Daudé wrote:
> Introduce the 'Parallel Subtract' opcodes:
> 
>   - PSUBB (Parallel Subtract Byte)
>   - PSUBH (Parallel Subtract Halfword)
>   - PSUBW (Parallel Subtract Word)
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2: Uses tcg_gen_vec_sub{8,16,32}_i64 from tcg/tcg-op-gvec.h (rth)
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

