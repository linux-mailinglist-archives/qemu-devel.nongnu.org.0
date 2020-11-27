Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19882C6A4B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:59:49 +0100 (CET)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kih64-0002zZ-Pz
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kih0g-0007wb-CM
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:54:14 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kih0e-0005vU-Bh
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:54:14 -0500
Received: by mail-ej1-x641.google.com with SMTP id a16so8482117ejj.5
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 08:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNoKjAWI6FNYedv6nMQyS4hzPxYQYvpuxCAv5dnotOA=;
 b=Zgki8s0ouswI905Jd9y+z/R/e4sLnZXyW36Kx406p2gyjRTbBcHTZsogwdWv1/CZwo
 o7G8w4CafsAIheOi2tn/KhngZa1HZvS85rvR7gHLi/Lz6cyd1TJX8+wdzo7bqrKr4GrQ
 6QVwwxU2rM+PE51H4sLlGxv2honkGSotPsDhr1gMoJEzd00jce2470oYFjFLp2V+3N+O
 t2yG6DQXJwAIHcq2+rbrdIYY3ciyVCsb97gxn1UBtb2kvteO+2xVRYZoO6XzMnQNdKWy
 HMJnBIv1XaTTkskbpVItNghatlmg5F8i5xcXbsAd+KVcF0XPqh9tS0DgL4qPcJq2kr58
 3AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNoKjAWI6FNYedv6nMQyS4hzPxYQYvpuxCAv5dnotOA=;
 b=pUicJxtvzjDaKWYzhT4Wds80msXiOzLtIgsi8Fbh5QHXFz/ep8nOoARKTfOLAp67ky
 VmuUlzUu0EExl3OHCh7TYlacVPywCv3F/FXbBlSdUF33kR8WVcW0pfMqtiHt5UmsaN9/
 qQ4SRgpEjWFlcChkyHG/3zlCs/nxNf0ipdXtDiTRo3PbaXVELKMd5nBgaDkrB6WbD+l5
 ZRqXwj1rMYM2Wo3Qp8qSsejSvEp1hI5ICl1yriZw0fVXbEFlIWQqWqG+5Dtcgyg0fhTS
 sEi7tfj8dH9kAfOCXz51JZTrOgCXR2fhpA9xABO2gqBARWPxvuLRMRLrOSH5vmqjMTKO
 ZBhg==
X-Gm-Message-State: AOAM533Nu0jqsjp01GOI056EvqsHGUlaONlZCJ/6xSZDg9GLKYvz9wLj
 NV33nBQ+TAN2LBjEf2JMJSbwKQ0JlrEWo60KUMgKaQ==
X-Google-Smtp-Source: ABdhPJz9CW+2xiHs3OnRQAZkRa7DTiho8XylWlubQ52qkQccdOsm9Uhg9xp1yyX17ODB1oUKaoMRaV0E/owMbyS8OZQ=
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr8881064ejv.4.1606496050573; 
 Fri, 27 Nov 2020 08:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
 <20201127164708.GZ2271382@habkost.net>
In-Reply-To: <20201127164708.GZ2271382@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 16:53:59 +0000
Message-ID: <CAFEAcA_rt_aJTfBzAchUfCH5aKpSPReXWrVDC5mMEvyPughB8w@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 at 16:47, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Do you know how the implicitly-accelerator-specific code is
> implemented?  PARange is in id_aa64mmfr0, correct?  I don't see
> any accel-specific code for initializing id_aa64mmfr0.

For TCG, the value of id_aa64mmfr0 is set by the per-cpu
init functions aarch64_a57_initfn(), aarch64_a72_initfn(), etc.

For KVM, if we're using "-cpu cortex-a53" or "-cpu cortex-a57"
these only work if the host CPU really is an A53 or A57, in
which case the reset value set by the initfn is correct.
In the more usual case of "-cpu host", we ask the kernel for
the ID register values in kvm_arm_get_host_cpu_features(),
which is part of the implementation of
kvm_arm_set_cpu_features_from_host(), which gets called
in aarch64_max_initfn() (inside a kvm_enabled() conditional).

So there is a *_enabled() check involved, which I hadn't
realised until I worked back up to where this stuff is called.

thanks
-- PMM

