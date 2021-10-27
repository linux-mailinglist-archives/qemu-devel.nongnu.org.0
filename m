Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F143D61E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:57:21 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfqvB-0004VZ-1V
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqsN-0002LW-1n
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:54:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqsL-0003Kl-KS
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:54:26 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso3119154pjt.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FbL/MZJpDlFXj/5ggAOoZEdXNKlZ+W2UaATtupIw/4Y=;
 b=Z+qRDdJAY2rRNMtFn6uYu5MESgeYrOq2Yx8/SSa3a+/m8EmAyZY4PFsTVOCLW5dyIk
 BZB8tcqGTRiXanAcPXYQKROXfpCVgR9xPBwiWhxr6PLv2U731bghbnrjkb43V0nu2sep
 i4wohBcaEdMqI7XguVQxHyKEzvkQf7tzDm7whhltUL4PNy16Qv4Oo0ySUdKUe3Rp+noz
 W08v+ETzTSweRQDXB/uNK4a5/AekbRYQlo+2xuXuPLs6omFtkE8m6gMGhPp9TO7Stca7
 Ah2tzc201sG+UYU1e7ILvCO6lmpqkMbw1M4PsF/fO5wEUmOEt8M38oM7+g6lqrLin9PE
 GmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FbL/MZJpDlFXj/5ggAOoZEdXNKlZ+W2UaATtupIw/4Y=;
 b=qyE0se8HbqZM+vTI3lHlL7xQFnZJXMhJoM4vM1eRnr5bsEGn2JwwCxzIV+njLYyLjR
 nQKz/hog+Ff2dS8AB75bMIP7UdlFSbCrLYhGBd8lC3iP3TqhxWanMDYrIYcGLUOcdaW6
 10cSxn+PiZWcMFik90AmXIANSDTJqYoS/YM+e+HEAFG9cFEuuyp8qyhwkUcetkkj0e/j
 4duSHZ8as3Swx5XT9ZsreXo0GjW/UOCjESCMTQTtKqidydzSahGjjckUUYnIrGpUqV01
 4rpa8oLh9sH0/2cHDdVK/ZmpPPhW4d85B27EwA1IQQ1PUh2Yar6xCig070E+exCo2mn+
 TDRw==
X-Gm-Message-State: AOAM531Be5wt9BMhGM3WwaDknd8s7WZAepaPr6K6wV69MRyRr6u1oWau
 Jdf8Z0MZZciPdGDrx8ZFzq3CyTMDx4j5cg==
X-Google-Smtp-Source: ABdhPJy1y77s/u8hPzcMkXePr3gsPgktkvepdQrfS5agj6lf/1HS+dpjVRR7GKIbBm/qmN4leYVwHg==
X-Received: by 2002:a17:902:da8a:b0:13f:1a39:e02f with SMTP id
 j10-20020a170902da8a00b0013f1a39e02fmr168734plx.82.1635371664151; 
 Wed, 27 Oct 2021 14:54:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm929814pfh.135.2021.10.27.14.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:54:23 -0700 (PDT)
Subject: Re: [PATCH v2 19/32] target/mips: Convert MSA 3RF instruction format
 to decodetree (DF_WORD)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21058b6d-bc84-6ad0-ddd8-a0bbbc8a714e@linaro.org>
Date: Wed, 27 Oct 2021 14:54:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> +TRANS(FCAF,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcaf_df);

Add DF_WORD to df during decode?


r~

