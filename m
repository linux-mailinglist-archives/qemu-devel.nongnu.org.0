Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F81C7081
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 14:42:43 +0200 (CEST)
Received: from localhost ([::1]:46590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWJNq-0004Hr-1C
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 08:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jWJMw-0003fS-LR
 for qemu-devel@nongnu.org; Wed, 06 May 2020 08:41:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33710
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jWJMv-0007hV-54
 for qemu-devel@nongnu.org; Wed, 06 May 2020 08:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588768904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDYBBhniPPSNn7Lf300gpuTkvLKnh+u1QO++slaKMbs=;
 b=KFn6HYMMjNI58T1tQwlhoG5fAVpixTNS8SuR8I1ibbfmdawJT3qU5ZqG3gJ44U744eGy4m
 eiQrD1vYZpOHN/uP8OCy790SNbZZIbzl4PB4pn394yYKRXp5FH49EvwISjxBpuMFEM/nAr
 dWJFRwT+sISYIuaNeF1Q+hFm6N14cs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-PpCWLcDmMIay7K_ugAwWPQ-1; Wed, 06 May 2020 08:41:42 -0400
X-MC-Unique: PpCWLcDmMIay7K_ugAwWPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ECA2107ACCD;
 Wed,  6 May 2020 12:41:41 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-140.ams2.redhat.com [10.36.113.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 232336061C;
 Wed,  6 May 2020 12:41:39 +0000 (UTC)
Date: Wed, 6 May 2020 14:41:38 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 12/33] block: Unify bdrv_child_cb_detach()
Message-ID: <20200506124138.GC6333@linux.fritz.box>
References: <20200218124242.584644-1-mreitz@redhat.com>
 <20200218124242.584644-13-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218124242.584644-13-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 23:48:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
> Make bdrv_child_cb_detach() call bdrv_backing_detach() for children with
> a COW role (and drop the reverse call from bdrv_backing_detach()), so it
> can be used for any child (with a proper role set).
>=20
> Because so far no child has a proper role set, we need a temporary new
> callback for child_backing.detach that ensures bdrv_backing_detach() is
> called for all COW children that do not have their role set yet.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/block.c b/block.c
> index 3cf1293a7b..0f24546863 100644
> --- a/block.c
> +++ b/block.c
> @@ -943,6 +943,7 @@ static void bdrv_child_cb_drained_end(BdrvChild *chil=
d,
>  }
> =20
>  static void bdrv_backing_attach(BdrvChild *c);
> +static void bdrv_backing_detach(BdrvChild *c);

This series leaves a few static forward declarations behind, and even
in the middle of the code rather than at the top.

Does anything stop us from adding bdrv_inherited_options() after all the
old functions instead? This will require a temporary forward
declaration, too, but it can go away at the end of the series when there
is only child_of_bds left.

Kevin


