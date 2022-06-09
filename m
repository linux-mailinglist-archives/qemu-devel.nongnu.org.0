Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5899E545354
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:49:50 +0200 (CEST)
Received: from localhost ([::1]:39980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMI1-0001Bk-8a
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzKZZ-0005Mt-Sh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:59:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzKZY-0006tY-Bo
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:59:49 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so1621602pjb.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=arTU8ZihSui3wB8BkW+ZUlu2spW0O83YCZIjAbRoWYE=;
 b=cp1RaqyISjZxtBeJCiwm5TQFDqS3zrOskHoc2ydAfWpZVRbFkgzWN5QIjfOJNyRVf1
 eVEYjkhtrnAl79gNhGtZcTsS/GuopzO0B4ZiX5t8KJg9AAWGZckLn4nM3ovaS4TORFer
 nYmYUr99VDZ4Cux9DdwQdJVZf9HIYLRN+UMkMAg2XQm0b7Hz3+eXOj+kL71wxZxV/I8x
 UnPj9jaGEAcExP5VPm0OO1Fr2UVdIsLbYJla+7cfYJQECNx1rcDugX4hsID7csg3keXq
 admWM6fN5q/PSO0+RS9chZsLuz2VeP+HmWT/m5k5Bqkyeu6xJzzn8cIRTNT1u2scX5Av
 EUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=arTU8ZihSui3wB8BkW+ZUlu2spW0O83YCZIjAbRoWYE=;
 b=GVjbOR5DBuPJVZU8Sq346sZL7c9Hlhv9EwfIuN9bC76hSQSUYRKFmBT/OMogd6DnQJ
 UoMWVTC87c0NwstbAOu3rn8np4Kt4a6wpjRnvSG4Sk3nAwpLtCzuXCknBeJiH1Vuf/KY
 DLcRNt/1NA5jLVsYcRG751cyDznExeIL1S25sRfyQIL82LYxsFPdiPImaRh6jTeCH0Ag
 ifRpav0M5ygioB2oqANYfs+I0TRu5C/SXY4XEWMMrqY9EWrIcvFyHmjNG4HScUcLKtYi
 DxH/NkBV3OGY2sg7EC8MRJa5zfbM1XVKNSmwMk4NlN/XJ5/rAJyXic6hxvjiOl7cuWAF
 45gw==
X-Gm-Message-State: AOAM530YPrCCapm00nYH6ye5KWUbVhQV6C15oZDLV6gyxevHwhjfmDUF
 jDkJxgzK1nVeNBJRl4mQr8NFqw==
X-Google-Smtp-Source: ABdhPJw3w3S02ZVptEGswDaxkFF4rEVfppFoFSdOjWu2fEUg3j7lNlbipnNN7FD5bGxl51wdzQZ4Iw==
X-Received: by 2002:a17:90a:5d04:b0:1df:91d7:5563 with SMTP id
 s4-20020a17090a5d0400b001df91d75563mr4061612pji.95.1654790386931; 
 Thu, 09 Jun 2022 08:59:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a62cd01000000b0051c78a6fb9csm2651113pfg.111.2022.06.09.08.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 08:59:44 -0700 (PDT)
Message-ID: <e2ee8394-be2f-ccce-aa45-2793ada3a10f@linaro.org>
Date: Thu, 9 Jun 2022 08:59:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 15/53] semihosting: Remove GDB_O_BINARY
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-16-richard.henderson@linaro.org>
 <87fskdsunz.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87fskdsunz.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 6/9/22 08:49, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> The value is zero, and gdb always opens files in binary mode.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> It might be worth mentioning these are the FILEIO_ flags in
> include/gdb/fileio.h to make future referencing easier.

Comment added in the next patch, when they get moved to include/exec/gdbstub.h, though it 
doesn't reference a gdb source file.


r~

