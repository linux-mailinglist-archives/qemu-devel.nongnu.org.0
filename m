Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732ED667A3B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:02:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzz1-00056Y-DA; Thu, 12 Jan 2023 10:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFzyx-00055T-Ax
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:59:11 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFzyv-0001zk-BV
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:59:10 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 s13-20020a17090a6e4d00b0022900843652so2494195pjm.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 07:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XsNXvHrKB5fBnHaG9Xw20MMzOK6GmCYiu04FFFlrXM=;
 b=JCAt5+dEu4bOnmKtN6iZTFsXB5AWmOxrkmDHehhwBx213pZvJvhikFDJCARMTbg/qW
 4Xlr31rH/kyTUGqc7daISnLiT2EK7qhb4qIk3JEsHgn/rBuAk1wUGjtCSFPOWsfalwWm
 Mla4B7Qgs0gMkllOmdLloWzARD7xy1DKV6z2jVXjtFgXB1UF6TOOeRkujI4T7uE4FkG/
 G4iFWF8TsaFoBaZeGziCSjYUs2yC1mouyTMHHIDerQlRHaQzXLq6gNDLzIyIZ+IaLAor
 dzhqftZZVPHgPlwis7E4Rd+9hW9RYwt6EXJ/eh/wZCRi5QXsArFqHCIU8nNwyZvafi/2
 ImFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9XsNXvHrKB5fBnHaG9Xw20MMzOK6GmCYiu04FFFlrXM=;
 b=HLEizSv8ebTDhKv4NkAkYV35dVzDTPG4X1YidqaVZRtgc/q6wNi1b4yQ/FC1UPtJ1L
 RiVwQf0HjBGIY/1JFCcq+2FhsCbW0VuXv+IMWYgH2l4WJOa5/j9XK4fTRfWABu4zdqYx
 YiIGeIvX06VvpOYOwwZK3tpCsOR+YNvJXBMyYFHd++0ZzQLYdfauV5z3AwdaQRs649sw
 +5CVzeO+U0POLxQdZgBtH1AYkESZcqQF4Bk67ogrlARhi0EV6k0jLCdSTLd0PiKX62Px
 /KoYBZfS7DJYW5aD70yiHTs803XfKY1gV82vId3R9AuLE+OGbxW8nZ0ePXaRZKV/frvc
 TlUA==
X-Gm-Message-State: AFqh2koOG4bnMA03QJj2VkL5ir+9m8c7fbYmRs3rrs/pYONAs4jRcbK9
 4t6NUSZiKATS/p9y+L0RuOZlewg+386PmD05D1HQwA==
X-Google-Smtp-Source: AMrXdXtv/z2TJBieQyDVhoLiAmMq4k41KKq4Gc5DT9erQY1R41afYQlcB6cPDRkUbaN+xX73PQUytqFRUY/H7x64058=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr6296004pjs.19.1673539147791; Thu, 12 Jan
 2023 07:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org> <Y8AewFAHRGf6ZI3x@redhat.com>
In-Reply-To: <Y8AewFAHRGf6ZI3x@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 15:58:56 +0000
Message-ID: <CAFEAcA9REU2emdHRhfO2=ZZB3K9O=eKSP1k5aVh_Hwh0+cCW5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 imp@bsdimp.com, kevans@freebsd.org, ben.widawsky@intel.com, 
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de, 
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com, 
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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

On Thu, 12 Jan 2023 at 15:14, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Jan 12, 2023 at 08:51:26AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> > > docs/devel/style.rst mandates:
> > >
> > >     The "qemu/osdep.h" header contains preprocessor macros that affec=
t
> > >     the behavior of core system headers like <stdint.h>.  It must be
> > >     the first include so that core system headers included by externa=
l
> > >     libraries get the preprocessor macros that QEMU depends on.
> > >
> > >     Do not include "qemu/osdep.h" from header files since the .c file
> > >     will have already included it.
> > >
> > > A few violations have crept in.  Fix them.
> > >
> > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > With my awesome grep skillz I found one more:
> > $ grep -r --include=3D'*.h' qemu/osdep.h
> > include/block/graph-lock.h:#include "qemu/osdep.h"
> >
> > Looks like all C files must include qemu/osdep.h, no?
>
> Yes, and IMHO that is/was a mistake, as it means our other header
> files are not self-contained, which prevents developer tools from
> reporting useful bugs when you're editting.

The underlying requirement is "osdep.h must be included
before any system header file". "Always first in every .c file"
is an easy way to achieve that, and "never in any .h file" is
then not mandatory but falls out from the fact that any
such include is pointless and only serves to increase
the compilation time (and to increase the chances that
you don't notice that you forgot osdep.h in your .c file).

If there's a better way to do this (e.g. one which meant
that it was a compile error to put osdep includes in the
wrong place or to omit them) then that would certainly
save us periodically having to do this kind of fixup commit.

thanks
-- PMM

