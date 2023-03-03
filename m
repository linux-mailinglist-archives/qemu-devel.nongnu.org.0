Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F26A9455
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1we-0007VW-Bd; Fri, 03 Mar 2023 04:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1wQ-0007Qj-Pl
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:43:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1wP-0006Ti-8G
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:43:06 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so875165wmi.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677836583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r/wGWaNciDRLtnr55OWobHC2854nly9YcDud6gGG0xQ=;
 b=oY2DRDPV59KF69WT4wkPDL/1gBEK/xga5S/cny259JHn0ZSRJWyfn6nSaleNPT3Tje
 uniwwVJO/zPQbRC2nnfUsXhjsMhPu1pfEkquFntOsUbeaX4UILPOiZwCtbvWMBWSSCrt
 SEYdC/OgIuMtxXcU8p4H9b7YOorwY9GIHoEwj4VqC0cvOBGJYdB7k9vyaFnVpzLOoAGX
 c2051oPEZbQ7KEj9WBvAA/VAjA7gW7xL6bKTkXhmiWx6/SxdJC0ksz0aVo/Qcb67BIoC
 pbAI79gIurKG35iPDKT6FtZcHq+XITgsewIG3Mdjw9smR21BnnPMhwMhrG0FVVcc03BC
 IrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677836583;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/wGWaNciDRLtnr55OWobHC2854nly9YcDud6gGG0xQ=;
 b=3RkOayHqlhV4JrWdESbgdVVOwr9mcy9fQ00FYNUtKjDi4IFGadW3KJNyN4K1fBmZFB
 KEy0fBWq2+MpHgAIFnYCVURmfpPhtmfMGV8N1RRvtWyIvinXMbBk4qCDLv2RIHM/7GO5
 UJjr4YBr7H8JzQBU+lpkwjP357/b+p6ZqXCoSjCKVDC5//ipDMpx/PZMjRKcOeC9lYNJ
 K7eFR0TZrKM35j2v+xYSDmrj5qnvlYaw+fsGR26aWLHvrPyCNuxlYMkuNGORPZSmQfSX
 mpqKjpP8q2QlDFQicjqmtHKCkw8h8zlvE1b1+KjeBjRZ3Db0brsnMfyKIxM7ZIYkptNj
 k5IQ==
X-Gm-Message-State: AO0yUKWDd5VenI1V+adQ8jFX1CR7eKtn0VAz4oakR4CSYfREf50AjA7N
 wFz0njLggxXlSOi52DHYxy/0CQ==
X-Google-Smtp-Source: AK7set/B7AxmGrNae4WLApoHavaxRMe/961jlQdxqPuI/pCHzzibClRVKbzO2ExUYSXL9r9ZiyrNnA==
X-Received: by 2002:a1c:750a:0:b0:3ea:e582:48dd with SMTP id
 o10-20020a1c750a000000b003eae58248ddmr962663wmc.34.1677836583092; 
 Fri, 03 Mar 2023 01:43:03 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 d42-20020a05600c4c2a00b003e6efc0f91csm1808935wmp.42.2023.03.03.01.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:43:02 -0800 (PST)
Message-ID: <217f4b5d-bbc8-c896-7b5f-a8e0effa04f9@linaro.org>
Date: Fri, 3 Mar 2023 10:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4.5 26/29] gdbstub: Remove gdb_do_syscallv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230303025805.625589-1-richard.henderson@linaro.org>
 <20230303025805.625589-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303025805.625589-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 03:58, Richard Henderson wrote:
> This function is unused, except to implement gdb_do_syscall.
> Fold the implementations together.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/gdbstub/syscalls.h | 11 -----------
>   gdbstub/syscalls.c         | 26 ++++++++++----------------
>   2 files changed, 10 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


