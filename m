Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96566A52F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 22:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGRij-0002O9-MP; Fri, 13 Jan 2023 16:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGRih-0002Nr-NP
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:36:15 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGRif-0006oZ-59
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:36:15 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p24so24697914plw.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 13:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mIZca/3Or5SKTS8ZA8/quFtNhM9b0gLUJE0O9AuOUM0=;
 b=kmx6JKHmMimKpq4oHACFMAcWhbk7vdDJk8Crk5MttNtxi0BuNmLg0CCFQUsj1Rp6P4
 QEDEoyLLhnlAJVkRbDGnT2Xq0Q7f/MALIcY760EvhSsHCjSGeRwlYzA57i4lEIuttBiB
 FKOQkrEUbKd9qAgFSXeoTvSYCVi/FCQkwRCIbJCXNroceXLEbg8RHZcGJBQroRq78M8T
 Q7+c45DXYjk0YthuEJVMyFapzcsEzsV/Qst5yR7MDzHDK+Fv/SH4gk5wveW/8fzA26Km
 sZoiWEDVlUQvoO0YUfgZlU7p5C2YGgoEnU81WNvBJGv9lZaJTgl+C28bOclQHFYzYJVI
 mJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mIZca/3Or5SKTS8ZA8/quFtNhM9b0gLUJE0O9AuOUM0=;
 b=O+Qy9tC1Ymgp00JMaScMb6UcvuJCzVZEMmlc/GNo5+PLW135kPqBM5EzxIXfWA+BLF
 HeDn5r4loh7jW2sVTYDVaySAUSCqkKYDISLOp9QnqesaF2Ozr+O4pDp57QNNACPbjXGl
 usZyGccjhXrr5RlYL7q3Ms+Weh5k0v6WgN2sNbA7IrRGWiLaq8nVjzv+hI7VVn+qvlAz
 iwwmzfc6FWwcyhty5R12V39CLft2vABDekNsUVJXUAEsX7rf+fCMf9RYusVTW0BnZUKb
 l/f/KvFt2272/QNEtDy2SV8eOJUIddoS2CKkDNRNpJJjZppjpkwMXBDdUZPBK3tSdKgH
 7MIg==
X-Gm-Message-State: AFqh2kpicx5Ic2dzPZkdbbDCmsewAQzOCtOit4C4HdbwyVXDpRczPNoJ
 T6Bu9Z63KE4iANNC4iv1cKvIVA==
X-Google-Smtp-Source: AMrXdXsrLWxmZkONcXADziK/okWzsUjW/iS8rnqacW0nxFfhGlwsmLURJmVCXEewbtXMFQc9NS3K9A==
X-Received: by 2002:a17:902:7d8e:b0:194:4981:2018 with SMTP id
 a14-20020a1709027d8e00b0019449812018mr10447852plm.60.1673645771584; 
 Fri, 13 Jan 2023 13:36:11 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b00186c5e8a8d7sm14556287pll.171.2023.01.13.13.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 13:36:11 -0800 (PST)
Message-ID: <034cb8a7-a7aa-9328-45c1-46020d55408c@linaro.org>
Date: Fri, 13 Jan 2023 11:36:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/4] Improve the introductory documentation
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, peter.maydell@linaro.org,
 Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113133923.1642627-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/13/23 05:39, Alex Bennée wrote:
> Alex Bennée (4):
>    docs: add hotlinks to about preface text
>    docs: add a new section to outline emulation support
>    semihosting: add semihosting section to the docs
>    docs: add an introduction to the system docs

Looks ok.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

