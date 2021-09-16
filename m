Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14FE40D9E6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:27:02 +0200 (CEST)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqTl-0007pF-TK
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqSC-0006U1-3R
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:25:25 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqSA-0004tQ-0H
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:25:23 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so4341817wml.3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=71AUUp+YrqYzna7fzXwAiwy0Kwn6P++MR152fVslebw=;
 b=zvem2x5wkL9u41qQP2kjAm3R3uMZ48xNc9BVEqDLxKkKQXNvCQKwJ5XyOuxyJWGoQA
 9K/osQqSIF1De9eISoiAVCipYmCCON2ZlS7x5FbeUebAzJ5RgJga8lOANFgPsYG5YgaB
 u29bGJZBb0by6CAKcnm88GpT5z39nR1JJ082CJMgKIvgTHH4GB1wXLretU3bgmM8ke3x
 V52SiB5wcu2ohWCLakU7gf3pDoK3uiE9EP22uMCBwZmPZMGo0OP9YvoPl/jfD10EliJD
 bE0wqjVKD2VIyJ72q/exXE7kQBUSqV8Kza0ypCRMxE7fqLNfchwHVEHlSiX+XpZOVV8T
 o8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=71AUUp+YrqYzna7fzXwAiwy0Kwn6P++MR152fVslebw=;
 b=CxiuOJoKB4rbjeA8bamPofi+Vn5shmmUUAhcoCNXkvIuuSjVsnCIrFjnMM2H4TdWJq
 SneptQuzJrg7WxFho88jIkNWudqpJw6Rn8vq4m8/ioiDy0jRIkjFKKYGtyN5NFbfD6GU
 WXwMbezVv83m/6sj69b7pmMlQKOUT9Iu0MEDgz6yUy8A5a8YVxUXN8vTpUQViBsJUSGt
 M9p1jcGZw8+Cry4SklbrCjorQSwf55mzGZxNX/oyyub2l/R4i7lY6bB+7gf57JoUeRb5
 Qy/UwF+A1OXRHM6I2I4u4LpzPDIDJwC4SLlmWaaL14fmqza8j2kkVbbvdRRD/6wGea56
 KEmg==
X-Gm-Message-State: AOAM530okD+fxZHrhDrP0nPzmed8Mt3thWqD1c99LEFVlv743Zgy6Fbn
 maMoy0nTClaAeAYx1D9W3uopGLzxlrZptjIrOAbfHA==
X-Google-Smtp-Source: ABdhPJyXxcl4ikmX42HwfCz3G+/S/vFGefYj469OjKmLkIAK5pV4YdnEaiw/f1Se9goiOcKZfmVieeMWMPjRBAvLwpE=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr801054wmi.37.1631795119786;
 Thu, 16 Sep 2021 05:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-7-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:24:28 +0100
Message-ID: <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
>
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>
>

> +    /*
> +     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
> +     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
> +     */
> +    ahcf->reset_sctlr = 0x30100180;
> +    /* OVMF chokes on boot if SPAN is not set, so default it to on */
> +    ahcf->reset_sctlr |= 0x00800000;

Isn't that just an OVMF bug ? If you want this then you need to
convince me why this isn't just a workaround for a buggy guest.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

