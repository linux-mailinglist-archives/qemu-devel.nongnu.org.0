Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8958D591513
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 19:52:01 +0200 (CEST)
Received: from localhost ([::1]:33488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMYpE-0001xh-FR
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 13:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMYjL-0007Tx-3M
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 13:45:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMYjH-0002pv-EI
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 13:45:54 -0400
Received: by mail-pf1-x42a.google.com with SMTP id f28so1553217pfk.1
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 10:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=SM/ujSAynMi+2s6n7WaJgwOSn4TD2PQezU5en+CQRzI=;
 b=NcdYl9NwlTW8rDICHdNdbNlbfXKROy22/GOFFfLFfBJeOEmKXG60feY4T3EIgj6P3t
 bPxNf1+J/raW8Y65/zN7v2MYwcMtYmeGR1HQSYV6BEStmamjewhHEbE0ti1WIeo6k+CY
 CmHxwkumLLmgXggHRdetpFglhAG1W/bFRKX/RcLQLxXamxjRyPk5cmDjkB9ShldtyPQB
 MvKKpiTxgFVVezSHC20Yj0jGBT9Xsq8qPVgKsFG4x4hozu6mD+siIg+h4LHrrbJXB5qJ
 /+Y/LY8OgtJYnGvJ0EE8yhNEqW5wvvkJ4SkDvLtuOwJaZ9FWBqGOQCl4jlnoydk/Ldr8
 iNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SM/ujSAynMi+2s6n7WaJgwOSn4TD2PQezU5en+CQRzI=;
 b=XPk8e2gJ+QA7vBLYqw51cKfD9QLKXljETzywZrrvWq1huPXXCbOqJwzu5NT3vmBHl+
 Ky3mtjTwsEOSzxBAwV2Nn5SKP/ZrclJV0t0wziQTXh7M2iUWXRwM2pkeedWgJ0ddyXH1
 Art0x93n5JHQbbsK2zNVH6u50lET5nG1DmM54++TsAW1s43mZ66FePM8sVV977AFoAVb
 TBnlLiaeC0mjtj9Ul5AGX3dK3gNdqXV1hIeDCm2GKhWTqZd3LjBPbgDidag3TA77rNil
 ftrtw/x6hu8cOmo31L9POQztIsCe2VCPLimZb/ZDCuM9I7NcE/lGDmoDFwBDsLz91hRv
 5F6w==
X-Gm-Message-State: ACgBeo3hFdwdwuHcrjbmrhVi1Gkm4Iv9InIhrQ8gKnCjdzkgzTZujiZO
 YKjVrEc7tkJuh8AuY9BwQlYkqgsSh2CKEw==
X-Google-Smtp-Source: AA6agR5ZA5fuhgZrt+jg4G8Bmh1v3w3qq2tncsqLIFI72AXAqBGVXJPkbPolFPe3CqsApTdzug/iYg==
X-Received: by 2002:a05:6a00:1688:b0:52b:cf1f:807a with SMTP id
 k8-20020a056a00168800b0052bcf1f807amr4894843pfc.21.1660326349226; 
 Fri, 12 Aug 2022 10:45:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 a3-20020aa79703000000b0052d4cb47339sm1870715pfg.151.2022.08.12.10.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 10:45:48 -0700 (PDT)
Message-ID: <087499b4-bf3b-b74e-22e4-355ea4110af4@linaro.org>
Date: Fri, 12 Aug 2022 10:45:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] Linux user for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220812103353.2631628-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220812103353.2631628-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 8/12/22 03:33, Laurent Vivier wrote:
> The following changes since commit a6b1c53e79d08a99a28cc3e67a3e1a7c34102d6b:
> 
>    Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-10 10:26:57 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request
> 
> for you to fetch changes up to dbbf89751b14aa5d281bad3af273e9ffaae82262:
> 
>    linux-user/aarch64: Reset target data on MADV_DONTNEED (2022-08-11 11:34:17 +0200)
> 
> ----------------------------------------------------------------
> Pull request linux-user 20220812

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Vitaly Buka (1):
>    linux-user/aarch64: Reset target data on MADV_DONTNEED
> 
>   accel/tcg/translate-all.c | 26 ++++++++++++++++++++++++++
>   include/exec/cpu-all.h    |  1 +
>   linux-user/mmap.c         |  3 +++
>   3 files changed, 30 insertions(+)
> 


