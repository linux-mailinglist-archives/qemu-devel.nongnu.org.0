Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71205512803
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 02:27:31 +0200 (CEST)
Received: from localhost ([::1]:56774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njs0I-0005Xo-DM
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 20:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1njrzJ-0004pS-E4; Wed, 27 Apr 2022 20:26:29 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:46006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1njrzH-0002Ji-Iz; Wed, 27 Apr 2022 20:26:29 -0400
Received: by mail-oi1-x230.google.com with SMTP id 12so3746319oix.12;
 Wed, 27 Apr 2022 17:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=spPIX/SoCntMuGK9JpU1QH+WBZvdHfozKIaCjXawG9w=;
 b=OzwrJ675UYtF59k508M/j8Xxkq9nQutDWc1WQcFTO3mppbkbDzFlk58Gjgaxuo1zuG
 u/7nH/S5mzg/w7E+09i4k4S39YwPEmKEXLXRk4gY7LnslAiBQv4Lh+GGbRpxJcuJg4Ok
 KEduCS/cr6Kb0Bqm0cU6pFy+/TtpBT2t3DIjCLHbyKmJN6l9bIgDDEIhLkCAiOTAHkbV
 JWR/68pBov/facrwJSPcJBSOTmZpqccd2FjR4SUK4ZxkZoUJW+QzUsoiy0pF33CTErOw
 8A8WEU6K/4D4m6rHF198By2GwZfcW/X9POM0t0HTLiojph9Cdo5JSqzMu04Q/7hegYWS
 R5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=spPIX/SoCntMuGK9JpU1QH+WBZvdHfozKIaCjXawG9w=;
 b=dIBUIsOOsMSW0EnzfwfinTxa9MAwVEZRQUtGY9NUbGQ7TbBkvuMQosYQVwaT0ZhGyK
 MMOBU4z5Sucuwa3OxENhNgwSSRn+6XKAQm+CYqGELzzrDvY2RxbSfcU4If7aOMvQdb9i
 g07T7wAzhAKDKills4ZyH1S8Qseyn/ERyiE2bt7hee8I79gM7E2L9gTAe2YreY0nNKCU
 cB3AwhIGtelm05ftL+/XW7SjswnWimno7aCdVtC+SmiREOrdF3PsQQyz0Jom/0yOGbYU
 18FDg9niBeYwz4+oB9Zy63no2AOmq9VnvdtpItRGewu8PuoNyfmQ8wVzcMosTzhZkjFG
 kvUQ==
X-Gm-Message-State: AOAM532eB1yjtHNbLcm436azFaa3lsAfu4/cK4HaHpRC7At1s9ak0fwA
 MtuBHu5laVG++NbmeFM7rXkafp3SA2Aj4eTrtio=
X-Google-Smtp-Source: ABdhPJwLzvYUenZd2uyZ+xGTs/0Cp7+oItQPgBKYCIKne7YgUx2bwjBb90ATPr3t0O6Z45p8tC/F3+FBfEBrqR8i+4s=
X-Received: by 2002:a05:6808:f87:b0:325:5428:2de5 with SMTP id
 o7-20020a0568080f8700b0032554282de5mr6370745oiw.100.1651105585701; Wed, 27
 Apr 2022 17:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220323135722.1623-1-dmiller423@gmail.com>
 <25e876da-c2ac-ad55-0830-6fe149e0691f@linux.ibm.com>
 <6c44677b-50ee-5d4e-2aa6-d28f98142f49@redhat.com>
In-Reply-To: <6c44677b-50ee-5d4e-2aa6-d28f98142f49@redhat.com>
From: David Miller <dmiller423@gmail.com>
Date: Wed, 27 Apr 2022 20:26:27 -0400
Message-ID: <CAEgyohUkMpVog1HwgCeSvHHeVXjNPp8dcLaqKUTK4+0hn=na0w@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] s390x/tcg: Implement Vector-Enhancements
 Facility 2
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm playing catch up a bit here,  as I was out sick for a few days.
It would be very much appreciated if you could do so,  as I'm not
familiar with what is required.

Thanks
- David Miller

On Mon, Apr 25, 2022 at 3:51 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 25.04.22 09:43, Christian Borntraeger wrote:
> > Am 23.03.22 um 14:57 schrieb David Miller:
> >> Implement Vector-Enhancements Facility 2 for s390x
> >>
> >> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
> >>
> >> implements:
> >>      VECTOR LOAD ELEMENTS REVERSED               (VLER)
> >>      VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
> >>      VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
> >>      VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
> >>      VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
> >>      VECTOR STORE ELEMENTS REVERSED              (VSTER)
> >>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
> >>      VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
> >>      VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
> >>      VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
> >>      VECTOR STRING SEARCH                        (VSTRS)
> >>
> >>      modifies:
> >>      VECTOR FP CONVERT FROM FIXED                (VCFPS)
> >>      VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
> >>      VECTOR FP CONVERT TO FIXED                  (VCSFP)
> >>      VECTOR FP CONVERT TO LOGICAL                (VCLFP)
> >>      VECTOR SHIFT LEFT                           (VSL)
> >>      VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
> >>      VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
> >>
> >>
> >> David Miller (9):
> >>    tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
> >>    target/s390x: vxeh2: vector convert short/32b
> >>    target/s390x: vxeh2: vector string search
> >>    target/s390x: vxeh2: Update for changes to vector shifts
> >>    target/s390x: vxeh2: vector shift double by bit
> >>    target/s390x: vxeh2: vector {load, store} elements reversed
> >>    target/s390x: vxeh2: vector {load, store} byte reversed elements
> >>    target/s390x: vxeh2: vector {load, store} byte reversed element
> >>    target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu CPU model
> >>    tests/tcg/s390x: Tests for Vector Enhancements Facility 2
> >>    target/s390x: Fix writeback to v1 in helper_vstl
> >>
> >> Richard Henderson (2):
> >>    tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
> >>    target/s390x: Fix writeback to v1 in helper_vstl
> >
> >
> > I guess we can now re-do this series against 7.1-devel (qemu/master) which does
> > have the machine compat changes. Apart from that this should be ready now?
> >
>
> Yes, I think so. I can respin with the proper compat changes if requested.
>
> --
> Thanks,
>
> David / dhildenb
>

