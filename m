Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310CC49C762
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 11:23:53 +0100 (CET)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCfSy-0000UU-1T
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 05:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCfRi-0008ED-3Y
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:22:34 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:29801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCfRf-0000Ss-R9
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:22:33 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-4_MHKMjbMSCIWUdimuaM6g-1; Wed, 26 Jan 2022 05:22:19 -0500
X-MC-Unique: 4_MHKMjbMSCIWUdimuaM6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A540283DD23;
 Wed, 26 Jan 2022 10:22:18 +0000 (UTC)
Received: from bahia (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ED1166E15;
 Wed, 26 Jan 2022 10:22:06 +0000 (UTC)
Date: Wed, 26 Jan 2022 11:22:05 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] tests/9pfs: fix mkdir() being called twice
Message-ID: <20220126112205.58f32614@bahia>
In-Reply-To: <3438847.JacDP26HMr@silver>
References: <f6602123c6f7d0d593466231b04fba087817abbd.1642879848.git.qemu_oss@crudebyte.com>
 <20220125163346.4cb345ce@bahia> <3438847.JacDP26HMr@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jan 2022 18:51:54 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 25. Januar 2022 16:33:46 CET Greg Kurz wrote:
> > On Sat, 22 Jan 2022 20:12:16 +0100
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > The 9p test cases use mkdtemp() to create a temporary directory for
> > > running the 'local' 9p tests with real files/dirs. Unlike mktemp()
> > > which only generates a unique file name, mkdtemp() also creates the
> > > directory, therefore the subsequent mkdir() was wrong and caused
> > > errors on some systems.
> > >=20
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Fixes: 136b7af2 (tests/9pfs: fix test dir for parallel tests)
> > > Reported-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/832
> > > ---
> >=20
> > Reviewed-by: Greg Kurz <Greg Kurz <groug@kaod.org>
>=20
> Hey, a live sign. :)
>=20

Yeah... My current engagement with kata containers doesn't leave me
much time to do anything else and I just had covid ;-)

> > Unrelated, the template pointer is leaked. It looks like g_autofree wou=
ld
> > help here. I'll post a follow-up to fix that.
>=20
> This man knows what I like to read!
>=20

Heh :-)

> Best regards,
> Christian Schoenebeck
>=20
>=20


