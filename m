Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3307C3DB94A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:26:17 +0200 (CEST)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9SWl-0004I4-Ug
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SUM-0001Ly-NM
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SUL-0006uD-3u
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627651424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hfqW6idA0uXqEVjJSBjEssVkIVsyagJ2aDipAtV/NqA=;
 b=ip1so7ET+q1/q0tuSHGbOrTmSqRE8qvMF42EFB0U3S/hu32rJQU2ZKTkn3YddtuzduaJ47
 0DAEgme7jmJNBSDUJJzd1sdb7CE/XSKWPIOMjlecm/ADstH8uQCr5LzU7YgP6i8MJpK673
 qUx3YAZ0WJZXDjDwcypakKVsbneqJCs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-AK44nJ8oMKOkkPCV76TQNA-1; Fri, 30 Jul 2021 09:23:43 -0400
X-MC-Unique: AK44nJ8oMKOkkPCV76TQNA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j11-20020a05600c190bb02902190142995dso3193400wmq.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hfqW6idA0uXqEVjJSBjEssVkIVsyagJ2aDipAtV/NqA=;
 b=gZOsl1P0x/39VgSkyBeuNHq93Paqj6VFl0nnI+Anv/LRMIx/4V3R0IXCtb3FpZIRTJ
 lyYfmKQS8z8DHXjO6oYE7rkdyPNoAGC45CXp5VM6tA/Mg591YcvvrD+IzbrIRg3LFZyq
 5MgsIhHEXebNyQuq6E0fXJAcwLc649yfP0ir7zdGIMEPAKMiUrP9Lw1ENAKGziVBvQdS
 O7wKgpeylop/y3EjjeXhf+gGMNCh+hWvquU/dLEbEHEjKoTgnx2KcuW1Kr7WNif956Jo
 Fj/aftJbl+Kw3bDjVl3B1qX7B8DNo9ax5cQ29RdKr87vlzs61mOKYzUnHlfkpYx4DGy1
 SU0w==
X-Gm-Message-State: AOAM531e3jP67RRQMdqy9HU2EKxEaAo/CQbczd0XC5Io6Js1+y0mh3zi
 dh28XueV+rK2mBSzgv7160KHyKHJA+UrQp/gZ6zeD2ghtG/mAmlImvNM9C1LoXdkvMGrMwER1Dd
 2FyCCDEJSYsCr7zg=
X-Received: by 2002:a5d:6184:: with SMTP id j4mr3110843wru.340.1627651422140; 
 Fri, 30 Jul 2021 06:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA4iXdLzJNGw+hmNop5/mu/vC8hr+lMO5z9qydlDZkP0HbvwTV1JOgRkJGBjCnkv4gFs5CUg==
X-Received: by 2002:a5d:6184:: with SMTP id j4mr3110829wru.340.1627651421993; 
 Fri, 30 Jul 2021 06:23:41 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id a207sm2237541wme.27.2021.07.30.06.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:23:41 -0700 (PDT)
Subject: Re: [PATCH for-6.2 8/8] stubs: Remove unused arch_type.c stub
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5fa0e76e-d70a-acda-4b56-be8d4cd6615c@redhat.com>
Date: Fri, 30 Jul 2021 15:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-9-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 PM, Peter Maydell wrote:
> We added a stub for the arch_type global in commit 5964ed56d9a1 so
> that we could compile blockdev.c into the tools.  However, in commit
> 9db1d3a2be9bf we removed the only use of arch_type from blockdev.c.
> The stub is therefore no longer needed, and we can delete it again,
> together with the QEMU_ARCH_NONE value that only the stub was using.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/sysemu/arch_init.h | 2 --
>  stubs/arch_type.c          | 4 ----
>  stubs/meson.build          | 1 -
>  3 files changed, 7 deletions(-)
>  delete mode 100644 stubs/arch_type.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


