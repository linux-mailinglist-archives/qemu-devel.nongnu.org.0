Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572168C5B9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:28:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6D5-0002pq-Jw; Mon, 06 Feb 2023 13:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6D3-0002pS-N9
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:27:22 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6D2-0001NH-0v
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:27:21 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 d6-20020a17090ae28600b00230aa72904fso4115666pjz.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pf3wpo98ocpZojzJUra9uZGXeOuH5mXdt8yWg6RtZZY=;
 b=TJa6TnxHhKEivNxKOKlklAu07cnRPG9dR4+Vw049IqSz+IB19WXwQ28/Yu9cIhxXmQ
 ONaj2y6stdJFY0CSIclSQIaecIyQuc715Xo+hGpFA8QnC3M3ADFiBsA5K4Pb/8cF0qxr
 mbur5/9ZpMurib/WRaylfqSDFo/ceJsL3J4C+NTGRbeLUAR4Ep5MC07ddrEw3Cu7byQo
 +PNlFliuR2ETEoWN2NZJcI6ihtmxjLS3itkX24UeuTbNEqQC0jitw7wlulG3fkSx/jUE
 JQM8Si6whQ1qEg07McP2zXmyI5iVS+f90F+5KV36gyG7qenqPSS4X9e4LROtQa2v5hCf
 XaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pf3wpo98ocpZojzJUra9uZGXeOuH5mXdt8yWg6RtZZY=;
 b=MMAZMwErK6DAXykwrVkcBPqMmtdwysxcDxqAqOcl/G+qEFTsNZVSLMM513kw+ovywu
 oZyXsUx6pHmJS74D0ZwzpBcQFf4ue2NEdSCTzVZhNVE8jcNe7Bz92OUCkZUxj4nbh6T5
 s8mv8VDt57MnY0PGxmwwhhBIsN1ArdeB7BmYdmm+0XkmaVEz74Ub+ZFpn5FrZ1P+rEId
 pnyHL7gppzuCUQzFFB/WRWT8cW+61FUjXZOvFHN7OSKWleFfgHA/zcIKJrvhwMqeAPWu
 vV+cgsraD/sFjz2zuBOv8dgphmGFU5cow/VG9Q227cJMS9SBTX4fxQY/9fGoiH9gpXoH
 XhLA==
X-Gm-Message-State: AO0yUKVZBwGflsEshbENinP6GbinQcVhKPsqIAk/RTvo3YPccAuJA/aJ
 jwL01oZcc0qaTkDI/9SOiG4wtw==
X-Google-Smtp-Source: AK7set/N6u1sagtvJP1JT+ZXBR9x5zwXRHdQg5WiucTmuzZ7wcw8vc8YeuqN2UB41pHb6ghRqL4MEA==
X-Received: by 2002:a17:90b:3b4e:b0:230:acb2:e3e8 with SMTP id
 ot14-20020a17090b3b4e00b00230acb2e3e8mr417696pjb.23.1675708038115; 
 Mon, 06 Feb 2023 10:27:18 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 j12-20020a17090a31cc00b0022c35f1c576sm2865846pjf.57.2023.02.06.10.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:27:17 -0800 (PST)
Message-ID: <14188fd3-6e97-3e00-7d54-7f76e53eeb22@linaro.org>
Date: Mon, 6 Feb 2023 08:27:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
Content-Language: en-US
To: Eric Auger <eauger@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <ecddd3a1-f4e4-4cc8-3294-8c94aca28ed0@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ecddd3a1-f4e4-4cc8-3294-8c94aca28ed0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 2/6/23 03:32, Eric Auger wrote:
>> +void kvm_arm_enable_mte(Error **errp)
>> +{
>> +    static bool tried_to_enable = false;
>> +    Error *mte_migration_blocker = NULL;
> can't you make the mte_migration_blocker static instead?
> 
>> +    int ret;
>> +
>> +    if (tried_to_enable) {
>> +        /*
>> +         * MTE on KVM is enabled on a per-VM basis (and retrying doesn't make
>> +         * sense), and we only want a single migration blocker as well.
>> +         */
>> +        return;
>> +    }
>> +    tried_to_enable = true;
>> +
>> +    if ((ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0))) {
>> +        error_setg_errno(errp, -ret, "Failed to enable KVM_CAP_ARM_MTE");
>> +        return;
>> +    }
>> +
>> +    /* TODO: add proper migration support with MTE enabled */
>> +    error_setg(&mte_migration_blocker,
>> +               "Live migration disabled due to MTE enabled");

Making the blocker static wouldn't stop multiple errors from kvm_vm_enable_cap.


r~

