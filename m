Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387BC17007F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 14:54:40 +0100 (CET)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6x95-0002BW-AY
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 08:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j6x8D-0001b0-RS
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 08:53:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j6x8C-000681-U2
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 08:53:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28572
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j6x8C-00066J-QL
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 08:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582725224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9n/g++uhJQWaRTqsbWus6FfiO1b6NiwYsF8Vwy3dvEM=;
 b=BCk84ORV+sAYnGXByPBNh0ixipKgnS2gkl3SpJtMj1pUAAiYtipfZU3+ElLyMAZE+TNQJx
 6dPnSm+/9wKbINSzn74na0GbU6JQCgTJp3LXy4TfuFFV/Zov5L/n/zkGtDy44RVEChAlX8
 zc6NGfnpq3tC+8oduDB7wPKNE0Gu1Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-Qf2dukUUNLGsHz6r-xSPMg-1; Wed, 26 Feb 2020 08:53:40 -0500
X-MC-Unique: Qf2dukUUNLGsHz6r-xSPMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90A1E801E70;
 Wed, 26 Feb 2020 13:53:39 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-170.ams2.redhat.com [10.36.117.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BB9B8C09E;
 Wed, 26 Feb 2020 13:53:37 +0000 (UTC)
Date: Wed, 26 Feb 2020 14:53:36 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/3] qcow2: Fix alloc_cluster_abort() for pre-existing
 clusters
Message-ID: <20200226135336.GE6096@linux.fritz.box>
References: <20200225143130.111267-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200225143130.111267-1-mreitz@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2020 um 15:31 hat Max Reitz geschrieben:
> With c3b6658c1a5a3fb2, Kevin has fixed a case in alloc_cluster_abort()
> where we used to free a cluster that wasn=E2=80=99t even allocated by
> handle_alloc(), thus leading to an error and/or corruption.  Besides
> external data files, there is another case where alloc_cluster_abort()
> must not free the =E2=80=9Cnew=E2=80=9D cluster: Namely when the cluster =
isn=E2=80=99t new
> because we=E2=80=99re reusing an existing pre-allocated zero cluster.
>=20
> I think Berto=E2=80=99s subcluster series fixes this, too, but it=E2=80=
=99s still an
> RFC, so I suppose we have to fix the bug independently of it.
>=20
> Patch 2 adds a regression test; patch 3 adds a regression test for
> Kevin=E2=80=99s patch c3b6658c1a5a3fb2 (which didn=E2=80=99t come with on=
e).

Thanks, applied to the block branch.

Kevin


