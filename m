Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB032DB48
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:42:43 +0100 (CET)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuny-0008Cj-6x
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHucO-0005fe-OG
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:30:47 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHucJ-00032E-S2
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:30:44 -0500
Received: by mail-pl1-x631.google.com with SMTP id d11so16815899plo.8
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5elVsMH9HikvBYpynJ+zyC3Krg9QqtADRoVC5wkhchg=;
 b=BNy32NoQ6jhDYq/bCdDDiDtC/jln9296lEh0pxXxXbrS79qCGvUyZJkIY8DN64i4gA
 QlU1xjD69Fh4OxNGVVKFSwiQWQvdF4v+jLW7ufMdyxFezDtXGY75hRD8R5DR1F2NwUb/
 6OUlLrvFTxCcwFY0llUnXNbSvOzSKTjWOWMF8BGa6Ojzech8Mjxijid0akgR5zsZxLQz
 cJrrqoo5MjhJ200g01S4wh3I/9/3B55MVVCRk5Y2C5AtKuGfcIRXvGLB7xqvXhyJ/sKX
 I5klbtoTmvWwHhRnmAf9jcBSiSYWnBxGNonaWlz1jpeFyJrNaZlMWQji0NpvMhiQUVw8
 iZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5elVsMH9HikvBYpynJ+zyC3Krg9QqtADRoVC5wkhchg=;
 b=hVf283ShiQo33jgJ1+hL0uE6VxNAJV5UiBYwQIqqw921kBEqeBVKpXjB3LB+SLs3Rm
 etRsXHUaKc+0DWJGXzw/YDI1+DMrlwCAWlHnhce0UKlZrW66QphMJtudPuAASDJcPeSP
 wuVkKyPATUlMxkBhAWA9DYH/8F2dMnX10DjMLExtGsAmCSQz/6W1jG8i/BfDxKeDhGsR
 iBA7c1aCNFMgJ8SXeCvaN+YnLBNcVDI9HwgoUxyNBsPKv9JUdRN2w3nAsAIzstmJscni
 9y8q/DtM/CdIbUkKNd0Xv/eksmCk6SrVwjqCfdficfssj3oPNze9PZDJVToNXk0hnRgh
 l+uA==
X-Gm-Message-State: AOAM533wUwjGlDhMI9dnBfQ4vT7INvXy1t7q/iLZF2jw08c6rzjhTk3y
 Ov8q9Uq3otpuVK8KsU3me7DqG5gA87L0rQ==
X-Google-Smtp-Source: ABdhPJy6VvI25lgD5aARR7vFahhW0srv5FDSZf3uB4r1vsdnQHVfMVoRINO3D8iV13WNZy6YEpvagQ==
X-Received: by 2002:a17:902:e810:b029:de:45bf:1232 with SMTP id
 u16-20020a170902e810b02900de45bf1232mr5512327plg.59.1614889838409; 
 Thu, 04 Mar 2021 12:30:38 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id ml17sm134284pjb.45.2021.03.04.12.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:30:37 -0800 (PST)
Subject: Re: [PATCH 32/44] hw/arm/armsse: Add support for SSE variants with a
 system counter
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38bc9545-606b-83d2-ec92-2eb61ccd818e@linaro.org>
Date: Thu, 4 Mar 2021 12:30:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The SSE-300 has a system counter device; add support for SSE
> variants having this device.
> 
> As with the existing devices like the cache control block, CPUID
> block, etc, we don't try to make the MMIO addresses configurable.  We
> can do that if and when we need to model a future SSE variant which
> has the counter in a different location.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

