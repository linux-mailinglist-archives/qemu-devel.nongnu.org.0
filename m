Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB366A13EE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:44:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLFO-0000nX-Kh; Thu, 23 Feb 2023 18:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLFM-0000ll-7U
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:43:32 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLFK-0000yI-MH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:43:31 -0500
Received: by mail-pl1-x634.google.com with SMTP id ko13so15557779plb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lHQj+OYvTpRj4a5KBZK3Pb+U64GIzlJNuL98HmLS7uE=;
 b=T2XtrXVzvMfMS7lBO8UNKcFb/Ce5npqDn8GpvhjbSKZxrUb4iTN7kHOTdw24pTp1NU
 2v8Cig9NgxNYzGESHvErczq87jY2jC8xiF/RwUV0ZInWC6OdYjxjhy/yuiPJ9pBuvTk6
 ESBviCC6m1Ihq5RoZMQmjkld/jUQ5wVqxtYfeDxaxO59W/rXZCyNz5SH9ioOMLKFhuB2
 6/AmDfGfmREOySYmUu3a7071/1U/BVEHYAGWBs2bJYHavwvXAzlNKrZ0SQbB0Y0acJNN
 2aEadUE2d1xdUhkf+H1CU4t6T/FU9/vuCdImMgPTXsjJm+LzBdD/Ot7zjuaAcIjY0/9F
 mL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lHQj+OYvTpRj4a5KBZK3Pb+U64GIzlJNuL98HmLS7uE=;
 b=8JgGYTDI63oW3MVca5BR4SfK9UWXRDSnzuQF/asoYMo7dX4oie+tWc6QOeI8UP79Y4
 5HvRvIx3KWXn3X/5k/zp9R3Dny+IjYTIXVX3Uk6U+jSBzQqvMViLQSJ8woM3xSYl6oyD
 bIAOSp/0cqlbNbq8TVY/QMef6PqiRBquXLGenKb6uf0O9G4n1izT3m+BlfCd7dBgu+E9
 cghlD37xzf/Ca61GkyZ6I6/yJUJevFdRQsMABr+jx6ddt7liA/mBbhLveHU8cknQQtOU
 8smo6nv1icHj3FG7sQOy8kSh5jHRsiN1UzOrnT1g4eDFQwXf+G6MbQvf4kdAxQi0ye59
 PLeA==
X-Gm-Message-State: AO0yUKUHdOkW4A1/dHvUeeutCM26rH73jx6bg8EqQPO0M5qgTFV8IIHI
 j4R+TANo0InFXygYrwenZb4X/A==
X-Google-Smtp-Source: AK7set9yaKoHV6u1cLiLeJLZ7U4tj7xNLj+WPW2r8u2IxwkceB4uTaSetVIvFX3+Lw9fPrg33yTADw==
X-Received: by 2002:a17:902:d2d2:b0:199:564a:9936 with SMTP id
 n18-20020a170902d2d200b00199564a9936mr17210365plc.25.1677195809032; 
 Thu, 23 Feb 2023 15:43:29 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 gc13-20020a17090b310d00b00230cbb4b6e8sm251322pjb.24.2023.02.23.15.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:43:28 -0800 (PST)
Message-ID: <4b24a2c5-3013-48ee-f133-7fa3998d4f0e@linaro.org>
Date: Thu, 23 Feb 2023 13:43:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/7] dump: Introduce win_dump_available()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223231755.81633-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:17, Philippe Mathieu-Daudé wrote:
> @@ -2130,12 +2136,10 @@ void qmp_dump_guest_memory(bool paging, const char *file,
>       }
>   #endif
>   
> -#ifndef TARGET_X86_64
> -    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
> -        error_setg(errp, "Windows dump is only available for x86-64");
> +    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP
> +            && !win_dump_available(errp)) {

Indentation is off.

Otherwise looks plausible as an intermediate step before more targets.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

