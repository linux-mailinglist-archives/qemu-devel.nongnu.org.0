Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABD12F2330
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 00:56:32 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz731-0004Ij-4U
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 18:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz71I-0003aG-4B
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:54:44 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz71D-00037r-BJ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:54:41 -0500
Received: by mail-pj1-x102b.google.com with SMTP id v1so497216pjr.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 15:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KP9sn3FFz6LwmXS4mve5uxiwRAGtey2SxLi8HC8Ezfc=;
 b=ASpKcEYwWgwtkUAj9hBNbhXC9BcsuZnDLQlNPEEiKVdSQxOtrldqx4q/0PwcIm0rJV
 yW/kDz0cyqtpUABuPdGX7qgANctJHlz7SqG/9sRhNuLuEplg4SpnAgk3lFlUp0g6khot
 SOHUMy8HuhjolXgRa8q4Gio5E+ZQflbx16m2SY8R5RFsxr1CGLpD4hXXiPbMDd/XsRhM
 FbB6paRsGsiCoOvpcnjQIwZMK9RvLNHrF3FsyO39fMbd12Scx6X3Pb4G++9fq15gc+RN
 Tgt59iPmlTuJ+RYwAeT+93i6qB0nV4VTjv9r+7XGQsJoj9UBYSAW3UdwSdUXpwsBo0w3
 j5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KP9sn3FFz6LwmXS4mve5uxiwRAGtey2SxLi8HC8Ezfc=;
 b=ma+Tja0UMBa0r0m9RnHpXKPNYrgGkj/RH3E+PB+65kTr8MdhI7lVKUz1qZ1EJmfewN
 tcvhWxF1Hm1Um6GKTe+cHa1HtOXZVs0aMG401/dJKGWKO18Pr3K0M2jv6DQ3D4xetxo7
 g69jaDeiw2CgD30AXWIXtYVxaw99GnnWUTVXo/TqDrI+BI2Kkn9MuTOIvvb6fhgv9jAq
 M+fYsvuJ5VH7oUzQQ8FpqG1xiTTy+Fk5W/8q6AAxySkCOT0oqmNxDIYhuXqEonkRbUET
 hYz5n39/ZOxhAxfgFxO8uPZmdFt1epAHU87d942AEUQqFskmweFfnveMOcS9zLECLSi1
 w+/w==
X-Gm-Message-State: AOAM530+7e0bYzc9vY5bcjBRJFGsxMz2ymrPFaeQpDTi5GPQc182r40D
 EhbP3fxmuqoupouFJ6zYrc5S0w==
X-Google-Smtp-Source: ABdhPJxHwTjaqbrxYl65BhvZFl0logBIuUItuWxxxQRRcFjuaHD0paevl+FltGSmxTD7AHm2qxNz/A==
X-Received: by 2002:a17:902:b213:b029:db:3a3e:d8ad with SMTP id
 t19-20020a170902b213b02900db3a3ed8admr2185277plr.73.1610409277592; 
 Mon, 11 Jan 2021 15:54:37 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id b11sm543050pjl.41.2021.01.11.15.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 15:54:37 -0800 (PST)
Subject: Re: [PATCH v6 2/3] target/arm: Add cpu properties to control pauth
To: Andrew Jones <drjones@redhat.com>
References: <20210111231108.461088-1-richard.henderson@linaro.org>
 <20210111231108.461088-3-richard.henderson@linaro.org>
 <20210111235310.bbeis2rh25kud2kz@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80b2ff9f-3614-07d1-88a2-686854d55555@linaro.org>
Date: Mon, 11 Jan 2021 13:54:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111235310.bbeis2rh25kud2kz@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Rutland <mark.rutland@arm.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 1:53 PM, Andrew Jones wrote:
>> -    "kvm-no-adjvtime", "kvm-steal-time",
>> +    "kvm-no-adjvtime",
> Looks like a rebase error; kvm-steal-time is getting dropped.
> 

Whoops.  Will fix.


r~

