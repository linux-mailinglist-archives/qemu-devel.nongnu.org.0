Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018304C58D2
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 01:50:08 +0100 (CET)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO7lH-0001Sk-Jr
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 19:50:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7i9-0000cW-49
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:46:53 -0500
Received: from [2607:f8b0:4864:20::62d] (port=37760
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7i7-0001wV-7C
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:46:52 -0500
Received: by mail-pl1-x62d.google.com with SMTP id n15so5578416plf.4
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 16:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i3dPSt0EGN35q0wPzSCQlVJTeBrYSOAtr/UAgjFfTdQ=;
 b=spq/AY7whFYC/I3frhXLwWKxnuVfoYy03M1PwELNASoNHdheUkgacbNyVtrC8omjFm
 LwFW4wDHteZy1yYZfVIPVChkNYhfKLIIPPVYmETw8i304iVMeb+pjV7q6OJc6I6iCE9P
 w3RDUSo/TGtI7q12JO2symMm3suZIlI/pUnjqXSWNbA9rlYHDSUjZpmk6OeT+ccu5gqo
 KVR9hQeQoQGGEtKGBC2KpVK1EQ0V2Spj8eyBr0Z5U3yXfl8RqjBu6xEHBvR6fleutYat
 rP8C/TsK94NIkwG8aqceWgfiMtwOAvgHPD4AS6LvZZmgerzUQgGiOto7/siorvIpV8c3
 2qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i3dPSt0EGN35q0wPzSCQlVJTeBrYSOAtr/UAgjFfTdQ=;
 b=UHVZCKRsrYKcuZfuDarkhBdLzWdCHXNToB7EBJ8Qh2nbFU3EY7PAxSsXF9OzpJQsgy
 P7XCUmAs5bsSqfrhJzseh4Qiqx0VCeul/KgotdrooUNLB5XpuIOM6SVTecffN9LDRjHA
 p99OzjyVX0M/TbFZlGPfSB3c0egqW9EYNyB/iW+V+9/4cUKi2O8JCAt/v0EXFgztEUy0
 Mgpx9iyuTgy794COWrqs6lr3dNtwDghp6K7/HYq8HVb6RSTXhKfO5D9QymbuSudxrH06
 S3Nz+17Xl9g1jiX6oUJwbj91I5Cgp3E5BC4uD/CIYDW+Aw0FKHjr6gk9W/LYl/SEHEqG
 apLA==
X-Gm-Message-State: AOAM532M5Utq3sTYhZa5MVfkfIfzOtlpqQq7iWUNqsNwaGVGEQFAzlce
 F4GeqVTJa8gDTaTw+1N/2b0+NA==
X-Google-Smtp-Source: ABdhPJwjFeQtw/xPOHy/JWLEOfgyqSewkwQmc8ZWI5EJxEvuyW/QqYfE1M6Ur1Q0nwxXNp02IVDeZg==
X-Received: by 2002:a17:902:9041:b0:14f:1c23:1eb1 with SMTP id
 w1-20020a170902904100b0014f1c231eb1mr13730399plz.173.1645922809495; 
 Sat, 26 Feb 2022 16:46:49 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a056a0021cc00b004e105f259e8sm8061386pfj.152.2022.02.26.16.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 16:46:49 -0800 (PST)
Message-ID: <cfdb8645-03fe-5896-301e-1b4c80e57fbb@linaro.org>
Date: Sat, 26 Feb 2022 14:46:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] util/oslib-win32: Return NULL on qemu_try_memalign()
 with zero size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/22 08:07, Peter Maydell wrote:
> Currently if qemu_try_memalign() is asked to allocate 0 bytes, we assert.
> Instead return NULL; this is in line with the posix_memalign() API,
> and is valid to pass to _aligned_free() (which will do nothing).
> 
> This change is a preparation for sharing the qemu_try_memalign()
> code between Windows and POSIX -- at the moment only the Windows
> version has the assert that size != 0.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   util/oslib-win32.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

That would be my fault, I believe.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

