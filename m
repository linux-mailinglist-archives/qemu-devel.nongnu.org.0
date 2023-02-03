Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D7368972A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:43:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtVj-0006zJ-OW; Fri, 03 Feb 2023 05:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtVf-0006tS-Nq
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:41:35 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtVd-0001SB-Ty
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:41:35 -0500
Received: by mail-pf1-x435.google.com with SMTP id o68so1964217pfg.9
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qDKJQ+oQd9/ncDtTKloz7AH/dMoDZ3RSuQNWDK8UOEA=;
 b=pTZDjOGsejjhZe7I6HsdsXMzhiRVADu0NZ0CHtMb0VLhFZcUmlnQI3BsdvuopG45hW
 VkcxNS7hc0VkClY2dVL7g2/hP2BpkTfBP35R4DtUi/lI/mSKNSNolZKicFhDvYjeYqa/
 6K4GQXdDLfay/O78eA8PVNLUdenOMmPzqPY980nq5uEz8J22j6emk9tF1+pyz+KXlov1
 eX7j8ILKgZYNZomKkJLb5Zy/RnlGhLadbo1jZDAnHfbUpLam5g2IXJCZq50FfVbj3Jyp
 IuJLBHetbJmxEbgRg3DU0qTU0rBd6eDady4L5lQXcTpZrPkNhKU8SqMhVgkPOcpInIZG
 CgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qDKJQ+oQd9/ncDtTKloz7AH/dMoDZ3RSuQNWDK8UOEA=;
 b=bT84mZtJUgR4ybHuUij/FEafzL/bjr4z8F6BAtM3326ezhULQ9zbwpFeAXFjxCP6gj
 y7I9WiHmzIoYp7CF6zjLcehB3vgK1KPlDbeG1COARW1JM8d314ObXZJuHPMEoeGlK0mX
 vUP6oWPh5IvbcbrDBzcx4OuxLRjnggTt1Mb7//GwlybvuSmdaN80Vyo94PgOoPWGoR5z
 3RhXYc1VmAYRl2RiCycuqPdqv18B7LQxi0CUfhxseGe4bq8mnp9kHMCGvS31IXWoPt1P
 1nay5wK+6uTvy+xjMqcPkwiWkUBLpWMHmOtvoretoWpJx2zJmCiz5FZczcoogPktAs0M
 zCfQ==
X-Gm-Message-State: AO0yUKX6xlSkO/U8097S7Tm+mIQgSZ+tlorhsL3j1ox0z7gGIggPn8uZ
 mUEcPtSk6YuN/IGb3MEbrXRfLmzs3NTuk18dzxK1Kg==
X-Google-Smtp-Source: AK7set+NEQrIUWFtOUVfW7ADvgoASmxIqtRWkHRoZn9KZi47N+i5u8dIGzlG1ZwbeFDpNuDsN36qdtDfVVB12ETSweo=
X-Received: by 2002:aa7:9686:0:b0:58d:ce70:4683 with SMTP id
 f6-20020aa79686000000b0058dce704683mr2208468pfk.39.1675420892137; Fri, 03 Feb
 2023 02:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20221031054105.3552-1-richard.henderson@linaro.org>
 <d91ccc02-a963-946d-169a-fd4da2610861@redhat.com>
 <211b40bc-2bbb-63be-191a-42e03e049b98@linaro.org>
 <CAFEAcA8cbfqy-eBY=gjj6ttxJ-RbzBn_XhyjjVfj303=R+uV5Q@mail.gmail.com>
 <5a9de193-e0e4-79f7-3c41-773078bb920c@redhat.com>
In-Reply-To: <5a9de193-e0e4-79f7-3c41-773078bb920c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 10:41:20 +0000
Message-ID: <CAFEAcA_QxZ96k105MK+YsW06vY86EfRE3wvSRSSV-h4CUvo+SQ@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Complete cpu initialization before registration
To: Eric Auger <eauger@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, iii@linux.ibm.com,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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

On Fri, 3 Feb 2023 at 10:29, Eric Auger <eauger@redhat.com> wrote:
>
> Hi Peter,
> On 2/2/23 11:53, Peter Maydell wrote:
> > On Wed, 1 Feb 2023 at 20:37, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 2/1/23 04:20, Eric Auger wrote:
> >>> What I fail to understand is why this code is called with a kvm
> >>> accelerated qemu (the test runs by default with kvm).
> >> ...
> >>> #2  0x000002aaab1500f0 in vmsa_ttbr_write
> >>> (env=0x2aaac393850, ri=0x2aaac3c90e0, value=2154950976315703518) at
> >>> ../target/arm/helper.c:3784
> >>> #3  0x000002aaab14e5a8 in write_raw_cp_reg
> >>> (env=env@entry=0x2aaac393850, ri=ri@entry=0x2aaac3c90e0,
> >>> v=v@entry=2154950976315703518)
> >>
> >> This is indeed very curious -- vmsa_ttbr_write is supposed to be the "cooked" .writefn,
> >> not the .raw_writefn.  We're not supposed to arrive here at all.
> >
> > If you only provide a cooked .writefn and no .raw_writefn,
> > the default is to assume that the cooked function will also
> > work as the raw one. None of the ARMCPRegInfo structs that
> > use vmsa_ttbr_write specify a raw_writefn...
> I fail to understand. Do you suggest we miss explicit .raw_writefn =
> raw_write in many places and that's the source of our trouble. Indeed
> entering the TCG code in KVM mode looks weird.
>
> Or is that supposed to work and we have a bug introduced by the abive
> commit commit.

I don't know why the above commit specifically has caused a
problem, but yes, the registers which do TLB maintenance calls
in their writefns should set '.raw_writefn = raw_write'.

-- PMM

