Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3C64C58CC
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 01:28:25 +0100 (CET)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO7QF-0002Ph-Sy
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 19:28:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7PA-0000i9-Jw
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:27:16 -0500
Received: from [2607:f8b0:4864:20::631] (port=45966
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO7P8-0007fv-SF
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 19:27:16 -0500
Received: by mail-pl1-x631.google.com with SMTP id s1so7775824plg.12
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 16:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9erXbZRotPTQDKXCSOOL3Z9dF+sIUYBlCPaAq2JVLLc=;
 b=BOmV6ZrHjzZhq3ALzPG+DBVjChaxpCcZ4+xeRLWFG6wNCwJ9hIujSUwlLQP81dmvLo
 GzukuhHn1+4TReJOer9Vec3xS+mVV0rmOrZ+zPl9D8XsH4rWwWTBZie5KofhS8z5mLlJ
 3S4Wyoyaujs3fPxvCrthOkppDkJ1Vuu/q7jZGvUCMr6JKnBgHXxjUgngvtux0ghSXqel
 nRjRLIlTGe5p6RPxfVbnHJ6YgHiLwRTD6/JmTFU3P+ZAZlxDQCeJhAdW/j+DLu/6yavV
 5MzOoDR5G01K8jUzSM1jGRM4wtbp1R8JCG9SY2l/z7reS4cGjtLXh0TmtuJp6pz4nz3N
 6b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9erXbZRotPTQDKXCSOOL3Z9dF+sIUYBlCPaAq2JVLLc=;
 b=EhBQ3VxKQUR8oYZ1ouyKUE9u496Pzmp0ia/3mpJHub4WRVmbcrywQJi8aIAcXDgbRs
 9kYroA+YYyVCUoeQFnIVrtcNsYqKRwJHDp/ZH+JM4hnT+de+jWKbvkTcgMSBeBjQuFH3
 9FsFf5D09JZSgTqsdlbHg+UEERTPGBWVxaoyO7nyvah5haMumHrqIkbmUG2Ohs6zG/pC
 ysxSfBkkK4o85I3H9cZele5GNa4LGk31kdnuRkwAPj2fdi4x978hDAtQb+ZkmJ2MNJl3
 q54XeoXZ50AomcQPYr/mlb9DZcTQyq4B1xT+i9ywDo73JQCi9FL4IqO6qxGDkYCvfLze
 uZaQ==
X-Gm-Message-State: AOAM533PfzqBa98e2TSZ6Uk++biLUbgQXKV7pHmo66OCd/uCJlyr47zI
 m9GdhztZN5AeVF9dYKZFqip/fQ==
X-Google-Smtp-Source: ABdhPJyCoixzCQCYjAzFXfCLDrgqueXKB7WXLWyz2+Dvujmc9gYfbqEq6eaVx+95hKWXH4aHCnLI1Q==
X-Received: by 2002:a17:902:cf02:b0:14f:e0c2:1514 with SMTP id
 i2-20020a170902cf0200b0014fe0c21514mr14140728plg.90.1645921633605; 
 Sat, 26 Feb 2022 16:27:13 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a056a001a8d00b004f0f28910cdsm7742222pfv.42.2022.02.26.16.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 16:27:13 -0800 (PST)
Message-ID: <34ec9c1a-77be-ad61-a67b-48dcee294408@linaro.org>
Date: Sat, 26 Feb 2022 14:27:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/9] util: Make qemu_oom_check() a static function
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
> The qemu_oom_check() function, which we define in both oslib-posix.c
> and oslib-win32.c, is now used only locally in that file; make it
> static.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu-common.h | 2 --
>   util/oslib-posix.c    | 2 +-
>   util/oslib-win32.c    | 2 +-
>   3 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

