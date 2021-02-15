Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E431BE99
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:18:47 +0100 (CET)
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgaE-0001Cn-AA
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgXX-0007tL-Rs
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:15:59 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgXV-0007pq-0q
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:15:59 -0500
Received: by mail-pl1-x630.google.com with SMTP id ba1so3997422plb.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XCk27eLIMDUfsbI1xn5bUQIp6XYVK9zuguAtZSJR5oU=;
 b=NAPWyhZk3kcYRVQ9p06UkDpRAfLFLXcfTAam8hzuK3BmNBWVfWzwcxCHW4SbtF9SEH
 LYm6CM9zUODMH3ITu4Mkha0XiImzfy9sHwD+DO4B9CvO5NoLL+je74VHTwnRSpGUlfvd
 MW7h6tkcUD5AuqZH4sEjOhaOl2mfDGkgrvMbXpV+nHyJOO0xoGq1DxHcHCNWHD8M7Xpa
 YAHwZRNzga27erMj57yCNRQQABfxH0/bXxp1/Dml5A6bhwC9OQMTQP9cBcw3DDZbijKs
 QpSHW6R0cWtg0D4SG6SslBmHYSoSpN3Xz8a02dNr7N4RqpKj0lohuW6TG+LDn0u3g25/
 SAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XCk27eLIMDUfsbI1xn5bUQIp6XYVK9zuguAtZSJR5oU=;
 b=Id9fXUfrYMKOcpfEThAub6wxolVsYchzzKjleCmseyLGSFn/euS3/GmaX4dg6iXIm9
 +eRHp5cyMhTqI3JCD2Li4VJZ5uCbsOsxOcvMkBLciBaF9sfTsmC8R2+GvxbxdID4njnW
 Zo3EXXwhEaakLJ+w4dzwdv+GRhDg6tNw9BthfCLSoWcypWByVrbdAK/CFMxw4wHlAlZG
 B2T6oOKt+tumcGmpf+czT23Mr8yCXxGotZLAwrN0d34kVkkWSjD5jKw57Pb3mtNMBbrS
 F9IgyuSnVzyIcr8DNUfWU9lU5zj3q0iRviBVA4BwUF1zl+4Thpmf3ZfxdQtzPKQOdDTI
 iWaA==
X-Gm-Message-State: AOAM531N+6tFLAaDJ7W8fSDrZ+UkJb0Ix4TSt75oMieZu/bU9LAQ5dNv
 J87zDDBdkHPTw1SA6RFpG899/g==
X-Google-Smtp-Source: ABdhPJxqF851f6LVAy5TLDWy/E6vrGvn9SeZ9RdhVYIuT36uA4OxYSt3MVURdYuST9xLIQnV3nj4pw==
X-Received: by 2002:a17:902:ec82:b029:de:8483:50b4 with SMTP id
 x2-20020a170902ec82b02900de848350b4mr15754613plg.41.1613405755701; 
 Mon, 15 Feb 2021 08:15:55 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 x9sm18517923pfc.114.2021.02.15.08.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:15:55 -0800 (PST)
Subject: Re: [RFC PATCH 06/42] target/mips: Introduce gen_load_gpr_hi() /
 gen_store_gpr_hi() helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61778501-685c-3956-7413-3fd966e3a322@linaro.org>
Date: Mon, 15 Feb 2021 08:15:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h |  4 ++++
>  target/mips/translate.c | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

