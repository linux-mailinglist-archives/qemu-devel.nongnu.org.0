Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2047E91D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:36:20 +0100 (CET)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vl5-0002wZ-TC
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:36:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VhV-0008I1-0Q
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:32:37 -0500
Received: from [2607:f8b0:4864:20::102c] (port=33575
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VhS-0002fm-N7
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:32:36 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 x1-20020a17090a2b0100b001b103e48cfaso6981643pjc.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FKeWEH6kTkk2WNB6hhPJpCVXNn0Po2VqEFmUGVZgsF8=;
 b=GpzBaXGUKdslWCQHwymHqXlpbb6ig+pd6tlhwa913WF3Jl5YFTtLKJ3M0vM+d9DqeS
 WpGzWwzRXHWpXW9g9t3jWFGaZN/slUuc9Yi92HgPOxrAVvJDpEBTuQK8Ui4xBU/M4ims
 YYW/Mtc0sSCqOKCaXpWo/NK20Lc8Gx0xqatT7qb+KREgkz0Bv/nFqv3MEWHXRpzBTqh0
 pgpuua/ynqr4pe+kDqyDr7nfAppwfpwKvdO/bbncqhVclpkr42tGpf2EkgqCwQ87Zsyh
 Ph56Va3DtXmJ3RWhrkfoFjcb6mcw+/vlwKih1P8YNcneGlf7BAvaioojnAbT/xhz0QgM
 p9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FKeWEH6kTkk2WNB6hhPJpCVXNn0Po2VqEFmUGVZgsF8=;
 b=YRhMSePG1zJ9wNC5HMeomQ3CWyzwcl560se7CMvdAYB1GPmD47hFUvwBgdQ1Y8b0f4
 3uufQektE9I9HOHUj1hr7unTVR2VTdCgKstN55Jgr7cN1oPKNt9gps+/Llkiwehdw74p
 HUhI59RjExiGK0vuFot4meekh8Qk7XLEZD5JmsefhUqMTmB3Jc+J9CPFUyUqFy5aYKiS
 E5fCKM8B9dOeg+yMxQ407JMNgCKwwoQDi7dKrFxyBlVgDQFPkwHVTLbhwYUS/RtOWsNl
 382dupoTc1IHOBMjeDLAOAiNDE+7JJvat/X7Ox0hL0y0yO2nn5/pt+zSbwJjN/rgCz2N
 RjNw==
X-Gm-Message-State: AOAM5309yHY0Jy1TkerblPsG8HOQvTX6K0ZbgnlOONw80TGtE2irE6UV
 2kKqFQ9FLJS79hCcFn4L41KYkLr0WJTUIw==
X-Google-Smtp-Source: ABdhPJzPP46YjbX3qoBTS5ulHPTjfAzO94akxcynjx9Z2seWIGa3k74bZjRMMAwROQVIjNu83l833A==
X-Received: by 2002:a17:90a:1f45:: with SMTP id
 y5mr4636713pjy.138.1640295153410; 
 Thu, 23 Dec 2021 13:32:33 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q2sm7277551pfj.62.2021.12.23.13.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:32:33 -0800 (PST)
Subject: Re: [PATCH 1/8] target/ppc: Print out literal exception names in logs
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-2-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0646e85c-365a-75eb-5292-491ff3fc651f@linaro.org>
Date: Thu, 23 Dec 2021 13:32:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222064025.1541490-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 10:40 PM, Cédric Le Goater wrote:
> +static inline const char *powerpc_excp_name(int excp)

Drop the inline.  It's not performance critical; let the compiler decide.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

