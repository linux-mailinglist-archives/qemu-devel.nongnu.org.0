Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E645662EE78
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:34:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvrM-0000TS-Dg; Fri, 18 Nov 2022 02:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvrB-0000N6-FA
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:32:13 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvr9-0006VY-Or
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:32:13 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w14so7933207wru.8
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8bLCpAOEeaJ/eFrFFUhxvhWsOOXuLPUrFWAh3K1PwNU=;
 b=Q8IVKjDdyp+kzQ94ux6/akduMBeTGFYpGKiE86h8IThnc752o/QcZq9YaBCg5Y/Ank
 uSRIwEpJsZ0zzmQr0YJ0TunWdVTudEwCO4IO80Go3akEJ5Sz9RAJg/hTqd72/ZxPLPb9
 R8flmPuE8L3yGO1NYf9TzJKmP2rC3+wewLMHhfte4MZEH4NdOjRPdMSBzyUheIKrm0rL
 MxOmY61UM6mkPEpEItRhBCryYyXUH+jx6v1KcuecKiFFRjXRwrHTmA04XSB3ozrFMk01
 rziRFI9PbLOKWE1QFpOw6wzLAne/N2dlY064DhidGXH47zr+Yl2/gqDqk5/YxKSC3skj
 dVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8bLCpAOEeaJ/eFrFFUhxvhWsOOXuLPUrFWAh3K1PwNU=;
 b=dDz6lxu9GJRXwYLn+Idzo1oNz07VLcEEn0Q/9Iu8xSPhzu2JzR7DMq4gsoEkVlG616
 Iw6cf2Nnotqb7NeZs6eGJDZeUZlgSqWTmf9KJcw6goBda7AmpPvAKVzpIGeCT/vEVdwU
 IL/YH/yBpXbS6yV3fVVK72aLCJTZ+amjmmG/GjAVfIhTr9EZtkGZF3CrlMLV27CBqBtH
 OehFz2CzBo8Danr1wsRWROrN//wjADGNgW5JzdWGgtcNOYg/Pp4+abdoFRkkZ7V8UGrm
 TGJlxenfJjb1KJLVcrxNAnMlRoKlIO4GUjtNSs+ByWh8+6ero2XqP0ZAplJ/tyjuSL3f
 kRjA==
X-Gm-Message-State: ANoB5pn9dBvO4LkSykVwalF+aBNyH9hBZVp93t//iduYyO+uaqTuggUZ
 +wcydKPa23lb3RY6OHWyHqrJWA==
X-Google-Smtp-Source: AA0mqf5CfgufJzxihB5k7dwfOdwceuc6wKQ+Rw7vbZyDUgA5a3rzRkoygZG2XBS5CTgdhypbY70Qwg==
X-Received: by 2002:adf:f54c:0:b0:236:ba68:7fc3 with SMTP id
 j12-20020adff54c000000b00236ba687fc3mr3473429wrp.223.1668756729115; 
 Thu, 17 Nov 2022 23:32:09 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4083000000b002366e8eee11sm2748900wrp.101.2022.11.17.23.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:32:08 -0800 (PST)
Message-ID: <e8e6fce8-9912-7684-d4c3-c30d731bfcd7@linaro.org>
Date: Fri, 18 Nov 2022 08:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/3] accel: introduce accelerator blocker API
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org
References: <20221111154758.1372674-1-eesposit@redhat.com>
 <20221111154758.1372674-2-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111154758.1372674-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 11/11/22 16:47, Emanuele Giuseppe Esposito wrote:
> This API allows the accelerators to prevent vcpus from issuing
> new ioctls while execting a critical section marked with the
> accel_ioctl_inhibit_begin/end functions.
> 
> Note that all functions submitting ioctls must mark where the
> ioctl is being called with accel_{cpu_}ioctl_begin/end().
> 
> This API requires the caller to always hold the BQL.
> API documentation is in sysemu/accel-blocker.h
> 
> Internally, it uses a QemuLockCnt together with a per-CPU QemuLockCnt
> (to minimize cache line bouncing) to keep avoid that new ioctls
> run when the critical section starts, and a QemuEvent to wait
> that all running ioctls finish.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   accel/accel-blocker.c          | 154 +++++++++++++++++++++++++++++++++
>   accel/meson.build              |   2 +-
>   hw/core/cpu-common.c           |   2 +
>   include/hw/core/cpu.h          |   3 +
>   include/sysemu/accel-blocker.h |  56 ++++++++++++
>   5 files changed, 216 insertions(+), 1 deletion(-)
>   create mode 100644 accel/accel-blocker.c
>   create mode 100644 include/sysemu/accel-blocker.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


