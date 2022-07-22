Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CD57DEDB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 11:54:04 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEpMA-0005M9-Sa
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 05:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEpJr-0003yx-RX
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 05:51:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEpJq-0002iG-96
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 05:51:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id id17so2469652wmb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QzBCrWlwcWZXInzS0ITrQnHy6XlPP/9j5siG/21TN30=;
 b=MMrsEmBx0ebXM4nPTmGvjlFU9N6zdyMGzOOoT2Aj6sfKHOKJHswLi257jGgDppRjxI
 eIIFO+xYUBBVIVVy8P8Z9ElSdy9iDO753TkhoM0W84wQILk/1k0eCHBmQp2qlDvUwTOm
 8XmELklpn+vCcdWqBzbsFAov1las5bI4LvbURHqZOAIy3O2uivKzRb/IQLXHj79UYHiq
 dPlF/Dg0v76ORwOzUM/VsAmr36h4DqL/oo9rlyHQB3csS/q67/j2+aBixNMOxhLIRmz8
 rSzRj56dlnbBcff3M38rzSyWcpZf4GtUvcjHyDoTzqPwmgqUMI/va/Yqd8d6cjQySuwB
 odOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QzBCrWlwcWZXInzS0ITrQnHy6XlPP/9j5siG/21TN30=;
 b=5m0c8yWkXZCL+cJbH5pc/ElnZ38NsHSNRvAHeZki3AdF3qGAYIFE1tEQbipmgjWKcU
 wUD86CHdeg6AJNVd5j5VtALdnJJ6/zZ90zGvbEI1dzd0qoDCzJhLWk1taIsZwlzT+jgi
 aoHIIIx6iCkTv8+9Wq/2URI6YsyPLGCb/I8E+ey10AHo8Oa4ibt2zrZx9rqYnS+fMIzX
 3idKVX7NVQmgrqnC8WPwE8/L+jFY6j69DsY0g3OSywUvDdL/gmQnk7udRGOhBo0p32ti
 Fah9X5KRRYB1F6wEgvfFOghv/U/HF5Sd2tZH97Scebg2KZiJ1bvcdgKcSFjUBiSzZVmU
 bmew==
X-Gm-Message-State: AJIora/cYrkNLOoLSxaveipcba4Zr/+dpTkg/RgF3zE2SQ0EIi08FlYq
 UucynK11uV9QCp2I/d+8nvgmYscUnxqyTw==
X-Google-Smtp-Source: AGRyM1vUvluF4KYP+yUCHdLfeNPZLIQ6wdER47sf9nRYezeaeafEAxDeyEWrcnQh/WNaRYCtbhu8Sw==
X-Received: by 2002:a05:600c:154f:b0:3a3:4383:e1eb with SMTP id
 f15-20020a05600c154f00b003a34383e1ebmr719714wmg.111.1658483495857; 
 Fri, 22 Jul 2022 02:51:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j11-20020adfe50b000000b0021e4a4fc017sm4046011wrm.34.2022.07.22.02.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 02:51:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16DCD1FFB7;
 Fri, 22 Jul 2022 10:51:34 +0100 (BST)
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com> <87tu7az28k.fsf@linaro.org>
 <Ytm1KiyFGNqAo/Af@zx2c4.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
Date: Fri, 22 Jul 2022 10:45:19 +0100
In-reply-to: <Ytm1KiyFGNqAo/Af@zx2c4.com>
Message-ID: <87o7xhscey.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hi Alex,
>
> On Thu, Jul 21, 2022 at 08:36:10PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>=20
<snip>
>> >      uint64_t reg_attr[2] =3D {cpu_to_be64(s->addr), cpu_to_be64(size)=
};
>> > +    uint8_t rng_seed[32];
>> >=20=20
>> >      if (!fdt) {
>> >          error_setg(errp, "Cannot modify FDT fields if the machine has=
 none");
>> > @@ -55,6 +57,9 @@ static void loader_insert_platform_data(GuestLoaderS=
tate *s, int size,
>> >      qemu_fdt_add_subnode(fdt, node);
>> >      qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
>> >=20=20
>> > +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
>> > +    qemu_fdt_setprop(fdt, node, "rng-seed", rng_seed, sizeof(rng_seed=
));
>> > +
>>=20
>> Why are we inserting this here? The guest-loader is only building on
>> what the machine type has already constructed which in the case of -M
>> virt for riscv and ARM already has code for this.
>
> Wish you would have replied to the list patch before Paolo queued it.

I'm sorry if I didn't get to it in the *checks notes* 2 days since it
was posted. I've been on holiday.

> I don't know this mechanism well but I assumed it would pass a unique
> seed to each chained loader. Let me know if I'm misunderstanding the
> purpose; I have no qualms about dropping this patch.

All the guest-loader does is add the information about where in memory a
guest and/or it's initrd have been placed in memory to the DTB. It's
entirely up to the initial booted code (usually a hypervisor in this
case) to decide what gets passed up the chain to any subsequent guests.

--=20
Alex Benn=C3=A9e

