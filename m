Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727831915B5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 17:11:11 +0100 (CET)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGm90-0007pE-IG
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 12:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jGm8D-0007Gn-JZ
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:10:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jGm8C-0004Uc-29
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:10:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:45830)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jGm8B-0004UH-SE
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585066219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSUBEKT8ryeInsmCRfsUL+Ykroq26xt9W/bluTP2Q0Q=;
 b=SS22dpdJuJEZcx0+8XhjR0v8mLSOBuXZDF9eYWRUfQcNRDjiCloJ0IUls6qXB6U0bGI7me
 sBGyjUFfBjlBOIvcESqbfKa3L9kH5l5UEA4PMcGHfguHN48jq9KtDlZd4th/TfudMQPF1k
 CjqQiFxT0+6mDTBJgBHMBjDtIdMGbiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-NpfXmCr_NwaMGnF2jacvXg-1; Tue, 24 Mar 2020 12:10:17 -0400
X-MC-Unique: NpfXmCr_NwaMGnF2jacvXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2167EDB20;
 Tue, 24 Mar 2020 16:10:16 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-119.ams2.redhat.com [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF1326EF86;
 Tue, 24 Mar 2020 16:10:14 +0000 (UTC)
Date: Tue, 24 Mar 2020 17:10:13 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH for 5.0] block: fix bdrv_root_attach_child forget to
 unref child_bs
Message-ID: <20200324161013.GJ5417@linux.fritz.box>
References: <20200324155921.23822-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20200324155921.23822-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: den@openvz.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.03.2020 um 16:59 hat Vladimir Sementsov-Ogievskiy geschrieben:
> bdrv_root_attach_child promises to drop child_bs reference on failure.
> It does it on first handled failure path, but not on the second. Fix
> that.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

Kevin


