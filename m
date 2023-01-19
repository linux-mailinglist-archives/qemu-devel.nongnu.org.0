Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2CD67432B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaxj-0002b9-No; Thu, 19 Jan 2023 14:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIaxf-0002Zw-UJ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:52:36 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIaxc-0007oc-Qu
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:52:34 -0500
Received: by mail-pg1-x530.google.com with SMTP id s67so2420468pgs.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xVfSg9I0OgO/dWmFS0x2fQ/Omhg2xTzU3mZLgPOqpp0=;
 b=KEjyTrfAtTHSKGn+mqqT3VxFrbCoWnaqeJDy6qlgNSi5N+fUeOEgHLORraRID5GBuO
 iLoNb+fGES6dSN4DpxiDpuxzHVmQc9ZAf/1fpcKDrvnpkdLCdlzoY77ua4NfC0OFouy7
 F0mB5j2kxY6KLzzI1QiPc6jM70yTwVsH+l0RYzyBh/N+llnOZ5hpYq1bmLuXz6NmZU3E
 JJFXU3saqtaxzJQz9C1i1qfm1owq+xTAyjXx3RD1caHb3hvL933WC5+zUyR/LyEMnSEY
 wdVAG1ACXDtoDmHVyTAA1Fva5FrOGsZSucWO7wfRzcR3xvuQ5+6KQ9nKv76N/dTgXiYx
 JE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVfSg9I0OgO/dWmFS0x2fQ/Omhg2xTzU3mZLgPOqpp0=;
 b=Mr6wvYtV6ROE9VxgVJQlz5nBeayOGPY9iwZCkRV2kxDkE/5ilEfGYlazPbxuRazioB
 78L5seJB2M7MvWp1dqauRf3mUn/W8RlqgxRSx3ymaW3RqKe96+zA9rVL++d/jMKaF3bj
 jqgxSnPpJ/ozbTT39bdlQf8+1kxi/8Niwpfp+VZAyLrV4+9onsOlaGTrkfPcLoyB1y4h
 xuzs4Ajb9ceI088UujqkX4qFj3c7SZQA1a9pDqcQA+7BLf5uCbnlglPtidoHainc4C/B
 Z6j9kPMPjbVF6MpKUdrt96ShmGeeYTu1AU3y+BWbWgySEAXyG0gafbvnPMINu+yFReH7
 mQmQ==
X-Gm-Message-State: AFqh2kpAEm7/md+2Y+dFoZatKn5OcUzrTtSgjnV4jH6FataBs3NAv0+D
 Ede77j69ynFOO4OH/60tCZehvQ==
X-Google-Smtp-Source: AMrXdXtVFkLzPdOrRM9m91Ahi5yhM9kb2v8AgK3GlCdXAUKjckAofmsjhppvRH7r+rWd1b2WNjcfrw==
X-Received: by 2002:a62:6492:0:b0:58d:90ae:495c with SMTP id
 y140-20020a626492000000b0058d90ae495cmr11626830pfb.11.1674157950369; 
 Thu, 19 Jan 2023 11:52:30 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 o22-20020aa79796000000b00581ad007a9fsm936409pfp.153.2023.01.19.11.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:52:29 -0800 (PST)
Message-ID: <d6314a22-4c5c-a431-ce37-4cc7f64ac092@linaro.org>
Date: Thu, 19 Jan 2023 09:52:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 14/18] tests/docker: drop debian-tricore-cross's partial
 status
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119180419.30304-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 08:04, Alex Bennée wrote:
> This image is perfectly capable of building QEMU, and indeed we do
> that on gitlab. Drop the DOCKER_PARTIAL_IMAGES setting so we can also
> test the gitlab build locally.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 1 -
>   1 file changed, 1 deletion(-)

Why are we doing so, though?

Unlike the other container-cross.yml jobs, we are not cross-compiling.
We are building for an x86_64 host, not a tricore host.

We appear to be using this container simply to provide a cross-compiler for compiling 
tricore tests.  Which is fine, I suppose, but I think the job should be modeled more like 
build-some-softmmu, instead of modeled like a cross-build.


r~

