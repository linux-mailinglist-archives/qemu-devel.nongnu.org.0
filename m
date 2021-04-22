Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125123678E1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:47:32 +0200 (CEST)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRFT-0000Ba-5s
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZRDk-0007Lm-4P
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:45:44 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZRDZ-0005jA-E0
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:45:43 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso278642pjs.2
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 21:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DXjCdAnHAhGCr+w3KoEts8f/6jwy2njywZx+6/hg9YE=;
 b=t6ENp/xv8z4IDL6KI0OqHPbBHh1kOa3qGrSZCajGcUXCTFbZlgP2SLPNctiLmrSQ2t
 G69Hu/zbSglnwGiCWmCxCd3W7wbr2cGv248NJkXbE9SqrKmVh1DjGHdJAD1hO3RtcMGU
 pJElz9RZ9jO5HY8B7yBmy3sGIguOsCcJq2V7Z1S9kHnD0eFQFqKIFC0CedA6qTz5yXNF
 X9nEnjvZhNEWTL+27nlyhg3Vo75BHLBdEy5VoY+he1dUlT4w98TFneA37OayYr4EpLkg
 UuF23A0tbRXu9tLBKmJwVRRzM/HVlW1zGJ1/nbf+SWZU3kBHzNH/qcmRafvbPN/q3XOd
 4K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DXjCdAnHAhGCr+w3KoEts8f/6jwy2njywZx+6/hg9YE=;
 b=HA2qbDHQmNVdKn+jmq2RvWbYCZbbd0KvpofK4kRG98OcyuDMUU4NR7TkgoKrK/NL7R
 YGtqutUORG5hAL1HKZL9xcEgc/QyyJlfVooyn/a4pxWTY4Zowa1Hi/R8IDruyNFJY7Yn
 5woBx4BDg4w+ty++4Hun7+mAzhyNnh/xaLv5Z7/qPruvTi97ETiNma8DhvHYXsJm5A8D
 KzKXlsYcCfBP1KVoddHUrOzAFRoQla/f/+gAGuKCkLL9111FhxgSaBd82aubIIoNpPp4
 e0RdX84atZzaJyTKNypfggGHHrtUKanEvWmyfXuDwR3ZFTUA0aAQpFMBO4vOCg3nYlkd
 lMWw==
X-Gm-Message-State: AOAM531lzS6LO9RKTRazZhLQvSOee0TvcHB3kXY7d/QSWAV8e5FeMKcD
 wgBQxfjzYlJG3Gp/L36lmdraNg==
X-Google-Smtp-Source: ABdhPJxqDifEjz2EiDSvzzDYU591AdzyddlKSGsVhoBDF+p1Gg4e6D3cog9LXZZA24AqVdb/AbPy8w==
X-Received: by 2002:a17:90a:9511:: with SMTP id
 t17mr15499041pjo.235.1619066731812; 
 Wed, 21 Apr 2021 21:45:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id e7sm828010pjd.6.2021.04.21.21.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 21:45:31 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] ppc: Enable 2nd DAWR support on p10
To: David Gibson <david@gibson.dropbear.id.au>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20210412114433.129702-1-ravi.bangoria@linux.ibm.com>
 <20210412114433.129702-4-ravi.bangoria@linux.ibm.com>
 <YH0M1YdINJqbdqP+@yekko.fritz.box>
 <ca21d852-4b54-01d3-baab-cc8d0d50e505@linux.ibm.com>
 <8020c404-d8ce-2758-d936-fc5e851017f0@kaod.org>
 <0b6e1a4a-eed2-1a45-50bf-2ccab398f4ed@linux.ibm.com>
 <YIDX5nRJ2NWdGvlj@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01a7ea82-1d51-6d8d-5b47-43ef9df6b81e@linaro.org>
Date: Wed, 21 Apr 2021 21:45:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIDX5nRJ2NWdGvlj@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: mikey@neuling.org, kvm@vger.kernel.org, mst@redhat.com, mpe@ellerman.id.au,
 cohuck@redhat.com, qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, pbonzini@redhat.com,
 paulus@samba.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 6:56 PM, David Gibson wrote:
> I don't actually know if qemu has TCG watchpoint support on any
> hardware.  Presumably it would mean instrumenting all the tcg loads
> and stores.

We tag the soft tlb for pages that contain watchpoints.

See include/hw/core/cpu.h:
   cpu_watchpoint_insert
   cpu_watchpoint_remove


r~

