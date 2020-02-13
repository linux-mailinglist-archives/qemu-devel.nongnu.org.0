Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850415BC53
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 11:05:14 +0100 (CET)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2BMv-0005An-3j
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 05:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j2BM3-0004e7-9W
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:04:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j2BM2-0004kz-9R
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:04:19 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58431
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j2BM2-0004kR-66
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581588257;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P1j9Oc1NnOVsfkDgKHOZ1NjLth4nXVJZQ5NuwiQRioA=;
 b=GgwyJPPvzMQZaT+y07SxXwhgTnSXM01qo4AKdlagXtUj/OqJUoy23aiK6bjVb/+tKCG6QY
 ryU3PXZSgZE7RGRYdX1JWoh79CPh3w1zCCId1Yrq18hkGol6ATT/tp+P5l1kUAHxWIui1S
 VoVxAga8J0+yIFoJyoj6feqikmXZ+jE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-EcWhL4cxPdChHWXZcO4jrA-1; Thu, 13 Feb 2020 05:04:13 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 581D7107ACC7;
 Thu, 13 Feb 2020 10:04:12 +0000 (UTC)
Received: from redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C618D1001925;
 Thu, 13 Feb 2020 10:04:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Zhimin Feng <fengzhimin1@huawei.com>
Subject: Re: [PATCH RFC 02/14] migration: judge whether or not the RDMA is
 used for migration
In-Reply-To: <20200213093755.370-3-fengzhimin1@huawei.com> (Zhimin Feng's
 message of "Thu, 13 Feb 2020 17:37:43 +0800")
References: <20200213093755.370-1-fengzhimin1@huawei.com>
 <20200213093755.370-3-fengzhimin1@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 13 Feb 2020 11:04:09 +0100
Message-ID: <87d0ai952e.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: EcWhL4cxPdChHWXZcO4jrA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Reply-To: quintela@redhat.com
Cc: zhang.zhanghailiang@huawei.com, armbru@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, jemmy858585@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhimin Feng <fengzhimin1@huawei.com> wrote:
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> ---
>  migration/migration.c | 10 ++++++++++
>  migration/migration.h |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 10a13e0c79..819089a7ea 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -107,6 +107,7 @@ static NotifierList migration_state_notifiers =3D
>      NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
> =20
>  static bool deferred_incoming;
> +static bool enabled_rdma_migration;

Please no.
Use a field in migration state.

No problem with the rest ofthe patch.

Later, Juan.


