Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A214AC20F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:57:19 +0100 (CET)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5SA-00079t-Tw
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:57:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH4tb-0001BL-IR
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:21:35 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH4tZ-0005Uv-Tl
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:21:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=J41ypGdXlN3pH5hbPgsH6FmVg5EfPRzheJj72JijezQ=; b=kmhjQIDhiUhGRkAxUDiGTbd6YT
 M2AnIH7PhUsG6K/En2fCJDPOlZmL1sPClPN0yMv0yl2nMY4w3MAeYWURk+yPXUT+HKuD5vWzehLuo
 QZ1OwP1HnmTUXiTzX3N+uybVfJ9alALIVBuI7rU+AYwhMU+GjLkq2+lcDjpc5UR8DpH/HcDkdHbTY
 9LzG532+DPxhSaSj0Ss3DkitBT9YmUaenJFMThWikMFvdisgyNTTlRsUbMTtdXz1gyGdeOYqjTu4+
 c+cCyCwAw3zBJNzoWR3bVAsZT9mfsmfOyzD81ZiI8ONQHlHtBlGDFEqqcFN1fx8MTnaEPLwopIgQD
 mB0ECL1oiakym+nhsiRLDY1RltQmydXCQC3UZG2r93B1vyV8TvBMVRmbFfU7ep8INj8CS0D8lxr1h
 9rxBDyjU5CsKfV0DANtB6oTslXjUQnkz874Rq7q1wtKUDu9PG7J98TOhJ8ojdUiNZ5qOrg+zUgtul
 WGJIjKmZ6te3PKTRsmNasqUXQ1amKh2tLvFk/rCdKQIclL/0if2o3nF9oTwTLYoIt+4yXkWivyXnj
 vReYPb289wNO/BG5xMWg+jYwtpA9OPXyOM/wnDXTRMWrEXWmfUXF6qXdfPff9VjAF5c+8DJjMwUeD
 VPg4mEMQD9Xq9gIkc4V8wXrZ+rlkextPSewfS+Pd8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Vivek <vgoyal@redhat.com>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Mon, 07 Feb 2022 15:21:26 +0100
Message-ID: <5204641.elYuxvqpol@silver>
In-Reply-To: <YgD7FZs9d1srvYG8@work-vm>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220207114912.1efe2a27@bahia> <YgD7FZs9d1srvYG8@work-vm>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Montag, 7. Februar 2022 11:57:25 CET Dr. David Alan Gilbert wrote:
> * Greg Kurz (groug@kaod.org) wrote:
> > On Mon, 7 Feb 2022 11:30:18 +0100
> >=20
> > Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wrote:
> > > On 7/2/22 09:47, Greg Kurz wrote:
> > > > On Sun, 6 Feb 2022 20:10:23 -0500
> > > >=20
> > > > Will Cohen <wwcohen@gmail.com> wrote:
> > > >> This patch set currently places it in 9p-util only because 9p is t=
he
> > > >> only
> > > >> place where this issue seems to have come up so far and we were wa=
ry
> > > >> of
> > > >> editing files too far afield, but I have no attachment to its
> > > >> specific
> > > >> location!
> > > >=20
> > > > Inline comments are preferred on qemu-devel. Please don't top post !
> > > > This complicates the review a lot.
> > > >=20
> > > > This is indeed a good candidate for osdep. This being said, unless
> > > > there's
> > > > some other user in the QEMU code base, it is acceptable to leave it
> > > > under
> > > > 9pfs.
> > >=20
> > > virtiofsd could eventually use it.
> >=20
> > Indeed but virtiofsd is for linux hosts only AFAICT and I'm not aware of
> > any work to support any other host OS.
> >=20
> > Cc'ing virtio-fs people for inputs on this topic.
>=20
> Indeeed, there's a lot of Linux specific code in the virtiofsd - I know
> people are interested in other platforms, but I'm not sure that's the
> right starting point.
>=20
> Dave

Agreeing with Greg here: i.e. I would have placed this into osdep, but I wo=
uld=20
not insist on it either.

Best regards,
Christian Schoenebeck



