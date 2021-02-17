Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E131DBE7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:04:56 +0100 (CET)
Received: from localhost ([::1]:51162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCONr-0006Hv-OP
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCOM7-0005L9-RN
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:03:07 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCOM5-000568-Uc
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:03:07 -0500
Received: by mail-ej1-x636.google.com with SMTP id do6so12285533ejc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lH5BBz20oUxl3m8mixschhVdp0a3sV6gwRpko6r8EG4=;
 b=CHrek05rmM3p4QYyxTpKeUslqQwTAEnxEHT5gAz4Bv9+QjNAPigidO6NbaLWXncJ0L
 VhJGL/kxZ1i8nlXhnLL+jPUoNowY4dQsKcW0vxXtJeRvWOU4SZMMWaQoec0KQ8tirlKB
 ICPk6bWZVGLKZCMMO9CDwOMZR7hM7K9JFvQdpWRAaOCj7xVBeyS3ng5iwn3IUZEIzpdz
 KrLLs+hLqHgkoDL4GvmsZhpp4AM7ZPnI0D4nm/LSDonLwP4sIwBzBXxFveOmNiTU/8H6
 2d4Ga54Pzpmjqayvl5I0DdbcvQHX7VTsp3Rmr1tXhgtqApVPd9gyXOSJieY4n+qGJxQn
 P/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lH5BBz20oUxl3m8mixschhVdp0a3sV6gwRpko6r8EG4=;
 b=Oi25lxOZn5Om7K9Hc0fiQtsHNt1UYkiTzM45yfD+H9HVwshOGd1Kz8wQWjgvoxYyk0
 6CcRFzPUthUSaAaHuJs7VGmREAEhxB+iQqD/ohXywXKyJF6y1ce1pJGMR9ftBEl1wpM/
 ZO5mdx5ahx0WqkH+OchmIA5QYlq20RCjnhPrOAVzUHI9o3LcQITpERax4CzztpSFic73
 m5iUsFoTCWLs/18blteE4eC1dA2f9X7EJUsf+NYG2ZYBjygvW9oGkRW8b9vrm/1kDs0H
 U0U9f/hH8TglUSqCIslC6YFAZOTduPM/sluKX4/7sk9u/E7tYhF/AGxFcZ5uPVna1egv
 1BVg==
X-Gm-Message-State: AOAM532qJYBrzYlUycUATIcEZoDbP6qmHHN+zT0+XjiFZULn53rY1d6U
 y6Yv2LNEYkW4iv5dH5WCaeMZ/mdtDmRYAXh3Vd+AgQ==
X-Google-Smtp-Source: ABdhPJzGWA4UojaIvZRYXVcW1yAbhDazHFRhUlnzzxrhK81PtLb6OizffVKo2Ddza2MJbv6SMMvZORr3VPxEVcjE09A=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr25263369ejg.382.1613574184255; 
 Wed, 17 Feb 2021 07:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-25-alex.bennee@linaro.org>
In-Reply-To: <20210115130828.23968-25-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Feb 2021 15:02:53 +0000
Message-ID: <CAFEAcA_+iLxp9mdmX9SKUcTxcc6At7OGL4Lo9EpaXZpYjQSvtQ@mail.gmail.com>
Subject: Re: [PULL 24/30] semihosting: Change internal common-semi interfaces
 to use CPUState *
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Keith Packard <keithp@keithp.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 13:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> From: Keith Packard <keithp@keithp.com>
>
> This makes all of the internal interfaces architecture-independent and
> renames the internal functions to use the 'common_semi' prefix instead
> of 'arm' or 'arm_semi'.

Hi; it looks like this commit broke the implementation of
the SYS_HEAPINFO call (see https://bugs.launchpad.net/qemu/+bug/1915925).

Specifically:

> @@ -1064,23 +1089,19 @@ target_ulong do_common_semihosting(CPUState *cs)
>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
>                  bool fail;
>
> -                if (is_a64(env)) {
> -                    fail =3D put_user_u64(retvals[i], arg0 + i * 8);
> -                } else {
> -                    fail =3D put_user_u32(retvals[i], arg0 + i * 4);
> -                }
> +                fail =3D SET_ARG(i, retvals[i]);

this code which is writing the heap info into guest memory
should not be using SET_ARG(). The SYS_HEAPINFO API says:
# On entry, the PARAMETER REGISTER contains the address of a pointer
# to a four-field data block.

which is to say that the parameter register points to a 1-word
argument block, whose single constituent is a value giving the
address of the (heapbase, heaplimit, stackbase, stacklimit)
structure we need to fill in.

The change here to use SET_ARG() is making us write the
retvals to the argument block, when we should be writing them
to the memory pointed to by arg0. (This is why the original
code wasn't using SET_ARG...)

Could you look at a fix for this, please?

I think you probably need to abstract out "figure out the
size of a 'field' for this target", which for Arm is "is_a64() ? 8 : 4",
and for riscv seems to be "sizeof(target_ulong)" [*]. That
then as a followup would let you have a common code implementation
of GET_ARG() and SET_ARG().

[*] side note -- shouldn't this be checking riscv_cpu_is_32bit() now ?

thanks
-- PMM

