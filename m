Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D544D839
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:26:50 +0100 (CET)
Received: from localhost ([::1]:42766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB2P-0003as-Fw
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAsl-0003Sc-SC
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:51 -0500
Received: from [2a00:1450:4864:20::42a] (port=45967
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAsj-0006kx-9M
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:50 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w29so10020946wra.12
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YfHVyEB68vNscGi6JjU9NGgL1Ud9paGUEUfcsooGgTI=;
 b=lIwJscutmuBFvjpbv8EpGZAzOBHfqLouIr5SFHkH3E54VQNVF48c+heTwzC/6I5hdz
 GtsMI4CsTmZ2JkrIxRYD5pfM1g0REV4XOfoMA/neza4IDaTUeKcNqEwr7vlupkD8EI6r
 Az8Xc1txg08f9a1p5odw7iv/aj50XZXwsxmO5TIhPeIY2lT6qjpekVXrYrJOvltlqaMv
 o/SU1LgekUg9WF99DDPik9WAkOdu1pbMX/ICMToBYrVif+ckVHUVyJWsbGWGbYob7s+T
 a9c38NQUmjTYIrQwsj4KvlAITBQvty4uCRIB/7Jm6gyJRUx13NJbNEPnTDIYnKeyRcy9
 GRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YfHVyEB68vNscGi6JjU9NGgL1Ud9paGUEUfcsooGgTI=;
 b=7H+wAizIy7g8sVWh7CzaMgtH9txliRv/SnJm+hB8t9H/ueYiEuWBcLHKPTsYpmy26L
 d3moys6bJIo9cm5Wp4NlAj4JNhso5JWSWi7Vg6Gb7oYtqDzbCjwKIzZF+ge4eBVdT2K2
 iVv3YGCZ6kuv1nteTPWu2LYxBb+hLqL7DGhBWiKudXNG5EMIwmv7xRSA356jzjJXjFFU
 bxacYP4UQrk//ZTExiD3ZESpOn/2svsBGY0iE1JilS7TRtygDXe57zAq2rp3spjeK/fk
 Lrir3m4kgn3+adkZuswZCvkAyg5ZmWoLSwbH57E7G4WkdGpDBm3V6JjAqZAHUQzDvazc
 tgsA==
X-Gm-Message-State: AOAM5311jBM+JqGuG6Czw6vZIMOlro53/Jq8LY2OVQlr93RVas+RUT4s
 42cAOcnvgIzHdHZWN+WbjQqKXw==
X-Google-Smtp-Source: ABdhPJxYCs7dAk9f+xFPYwVl2JxA6aUdaXrCBHAujhsouBpk2QsWBswK0XfMTy7VWlNDJj5ZWW3QXA==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr8609309wrt.224.1636640207485; 
 Thu, 11 Nov 2021 06:16:47 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id o4sm3866852wry.80.2021.11.11.06.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:16:46 -0800 (PST)
Subject: Re: [PATCH-for-6.2 v3 1/6] tests/unit/test-smp-parse: Restore
 MachineClass fields after modifying
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5c52ca2-72bd-74e7-37bb-f721891d1114@linaro.org>
Date: Thu, 11 Nov 2021 15:16:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> There is a single MachineClass object, registered with
> type_register_static(&smp_machine_info). Since the same
> object is used multiple times (an MachineState object
> is instantiated in both test_generic and test_with_dies),
> we should restore its internal state after modifying for
> the test purpose.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

