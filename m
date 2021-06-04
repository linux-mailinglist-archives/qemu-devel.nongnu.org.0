Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30539C1D1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:06:08 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpH15-00033U-8R
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGzu-00022r-D1
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:04:54 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGzn-0006GS-PQ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:04:54 -0400
Received: by mail-pf1-x432.google.com with SMTP id g6so8338936pfq.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wwVpT+trkezOcZLISnKTm3sD8U2cNa5rP9EnrW1W8LQ=;
 b=xAmk1+6KJZiNl928dz/NJtMs4c8PE6kH+Kb+OoeZHlChjDmRGq0a2kiYJlI6EW0JI/
 Z6iXga1lFvjCu8tWPLRIa+eDOFR10A17AbBWoMVEbe5aFI761/sX/tvlaRsqvAkxSDix
 Ll2F/309J4KcTlWflMaK70ppj06OU5TM9hPlg6kp6ysemdob5JOIOAbKXVn0dO8x2Nb8
 N1E6Z0IOInILFLZ7EGjXT5QMRAByVlytQvto1a4BoAYf8cV2XljhrHkwWshe59mD2xwE
 F2MozSW+rcXhiFOm1+nyjVtms9o8XG1yu/1fpECbB0fndVDYRTPBBc9X8eHOIMQVgexh
 rGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wwVpT+trkezOcZLISnKTm3sD8U2cNa5rP9EnrW1W8LQ=;
 b=Z78XM3oFwg7cClMN90wO7evZZfbzCiBu/mn4SOFEmLWCFD/Hpif786xwtOxHw7DTh+
 5fokeHoPnTMGt8usCJpOxZmrBvLnTzsY4kcd4vKcYQTo5FbkUI3XjixHw6pJjofvjiHL
 JG8e430iQ0Tsw2SqdQD4rYERRCpMfwpiQYrwXRnXGUwEO254teWNBh40Q75hKS7saAN5
 rQmACK6oSxcpxD0EUhMZ/KVV1X3OvlRRamMmORUt/1OrLirJvLlE1xoThZm/zKeUvYG6
 Zt/kU53NkDpOLLNw6rsp29sgSB7AG265mkLV/LkDT6bUIeJG4gTRNbsPgJBg66CJ9RXZ
 nMxw==
X-Gm-Message-State: AOAM533LCyKwc2vXlwxmvYCPRtX2WXa5P6rHVcoCBgQMnElyZDQ0MBbe
 +rzm4ecc9Fg1b6clfyUY5TxZcg==
X-Google-Smtp-Source: ABdhPJyyzryUjPCwYCtMOuyrtFmTU+uUsTo5ScdSmua1+9jkVfRpddYLQJs9mZIgl3RDq/s201iqhw==
X-Received: by 2002:a63:4386:: with SMTP id q128mr6959727pga.397.1622840686079; 
 Fri, 04 Jun 2021 14:04:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z15sm2902611pgu.71.2021.06.04.14.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:04:45 -0700 (PDT)
Subject: Re: [PATCH v16 07/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b430cb5-b01e-8740-0507-53aa0c7c311d@linaro.org>
Date: Fri, 4 Jun 2021 14:04:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, only run these tests if TCG
> is built into the QEMU binary.
> 
> Suggested-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-8-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

