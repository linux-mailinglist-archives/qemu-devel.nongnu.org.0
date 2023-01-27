Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831E67EF9D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 21:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLVTP-0001Bw-BI; Fri, 27 Jan 2023 15:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLVTM-00018r-LK
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:37:20 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLVTK-00055j-Tr
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:37:20 -0500
Received: by mail-pl1-x636.google.com with SMTP id 5so6187362plo.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 12:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BHuUJUqMqN/xTSu6EyeYUzPZT3vrZ7VptQ4cKrpisEY=;
 b=w+yyDaWwYA8m/76Vx5m3XqfUnpZq/mFzE6SOYhx2CIniWJKbKV0GH+cZWI6I8GdOOM
 ki6tqDysRuMg9pOMu9sm+dn4HTjSt4lKHhSrQZjrwoVrUBt2PZe6cgfIs07xYsAr9s9d
 RJwwFbeYD7Nu1OeobzxZLYFNQAVk+lbaTQ9WztQQk0uWrd3HcsCKzZNBO9FRuLwCFgiF
 RqdWrzgo4+P6V5HzB+TuU7Y/w4RSA+BmJR0QzaxB4i1RKfD5JiPNV+yR44r63Ag0QLPM
 xbPWuogYqlztKaBk7jvSewok94tLj6+KVa7FBvhpXX+Unk34H5Exs5+uBfBKumOp0kzf
 aNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BHuUJUqMqN/xTSu6EyeYUzPZT3vrZ7VptQ4cKrpisEY=;
 b=EQkFnWNAJtcTXN7r26fcOS9V3VwJ2ozCwMuQfDeahJhRncRxNm8iXmUwALRyxG5/9Y
 pqhVW6VvadOCBHakGrV/N9huaxoDRH7HJOI2G6rI8BvRO3a4jDyjOPjmHuu1i5mk9R9H
 T3gmgR/Pym1UVQh5M+Qt45M0BhbVtLk88PLohdCnsxGZy6exvJ2pWiwyq/oqBVW0YKKG
 SCVPwJUi4IzzF0BuhmK6oUcCpUxipXou0F2bj+iEmCzj54Frmzzcj4bXQ1o3B14NDInr
 ozGcB2jZY/B6JEoFPkI5FutGfn4ONxPwWc6C+JwkYUieVCl1S+uUG/U9PGKlNZhZztPv
 oXNw==
X-Gm-Message-State: AO0yUKXuXRrm2slfm2aFadhMOhglUWQ4gSu9uzsOxTLz2W563mkvsBNx
 LEauksUGGMpLRMOvlzUxNmbv4w==
X-Google-Smtp-Source: AK7set/9dDDqYDDf9spm37WRWP8CsLsRGc4wYyFUsReKx1FsUMO3KzJZeaPIsPCimLxoMr1GIi4stQ==
X-Received: by 2002:a17:90b:3b4f:b0:22c:2092:b6d1 with SMTP id
 ot15-20020a17090b3b4f00b0022c2092b6d1mr8321399pjb.24.1674851837422; 
 Fri, 27 Jan 2023 12:37:17 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 v11-20020a17090a4ecb00b00229f68ba7fbsm5443747pjl.19.2023.01.27.12.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 12:37:16 -0800 (PST)
Message-ID: <5a713862-5bc5-3d2b-e54f-70cf5b484493@linaro.org>
Date: Fri, 27 Jan 2023 10:37:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 03/16] target/arm/kvm-rme: Initialize realm
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-4-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-4-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +static inline int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
> +{
> +    return 0;
> +}
> +
> +static inline int kvm_arm_rme_vm_type(MachineState *ms)
> +{
> +    return 0;
> +}

Should the stubs really return 0, or g_assert_not_reached()?

> +static RmeGuest *cgs_to_rme(ConfidentialGuestSupport *cgs)
> +{
> +    if (!cgs) {
> +        return NULL;
> +    }
> +    return (RmeGuest *)object_dynamic_cast(OBJECT(cgs), TYPE_RME_GUEST);
> +}

Direct usage of object_dynamic_cast is usually not correct.

Normally one would use DECLARE_INSTANCE_CHECKER to define the entire function.  But if you 
prefer to type-check the input argument as ConfidentialGuestSupport I can see defining 
your own function.  But in that case I think you probably want to use OBJECT_CHECK, which 
asserts that the cast succeeds.

But then I see that cgs_to_rme is, in all instances so far, also used as a predicate.


> +bool kvm_arm_rme_enabled(void)
> +{
> +    ConfidentialGuestSupport *cgs = MACHINE(qdev_get_machine())->cgs;
> +
> +    return !!cgs_to_rme(cgs);
> +}

Ah, hmm.  Well, probably wouldn't want an assert here.

At present I would expect exactly one object class to be present in the 
qemu-system-aarch64 binary that would pass the machine_check_confidential_guest_support 
test done by core code.  But we are hoping to move toward a heterogeneous model where e.g. 
the TYPE_SEV_GUEST object might be discoverable within the same executable.

Therefore, if cgs_to_rme above uses assert, this might use object_dynamic_cast here 
directly.  It seems like we ought to have a boolean test for this kind of thing, but no.


> +int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp)
> +{
> +    int ret;
> +    static Error *rme_mig_blocker;
> +    RmeGuest *guest = cgs_to_rme(cgs);
> +
> +    if (!guest) {
> +        /* Either no cgs, or another confidential guest type */
> +        return 0;
> +    }
> +
> +    if (!kvm_enabled()) {
> +        error_setg(errp, "KVM required for RME");
> +        return -ENODEV;
> +    }

I think this null check, and the kvm_enabled check, belong in virt.c.
You'll not get the error with the !CONFIG_KVM version of this function above.


r~

