Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48A53C17FC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:20:38 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XhV-0005NN-Ma
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1XZL-0005qg-1h
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:12:11 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1XZJ-0001Fh-Dk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:12:10 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f11so3384062plg.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KdutPWMHCDdq/PD1IebFzRQN2i3/Jo114nZpFahInLk=;
 b=E8/IDCmqPytUb4MM9w1S0STl0VV7trUMhsABtpBIjLQSMGVQnapYpKMj7TihTYm0B+
 Jb/WEE7+vprzu1U8XlmgPu8Ccvxi/VZTdldDiYr4oOngZkL/3S+1SLhkXQPBHT9+iTJw
 eu8i0IiqlrgOYH2WwlLjg00lBs9hDUCNMRryQjBPb+lItjTSs9Iu7rXa3w15FautebBk
 iebsVS/aV7nvIv5T5LUpo9PANyBbemgMhlefkXHW+LdtNe3L/3hT9AjdkVlrMKkzrzeG
 x/ZktChFT7sQw23dyy+4clKg4k2P3dGWLOK2Rs5uhyqFL3tj9tLJRs7FCSYSzxAdXT7k
 y/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KdutPWMHCDdq/PD1IebFzRQN2i3/Jo114nZpFahInLk=;
 b=lQqkq8nT8/M9MzoeRTfUcdsxlqv+LGGARRstRlsRnLj4HAKUCK3gdr1yCX2ZWlk+hr
 txLDUkKSNbBESFkcUmebAeyrlnJj0ZzF05u1DzLgUXhxVLUyG+WL1TLFM+LNnzkLXV0x
 x9AY1f5GX28vWsM30z/1tXvCyiEVnCS4Vi2/t5XvYcXGjNqjv5igx4O7L39uzW9SyenA
 NPSdufwDUEJkrzhx/Pw5pVPWbxM6YjQE4f/1pUUqEr+bq4MyA3pdphNw23NwzKYJEPf1
 llrLbmrX4zGDHRyaPm/DpiNgxcAVgc0v1oxEXwR1M/ZnUS/2A+Sgeq1nqN74Xw6ivisu
 2oAg==
X-Gm-Message-State: AOAM531DVhkMZmqhrST66QOHZGc9TBV75d2nwlSHLzzseDgwEnTFV3gk
 +sSD0Z9sFhO3Z+SZanPKlIba3QZS/XUdcg==
X-Google-Smtp-Source: ABdhPJzOD9mYN2JR75X2KZ0LFqu5Fo244KQsJquLrRfRpWTKmAbu/XCIgyoVelekDqnbZ+DTzo7+vA==
X-Received: by 2002:a17:90a:1a:: with SMTP id 26mr5856973pja.187.1625764328114; 
 Thu, 08 Jul 2021 10:12:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u21sm3361602pfh.163.2021.07.08.10.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:12:07 -0700 (PDT)
Subject: Re: [PATCH v3 8/8] linux-user/syscall: Remove ERRNO_TABLE_SIZE check
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708170550.1846343-1-f4bug@amsat.org>
 <20210708170550.1846343-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd407211-1c4f-9d72-357d-5d012f5d1c16@linaro.org>
Date: Thu, 8 Jul 2021 10:12:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708170550.1846343-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 10:05 AM, Philippe Mathieu-Daudé wrote:
> Now than target_to_host_errno() always return an errno, we can
> remove the unused and arbitrary ERRNO_TABLE_SIZE definition.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/syscall.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

