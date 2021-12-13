Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86301472277
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 09:25:26 +0100 (CET)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwgeD-0007e5-7v
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 03:25:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwgcg-0006lo-I9; Mon, 13 Dec 2021 03:23:50 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwgce-0002u0-R6; Mon, 13 Dec 2021 03:23:50 -0500
Received: by mail-ot1-f44.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so16599027otv.9; 
 Mon, 13 Dec 2021 00:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aIM5vNlFFWtsIZf9G6aHVjyQwR6KTetm8kj+d/Ph/qE=;
 b=4IaOxjllk2mr5pyhxpMw+h9obRn4si7hEmYhor3BPZSnfZJlucmckbngJx4bGvQEXr
 l9SoOHuMlO+2uPi+7OM10GH66SsYKjhoazJs2jXKXPThmadRMLWIoIP3T0bKeZc9Ghv5
 +E6FFea5ZtSxkT03AUSSncLdxXgQzsqCgAwdmSFaHg6u9ck2bC/RBtknKTrMbauimiJb
 5ghE2qxhObIf1oax6Vbw7HD8jkGs1QDQKy6wTc+mJdo0IpqP+tA9Qo9VzOkgaPKUJSm+
 iDr/cu9kwhW7Vvr8g53fzKXsyyTRLHdezYaQAdE7Qpu3kuNjEssk1AWW4wBFQi3UhtM4
 kBfA==
X-Gm-Message-State: AOAM533VcBB6K5a0jT94B6QI/W+effhJtcydYSS4SQBdBC+F61xW6Zrv
 SP2Ftyet3lNt6+hqRWGrKPBs1LmkCh6qwxB7KBQ=
X-Google-Smtp-Source: ABdhPJxdGiSKYhQ5wB0zE6ShGl4awatyRq8PdyAN/WEfNgKNT0D2DmqS4essleYXvnEKXSvNUlLncUdApVRLXNP8KAY=
X-Received: by 2002:a9d:6752:: with SMTP id w18mr23676859otm.13.1639383827657; 
 Mon, 13 Dec 2021 00:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-11-peter.maydell@linaro.org>
 <35ff2726-ab52-695a-466a-c7b55fdb31c2@amsat.org>
In-Reply-To: <35ff2726-ab52-695a-466a-c7b55fdb31c2@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 13 Dec 2021 09:23:36 +0100
Message-ID: <CAAdtpL7eB0ErfTyjtq7zz52nARUC6t2UTYwVJGAPW3DPWsVeZw@mail.gmail.com>
Subject: Re: [PATCH 10/26] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.44;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 12, 2021 at 10:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 12/11/21 20:11, Peter Maydell wrote:
> > Currently the ITS code that reads and writes DTEs uses open-coded
> > shift-and-mask to assemble the various fields into the 64-bit DTE
> > word.  The names of the macros used for mask and shift values are
> > also somewhat inconsistent, and don't follow our usual convention
> > that a MASK macro should specify the bits in their place in the word.
> > Replace all these with use of the FIELD macro.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/intc/gicv3_internal.h |  7 ++++---
> >  hw/intc/arm_gicv3_its.c  | 20 +++++++++-----------
> >  2 files changed, 13 insertions(+), 14 deletions(-)
> >
> > diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> > index 5a63e9ed5ce..6a3b145f377 100644
> > --- a/hw/intc/gicv3_internal.h
> > +++ b/hw/intc/gicv3_internal.h
> > @@ -393,9 +393,10 @@ FIELD(ITE_H, VPEID, 16, 16)
> >   * Valid =3D 1 bit,ITTAddr =3D 44 bits,Size =3D 5 bits
> >   */
> >  #define GITS_DTE_SIZE                 (0x8ULL)
> > -#define GITS_DTE_ITTADDR_SHIFT           6
> > -#define GITS_DTE_ITTADDR_MASK         MAKE_64BIT_MASK(GITS_DTE_ITTADDR=
_SHIFT, \
> > -                                                      ITTADDR_LENGTH)
>
> Side note, both ITTADDR_LENGTH & ITTADDR_MASK definitions are now unused.

I misread the diff, once applying the series I noticed ITTADDR_MASK
is still used in process_mapd().

