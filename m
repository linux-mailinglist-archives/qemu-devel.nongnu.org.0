Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086055AEE49
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:58:58 +0200 (CEST)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVa2T-000607-0t
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZtm-0008Mq-Tk
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:49:59 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZtk-00076F-0n
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:49:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id r69so10876124pgr.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=KNRHTXsjguwjmXRVqpvpfbotbrDmiUxZfLF2QtA+z44=;
 b=mdSQR59E9S2zrFDZmsfAu5y+Ihk+fmvMPFwsCyJVZinS+HVsTQhOUGHII5mSGABPcT
 K6I8zvBwhyiOEhHuMN0+nci1rLAhDmPEy06Orqx92lkedPu6UAvvmfj6vohxgYHCOT4+
 GVstapdxAPMYuI+eGk+AyQ1O1h242Wfzx4oWgUVy3BgKxy7K5NVnsqoVzlGrG7FAuMJe
 wb8RzsAcQQQqNdGAb5jTY4KYrmkaegUkFWbVrn5rDshlwSIw+3MPsf60W/39XQPOx9J/
 EpKLXuS80V1bUYQQwMxqhSPp7RXsh1HAZD5O/Ml00+tOVZQIE+X/JNb+VMk/tOChKFfU
 pNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=KNRHTXsjguwjmXRVqpvpfbotbrDmiUxZfLF2QtA+z44=;
 b=twNH4UuBSgudxsAoE5ImycTVpvf9UpnKIGolhmPc4+itOkUsDI5t1icEcXgGYJDqVf
 krIU4gMekfxGPdR8qE9nYYc4udMuQqDcw2dLeXywS/S7paA7ooO5UqihCbccMxhgom+P
 edrOAuYAsDDvEljBYP4DxGMffqmYm4+caDZNcLFtlt0bWnKxnQbcWHeWOo/DI6AUZ45J
 uuv+xe3Y26CUcy7QT0j/dz+bw7LnywJc40eWBRUT+GUjhPJPDEKGbVJ8/lpdYA+2Zko5
 9kdtfDkYh3hDaHzt0yO/1BrRPb16okNerRwAHJNjhSAaMKA6aAjuPXXl9hoXCIy0O03M
 rOnw==
X-Gm-Message-State: ACgBeo2zgZdwc3n+25cwtY5f4SwXzfZzm3FBW8abnbn6De33Isrw5xvA
 sIoDck8etCm9pi7G7w9mTNk=
X-Google-Smtp-Source: AA6agR4mkf4yrJTbNoyDA2nZ98mXhh/BqFPN6P3yrLgFQKXowmIcfwpE7IfI7cyvcUKg+Xv8MV1eaA==
X-Received: by 2002:a63:5522:0:b0:434:abbe:cae5 with SMTP id
 j34-20020a635522000000b00434abbecae5mr2846021pgb.134.1662475794636; 
 Tue, 06 Sep 2022 07:49:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f198-20020a6238cf000000b0053659f296a0sm10168892pfa.8.2022.09.06.07.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:49:54 -0700 (PDT)
Message-ID: <4de080cd-4377-271f-165c-bbe66a2eb22b@amsat.org>
Date: Tue, 6 Sep 2022 16:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 11/23] target/i386: Create cur_insn_len,
 cur_insn_len_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-12-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:09, Richard Henderson wrote:
> Create common routines for computing the length of the insn.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)

And tcg_const -> tcg_constant.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

