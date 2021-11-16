Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653074531D2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:09:25 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxHA-000852-HQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:09:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxFl-0006PB-VI
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:07:58 -0500
Received: from [2a00:1450:4864:20::42b] (port=47075
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxFf-0005sq-L9
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:07:57 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u1so37094964wru.13
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+wcskVpZCz2ABvreuZMCyQV23DbIIpLb3pPau1hxkto=;
 b=Q+/ms0tgb2CdROap1sRfFEnZ1vZgVakswLYMVtnzx+YTdZ3Lh8P8rkaJtrbX/5QPlm
 6ppsyA8wIg365QtugypIDz/6d353qbbfOEINc1i+cACK8Ym5hLKYk1yXQQc1QsU0639U
 P0z8EA/lcmsPk9EbUOjVaLc2kZKOiS0zpoEBn2R7ZE2JRQLqZrg/eCpwQGtMk/NgDiQf
 Ymnji3lBL7iYiPfeyU5KjqnWwYQOopS9+4T760UMdfys3HfC6s6pPiFXMbisMsbfnfYm
 aL8FgtONAhGuHAhurmeFALisZs+467kN0EwHDyEiFG60IFy9UAHk9hEeO2jnzUte3EEa
 0U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+wcskVpZCz2ABvreuZMCyQV23DbIIpLb3pPau1hxkto=;
 b=UbYzKizRx3lf09zWxYqZv9LgE9cK14Udl2/1mDZEA5wp4ZdeO95+lXAcGO4h27kZta
 0x4Xt/U/JmYh6JNuNndFuQkVUd7yD1ycTLK1bvzwmta01R/7TFQ3LklvZdCbJKEEdqVO
 IQb6Oah3wsbbgbBnxvXproY6wnLyyzGcUG6kLx4aKvayzISPzSpiZNZkQp4qzg6VqWj7
 vOdFhQAQgCBPK2OiLR78qZNC9zNa2xB/QHThdktkB+BC6QmXV/qQ1E8MbbACncW97tZl
 s5jKyoZhW98yWjBeETYXPQZ8pIgIyyoPMrIGSMEOA5/AZXlS/zETR/acI3BxiUy2SoPB
 wi5Q==
X-Gm-Message-State: AOAM533QieyJMVgmir16vkN1NHTXyXnU1eSY6dPLgpv93qGSeYjrKiXB
 MJdIErNv3H0ONVEK8AGqOtz7XQ==
X-Google-Smtp-Source: ABdhPJwIx73tayowgekEoCSVDAyDLqpbFROKs2+UhokQEEC/bdkqNiYeJdQdRZiwGKSHMb/YzBJATg==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr8502568wry.110.1637064469721; 
 Tue, 16 Nov 2021 04:07:49 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id k13sm12514499wri.6.2021.11.16.04.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:07:48 -0800 (PST)
Subject: Re: [PATCH-for-7.0 v4 07/11] tests/unit/test-smp-parse: Add
 'smp-without-dies-invalid' machine type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-8-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd1da55a-26f6-e529-7224-8b4196b0c4a0@linaro.org>
Date: Tue, 16 Nov 2021 13:07:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115145900.2531865-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
> Avoid modifying the MachineClass internals by adding the
> 'smp-without-dies-invalid' machine, which inherits from TYPE_MACHINE.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

