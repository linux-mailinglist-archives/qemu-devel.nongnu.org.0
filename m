Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F3936E5DA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:24:28 +0200 (CEST)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc12B-0006zG-8g
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0zm-0004NP-L4
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:21:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0zl-0000IZ-2Y
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFVjhA+ohgnGPHYnWmTbz6t9BXDUEN3PMX6RbaMB69Q=;
 b=Q/cSQLgzHwWR7sEnxTOATPbaDghBMLonn+0AgnGZy2VNGUYAaTq+OvzPzpQGRrQpZEF43m
 3aH4fXTE03VHtkuxrUIS/pWE/oIRnHUOvCeuyN7gB34nLH1HygBMmusYeA+jtEmW86j8aT
 o3XWnIbdOqr5PapjnqW7TNtFAOSFS1E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-PU81P9E6PReEXaDeKYfWbw-1; Thu, 29 Apr 2021 03:21:51 -0400
X-MC-Unique: PU81P9E6PReEXaDeKYfWbw-1
Received: by mail-wr1-f71.google.com with SMTP id
 32-20020adf92a30000b029010d6849a4e1so3495322wrn.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dFVjhA+ohgnGPHYnWmTbz6t9BXDUEN3PMX6RbaMB69Q=;
 b=ChezkgPTR7NhqqMaXyygZ04S2co3ZbUjOIoiL/ukRDLUr/sr8OVii7SKjAYMqO8mnC
 QlBtuBQ9Gi+0aTwfdlKz4a23Y4HrDzU3DbDGCN2L8vDbakLfAmY582+PJUJ+PImnjWYy
 5bW30e861l6EJ1HXLTcEV+gEOBPvILOHmekmUdPjHliHuxi1vvK5CQiiNVGw9GHBU7JD
 9K2jhM3PGjH000+wVQXG8BOpsugkLSObqZSpsUgcNXXCMhW495Sd82xCEY4lCLh3IXJi
 13ECC5cgYTd8JvP1FCWMvl1T7UQhtnKg6Ev0m+Lzwvh1wpYiK/4ItH19XCDRCvSX5Oix
 1QNQ==
X-Gm-Message-State: AOAM533wgTtLTExN8pSX8xrQE4Kqh9Vzdhmg7vKxo68rW2vbUEBqgJXv
 CfrJk+EYO0RfaL5WCnReZeRbxBbgEwH27uJn/WQ3pkY1jU1UQ49q+JUS7OqaCYCZy+ol1RQI+tW
 oGCux67ZY8LmSxvI=
X-Received: by 2002:a5d:4b12:: with SMTP id v18mr41353704wrq.45.1619680910274; 
 Thu, 29 Apr 2021 00:21:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmdgs1U2n4vu995rDHMoO3EYIv25bfyc1Vz7ZUB2Z7pjVxHp/TFEZRBeGLS41UDIlPwKr34Q==
X-Received: by 2002:a5d:4b12:: with SMTP id v18mr41353679wrq.45.1619680910036; 
 Thu, 29 Apr 2021 00:21:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 q4sm3219771wrs.21.2021.04.29.00.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:21:49 -0700 (PDT)
Subject: Re: [PATCH v2 13/15] linux-user/s390x: Add build asserts for sigset
 sizes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-14-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <87c4c49e-261e-9c6e-4a06-7b5f3171ede0@redhat.com>
Date: Thu, 29 Apr 2021 09:21:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-14-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 21:34, Richard Henderson wrote:
> At point of usage, it's not immediately obvious that
> we don't need a loop to copy these arrays.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 81ba59b46a..839a7ae4b3 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -141,6 +141,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
>           return;
>       }
>   
> +    /* Make sure that we're initializing all of oldmask. */
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(frame->sc.oldmask) != 1);
>       __put_user(set->sig[0], &frame->sc.oldmask[0]);
>   
>       save_sigregs(env, &frame->sregs);
> @@ -266,6 +268,9 @@ long do_sigreturn(CPUS390XState *env)
>           force_sig(TARGET_SIGSEGV);
>           return -TARGET_QEMU_ESIGRETURN;
>       }
> +
> +    /* Make sure that we're initializing all of target_set. */
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(target_set.sig) != 1);
>       __get_user(target_set.sig[0], &frame->sc.oldmask[0]);
>   
>       target_to_host_sigset_internal(&set, &target_set);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


