Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A011E20F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 11:36:09 +0100 (CET)
Received: from localhost ([::1]:45496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifiIr-0000zH-1i
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 05:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ifiHy-0000KV-43
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 05:35:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ifiHx-0002iT-4I
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 05:35:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32897
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ifiHx-0002gD-0H
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 05:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576233312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzI+c2sGEEKcWD2+JeUYF1iRos7YC6LorKz9+igyIPE=;
 b=A104zpeCTbBAIP7h5vlrLhqKbmpK4RYzjqoUPB+lTKu1UQuQF/EJjZH0MA+zXu6xwMENY9
 vlB+6ByBt56G2YRW0kmxUHuj2ptwRWRBaEDQ/UeMjmWOHAu8fLz1MLFCheteFSKsuKjqGA
 2Pk6H6kXsruVEsptGf/yp608g0ZOI4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-PoBL0t14NYm2sv1hKxvGCQ-1; Fri, 13 Dec 2019 05:35:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 106A3107ACC4;
 Fri, 13 Dec 2019 10:35:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-153.ams2.redhat.com
 [10.36.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3745C28D;
 Fri, 13 Dec 2019 10:35:04 +0000 (UTC)
Date: Fri, 13 Dec 2019 11:35:01 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] qcow2: Use offset_into_cluster()
Message-ID: <20191213103501.GC3428@localhost.localdomain>
References: <20191212100121.29621-1-berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20191212100121.29621-1-berto@igalia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: PoBL0t14NYm2sv1hKxvGCQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.12.2019 um 11:01 hat Alberto Garcia geschrieben:
> There's a couple of places left in the qcow2 code that still do the
> calculation manually, so let's replace them.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>

Thanks, applied to the block branch.

Kevin


