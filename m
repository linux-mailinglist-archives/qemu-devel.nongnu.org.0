Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E4444D867
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:35:21 +0100 (CET)
Received: from localhost ([::1]:37762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBAe-0002ez-JT
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:35:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAuM-0005Eh-Ib
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:18:30 -0500
Received: from [2a00:1450:4864:20::431] (port=45991
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAuG-00071B-6j
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:18:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id w29so10028613wra.12
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Slh+NSi3CYS+GxwUPInFlVZGmGzOi3/bj3rNvp2OF8k=;
 b=XfMeH3Uf7XK55FXDPytsN1cMPGOaeA1EHnqU6eaViZiPCFvZsInFN5lmFvZXz+cyrM
 1tOGzusLLcbswqnEMvgHf0d3iKzJdOpJ4Zykatzun52T7uS+BtuTfPA/oR7OUqINds05
 EhuE9PUvZUey/sCmHx5i2mW+OeanBSlxhZQ1aNRXDk/ReP9eF0CcpsApZlvMBFKcOpvx
 MfDqHq151142Lg0r+tDr5D/S7qEwvfzPAPU10kwfrOgi82RLjGsv0MrHZGz0jVq31fcF
 osfcQJQvyhXw/Rrk05xiua7P3qlGZp7yi7dE0jskpXCKGMahhqumM2FbO8lXzZO+Lc2V
 X2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Slh+NSi3CYS+GxwUPInFlVZGmGzOi3/bj3rNvp2OF8k=;
 b=y5t6LyLYBrYQVyQ9rtxyXAfIl4KrGyV+zJfwtnReEG0GytmRfrKSq3nTpUTM//YRRL
 LVMQD73lOg0fnJSbtrh5Kr9Xm91F0zZIrpEg8blqbG++E45p+0xJ3e5o6TLXQvhluFK+
 GQYxv4Lsnqwb4MyBqlEzDOLTZ0Yg2unw9ZVv7cJ7P0hlfBQGhAVAfceoAGpk2Jg7Mo5L
 VW3tIvGeI0WonggEVDV7qsQw+t4SNYfqLILSo+5gNcTOr7qsz2+/n8x/Y/SZoSPj5496
 KpH1A/1QvQBGZq3xzRbXK+VuUI9xnZhRMIx77N6H2BQbjkbEniZ70t5J922HjdPm9oCm
 bnjA==
X-Gm-Message-State: AOAM531EO87Yh8RdmpfZSplhovKE4KKiycjon4wdWBDNfP1vyUdHozgS
 mZkAhNzyq67lJATMdamFKzEntQ==
X-Google-Smtp-Source: ABdhPJysK9Mn7QO6gUkaBkRFKm5HgH59bHgXIhpfcmQCtxXYFvmMdImGtVMKAf5d8NV2D0Lj2ij/iA==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr9046016wrf.197.1636640297976; 
 Thu, 11 Nov 2021 06:18:17 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id w1sm8860918wmc.19.2021.11.11.06.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:18:17 -0800 (PST)
Subject: Re: [PATCH-for-6.2 v3 2/6] tests/unit/test-smp-parse: QOM'ify
 smp_machine_class_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09cf5f54-0e0f-96e4-fac3-d01da5f02503@linaro.org>
Date: Thu, 11 Nov 2021 15:18:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
> smp_machine_class_init() is the actual TypeInfo::class_init().
> Declare it as such in smp_machine_info, and avoid to call it
> manually in each test. Move smp_machine_info definition just
> before we register the type to avoid a forward declaration.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 25 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

