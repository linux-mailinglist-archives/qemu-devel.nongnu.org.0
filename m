Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105AF698435
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:12:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNCg-0002NY-IX; Wed, 15 Feb 2023 14:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNCe-0002NH-P7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:12:28 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNCd-0001nh-2Y
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:12:28 -0500
Received: by mail-pl1-x630.google.com with SMTP id e12so3714937plh.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U4sd4CfFvNun5Y19QQTyQhmAroGAbwJZmGAwqqnptAA=;
 b=mMeOvS+2WSMc8vcG+GvHi2uqx75Fs7+KehzaiXXSV88TbZbiRMh/rFcjPlzPukVkjC
 meoUWPhUDbzBBi0kztKAAFqAcPkBOZ/xKEHglxfP5uywlNQ4vrSXiGV/sxPVwWvjX6U2
 /zNWZILtWoL3pQLexRlraYVt0hsfQXWeeIQe/EHgFDS3ewPC9tPaJRt7kf6ihRqmOLDE
 sV3Q1zI0S4LWe4OVz7f/b1Mr9s98bqP+ZZR5322hPKITMtGyxkY+IdzcbwpTYZR8Y2mZ
 AROL9VUqqhY/WxW38dbADew+s3PK7Ex3zyAxg+VIdk5EQQOtpdke6/Eyd9khao5o5YQ1
 dj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U4sd4CfFvNun5Y19QQTyQhmAroGAbwJZmGAwqqnptAA=;
 b=PBHi035RIAFegxjdw6NVuM7/hNtU7eN9u9EQsMBJYYDN3/kyPhHcYABPkSzdEkukKi
 aPoWxriUXIPM4kIcLfyvtwVWgKDylt7DEIqsLTyXy//2dgPvhBl+fmFq4zb2cTsZGSTq
 TaMAQ7BEnKac2CFhqvpMpa03QQXwKODLvAUh903qt+a8syPvJgR17yh6544eU14G3R1r
 L+pz6NkXCicueeBhGH16WOlbS8SEEm4wxCpftXy/LhMxPTKQbLpKeeuXclkJNvifyHSR
 vFMETnUkEOQf2v/YSOOGAAWyFl5WR6kq9c9guh8GLroAbnQSMwr4k1yGKmdf62a1yeI8
 y9Lg==
X-Gm-Message-State: AO0yUKX0voH1ASGKwxe5kMFl9hv5mAA3GBbaQeB8kqKsRQuSpb8uPaJR
 yMfVhFVUXSw8GRu5cv67kaqPjQ==
X-Google-Smtp-Source: AK7set8rUb2+RYii4xhO29O4jP0rtKU87+I40MCyBF5jRZfPLYi3uJk1Ike1FybFgGte6EajE23ljw==
X-Received: by 2002:a05:6a20:430f:b0:be:a796:bf69 with SMTP id
 h15-20020a056a20430f00b000bea796bf69mr3309196pzk.57.1676488345686; 
 Wed, 15 Feb 2023 11:12:25 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 i24-20020aa787d8000000b005a9131b6668sm233220pfo.2.2023.02.15.11.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:12:25 -0800 (PST)
Message-ID: <0e830ff2-0451-0ae4-97cb-4559f2939ded@linaro.org>
Date: Wed, 15 Feb 2023 09:12:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 10/20] hw/ide: Rename ide_set_irq() -> ide_bus_set_irq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> ide_set_irq() operates on a IDEBus; rename it as
> ide_bus_set_irq() to emphasize its first argument
> is a IDEBus.
> 
> Mechanical change using:
> 
>    $ sed -i -e 's/ide_set_irq/ide_bus_set_irq/g' \
>          $(git grep -l ide_set_irq)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/atapi.c            | 12 +++++------
>   hw/ide/core.c             | 44 +++++++++++++++++++--------------------
>   hw/ide/macio.c            |  2 +-
>   include/hw/ide/internal.h |  2 +-
>   4 files changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

