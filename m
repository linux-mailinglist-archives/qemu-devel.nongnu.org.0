Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997633EB9E4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 18:18:55 +0200 (CEST)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEZtW-0000it-8o
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 12:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEZsh-0008GZ-Ll
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:18:03 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEZsc-00034J-FI
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 12:18:03 -0400
Received: by mail-ed1-x530.google.com with SMTP id dj8so8311445edb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 09:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u/fXuSTf/7nmSfAPH75rFa4Zgui6hAM0XOdM2IGchK0=;
 b=qEdrsc6sVnMCk57uQk9QHcz70n6V6Fr4mtqnky5UEI1CoEz2rT0N3c7d3QFAofTPPV
 sr6QyYAbb/9IMNnIWgsSr89ieGLwV+lS7cr459vNlfrMlee9nwsJZd+85UP4D0vdRsok
 +5Wa3iCI4SfiIfVK6UiyCmrPjYeH4uRxGYcbbqY4q3YidsdwaIHxjdv4iC835qld0uGX
 VuiZdLZGM5wnYRb/93iQFvfFInqlRUXVsPfakcF6AAySyLDCsIVeUMVINIyE17NYt7Fr
 MfC9+kwupW/Tq8Uwj1aD4ONSSBF8N8BkrnwGSXZ2RaCI/0W3sadWiNeF/APLqycmrtxC
 rMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u/fXuSTf/7nmSfAPH75rFa4Zgui6hAM0XOdM2IGchK0=;
 b=cLBUdkiiDN9knTl3YEttzNkru0xAo1mOWKc3/3TEpYw7/29yAgwNzsma2dCMYrloNt
 JqOiUPTDhlDeJQH7ev6KGDc+jNp/53QEUT0AxMllD7HFMZ+E0w84h9uGzABnbHV/qvsj
 vpm/xl+27PCWZPX4rYvFN6drGYg3LAFYp/yB0K0dGprapCl9RzUC1pKte+r1cyvQxJq/
 te1SR29YDTYpQ/RSYQlirmi2fZlekVY9R6BSGYPdVhJIYOwNorN70kVHskoDxgdOpO5F
 gY3ORVBePE4LO5agxsJG7mM1ykYd4/mhQhjDFS90svQ+KqsNYAK2ZKlfGncLszI3Q5yv
 Y+Hw==
X-Gm-Message-State: AOAM532VJrzAVpqqKgqetIvj5taZLGp6BH/ix2IluUmD7r/L8T9c9q6g
 h/RFZ8lqhzhoNpHoe/JdRMETsqi1Zy9bJVLC2Fz0cg==
X-Google-Smtp-Source: ABdhPJzXb3H5cGQfMDpVz5MXqcsjTQk6WYedKZlTDpY+Hzrb8KLqZ/zXTbZ+Ged83jnzvnTFWEuqe2Gs16yLC3PVTuA=
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr4010792edr.251.1628871476321; 
 Fri, 13 Aug 2021 09:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210727235201.11491-1-someguy@effective-light.com>
 <e84e3fe7-e644-7059-22cc-ddefd8bfc8c4@redhat.com>
In-Reply-To: <e84e3fe7-e644-7059-22cc-ddefd8bfc8c4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 17:17:11 +0100
Message-ID: <CAFEAcA_WL4MLsgA-u+oaMOtxkchb2qrnpojsUEsGcNziXZF7sw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: kvm: use RCU_READ_LOCK_GUARD() in
 kvm_arch_fixup_msi_route()
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 kvm-devel <kvm@vger.kernel.org>, Hamza Mahfooz <someguy@effective-light.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Jul 2021 at 08:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 28/07/21 01:52, Hamza Mahfooz wrote:
> > As per commit 5626f8c6d468 ("rcu: Add automatically released rcu_read_lock
> > variants"), RCU_READ_LOCK_GUARD() should be used instead of
> > rcu_read_{un}lock().
> >
> > Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> > ---
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>



Applied to target-arm.next for 6.2, thanks.

-- PMM

