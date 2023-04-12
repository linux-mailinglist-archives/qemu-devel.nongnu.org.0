Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0546DF737
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:31:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaYP-0007MV-9D; Wed, 12 Apr 2023 09:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmaYN-0007MM-FV
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pmaYL-0002yc-W9
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681306222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zU5nL2Ka2gxdnmwzDmaHbRPRwrkdD1WuVQ+ZTcemt7U=;
 b=UrbtMVL47v6PY0D1LUpuB7VlSdKzUEOhzeATBodn1bnymyp8rKMgDyVQfNjU3bsynznkU0
 0NmECjfZ/bNTEV5sIahFLQPpLWsncmRu+mSqNFraVJm7mH6zfXqsVbcmlYgnPvzDu+x8yU
 dRjG7MVLFq7bOU5qt5e+fPEpqU8NpLY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-C8T5mxeYMniydTRy7tJd_w-1; Wed, 12 Apr 2023 09:30:21 -0400
X-MC-Unique: C8T5mxeYMniydTRy7tJd_w-1
Received: by mail-ua1-f71.google.com with SMTP id
 e1-20020ab01681000000b0077170be9085so3946858uaf.13
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 06:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681306220; x=1683898220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zU5nL2Ka2gxdnmwzDmaHbRPRwrkdD1WuVQ+ZTcemt7U=;
 b=w2R+gTo1mCvlDwc918Mau7O1qIMONaWD3eayxjBWf0udw2QQ/L/1biDfVNSj7dWfD0
 uDWA0jm0lqfwdA5blz14PvhhIfdVkmUXJUXJiYe9bQTM3H0KMv7i0RrFnQzLCqdxV/4E
 yJ4R3/laufeG2pAiFMq65AKt5I1bgMQWbphHlkuFwxtUb24xfQ97Vh7hEnd6ExsbDRT8
 5RbgoeBcG/RJyiyq0du+A7MnJf6C+/OLw273d9JMExLfLmh2CDYyhxbCxWzVtg2/hFrJ
 Y4d7p88jmnLN27gzpUKvluE2xbvLZrKWccG1Agj0vKnZ6Fod6dAuw1y+K6EWXshsYwW3
 F/xQ==
X-Gm-Message-State: AAQBX9fTCsOo+B6VlsuobEM+71vDmh44Udid5bGlk9cX4tBSaOqUklmq
 bh4Mam+mhNXeHQX2Ase3tqLLCHsAWGSRW9FpknaueSOWTycypwnE/Yl9x25MwyatpRJ5CZuIA8K
 Gc1oUkt/KHFw1/dkjp5AUtMXWkn07HHnSrHddbVdHXw==
X-Received: by 2002:a67:c08d:0:b0:42c:96e4:248f with SMTP id
 x13-20020a67c08d000000b0042c96e4248fmr944741vsi.1.1681306220600; 
 Wed, 12 Apr 2023 06:30:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350YhrxDAAY1c4CUyf/CECfTIKht30XADAAzzUusNGur5z791g+JQI/z594PT42du+N6oqhZ60Zw3FV1RiWU8oqQ=
X-Received: by 2002:a67:c08d:0:b0:42c:96e4:248f with SMTP id
 x13-20020a67c08d000000b0042c96e4248fmr944729vsi.1.1681306220340; Wed, 12 Apr
 2023 06:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQMSUtx73GosLwzMLERTMkJ=eLiU5NbwZY1K0eOmFbJ-M=4Kw@mail.gmail.com>
 <87y1mxnvlo.fsf@linaro.org>
In-Reply-To: <87y1mxnvlo.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 12 Apr 2023 15:30:08 +0200
Message-ID: <CABgObfZPZ9+CvpPOfaqgFa+hiqW-mYJZ_5AkJorujy0hMiwo6A@mail.gmail.com>
Subject: Re: AVX-512 instruction set
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Walid Ghandour <waleedjghandour@gmail.com>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Apr 12, 2023 at 2:17=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
> I don't think there is currently any active effort to add AVX512
> support. There have been various GSoC projects to improve the x86 SIMD
> emulation but I don't think they got merged.

No, there isn't. However, the recent implementation of AVX in QEMU 7.2
is designed to make AVX512 at least doable.

Adding support for AVX512 would be a very large work (at least 1
months full time plus time to get it merged), but not impossible. The
tasks could be something like this:

1. EVEX prefix decoding for AVX and AVX2 instructions
2. operand broadcast
3. VEX encoded mask instruction: kmov, kadd, kxnor, etc
4. other instructions and permutations with mask operands and permutations
5. opmask support including merging and zeroing
6. Disp8*N addressing mode
7. rounding control and exception suppression

It's important that, at any given step, the new functionality is
tested comprehensively.

> > 62 f2 7d 48 18 0d fa 0c 00 00 vbroadcastss 0xcfa(%rip),%zmm1
> >
> > qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> >
> > I like to add support for broadcast and fmadd avx 512 instructions such=
 as the following one:
> >
> > 62 e2 7d 48 b8 c9     vfmadd231ps %zmm1,%zmm0,%zmm17

Both of these are using a small subset of AVX512 (step 1 above). Both
vbroadcastss and vfmadd231ps are already implemented in QEMU, but not
using ZMM registers.

Unfortunately the base AVX512 functionality is large, and therefore
the above tasks are all needed to claim support for AVX512. On the
other hand, for historical reasons AVX512BW and AVX512VL extensions
are separate but in practice they are easier to just implement at the
same time as basic AVX512; my expectation is that they would come up
almost for free with the rest of the work.

Paolo


