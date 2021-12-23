Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742347E8D5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:48:52 +0100 (CET)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0V18-0000hF-Mo
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1n0UzG-0008Qs-DA
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 15:46:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1n0Uz4-00020D-Oi
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 15:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640292397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQk6qVad7sfN+2Clr7+NC1LkPpDmJT5mTk5sKYiXhyw=;
 b=Hd/oUHJ2VGOveO4lzXNGR3pZMCxXDEcWZJnIGp2oLp8H8x3mt1qYw7MiKYfpc7B9k7OIPa
 KSsGcDrjXutvGyID+jmxqoQ7fRVzRMsPrj4a2G4tXSp8N0p9Eg4uPXmQ4xgU7yq3UvbaWo
 kLTyBOCSbQzkB6m4vMTcmQAcVFJ/tUU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-QzbGXHqAONmT5reZeBFmGw-1; Thu, 23 Dec 2021 15:46:35 -0500
X-MC-Unique: QzbGXHqAONmT5reZeBFmGw-1
Received: by mail-pf1-f197.google.com with SMTP id
 t128-20020a628186000000b004bac607ec25so3917049pfd.11
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 12:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XQk6qVad7sfN+2Clr7+NC1LkPpDmJT5mTk5sKYiXhyw=;
 b=4hVSAOcLQG2PiVyfFgCrpVR8hBFmRdZ7Iz4qEKk2mIzlSTPqaMitCrgfriVrkniBTg
 iYQbrOViQigAkllhkyzqXmvet1WiXONJN0Z5C8sEksnYCgLoK3mlSe859V0mEgeAEXx3
 QXGTy9Xpse977G/UjjCtVd8LPtJtBLz2QdFZ271XrJbN8PhhI2ypH9fmz7VzxNWeUQTj
 w3psvGP8zHdPazUsXe42mcyDVHHcOR+zKOPj89eWXpaHjSzN6d3ik36GELZc8IAEQE1V
 Rqu1fImewW5qJCwAp5nk89NES4mUCSnA3FT5l3O1yJAMoVzzzeo5dfhNUWYilHNXiLOa
 u35g==
X-Gm-Message-State: AOAM530Z5UCu44J4u4IscnYGIAmcCtK5KzXYZ2SHeD5rtqopUWs4gHA+
 bqvoubbPpo6Lt1fqUM9wzlb6qF/Ua+zhfFpBanbRoSH7N9YfwW0ygaIu4cA6ybnFTjdYXqU8xsR
 r04oF9os5z/AVw2VxVDlG6kgQOGrBdXg=
X-Received: by 2002:a05:6a00:216f:b0:49f:dcb7:2bf2 with SMTP id
 r15-20020a056a00216f00b0049fdcb72bf2mr3910686pff.19.1640292393840; 
 Thu, 23 Dec 2021 12:46:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUBZuPfaBXtLa3SpU8y4GYmsPJrdc7Cmi+Qflk6HZaa2259Q2TSWYiX1Wg+I5UpekjhSo/xuSkqoY2b4AwO6M=
X-Received: by 2002:a05:6a00:216f:b0:49f:dcb7:2bf2 with SMTP id
 r15-20020a056a00216f00b0049fdcb72bf2mr3910655pff.19.1640292393485; Thu, 23
 Dec 2021 12:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20211221144852.589983-1-mst@redhat.com>
 <ad22de10-a52c-ff34-0790-3be8e7d62630@redhat.com>
 <20211222151922-mutt-send-email-mst@kernel.org>
 <CAP+75-VaN5SD22ABqKNTC=dHhN4yaN-22Ucfdp=6aeYa+q+83A@mail.gmail.com>
 <20211222154841-mutt-send-email-mst@kernel.org>
 <CAA8xKjWJhXge6_3k-kPc7Y3Z_X1JqbOdZvOCSuAy62ifO4E5gg@mail.gmail.com>
 <20211223083646-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211223083646-mutt-send-email-mst@kernel.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 23 Dec 2021 21:46:22 +0100
Message-ID: <CAA8xKjX_htWyyP_UuXqajyks79M4t6BK=JZj8+FpL1012xNevg@mail.gmail.com>
Subject: Re: [PATCH] acpi: validate hotplug selector on access
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Prasad Pandit <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 23, 2021 at 2:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Dec 23, 2021 at 10:58:14AM +0100, Mauro Matteo Cascella wrote:
> > Hi,
> >
> > On Wed, Dec 22, 2021 at 9:52 PM Michael S. Tsirkin <mst@redhat.com> wro=
te:
> > >
> > > On Wed, Dec 22, 2021 at 09:27:51PM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > On Wed, Dec 22, 2021 at 9:20 PM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
> > > > > On Wed, Dec 22, 2021 at 08:19:41PM +0100, Philippe Mathieu-Daud=
=C3=A9 wrote:
> > > > > > +Mauro & Alex
> > > > > >
> > > > > > On 12/21/21 15:48, Michael S. Tsirkin wrote:
> > > > > > > When bus is looked up on a pci write, we didn't
> > > > > > > validate that the lookup succeeded.
> > > > > > > Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> > > > > > > bus pointer.
> > > > > > >
> > > > > > > Fixes: b32bd763a1 ("pci: introduce acpi-index property for PC=
I device")
> > > > > > > Cc: "Igor Mammedov" <imammedo@redhat.com>
> > > > > > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> > > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > >
> > > > > > It seems this problem is important enough to get a CVE assigned=
.
> > > > >
> > > > > Guest root can crash guest.
> > > > > I don't see why we would assign a CVE.
> > > >
> > > > Well thinking about downstream distributions, if there is a CVE ass=
igned,
> > > > it helps them to have it written in the commit. Maybe I am mistaken=
.
> > > >
> > > > Unrelated but it seems there is a coordination problem with the
> > > > qemu-security@ list,
> > > > if this isn't a security issue, why was a CVE requested?
> > >
> > > Right.  I don't think a priveleged user crashing VM warrants a CVE,
> > > it can just halt a CPU or whatever. Just cancel the CVE request pls.
> >
> > While I agree with you that this is kind of borderline and I expressed
> > similar concerns in the past, I was told that:
> >
> > 1) root guest users are not necessarily trustworthy (from the host pers=
pective).
> > 2) NULL pointer deref and similar issues caused by an
> > ill-handled/error condition are CVE worthy, even if triggered by root.
> > 3) In other cases, DoS triggered by root is not a security issue
> > because it's an expected behavior and not an ill-handled/error
> > condition (think of assert failures, for example).
> >
> > In other words, "ill-handled condition" is the crucial factor that
> > makes a bug CVE worthy or not.
>
> I guess the point is that a downstream might have a slightly different
> code path where it would be more serious ...
> OK then, not a big deal for me. So what's the CVE # then?

CVE-2021-4158 has been assigned for this issue.

> > +Prasad, can you shed some light on this? Is my understanding correct?
> >
> > Also, please note that we regularly get CVE requests for bugs like
> > this and many CVEs have been assigned in the past. Of course that
> > doesn't mean we can't change things going forward, but I think we
> > should make it clear (probably here:
> > https://www.qemu.org/docs/master/system/security.html) that these
> > kinds of bugs are not eligible for CVE assignment.

Thanks.
--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


