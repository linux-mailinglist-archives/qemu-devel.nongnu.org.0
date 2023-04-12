Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A16E0081
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:08:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhgZ-0000N1-B9; Wed, 12 Apr 2023 17:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmhgL-0000I8-Sv
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:07:13 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmhgH-0007zG-B3
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:07:09 -0400
Received: by mail-ej1-x62e.google.com with SMTP id z9so5201702ejx.11
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681333622; x=1683925622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UA8q9elj3FPn3EmPfe9HvaU3GrGv3VbmfaEpyICN1Vo=;
 b=UZ69ETb79HTFFBxFaLZlnm6kt0INDRisL5/3o74GnOAQQU5qkn3hf7X6Wf2LIwYsvJ
 F9QGOAb8iW1GTpNh3vXC6TT10pmjHt1adlbO30ok6yJFVH9AiWwt2F2BGLesD+9ZIO6e
 21hjqa20JOXig3wqYXwjRFVF8jkuGydqbxFf773+HiBW4/P91noRqL5cJP6hOsWaL8xo
 e+N8RMbcca+T0JQtI7TbpfV6zNizFexFnGBV3/pLm9nl5Kb7x7e94ZVVf1Nk9KKaOhz6
 erJCjuTtPpgEVgejTpDjJEVtYmKxqdB9ZBSkRxGq5XXqcM3gL20UI/hAMuMhl2niDsKN
 /GKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681333622; x=1683925622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UA8q9elj3FPn3EmPfe9HvaU3GrGv3VbmfaEpyICN1Vo=;
 b=Ipw/0VzocTE28h93cEHY35mv4LxH45ZcMDylrP0YDN1M5RsB98eNj+3KHVElRtwXwj
 U4LjaEejf/9fMPO1qN9ikFSRzRpqRKQjXld7z+GlJg8sXU2UHygOSIE93ADjP5Ak2qiC
 E5q/sO60zAQQq2RpeRefYgWQVNpgr0NpVMiQKNzSnvOY2qMDznOreet/UO0YhW37zaE1
 z95JSi3pkBdrwo6AsyczBt0mmYMIO4t/Mba1/R66TReQ+kzaXplIiD5KUqDOkmCrJan5
 E51onuWzpoR7cfVkHeOl+WggeVaQxQSDv0GpL9sbZgZwW4ZOR0ysCPir6f8MX7POsTdB
 fFiQ==
X-Gm-Message-State: AAQBX9dUng17IsQpak477cWM+9O9r0qf7T4eUfhqHF2DN31jy3M091Kq
 M64oY7XNLKLH1x0xGS8qFeysnK731GaYSD1riyedqQ==
X-Google-Smtp-Source: AKy350aVB2J3vWh/VQvmlbE/Tky5dWuQFIKwJYTUeTIWmDDlCsHXLUINauED2aPkRYnZFJNlYKEP+GUKgFw7ZL3LFt0=
X-Received: by 2002:a17:907:1c02:b0:932:4577:6705 with SMTP id
 nc2-20020a1709071c0200b0093245776705mr159284ejc.6.1681333621828; Wed, 12 Apr
 2023 14:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230410033208.54663-1-jasowang@redhat.com> <ZDVrSVW0FoEuq6+2@x1n>
 <CAFEAcA9jbuR72u=o6tUvpiA+SYFiASnoYRocKWVurscvdUJJAg@mail.gmail.com>
 <87fs95pk7n.fsf@linaro.org>
In-Reply-To: <87fs95pk7n.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 22:06:50 +0100
Message-ID: <CAFEAcA8TB65xkv2+ZVdY0jYdEPU-uAc+twK5=eWYzkwZYbkhmQ@mail.gmail.com>
Subject: Re: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 12 Apr 2023 at 09:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Whoops, hadn't noticed that guint type... (glib's
> > g_int64_hash()'s approach to this is to XOR the top
> > 32 bits with the bottom 32 bits to produce the 32-bit
> > hash value.)
>
> This is less of a hash and more just concatting a bunch of fields. BTW
> if the glib built-in hash isn't suitable we also have the qemu_xxhash()
> functions which claim a good distribution of values and we use in a
> number of places throughout the code.

Is that really necessary? If glib doesn't do anything complex
for "my keys are just integers" I don't see that we need to
do anything complex for "my keys are a handful of integers".
glib does do a bit on its end to counteract suboptimal hash functions:

https://github.com/GNOME/glib/blob/main/glib/ghash.c#L429

static inline guint
g_hash_table_hash_to_index (GHashTable *hash_table, guint hash)
{
  /* Multiply the hash by a small prime before applying the modulo. This
   * prevents the table from becoming densely packed, even with a poor hash
   * function. A densely packed table would have poor performance on
   * workloads with many failed lookups or a high degree of churn. */
  return (hash * 11) % hash_table->mod;
}

I figure if glib thought that users of hash tables should be
doing more complex stuff then they would (a) provide helpers
for that and (b) call it out in the docs. They don't do either.

thanks
-- PMM

