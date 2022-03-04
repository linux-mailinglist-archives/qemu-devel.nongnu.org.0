Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FB4CD68F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:40:23 +0100 (CET)
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ96U-0004iY-Co
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:40:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nQ8Qr-0005YX-3w
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:57:21 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:53942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nQ8Qp-0002VH-Ag
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:57:20 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-i3kwbBZ6M2marSk5D9EbOg-1; Fri, 04 Mar 2022 08:57:03 -0500
X-MC-Unique: i3kwbBZ6M2marSk5D9EbOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77FDF824FA6;
 Fri,  4 Mar 2022 13:57:01 +0000 (UTC)
Received: from bahia (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32F38866D9;
 Fri,  4 Mar 2022 13:56:59 +0000 (UTC)
Date: Fri, 4 Mar 2022 14:56:57 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 0/2] virtiofsd: Support FUSE_SYNCFS on unannounced
 submounts
Message-ID: <20220304145657.3a5fdec4@bahia>
In-Reply-To: <YiIB8XnpQPqktxWG@redhat.com>
References: <20220303171323.580712-1-groug@kaod.org>
 <YiIB8XnpQPqktxWG@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: German Maglione <gmaglione@redhat.com>,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 07:11:29 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Thu, Mar 03, 2022 at 06:13:21PM +0100, Greg Kurz wrote:
> > This is the current patches I have : one to track submounts
> > and the other to call syncfs() on them. Tested on simple
> > cases only.
> >=20
> > I won't be able to work on this anymore, so I'm posting for the
> > records. Anyone is welcome to pick it up as there won't be a v2
> > from my side.
>=20
> Thanks Greg. Hopefully somebody else will be able to pick it up.
>=20
> What are TODO items to take this patch series to completion.
>=20

Compared to the previous try, this basically tracks submount inodes
in a dedicated hash to avoid browsing through all inodes at sync
time.

Given the limited time I had to spend on this, it certainly
requires some more thinking and testing around corner cases.
Since C virtiofsd is being deprecated, I don't think it's
worth investing much in supporting all possible scenarios.
Maybe add sanity checks and proper error handling for things
that would obviously break.

Cheers,

--
Greg

> Vivek
>=20
> >=20
> > Cheers,
> >=20
> > --
> > Greg
> >=20
> > Greg Kurz (2):
> >   virtiofsd: Track submounts
> >   virtiofsd: Support FUSE_SYNCFS on unannounced submounts
> >=20
> >  tools/virtiofsd/passthrough_ll.c | 61 ++++++++++++++++++++++++++++----
> >  1 file changed, 55 insertions(+), 6 deletions(-)
> >=20
> > --=20
> > 2.34.1
> >=20
> >=20
>=20


