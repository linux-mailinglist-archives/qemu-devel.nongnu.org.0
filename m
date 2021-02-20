Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C503203C4
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 06:16:01 +0100 (CET)
Received: from localhost ([::1]:38180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDKcZ-0000dm-JU
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 00:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lDKaz-0008QC-Oy
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 00:14:21 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lDKax-00057N-Vy
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 00:14:21 -0500
Received: by mail-ot1-x333.google.com with SMTP id s3so3944015otg.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 21:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fG1FO8SgixDTaSu0XDOPc/hjeTlRcmgoVngr/Lc77SE=;
 b=YeFeCu0t221pmGtMcPOcDJFa/+YF7dzW5NtIjkRQsf0fxZm/v+5p8hOSlooSbaUH12
 fAzxZ3X4ycF8VrPg7PUqCPDkT0yGe4SU4jisgj9a30c+spRb8NRQSsdQVb57CYPHACVy
 lK7yNRbuYiR7SgMzr+VHSwzgsDzaz1Om1MtROnsRwcvxR0TO12XnvU+mKZP+c5GnN09z
 /g3aWOdj85LsEvmpE1oIJEMAyErOBFpEGf71cboaQXmmQBw/XjZPadll/oZAc7uAtmjC
 6/XevHZDA4Sl+aDDD8lmhnZYx5JI8uzrR+JF6kcX+rWlOHwnZm2qhrPbA4RiKYq3wuAu
 SzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fG1FO8SgixDTaSu0XDOPc/hjeTlRcmgoVngr/Lc77SE=;
 b=RbtB6MzgaKUQ8K4pYYYJBopI1eiKzTc8JuhTY9F2sl50oPA1oXUWRNoS9gJ1xR2j3V
 tUyVIQFu597wr82CwB60/1U7acpHZP77CLDu5lGz9APl57O0OjcEEsT1Jh17KPiY8174
 bf95L5CelPpK6GT2gmDyU6EaFyiKe7xeltdRXNt8RlI82OKx8guNN/nZ0fzxFTBVLxSX
 Hqp775ktQMnXwQRttElaO4GNjWwv8Fy34yvoG7myyJRHXQZk3NmFXjCRZbKcTcjbPpk0
 udA3DVJxOViwamQ62tpStsdBL06+DYee3xV0R1YG8D1Twd4NVBQj4veL2ORdrEGy7kmS
 78yw==
X-Gm-Message-State: AOAM532gYMWtLbkuomU76o08wgYzmp3ESlBq7Mzkhtx/rGEUCNnXtq+E
 m6VUSX/BRl4o6mF/4LydsCU8dziHW2kJtexPtqcPsg==
X-Google-Smtp-Source: ABdhPJzeqohT5cNsGsEtj+rfkbJjvk5wosLQdBbJTRirVW+v2E+G+zhbcyGcUU7dOhzTu+WEBJFZ2FZ9CayNEF1+b0I=
X-Received: by 2002:a9d:64cc:: with SMTP id n12mr9612070otl.175.1613798058576; 
 Fri, 19 Feb 2021 21:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20210219095902.3602-1-frank.chang@sifive.com>
 <3cd7260d-4c09-696c-6a8d-0a74920adcdd@linaro.org>
In-Reply-To: <3cd7260d-4c09-696c-6a8d-0a74920adcdd@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 20 Feb 2021 13:14:09 +0800
Message-ID: <CAE_xrPgyccR9QnoR-Rc7R=gq8vSvOEWZv1U4XAFbO80_ncQUuw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000562ce05bbbda4f9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=frank.chang@sifive.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000562ce05bbbda4f9
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 20, 2021 at 12:12 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/19/21 1:59 AM, frank.chang@sifive.com wrote:
> > +/* Skip mem_idx bits */
> > +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
>
> Why not just add the mem_idx field to the list?
>
> The separation between the FIELDs and TB_FLAG_*_MASK is unfortunate, and
> will
> be a continuing source of errors.
>
>
Sure, I will edit it and send out the next version patch.

Thanks,
Frank Chang


>
> r~
>

--0000000000000562ce05bbbda4f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Feb 20, 2021 at 12:12 AM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hende=
rson@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 2/19/21 1:59 AM, <a href=3D"ma=
ilto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> w=
rote:<br>
&gt; +/* Skip mem_idx bits */<br>
&gt; +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)<br>
<br>
Why not just add the mem_idx field to the list?<br>
<br>
The separation between the FIELDs and TB_FLAG_*_MASK is unfortunate, and wi=
ll<br>
be a continuing source of errors.<br>
<br></blockquote><div><br></div><div>Sure, I will edit it and send out the =
next version patch.</div><div><br></div><div>Thanks,</div><div>Frank Chang<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--0000000000000562ce05bbbda4f9--

