Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61A1CE43F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 21:26:15 +0200 (CEST)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYE46-0002ej-Hb
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 15:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYE2o-0001UN-P2
 for qemu-devel@nongnu.org; Mon, 11 May 2020 15:24:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42302
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYE2n-0003eX-So
 for qemu-devel@nongnu.org; Mon, 11 May 2020 15:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589225092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKQKZ8WtQEdxj5jgvoMd7PhC4JroHtrqG+9BiijplfY=;
 b=QIdyIKX7BNSB0kNQoD6z59Qw2tbBsxmj7xoEo1Lw0SV1zoGmbuh43NWPPSTkdW8rc5v7Mj
 cj0EVH/fjhT0ZQ10J/Ws2BgrsHJHuOPut0JoJo5qKaJacEYoeFhCdG2HgSoXzcl3dLNqVR
 FRDENj4sciTD/9SByQGrG8iPqeVAM7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-lbTLeemyOQ6Qg-lDZGSiDw-1; Mon, 11 May 2020 15:24:49 -0400
X-MC-Unique: lbTLeemyOQ6Qg-lDZGSiDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072C3BFC3;
 Mon, 11 May 2020 19:24:48 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E763A5D9DC;
 Mon, 11 May 2020 19:24:44 +0000 (UTC)
Date: Mon, 11 May 2020 21:24:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] hostmem: don't use mbind() if host-nodes is epmty
Message-ID: <20200511212442.6e3f4509@redhat.com>
In-Reply-To: <34c80b6d-c6f3-3772-140a-4650e2356d25@redhat.com>
References: <20200430154606.6421-1-imammedo@redhat.com>
 <20200504154450.GM5244@habkost.net>
 <34c80b6d-c6f3-3772-140a-4650e2356d25@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, mhohmann@physnet.uni-hamburg.de,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 May 2020 18:00:01 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Hi Eduardo,
>=20
> On 5/4/20 5:44 PM, Eduardo Habkost wrote:
> > On Thu, Apr 30, 2020 at 11:46:06AM -0400, Igor Mammedov wrote: =20
> >> Since 5.0 QEMU uses hostmem backend for allocating main guest RAM.
> >> The backend however calls mbind() which is typically NOP
> >> in case of default policy/absent host-nodes bitmap.
> >> However when runing in container with black-listed mbind()
> >> syscall, QEMU fails to start with error
> >>   "cannot bind memory to host NUMA nodes: Operation not permitted"
> >> even when user hasn't provided host-nodes to pin to explictly
> >> (which is the case with -m option)
> >>
> >> To fix issue, call mbind() only in case when user has provided
> >> host-nodes explicitly (i.e. host_nodes bitmap is not empty).
> >> That should allow to run QEMU in containers with black-listed
> >> mbind() without memory pinning. If QEMU provided memory-pinning
> >> is required user still has to white-list mbind() in container
> >> configuration.
> >>
> >> Reported-by: Manuel Hohmann <mhohmann@physnet.uni-hamburg.de>
> >> Signed-off-by: Igor Mammedov <imammedo@redhat.com> =20
> >=20
> > Queued on machine-next, thanks! =20
>=20
> I've been debugging this issue again today and figured it was not=20
> merged, if possible can you add the "Cc: qemu-stable@nongnu.org" tag=20
> before sending your pull request?
it's CCed already, so my impression was that will should picked up once it =
was reviewed.

>=20
> Thanks,
>=20
> Phil.
>=20


