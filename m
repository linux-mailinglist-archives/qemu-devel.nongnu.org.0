Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B0F69355B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 01:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzvO-00016z-GR; Sat, 11 Feb 2023 19:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzvN-00016N-2h
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:08:57 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzvL-0001J5-JH
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 19:08:56 -0500
Received: by mail-pl1-x631.google.com with SMTP id k13so10298822plg.0
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 16:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5pbn28NdBT7eR1musuMumktiGbVnjbmT92RPP1j+jpc=;
 b=ZQV+YEsOWYdEKKl/ojfbG1QxtlXNNV4qH3mQZNCIXuzBX2E9lwpo55lvX2MZ10SbZA
 rKJpvPUQG0WNOmeilpXoVQb5E+rnywGhvRssj9zYYzSJOGSjXtx6mPdntaSJDG8Naih3
 pdeivXKaDyQyow2Vqtq9wareBSrxwfKE1oEmVd3TfAYNNUqHe8j+4Y80OQCWDnXqUmca
 lztbyeUKfCYLAXDNJF4LPWcuqAmeK+lfGyDQVmfR2K9Ww2D8eN5tCA9gOJnJJRQJdPie
 pvNr9cjVFD2nrdZbXsP1ISD3C1IMs2OKOZPSUK0UQwXQh+hhQgBsd5emobN5QVJnGBQA
 tlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5pbn28NdBT7eR1musuMumktiGbVnjbmT92RPP1j+jpc=;
 b=alTsWXXO+pzGHMRGq8ikPgK3tgDynZoCFelh1myo0mjsnh1VTYBIkKxsp60yNqTN4y
 Y+tah2J5CPbdTWF6iwrq/ytMNMrcaTQDnw6QPJ4eTBpgu4nZG0WheW2qdpTwNT8wzHYI
 axHzdkUuF5l0DFxZ6ZwxQwUkzt10m+59GM/vjs4Fe36018XOVvuyw74FtHQsNjKcwWYt
 YJuFjgjxEyUsdAIFhgOXNIoVjxF4bg8ngPWi369CVQqBHsDFWML++OVfN/BWkvHKumR6
 ty1498F7MpYpCheqMVm6+Nh1hg7kRQn3i3jJAYXSZfaDKikZChXx7cYNlDL1NYtBJUR3
 0zpw==
X-Gm-Message-State: AO0yUKWFYe3hoU0XmCzNoTKh7r2L4WtdKN321x5rXhh8IDntUDqivqlq
 jCpbVTf+bFKlM8iJ8jVu24GZAQ==
X-Google-Smtp-Source: AK7set+KO9RMhfxUeGdpfJfSNMvJt006YIDR4RvxSTMIKvX7iZJabce8+FxC2xLXESbJeFl/p7+t4w==
X-Received: by 2002:a05:6a21:620f:b0:be:e43f:df97 with SMTP id
 wm15-20020a056a21620f00b000bee43fdf97mr16018865pzb.14.1676160534066; 
 Sat, 11 Feb 2023 16:08:54 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 d14-20020aa78e4e000000b0059085684b54sm5565687pfr.140.2023.02.11.16.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 16:08:53 -0800 (PST)
Message-ID: <b295255a-773f-a5c8-b1e8-d503a4e02f78@linaro.org>
Date: Sat, 11 Feb 2023 14:08:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] hw/pci: Fix a typo
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230211152239.88106-1-philmd@linaro.org>
 <20230211152239.88106-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230211152239.88106-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/11/23 05:22, Philippe Mathieu-Daudé wrote:
> Fix 'interrutp' typo.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/pci/pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

