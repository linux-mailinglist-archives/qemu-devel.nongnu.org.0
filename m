Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B21C778D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 19:14:16 +0200 (CEST)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWNcd-0000tG-DM
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 13:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jWNbo-0000HA-MR
 for qemu-devel@nongnu.org; Wed, 06 May 2020 13:13:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58870
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jWNbm-0007Do-KL
 for qemu-devel@nongnu.org; Wed, 06 May 2020 13:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588785201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uuqm2kQe56o2Z4gEs36I57dNoAY0o5xOxbAZ7adebRA=;
 b=Y1bY6MGLEKORlIQ7+ER4DqsUPsOPcZMR48xHet/K5RY9ed9uUta93nZgg2MWPhtso9o/5x
 SmPDVqPkBqy2iRluFI/y+y+XCwuqoBIGoV1bH4tqdGHXJCZtG7Ffe7pxKCP3Mnge2tsqA3
 1JlTLHOMVhS+f56tCeelyUU+XkBZRD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-j1QQdrSJOPyOKsnPHvzZRQ-1; Wed, 06 May 2020 13:13:19 -0400
X-MC-Unique: j1QQdrSJOPyOKsnPHvzZRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9032D18FF661;
 Wed,  6 May 2020 17:13:18 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-140.ams2.redhat.com [10.36.113.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E8E5C1B5;
 Wed,  6 May 2020 17:13:17 +0000 (UTC)
Date: Wed, 6 May 2020 19:13:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 32/33] block: Pass BdrvChildRole in remaining cases
Message-ID: <20200506171315.GJ6333@linux.fritz.box>
References: <20200218124242.584644-1-mreitz@redhat.com>
 <20200218124242.584644-33-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218124242.584644-33-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 04:02:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.02.2020 um 13:42 hat Max Reitz geschrieben:
> These calls have no real use for the child role yet, but it will not
> harm to give one.
>=20
> Notably, the bdrv_root_attach_child() call in blockjob.c is left
> unmodified because there is not much the generic BlockJob object wants
> from its children.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/block/vvfat.c b/block/vvfat.c
> index 8f4ff5a97e..d4f4218924 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3186,7 +3186,7 @@ static int enable_write_target(BlockDriverState *bs=
, Error **errp)
>      options =3D qdict_new();
>      qdict_put_str(options, "write-target.driver", "qcow");
>      s->qcow =3D bdrv_open_child(s->qcow_filename, options, "write-target=
", bs,
> -                              &child_vvfat_qcow, 0, false, errp);
> +                              &child_vvfat_qcow, BDRV_CHILD_DATA, false,=
 errp);

Doesn't it contain metadata, too?

Kevin


