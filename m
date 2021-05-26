Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30D3920AA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:13:03 +0200 (CEST)
Received: from localhost ([::1]:36000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyxi-0001wO-RO
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyv4-0007Ba-8d
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:10:19 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyuu-0004uJ-4U
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:10:17 -0400
Received: by mail-pf1-x433.google.com with SMTP id q25so1695255pfn.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B0lHW0c+ZYGd2GHwFunOy3jQyPsJVdqNkGecq1gemBI=;
 b=bd75aPOzSfXHnn2gaNnmsyVN4DCigOdIReOFIEUr/2uHnSg8M4V/77L8O+PQmPtVyF
 3I6wQvYYZWL6IVcP/CVPfng2vkrC+OD1gNYuMeGU2kv3zPHy0CzxBLR04ATQHL4FCK42
 47tjwSaPv2HLNqJvskvrumtFUNsOa2oeYv1aBWrNGYnbviOUteobAF5F+b2Oid5lidwl
 WBLb83fCqZVK/razLXfStiNAZRqLQz7OcrFj/36DG/Lp0kPjgRg62JNSWSBmZNf6hTzh
 B5k1jojVo4RrvbeZzgA0CzJf97IsAzVgV073ViIy0LvfZWOM2KF0RRd7C0198g8lQULQ
 Uc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B0lHW0c+ZYGd2GHwFunOy3jQyPsJVdqNkGecq1gemBI=;
 b=jPbiyplt0g5vpeZqIpejhUxx52LSJ0hY9cLUlHj2usBqmKEO3WixIYobsEt3TEbByy
 gUy5xcLYv/pvtTg6pmy2MxqFcSt6aT/7/+nJVYWCISjfOERQnC/WzKrlr92ydB9ibmRt
 V0AAmgzqJ7hzL7C52KleJSjratAUhebzYZV63m5poSmG6VW9W+DP1JeP5azFRnGipZCa
 LQYypgcxtkJxO9cRADrPmPQc7u0crU8jUg/Gq3YWAuj6Y9m3G3Cgi6Fo38AI/MUksjBN
 rYyn+pWggDSwTaxPqUm6eqhBxW4MHbfKn6nMap7wVvKIlvDfDDOW+vwWFQ73S6Z85K4N
 45wQ==
X-Gm-Message-State: AOAM531R4GV786chiBYWPv9p0hIq8qaBHb96MVTVrDheaDCPHir6E5M+
 dTty+IruNsJJCjbR6YH0+iuYJg==
X-Google-Smtp-Source: ABdhPJwuimxfGF0pXou8i6CZC4909OexnhoyqX9iTXa/dxHHH+ECSK3DoXau6SZY8FGET+Gtqxpntg==
X-Received: by 2002:a63:465b:: with SMTP id v27mr25978126pgk.445.1622056205531; 
 Wed, 26 May 2021 12:10:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id 66sm134180pgj.9.2021.05.26.12.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 12:10:05 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] softmmu/cpus: Extract QMP command handlers to
 cpus-qmp.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f85b5ddd-2cbb-7460-d180-70827398fef6@linaro.org>
Date: Wed, 26 May 2021 12:10:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> qmp_memsave() and qmp_pmemsave() call cpu_memory_rw_debug()
> and cpu_physical_memory_read(), which are target specific
> prototypes.

Is there any reason they should be?

In the short-term though,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

