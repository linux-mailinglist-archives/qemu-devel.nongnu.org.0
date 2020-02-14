Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A63215D80C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 14:13:25 +0100 (CET)
Received: from localhost ([::1]:38594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2amZ-0005XL-T4
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 08:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j2ali-0004jQ-0Q
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:12:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j2alg-0001mk-Ty
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:12:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59360
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j2alg-0001m2-Py
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:12:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581685948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76fYOj2p/hlVqL0xNxyP7e1V8V9UC2UUbu4VyTyOZy0=;
 b=ii759axHfVje6WQzQqf3+fe69o0Rp4LiAebtRM79E3+rDFZW3RYUAlDI4SOLl2BRzCXrBU
 v0Z8iln/URU0MqGnhNY+q/0rvKsnmcBCAoeIj0XWOzGPE56xdaez+hmCy+F+00H6ZLTnb+
 nE1BMfT99Vke2+PwYnUYvH7BZy5R+hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-kWEABTSgNuu43zEN1StYeg-1; Fri, 14 Feb 2020 08:12:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED51D1851FDD;
 Fri, 14 Feb 2020 13:12:24 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECD5C5C13E;
 Fri, 14 Feb 2020 13:12:23 +0000 (UTC)
Date: Fri, 14 Feb 2020 14:12:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hikaru Nishida <hikarupsp@gmail.com>
Subject: Re: [PATCH] block/vvfat: Do not unref qcow on closing backing bdrv
Message-ID: <20200214131222.GC5443@linux.fritz.box>
References: <20200209175156.85748-1-hikarupsp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200209175156.85748-1-hikarupsp@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: kWEABTSgNuu43zEN1StYeg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-devel@nongnu.org, "open list:vvfat" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.02.2020 um 18:51 hat Hikaru Nishida geschrieben:
> Before this commit, BDRVVVFATState.qcow is unrefed in write_target_close
> on closing backing bdrv of vvfat. However, qcow bdrv is opend as a child
> of vvfat in enable_write_target() so it will be also unrefed on closing
> vvfat itself. This causes use-after-free of qcow on freeing vvfat which
> has backing bdrv and qcow bdrv as children in this order because
> bdrv_close(vvfat) tries to free qcow bdrv after freeing backing bdrv
> as QLIST_FOREACH_SAFE() loop keeps next pointer, but BdrvChild of qcow
> is already freed in bdrv_close(backing bdrv).
>=20
> Signed-off-by: Hikaru Nishida <hikarupsp@gmail.com>

Thanks, applied to the block branch.

Kevin


