Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB4466A5AC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:06:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSBo-0000G3-5W; Fri, 13 Jan 2023 17:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSBj-00009Z-Vm
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:06:17 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSBh-0003mN-MF
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:06:15 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso25732316pjo.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y+qvu+7Pyq9eGkJEkiUMjhl/CTNX4Fkv/iCghWgzUEA=;
 b=GWzupnxtiMTv9PyYpGSi1Ph4fVSpUTC8VH+gkqVospHTdK3Bb79I9XQsyo9HmaUG/T
 I1YCRGMPuj33EZUegH5v2xph/c9m1OjXIdKnhfpUO4ltynxKqGDKlESEhVq0HTUZNTUX
 tHreFmhHR2YRXgrJzKj7osbn6D7uzBvSXdd6cYN86OQ1Spq4noDBza/1xY3MCl1hIJQi
 Vsf5jLijCMkVnTSqgtA2sEF6QUSpJ97iOAFe3tuuHXBLNUT2UKs8yB4nmsoSOkQOMWPc
 rnIFvi8IoNJEV4Zvt7om8VdumRTq3epxvKd/s1rdnjEp/xTa8AFsHMe1vjSojzlerpAc
 E36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y+qvu+7Pyq9eGkJEkiUMjhl/CTNX4Fkv/iCghWgzUEA=;
 b=NVPcurXXlYxa88bL5BB/OyUXO4z3iyl1/wGf9j77qFslLhUmlvg1yb4E48adMKAGAg
 KIXoQ14l72FAi+x66MGPfTuDal9+USn6J+XjFgidZWFQe4KQFb+aiKvkm70jmim6NbI/
 pfmmH035GA7XpUh64DOznfSOnCOu6k6dt71fVaBCZRKuPM2ZLxCApwbmiuaXu/MbsqFw
 1CUFTjFhcPAG2rRdJYs4gl6sGIBPQ0yE4MVeUV/OketuuDdOueQhk6N0SdhfEdzUJG2c
 chU3e/1eBLgPFlCDsyEKP/tOtE4pvb5fuCqTcSYX4UIilGNNYxN7i+0HsiTg5fLfFKSX
 cEXQ==
X-Gm-Message-State: AFqh2kp8sQJAk0lvwHbKAyomWuXfSYuaAhssZL9EMmhQ2Rk/4jVutRBO
 J6kqyCdW4NGQY+9wrms5QvTPWQ==
X-Google-Smtp-Source: AMrXdXthoEcC0VtLJnDCb/yDqaibGbZuSB6Tr7SakXW299e+yKfjwRbKlVZCFoLh5shmSb03HSW4WQ==
X-Received: by 2002:a17:902:c401:b0:189:ba1f:b168 with SMTP id
 k1-20020a170902c40100b00189ba1fb168mr122912315plk.1.1673647570979; 
 Fri, 13 Jan 2023 14:06:10 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 t24-20020a170902b21800b001766a3b2a26sm14649164plr.105.2023.01.13.14.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:06:10 -0800 (PST)
Message-ID: <bf48eed6-bd46-a9d5-15df-a402c5ea3546@linaro.org>
Date: Fri, 13 Jan 2023 12:06:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <3be55a1c-64cd-28f3-9c7f-ceb67b20c36e@suse.de> <875ydaievb.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <875ydaievb.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/13/23 08:22, Fabiano Rosas wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 1/13/23 15:04, Fabiano Rosas wrote:
>>> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
>>> cortex-a57 as default cpu for KVM.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>
>> Our recommendation currently for KVM on ARM is to always use CPU="host", as named cpu models generally don't work (yet?) with KVM.
>>
>> https://qemu-project.gitlab.io/qemu/system/arm/cpu-features.html
>>
>> Should then "host" be the default for KVM if CONFIG_TCG=N or CONFIG_TCG=M and the TCG .so is not loaded?
> 
> Yes, "host" seems to make more sense. I was under the impression that
> there was a way to use cortex-a57 and cortex-a53 since they have
> cpu->kvm_target set.

One may use a -cpu other than 'host' if and only if it exactly matches the host.

r~


