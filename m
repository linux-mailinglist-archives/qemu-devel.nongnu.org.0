Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9389D55FD04
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:21:21 +0200 (CEST)
Received: from localhost ([::1]:57258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Uoy-0004Pm-Gl
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6UlO-0002Oh-3i
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:17:38 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6UlM-0003Ff-DS
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:17:37 -0400
Received: by mail-ej1-x62f.google.com with SMTP id fw3so3931705ejc.10
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1DJwB9/LLhCbayq4Pil6erc8zDI1mp2UkkfIVn8tZ7M=;
 b=uLpENFVbpi5VlK1nd+X8/n49KNFNMS3obIZ5+YHpGsICTVGqEisXLco0+ZEREhL/qI
 gVnngu4O3vUi6CixKGXdKr5fcpIFUsmBTMJKeBxKmcGuKYse/OeavTaTDopii/UCvmpQ
 l8JYOlEhOEcrtZIbMOqy0vO7S7MTrbBtsD4Ht3suQSUs/tMlJMLnACsh1VmMEC67rQwA
 UTOSpT2lkmjAieVQ9cluNzlp4H649zuH3Sk2sMjk6xjJ1MNJe9b/tz4n5BC0Ko5N8mZZ
 9D7oPv8PoJAeRFw6Yu6SVb/TDWY4EOeyOlsMWyBWYJUnMsEyYiw5uH+AuWMTkMftwvMi
 louw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1DJwB9/LLhCbayq4Pil6erc8zDI1mp2UkkfIVn8tZ7M=;
 b=3PuEbitg/DDMhoynkf0OfoldLuO6Jcof6KVmCzjSm/ONXP52va6JKG8vGkEN/FDRJo
 +4L748o6zr/0eb1SAtIO+SHUdtfNpsRnI00/8Masi24cq+wgnDjGUWcNj4mmsSjx8vw2
 hSidiaFQg8f5mobisLnA9SoN9wUfsxynanFUDDpqkI+vC4eqX7nxqbmbjtTww74LzoAM
 3gDT1cCGefbP+CxlB6SRHkqn7TYZdfjuxFpkvJlu19fJjB/rYFDFEvDs3MJK30C9XlXU
 fmEzlf4bTNp7vCP3kDFxXmcvcKwGIRxz+MYsgJYsRjZUMPrXP0BoVrTzDwlJRwxSGWVP
 /j5g==
X-Gm-Message-State: AJIora9hbtqc9BznH1XmI54dXXOglmo+BgobzapB9K0zVR/0jF29QlLn
 kqV/ISP+DXI6vK28wJaGhMtFOw==
X-Google-Smtp-Source: AGRyM1u1FWjOqaLdhdqJl3JIjEp9faF4BWTPrFlMwlJwg0vr0lrywtMfXOIK3A8ARDUORBhj20UKrg==
X-Received: by 2002:a17:907:6294:b0:6e1:ea4:74a3 with SMTP id
 nd20-20020a170907629400b006e10ea474a3mr2595193ejc.168.1656497854363; 
 Wed, 29 Jun 2022 03:17:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090609b200b006feaa22e367sm7494702eje.165.2022.06.29.03.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 03:17:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8F2E1FFB7;
 Wed, 29 Jun 2022 11:17:30 +0100 (BST)
References: <20220627160734.749861-1-Jason@zx2c4.com>
 <CAFEAcA_SVtMF=TpUoPRZGVEvHRe1zH2RaypxNW-Nz8uXvGZJjA@mail.gmail.com>
 <CAHmME9q1ChhVcsP9skQFnY=P_f+1NvUqt3G67P3y33eoQoVWmw@mail.gmail.com>
 <CAHmME9pPxKnJbFUWCmzJw8fYikugSwuRo+AO599-cb56UELqrQ@mail.gmail.com>
 <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: dt: add rng-seed property
Date: Wed, 29 Jun 2022 11:15:15 +0100
In-reply-to: <CAFEAcA9jzUk72NZ=BAubjiFwqVaUWqCgjJ-BLLx=J8Aq+ieWSg@mail.gmail.com>
Message-ID: <87czerixj9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 28 Jun 2022 at 19:45, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> On 6/27/22, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> > On 6/27/22, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >> On Mon, 27 Jun 2022 at 17:07, Jason A. Donenfeld <Jason@zx2c4.com> wr=
ote:
>> >>>
>> >>> In 60592cfed2 ("hw/arm/virt: dt: add kaslr-seed property"), the
>> >>> kaslr-seed property was added, but the equally as important rng-seed
>> >>> property was forgotten about, which has identical semantics for a
>> >>> similar purpose. This commit implements it in exactly the same way as
>> >>> kaslr-seed.
>> >>
>> >> Not an objection, since if this is what the dtb spec says we need
>> >> to provide then I guess we need to provide it, but:
>> >> Why do we need to give the kernel two separate random seeds?
>> >> Isn't one sufficient for the kernel to seed its RNG and generate
>> >> whatever randomness it needs for whatever purposes it wants it?
>> >>
>> >
>> > Seems a bit silly to me too. `rng-seed` alone ought to be sufficient.
>> > After the kernel calls add_bootloader_randomness() on it,
>> > get_random_long() can be used for kaslr'ing and everything else too.
>> > So I'm not sure what's up, but here we are. Maybe down the line I'll
>> > look into the details and formulate a plan to remove `kaslr-seed` if
>> > my supposition is correct.
>> >
>> > Jason
>> >
>>
>> Was wondering if you planned to queue this up?
>
> It's on my todo list to review...

Erm isn't this replicating kaslr-seed?

  static void create_kaslr_seed(MachineState *ms, const char *node)
  {
      uint64_t seed;

      if (qemu_guest_getrandom(&seed, sizeof(seed), NULL)) {
          return;
      }
      qemu_fdt_setprop_u64(ms->fdt, node, "kaslr-seed", seed);
  }


which BTW we provide a knob (dtb-kaslr-seed) to suppress because it can
get in the way of secure instrumentation/checksums done by secure boot.

>
> -- PMM


--=20
Alex Benn=C3=A9e

