Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817AD4C3684
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:07:02 +0100 (CET)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKOD-0004A6-HA
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:07:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKKz-0000Bx-T2
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:03:44 -0500
Received: from [2607:f8b0:4864:20::532] (port=43594
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKKy-0000VX-0U
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:03:41 -0500
Received: by mail-pg1-x532.google.com with SMTP id 27so2636568pgk.10
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 12:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gxrZWwHsfQofBmGElc59aYYGwbkZw4wfzwhydFb6WE8=;
 b=tPdVdvUWg82SExe6VZuKuKcNtG9rnSJJHAuWhR8p/CiD4OuLnG7QYP/xiClx2iMPjE
 vICB139BKFESUZRQXbwMjhVvI6zchg0oDS1tP1sXrqbXaEJ0qkVsAmw/NHfeZ25Z4KhM
 kS9K67fsk4Y3xMjQBJvuQsMd+xdt8XMTMDzo9sFUrTfS4I5tn+yCQCvHV2aoCHgiHXVO
 1rSc5owPekmwB4qE8XcQA89MPywtHhs4nAol7x0d3ViEJ8b9NVY6G+80G5tyzlMmZSTR
 Nl8JWRAXIodiUNuZMdSjBG4lPFfjCa9zQvXL35EHQEQsrn9fKz4OcLgHuIyWVYQ/QexM
 aKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gxrZWwHsfQofBmGElc59aYYGwbkZw4wfzwhydFb6WE8=;
 b=2gkao/ZvIhD0ivDcNqAyYACx6n2BbU2UMTKEeh++7ooxvg5AyFqz0mkK8LgeEYh8uw
 5TVMgtHFB3RVHcpJkttf3iLb/JnwqeJ5QZimWcKxaGPO0d2p9yMA4AOBd85qLSHXO3em
 ypnoy9lOrHTXfBxf/BZsyVf6FcsUJLUUr6989nQIPrZKsSJXqbhzEgBf3MU7QmFYq2y0
 d6fzlFXKI/Svm+bMrFxfkZI18mnSZ/YddFfTK2k9Y4NXZnfyAYOSr+BicJXStL/tHItM
 cnANRqkpI5j1asHZ2NW77MrfYua84/2LfKdKyCua2CeKedN3emiAUgH8u806LRlbKY9F
 NRMQ==
X-Gm-Message-State: AOAM533zJ/2GFuhdSdYSbQR+rpVbBfoywVZDUptxQzpqDBnv2BXe8axm
 ImoxmxbHDq3jrKGWiX1jpav8jA==
X-Google-Smtp-Source: ABdhPJzgUvy5Pfx7NPznXaFtcd6jGwitYpOILZfr/04jKef78rwnLGYPIvDJCw9xJvM7rBGz0HGMkQ==
X-Received: by 2002:a05:6a00:1494:b0:4f0:ece9:a01c with SMTP id
 v20-20020a056a00149400b004f0ece9a01cmr4141682pfu.58.1645733017161; 
 Thu, 24 Feb 2022 12:03:37 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm322132pfc.111.2022.02.24.12.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:03:36 -0800 (PST)
Message-ID: <f10a471c-cb1d-2cc6-103b-0eed07b31326@linaro.org>
Date: Thu, 24 Feb 2022 10:03:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/12] util: remove needless includes
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-11-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-11-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   util/cutils.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

