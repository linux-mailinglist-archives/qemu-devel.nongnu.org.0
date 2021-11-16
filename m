Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940DE4531D9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:10:58 +0100 (CET)
Received: from localhost ([::1]:41832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxIf-0001ww-NP
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxFF-0005iX-6T
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:07:25 -0500
Received: from [2a00:1450:4864:20::430] (port=47074
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmxFD-0005oj-Be
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:07:24 -0500
Received: by mail-wr1-x430.google.com with SMTP id u1so37092091wru.13
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zSV39xh6yB6Fkq+7SfDKr7yc4+DJ6dOkkanq31zzwtY=;
 b=jMtw/VUi7VEUuYM1WWNrou9kdgaZlJQ9g1bxQEMe8+vkFGTeX+l5s1vMx01FlTbztR
 UlC9JYyGALhKHHaVmrIXlOeHwR2ntXa+7keBTphkSXsaN4Ojii94NQsWWNAtTBbHFVV3
 LP1uWbR+Q6dn25Mb+qqJOXwP6k4F5cKg0XvkgmGUljFK3u1ciG1UDwu1XO8jfoKQMLgC
 2T1YeTLSTV6pvDjocqUaUyokIkvLnrbr07SKFk8jAFRLyQ3sgDkpVY/z3D9Sq5CQdUip
 CgoECrb8LoWQOOUuLEsQWkp17L2FTLei6g1SALzl4alrcqydd5zn+aMn0NUKyUG8eO6k
 V9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zSV39xh6yB6Fkq+7SfDKr7yc4+DJ6dOkkanq31zzwtY=;
 b=DeS8SY+sgnk7QJBdF7wGSljHuuoJwpQuSknLIy3Nj6K1JOovwQNg70z0y4iRcWrl6i
 sD7LTlmGgkz86uqLXyDDtWgKXZ6IwujHuw9fZKvdfFNDt+0HKrMdndf6oC25DQe39UFI
 gfFEMDj76+jdkX1t9ijH8YChI4+PA2xjYoXAm/JKvVR72P/EgDeBGY2xm01fDPAZrpUv
 beswp2Zo03IUdxvcc1U6aAlViJyo5i6o3m+mnAxF93S4V21hB1m75v28yTQB5nfkaOjW
 XtlCaYlIktJvTCJx+bMVizMM4v20g8vAvQMyL1CA13c+jMIB3Pgv1fL8+8ledBtRkCKk
 0WLw==
X-Gm-Message-State: AOAM531fiQxzqbwVfiAtXU3AtV66VxSESb2It93zV+9zpZNnQh0qYNcx
 q+865irzAJGrcE6y4sA2ewpDWA==
X-Google-Smtp-Source: ABdhPJz4s+LcGpqDELW/6x+D11RPaV2twcbt3QmAIWhDgCCYzB/8TirhwTHebkjJbDZ6Gxy5xBAFkw==
X-Received: by 2002:a5d:6449:: with SMTP id d9mr8021314wrw.332.1637064441739; 
 Tue, 16 Nov 2021 04:07:21 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id g198sm1790006wme.23.2021.11.16.04.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:07:21 -0800 (PST)
Subject: Re: [PATCH-for-7.0 v4 06/11] tests/unit/test-smp-parse: Add
 'smp-with-dies' machine type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211115145900.2531865-1-philmd@redhat.com>
 <20211115145900.2531865-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d21efd3-a755-daa1-93ae-d407677a0988@linaro.org>
Date: Tue, 16 Nov 2021 13:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115145900.2531865-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
> 'smp-with-dies' machine, which inherits from TYPE_MACHINE.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

