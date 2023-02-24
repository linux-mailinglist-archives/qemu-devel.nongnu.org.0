Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5E96A2383
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfKm-0005ou-GY; Fri, 24 Feb 2023 16:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfKj-0005nl-I5
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:10:25 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfKi-00064P-0u
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:10:25 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so579347pjz.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 13:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1YKAk+UQkZNuVzk5BGf9V2Sy1T1M2jL3ILYc7vY4po8=;
 b=m/dpqZho6TzYcj+Zm1MeXuXuMgHmq/o1BpJhYf/L3irCbTZPd9bhPu+hi0z6csb+Fh
 Ugm3MAc481OSYzDn5agclGealOnIAheqTFBKsrM9WIwMqvXrGdSFQiHNI5Jz/DJmp9Jl
 BAGwForGYjQocy7J04jmgP2utykPUSeWPghlO9VSokCqx+XObSvjAu+kjqPHcnl1A5BT
 Rt5YD2T7MM29Qlfyd5GkU3lu1NWWrgJwqm2K56dDs6pEtuoV1oaegUvvhOvprscoRfsF
 tFfEbyep13eC0E9vTK8AOK0sKvVUz3jjBjrLx9uf/lFT6BXySjfMK4BECLFf7vNMAC35
 Llcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1YKAk+UQkZNuVzk5BGf9V2Sy1T1M2jL3ILYc7vY4po8=;
 b=aUdeL8yh+IJrvenIdUYXKoPUTqgs3Ebrq1hZHBK+6KRGxBVFdRZgeXOk1JDw+rerfs
 PIwv7QrPP3OGZeZgsEX/c9HhxMEbp6nvV16WyjoZ5v60pibwISl3jDt4wDQhXDbuk/Ev
 Q7QtezDC271cMIkTZMFsyhPbwGwuk7QCvr1hsSTcxJhYKirZiMrfu1LcmQsjP9F29tDC
 HT06QbPRYx8DIaI1q2P71satg3jd7mBBSJ0UMomly2B9bwx9IjUz2/UCBj1Wtz9/ak1H
 WzQ/Q5lTFjrePQfPqjsRohFP1QbL2d+ac5nOB9Z1pbTlSAEVCatB0AGKZga3kL7E6aVe
 4h9w==
X-Gm-Message-State: AO0yUKU07DcdVPpByAKF53BBS+6hgqneCE9j09OmEpLzHGv7w+CUcbLt
 BdHsAd7qNBA0sPqqi3Guupd/jg==
X-Google-Smtp-Source: AK7set83zTBCIAyESYvYPsA5RKJr2b2ZVc6cK8seWOJIhShRZ+FDW/D0I5XOqIaRZ578KPkKzIZISw==
X-Received: by 2002:a17:902:9a01:b0:19c:be03:d0ba with SMTP id
 v1-20020a1709029a0100b0019cbe03d0bamr5914929plp.18.1677273022290; 
 Fri, 24 Feb 2023 13:10:22 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170902c18400b0019c2cf1554csm12999253pld.13.2023.02.24.13.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:10:21 -0800 (PST)
Message-ID: <6254606d-7164-50c3-a0c1-e3614810978d@linaro.org>
Date: Fri, 24 Feb 2023 11:10:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 5/5] dump: Add create_win_dump() stub for non-x86
 targets
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
 <20230224073850.84913-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230224073850.84913-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 2/23/23 21:38, Philippe Mathieu-Daudé wrote:
> -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
> +softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])

You can remove the when: as well, yes?


r~

