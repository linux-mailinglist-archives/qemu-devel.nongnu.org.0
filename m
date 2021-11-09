Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0244A845
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 09:22:46 +0100 (CET)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkMOz-0004aw-C9
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 03:22:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkMNq-0003o7-5O
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:21:34 -0500
Received: from [2a00:1450:4864:20::334] (port=44599
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkMNo-0006G9-Pm
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:21:33 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso1628816wme.3
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uCA4U/YQM9Zf8s0LUo4Wt3K0TQsUkFyCSecC0srUhng=;
 b=nT7W/enDBav/rbHtPGh/lT9luo0u93s3pY0+nTaXTM4YZzWFRKx/l2vDhTnrlHfA+v
 VxJ30Yu5RgspVzZOg3ywZBKB1Ryh6Kle6ybsNrn+3grZH97t4JH9KNarxN8CEo2AMyjq
 O7ukIvMEhs/AveVCHa6c/0ZJCWxrQ2hkyvpVXBrOUuFfRnAw4L7rQxeEvgvd3vwU4bdy
 S2pXzeZOFhfhpimB270F/CKeZ8wLL7AsZmXHrr1rxe2IZB8gim7eosex++SE1YJCrf7i
 v0dGkC4Q9/qGNGIUqAO3KzqO27IJ1jMwDSzwKQISyXBEpd8/SX/bGNWJA0RTxySkLi0h
 oQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uCA4U/YQM9Zf8s0LUo4Wt3K0TQsUkFyCSecC0srUhng=;
 b=R91mrhjyrzAafkdPf/HffaQoJahfEMchi5YPN2hewST+9dEVZqSsTz0HiRQjOPDsEB
 T/xefwQktLYYboRMyQO+fekBfHPkDpAUlMwfzDopCLfJknOqpkqkuPgpUcHmVcC9KyEl
 aeGyOWgD6pSTGhtemzap6Td9oZ1IfZirXu75U2BlW1lxbMjQFzIXHPquaxJfxzFHRj0z
 Yx0U4a9TsvTpA10JfpYg2iDikFWftI6fST9l24bIXCq9hiZXXJxobWNJVVm1u1qmfa0F
 W2JnDfdZjyVNMXLMKx8NtvpaSBeJp7NYSNb/9B1/OptYaun3kMSDn9T8RdeV0yRS5hDF
 URjA==
X-Gm-Message-State: AOAM530fJbjwnP05xKYi4OZ9JNGH76Hbsh3FJJV5K8JeRtbVoa/WZ1TH
 gW48h33WpyOy3htHMU/pdGEcTw==
X-Google-Smtp-Source: ABdhPJxwbu3jeMtO+xSv1QzTy/dsFfcxVFchlA9TukE6zPz0BsjM4WvmX4GBgXHdp47qAdTP/hXjxA==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr5107099wmq.18.1636446091344; 
 Tue, 09 Nov 2021 00:21:31 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id 126sm1734578wmz.28.2021.11.09.00.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:21:30 -0800 (PST)
Subject: Re: [PATCH v3 2/2] accel/tcg: Register a force_rcu notifier
From: Richard Henderson <richard.henderson@linaro.org>
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20211108113353.133462-1-groug@kaod.org>
 <20211108113353.133462-3-groug@kaod.org>
 <5892d9dd-5f0c-d745-6a0a-84485e0e29c3@linaro.org>
Message-ID: <8a184041-39ad-1207-f32b-673e2b8da0f2@linaro.org>
Date: Tue, 9 Nov 2021 09:21:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5892d9dd-5f0c-d745-6a0a-84485e0e29c3@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 8:54 AM, Richard Henderson wrote:
> On 11/8/21 12:33 PM, Greg Kurz wrote:
>> +static void rr_force_rcu(Notifier *notify, void *data)
>> +{
>> +    /*
>> +     * Called with rcu_registry_lock held, using async_run_on_cpu() ensures
>> +     * that there are no deadlocks.
>> +     */
>> +    async_run_on_cpu(first_cpu, do_nothing, RUN_ON_CPU_NULL);
>> +}
> 
> Should first_cpu really be rr_current_cpu?
> It's not clear to me that this will work for -smp 2 -cpu thread=single.

Alternately, no async_run_on_cpu at all, just rr_kick_next_cpu().


r~


