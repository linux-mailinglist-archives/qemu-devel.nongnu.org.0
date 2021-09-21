Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F1413640
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 17:33:51 +0200 (CEST)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mShmI-00082l-2K
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 11:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mShjj-0006DG-V2
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:31:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mShje-0000DG-T1
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:31:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d21so40361273wra.12
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 08:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Emk/Bda1m5kTVjM/t5vCSYRFTM3gUMVDT42meUXin48=;
 b=Ogf0snClip/6IIjVc9QIs36FRrWuP8twyokm6VP0uUgvnZGvnSQ7OFv4m/2PMt655s
 /dJRbQZJrfVmTWLzE6z0UcmnWAgZ+k6iQ6tWOpVYAdVCjguNd9C6QtmmfVFJaDmVrqQh
 hLKrV5zQFtk9rH23WOep/1xWJZMXveR3enLgqu/kKBVJQ5OoRbcwQ2VyLR6gB9miZKj/
 3liPntnf8mX1urFodMaVEJCfR52/Z5+RP5AXOD0AreDGO0i2ljKncX+NRIm7eAPSwZm+
 Ouwj8ZDNnQkuVKp2Tn2BOYnttXtvgPM+2B/qIobG+wx1g9n2Vkl01S5er9iJ8gGBnJSX
 +sSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Emk/Bda1m5kTVjM/t5vCSYRFTM3gUMVDT42meUXin48=;
 b=EymhhHFNLJPdo0pTl/7zOg4P6Zk0UxD4ZqaFSGGUSLh3/ArKnQ09XucsxYrKJgASjV
 zZXwN+7/EKBI1fFiLtM6nZQciDqhdsrhwTKpZzMtj2kl1qqMN5rRDApIF61LrLR0VKIq
 /tPwUxzk1qmGRPmAWNp1kLS2tZKNnPB2F3PluBiGYrhRltBh0F7ECqr/BWROhSZgaxfx
 UuqMQWR9POuES/01FNVOr8IGPzKPdmQNRr+uPDvXA/V2XwiOLPKtgzeRJlW+XSKxmLWX
 UcFRmayKF9AYDukT3Bi3SdysC2HyVzkVplhOMBpxJR7Ey8H+n7mRQm2eXkf7kBowgq8A
 VU1A==
X-Gm-Message-State: AOAM531qFyLTReyaoQXOP+TcrFJnHn1zhQzQMy1iimLjpMH8y0UAgHZt
 QPZf1XGCpIJYdEgHc4tMjkQOxqNSrU3ay6iUzXoITQ==
X-Google-Smtp-Source: ABdhPJzK7uK3t7Xercw47T6I1V/OoU9S/ESUNwI8tAjWLomHzw9dFor5+nBk5XQJMklwk4xD2ssDIIFm/dJPNnUkEYw=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr36020486wrr.275.1632238263634; 
 Tue, 21 Sep 2021 08:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-5-agraf@csgraf.de>
In-Reply-To: <20210916155404.86958-5-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 16:30:11 +0100
Message-ID: <CAFEAcA-Us-4H8FTFCY38s3=65imNGJ6WP_WYup_EoAxPyDghKQ@mail.gmail.com>
Subject: Re: [PATCH v12 04/10] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
>
> This patch adds all necessary architecture specific code to get basic VMs
> working, including save/restore.
>
> Known limitations:
>
>   - WFI handling is missing (follows in later patch)
>   - No watchpoint/breakpoint support
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This broke compilation on x86 osx:

> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -206,6 +206,11 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
>      return env->apic_bus_freq != 0;
>  }
>
> +void hvf_kick_vcpu_thread(CPUState *cpu)
> +{
> +    cpus_kick_thread(cpu);
> +}

This won't build without an extra #include "sysemu/cpus.h".
I've folded in the fix.

-- PMM

