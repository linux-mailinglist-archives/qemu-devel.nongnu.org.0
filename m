Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE11626F2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 14:14:09 +0100 (CET)
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42hU-00055s-4h
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 08:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j42NN-00057A-Rj
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:53:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j42NM-0006Lj-Sb
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:53:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35671
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j42NM-0006Ld-Ow
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582030400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Y+vgxiuwyMVTg5NR5Th+R/L1QP8fpIPJqnqj2lUfPw=;
 b=iagMSk94QBxWAVTIN6vuHB10qVfOJZl19unmJBtkxYjtNkhGGoyTRQS0qfrSf93gl6Unvr
 sT4G01cHMBUpJDva3Yg/Os0LxjORtd1WJiw+Cd6rKamohb3aGdL4ypNaaj/UkAlDFjUtrE
 35hgnuu6myJ6aLGTk1Xpmlfo7j2gXJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-NV8WQpgLOFOwndTE7TGlpg-1; Tue, 18 Feb 2020 07:53:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A84B9107ACC7;
 Tue, 18 Feb 2020 12:53:15 +0000 (UTC)
Received: from [10.3.116.180] (ovpn-116-180.phx2.redhat.com [10.3.116.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15E7E19E9C;
 Tue, 18 Feb 2020 12:53:15 +0000 (UTC)
Subject: Re: [PATCH v2 32/33] block: Pass BdrvChildRole in remaining cases
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200204170848.614480-1-mreitz@redhat.com>
 <20200204170848.614480-33-mreitz@redhat.com>
 <f4607467-cc6e-ce10-4afa-c2c2f8fb116f@redhat.com>
 <1b8cc66d-dc0e-bfa8-c060-4decdfa1242a@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1b65896d-5fa9-5eb9-e0f5-f9ae2fef53fd@redhat.com>
Date: Tue, 18 Feb 2020 06:53:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1b8cc66d-dc0e-bfa8-c060-4decdfa1242a@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: NV8WQpgLOFOwndTE7TGlpg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/20 6:01 AM, Max Reitz wrote:

>>
>> Is it worth an assert(role) somewhere now that you've converted all
>> callers to pass at least one role?
>=20
> Well, as the commit message states, block_job_add_bdrv() in blockjob.c
> still passes BdrvChildRole=3D0 to bdrv_root_attach_child().  So it depend=
s
> on what function we=E2=80=99re looking at.
>=20
> I suppose we could add such an assertion to bdrv_attach_child() because
> we could expect all BDSs to pass some role for their children.
>=20
> OTOH, maybe a BDS has a legitimate reason not to: Maybe it just wants to
> take some permissions on some BDS without having any real relationship
> to it.  Right now, some block jobs do that, well, except they do so
> through the back door of adding the child BDS to the block job object
> (which then passes no child role).  So maybe I=E2=80=99d actually rather =
not add
> such an assertion anywhere.

Fair enough - you have more knowledge of which callers remain that still=20
have a legitimate reason to not request a role.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


