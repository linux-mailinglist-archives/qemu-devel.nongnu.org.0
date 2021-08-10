Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B513E7BD1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:12:35 +0200 (CEST)
Received: from localhost ([::1]:46160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTQg-0003e7-1a
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDTMp-00057A-Bi
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:08:37 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDTMn-0002Qd-QB
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:08:35 -0400
Received: by mail-pl1-x634.google.com with SMTP id a20so21510335plm.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E2zukIypoqvVc/83vnLlrPZ68rmJHTPquZjFXl+O1lM=;
 b=SFlUunJqWewkcS/aQorybFoYcnRUr4IHUusZ4N9J9/q+MDtYTU3HjSJ6neofXZC2Nt
 4f2lfIWSF5/2a7c/tsFYAMlaIBvlhWIH5UJfpVXyXzGy5nqgyLMoWv36pF+feBxebCPx
 uJa0h6WmB1fKFw+AIBaeEi3m7fseOmgi8ofJwk+qQ49DzmaT+OWTKkd6d9Em25bne09Y
 p3K6SkCIDhKpzvcQuny49yPlpZ4onhuNErzch+OxVb+SH2YsSy2d2BKta/S446An2tE2
 kODliyj28L3JTLoFG8X8B1cgrQdYhEXx2SI1DZbAt/k/ee5OgZ0qArghyTzuga763Zsl
 t9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E2zukIypoqvVc/83vnLlrPZ68rmJHTPquZjFXl+O1lM=;
 b=JXSKVXBJquxeevGPGWq2tbub/JTZ3ieGiH4+ssVBgiFGGDyS5+pq7aOZ5xDw+fFw+w
 ro5rj8G2IyrSXA0u+QAqKTLX0swaVOZxOjTpr4DNuFaC4ygAixgFXoU09Wgl1U/aqI7j
 7NmhkpzLp4MQI8mCVADwMeKfDuhXXp+8k8cYP8Tj0iKztSC8aRnxWoRBGyx7utWbR9iB
 HSC4MTHnN2yjTE6EWB1iLfRI/ZXqZ6bJnV+DrkmcsbUBMwxuEwkaHQJHN/1mJKO3lCbf
 UE0andEZSTQ5jfdzmFJYOkHK3s42UeIRREwvk6enD/0tMWdAC2hio9xR5eVvsoORfVXZ
 XSRA==
X-Gm-Message-State: AOAM533g1pYHcFMzPaYzeI3BPZBX5yDzkN1tqRc9CYm/74jYKToZ9MCU
 PG2r9ZpyT0XeD87twPxcC7MDFA==
X-Google-Smtp-Source: ABdhPJwL12UamYiMqnNfW/gs8S3JTAWtD7vO7cURiBLoIDUqUJKFAgJy46rQ0EhRqqKtI9XJt58YBQ==
X-Received: by 2002:a17:90a:c20d:: with SMTP id
 e13mr5500997pjt.200.1628608111762; 
 Tue, 10 Aug 2021 08:08:31 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id y26sm25076639pfp.176.2021.08.10.08.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:08:22 -0700 (PDT)
Subject: Re: [PATCH for 6.2 36/49] bsd-user: Make cpu_model and cpu_type
 visible to all of main.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-37-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <95029605-62cc-eb81-3ad8-05930714b301@linaro.org>
Date: Tue, 10 Aug 2021 05:08:11 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-37-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> cpu_model and cpu_type will be used future commits, so move them from
> main() scoped to file scoped.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

