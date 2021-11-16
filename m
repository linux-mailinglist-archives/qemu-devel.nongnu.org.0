Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544574531D1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:08:45 +0100 (CET)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxGW-0006ZR-2J
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxEh-00054Q-Rf
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:06:52 -0500
Received: from [2a00:1450:4864:20::335] (port=54966
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxEe-0005iW-GP
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:06:51 -0500
Received: by mail-wm1-x335.google.com with SMTP id i12so15864296wmq.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ln+mu+GjaKuv6wgpEzsz1KfTn8Re8Ycce0GWgoei4mU=;
 b=XO2NsknCUyB64M5T7151NFm3IoERd2JJ7sj5W1JKiKWDD68naKiy7iebJeJ2SgTFaF
 LPi7oXTz8vMMP2+M03BJTAwUFYFWxAfjWq17TSFKNvPLvJezgXW69de3P1IeUUl42jTx
 dXd+MJgvi9p5eLmm17iTRJh/Y6S0ORuuJ1vL1lLqwD+vEONDx02OQNU/pABlt/e1UZjd
 nVJOnlIpXGGyvZPFDkQiGXgVHVesE3PLtAkeflcBWxXtKjn19FFIirtY5zhZkL0HM9nv
 kl1nhn/tLY9JGeRbsH4gXEqos7YDzypi2fwgh09EmKCBFE3Ttx1udFO2rbUPv47zrG60
 RQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ln+mu+GjaKuv6wgpEzsz1KfTn8Re8Ycce0GWgoei4mU=;
 b=jt+YmOmJSI1BoUkbMXpGAngRxKR/9eqX9u+TGdrLF7TQd9TvOzKYRXC8+aE2nl+wZS
 Co+H6j7eIWV6oKpdXRCdbm4ETCIxGVF4ZBhJecxAB7QXGVkqH+f/VTdxFwYtuqYbvCXH
 XGSw0hqsEVTJ94Vlb+6X7q0pOOFStf8OQy93SyilTOa92F2m1VxrZjo0zl53x+ZiGWXt
 t4zr5LqAHDV/oMyMh9OlkfabQdA/Cf8e2PPVsuQeHO1Oj7HASmqGERxIeHqwVpuINP0C
 c87r2XC/nqQvCPgHI+fEbsvCVyxiJk9L+YDZr3v37ynvsSZs4ImV+7dfTUfhNABnHTPr
 Ibng==
X-Gm-Message-State: AOAM533HR2aB3HZrEZAlm3o67uavnUpRnHAi0ZzlQk6sDcp4dnPbPUws
 JtpYf+YgM3iBpr561y+zrtpGUg==
X-Google-Smtp-Source: ABdhPJzQXfLbsI3s9o9t9QiqZvtqX09XbbjszgXuaEvlOy9MB+PG2tKGZstb+/dKNQfqT9EhNqKFbw==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr68378139wmc.127.1637064406261; 
 Tue, 16 Nov 2021 04:06:46 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id g5sm26089333wri.45.2021.11.16.04.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:06:45 -0800 (PST)
Subject: Re: [PATCH-for-7.0 v4 05/11] tests/unit/test-smp-parse: Split the
 'generic' test in valid / invalid
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d825916b-6c19-ef4b-e98c-731306f792a2@linaro.org>
Date: Tue, 16 Nov 2021 13:06:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115145900.2531865-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 3:58 PM, Philippe Mathieu-Daudé wrote:
> Split the 'generic' test in two tests: 'valid' and 'invalid'.
> This will allow us to remove the hack which modifies the
> MachineClass internal state.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

