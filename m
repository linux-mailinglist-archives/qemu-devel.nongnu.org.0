Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B18C63F4DF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 17:11:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0m8B-0004nU-2c; Thu, 01 Dec 2022 11:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0m86-0004kD-Qg
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 11:09:44 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0m85-0000hl-5s
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 11:09:42 -0500
Received: by mail-pj1-x1034.google.com with SMTP id o12so2268738pjo.4
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 08:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bwTILKOyhCn85/23lQZBXe5Y1YfHjOoehqFHkiEsNnQ=;
 b=GmzqK7/vmWRyXP+EzWvRQH6l46eoZBBmKGi5316zTSgZwcN9NOw8Q5VjtXD9zFiDtZ
 i510zynHeHWfQEFhuyXiXKsRvTv6pKhHnqOAqD+DLkY232LasLNjy54mO0yx8D4F4ysx
 X5slLETy2007Dy3R+gTbw1g9W4xEG0ZLf/7PLUIysx/GuQQexKIAysH8DqoSVyWPu+ha
 gWaqju8AEH6p+FcNh0gvRHoLZETV8TCeO7qoh8akPaErNDwJWB0DGo1RVygr4cyaQuDA
 xI0jCrtwQH3WuFfzRgMY2FPo7YTYW3u1kXkLrSCcMNnxlRfoNuq3iXLVf0gUY7ypEOOw
 YyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwTILKOyhCn85/23lQZBXe5Y1YfHjOoehqFHkiEsNnQ=;
 b=t0AH/xnWOCQmrPbCtPpyMGwa9KtMUILMkD+y0dkcpPfJ1yGmFg8oVBsBTbB5ZO4JRK
 UygvweIBykjecvDDO0Nx/lDqIHxRyPBSnRRXS/4Z22Pltt6UUO+652LVdNaOoJi/0d8u
 3gTYEo1iHBgurAgCGqnaOiUw52Lw7fUJNieODKTBfxEYMXzQLIa9MTRPW4Bmht+nfR42
 3GsJlZWLPFHPLqQ0Gl+ZAHkM+uhvk08JGnDu4YqNrv8iI1uE+0CjxiV830Mt8+5iRCVH
 oARMhckhgG59YoDBAcxEjYfaa7EQlTxdMn53749K8GZBjXhN6JGh5C/gO/8iPJfCLsxW
 Gaag==
X-Gm-Message-State: ANoB5pnzvRCL2g0qtOQn/mQ5AjHs/KpET4eCZ6n81L5txW9Vgvn6kB+j
 X/BxcXoCdcECjqP7G2/4sFlIAQ==
X-Google-Smtp-Source: AA0mqf57G6+VC/lH7INycHgxfSVIxw8Use1I1aoXjGI9ulG5dd8fBxUk8VWLZdX8ZIEPpwNajKcLiw==
X-Received: by 2002:a17:90a:4894:b0:218:a96f:9eec with SMTP id
 b20-20020a17090a489400b00218a96f9eecmr58359050pjh.159.1669910978311; 
 Thu, 01 Dec 2022 08:09:38 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:14f5:5e3d:e302:4fb4?
 ([2602:47:d48a:1201:14f5:5e3d:e302:4fb4])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a62f84e000000b0056bc30e618dsm3415655pfm.38.2022.12.01.08.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 08:09:37 -0800 (PST)
Message-ID: <fc6d4cf6-7ab8-8176-e216-6d4dd5bea361@linaro.org>
Date: Thu, 1 Dec 2022 08:09:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] .gitlab/issue_templates: Move suggestions into comments
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
References: <20221201133756.77216-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221201133756.77216-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 12/1/22 05:37, Thomas Huth wrote:
> Many users forget to remove the suggestions from the bug template
> when creating a new issue. So when searching for strings like "s390x"
> or "Windows", you get a lot of unrelated issues in the results.
> Thus let's move the suggestions into HTML comments - so they will
> still show up in the markdown when editing the bug, while being
> hidden/ignored in the final text or in the search queries.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   .gitlab/issue_templates/bug.md | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

