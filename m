Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7F3193DF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:05:57 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIDs-0003x0-Co
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAHVS-0004Tk-6w
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:20:02 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAHVL-0004QZ-9N
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:19:57 -0500
Received: by mail-pj1-x102f.google.com with SMTP id cv23so3968295pjb.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 11:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Nj2yJHPh29QMi/JmvCm2R2Y8RUz07m04f00LEAKAd0=;
 b=b4Osnyz7Ub65tEQ0A07SybKe/fWcAiiFMayX6vdtFFA10jsEFSQDNDak5zb7+AHrYC
 znoHmiuRGa8IpJJUpNE2KTkiJlbT/77nc8X7fIysCN09Qut6LpXZ3McFBPgOOVjKT2gK
 /TrHNDhv0jS55GwvU4ArEGwcNhyV8aVt25wloXxASk6saO1ar61/klNo2eFLfkWB0D6O
 eG0eln93Sf4ihT9SgOyqvP64l0nUYrJ961f+lDUYFtkNeJJL7yD7jHTMPVZXkfOZwevh
 uv27//SfTNn4RxFI3CCKFiulzxvLUXuEwGfflaR0RQkgFvSbLov2TkFgPCdfetU/ayvA
 vKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Nj2yJHPh29QMi/JmvCm2R2Y8RUz07m04f00LEAKAd0=;
 b=iJ7Cca3WHKltgPCmYjKI1mm7dTmzbiZo8BWFZUmFjrf+Laco0irITpQMbAANwComK0
 m4/hULBHXRJVzkNJ74C9CGeyZ7rvfIXz0sxqLA7ruVGZC8lQLEs5YagQcfE4vciax8BS
 rN3YTKlqic/s7hTkUy8Xqcw9wsurkQBb6jCr9XVzGyrDDCz4KVLDSFHLBk6+b5Ay413f
 GHdt37UaBut6mdQ1QUJSBg7dPryWJDhl/nYSdNz4YtJFebqZy73tT32YuFs3DpIQewt8
 cnVR0xFzeQspAIkPunpJ/HplKo0dzSQ92hW0dpoBO4mGUJOJLUPdyllsl+xW7jFoYkw3
 WvJg==
X-Gm-Message-State: AOAM531AkycuCq+LqYWg7UHlR8cN5lXkbxffI2aoaNj1KphxxmtoKPGw
 YnG66nsFNRo2iCaVHlss4PpjBw==
X-Google-Smtp-Source: ABdhPJyGXdRObcj5bDZhIUUjifJmWa0N6RMRNu1/Tb0iahfVYOgRJ7Ffy1DP4HxVF+EMzAAjOPsfkA==
X-Received: by 2002:a17:902:4a:b029:e2:f3dc:811b with SMTP id
 68-20020a170902004ab02900e2f3dc811bmr8762800pla.36.1613071193568; 
 Thu, 11 Feb 2021 11:19:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 143sm6513071pfv.134.2021.02.11.11.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 11:19:52 -0800 (PST)
Subject: Re: [PATCH v2 18/21] accel/tcg: re-factor non-RAM execution code
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e38c5536-3092-3788-63fa-79c8d1742ed5@linaro.org>
Date: Thu, 11 Feb 2021 11:19:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 2:10 PM, Alex Bennée wrote:
> There is no real need to use CF_NOCACHE here. As long as the TB isn't
> linked to other TBs or included in the QHT or jump cache then it will
> only get executed once.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210209182749.31323-10-alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

