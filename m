Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FB044A7F0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:56:26 +0100 (CET)
Received: from localhost ([::1]:33328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLzV-0004kM-SV
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkLy6-00042L-CW
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:54:58 -0500
Received: from [2a00:1450:4864:20::332] (port=45690
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkLy4-00014Z-R3
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:54:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1571985wme.4
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=icSrD/MmOw82TfVEb3mGvYibIbHwX57a+2+Q0W2uQHc=;
 b=KTnDd7vvpuDgI9teVmawkehISxqWIAKRX1IyiEOX++7ToIQ1HgtvTYCL8c3UxyLR5F
 9N0ONSu3pMd/cAgHmS9X8sjS1GO4K/UvMqDmc4ZnzkwXfya526EsKPymcUc3uH/jmJI/
 8hQG88GcQMgsgYGZlUhyzZkBTsUsyyIIkltee2Cre0YBu7trnIV+JW22UdK2clV8E5HX
 lFfuhBVox5rF9p65Fb8Dfq1H6eKbUThYLPf1aj6dMt+ChiDOhHIIuvYNIx69Q3FyqQUS
 7sCRlrT/l1iaDv060K7fqJRT8N0tF/ezIS5p1G5HtUu7/KAz+vleQYRR4lqW+XTRR+wb
 HmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icSrD/MmOw82TfVEb3mGvYibIbHwX57a+2+Q0W2uQHc=;
 b=uSd0kiHNcTfsTba5uiVqSzJMJLzMffD01fv93nDOobCGpu7ZGabE5+iMRaI3lKIP6j
 ZneO1/5qr9uwJTLdYUWslAMUO5xSTZ61VnFx/cajl8rJr0zT3ZJh0heq5FpTbGYpuyET
 d7GqCxtkgPNTrr0WNGtDctyM+IEMXNzmDUooFKuWRZQHzc73fa+7Sw3G7YZ7eR5aFLp+
 2H71LrwAQV72c1HPWqVH2diICJYGq/ASEWdPzH1aT8v4jVrVm0dO4fuU42dam7JwfJHs
 AsTgiw1JhU7eSFQVIdbpfIJRolrcogwqCCWsGsywy7LupLPyh6B+sFmMsAr8LPzk62Zz
 rsyQ==
X-Gm-Message-State: AOAM530IRTmMGnngcJs2/0nPfSQSNspZ1G5i4HclI0SD2FoeM0YHvJkJ
 bAxjj5Nb0tsSB31vACBjZxwElg==
X-Google-Smtp-Source: ABdhPJzX+RQHhLnjvjWt8AY15Cj/meE++x6BXQkq71YJIsrqbBMED9hHw3bSXdYjYqOq9h4ypfLu8A==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr4997876wmq.65.1636444495216; 
 Mon, 08 Nov 2021 23:54:55 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id u19sm1789424wmm.5.2021.11.08.23.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 23:54:54 -0800 (PST)
Subject: Re: [PATCH v3 2/2] accel/tcg: Register a force_rcu notifier
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20211108113353.133462-1-groug@kaod.org>
 <20211108113353.133462-3-groug@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5892d9dd-5f0c-d745-6a0a-84485e0e29c3@linaro.org>
Date: Tue, 9 Nov 2021 08:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108113353.133462-3-groug@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

On 11/8/21 12:33 PM, Greg Kurz wrote:
> +static void rr_force_rcu(Notifier *notify, void *data)
> +{
> +    /*
> +     * Called with rcu_registry_lock held, using async_run_on_cpu() ensures
> +     * that there are no deadlocks.
> +     */
> +    async_run_on_cpu(first_cpu, do_nothing, RUN_ON_CPU_NULL);
> +}

Should first_cpu really be rr_current_cpu?
It's not clear to me that this will work for -smp 2 -cpu thread=single.


r~

