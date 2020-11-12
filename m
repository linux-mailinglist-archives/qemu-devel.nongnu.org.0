Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323822B02E1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 11:40:48 +0100 (CET)
Received: from localhost ([::1]:52210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdA23-0002CG-9f
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 05:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kd9zz-0001IV-I8
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kd9zx-0000Z2-UL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 05:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605177514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3W/ILe670BMuUfdujmN+DpTX8cPcbqTHe1RwRSpG6c=;
 b=P1DdIsxLlW+dR0NbQFEWXnnbNuZKQ7aBNvd/BwQadAmNHwcVgzGFtWzSf/O7gJtP5O5FyH
 2cqqovvITbp09yC26u2mGidHQAf+1yzBbjWz0TfFq+C6z+3ose0nK2/HCVrQ0o6yVrvT9H
 HQXUmVb8E+EAVj74R/WQLIlnZun8p5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-HuZmuZWjO9OfZ-j7iU5xrg-1; Thu, 12 Nov 2020 05:38:33 -0500
X-MC-Unique: HuZmuZWjO9OfZ-j7iU5xrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92D648018A4;
 Thu, 12 Nov 2020 10:38:31 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C0727CB7;
 Thu, 12 Nov 2020 10:38:29 +0000 (UTC)
Date: Thu, 12 Nov 2020 10:38:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH] migration: handle CANCELLING state in
 migration_completion()
Message-ID: <20201112103826.GB2905@work-vm>
References: <20201105091726.148-1-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201105091726.148-1-longpeng2@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:51:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: arei.gonglei@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Longpeng(Mike) (longpeng2@huawei.com) wrote:
> The following sequence may cause the VM abort during migration:
>=20
> 1. RUN_STATE_RUNNING,MIGRATION_STATUS_ACTIVE
>=20
> 2. before call migration_completion(), we send migrate_cancel
>    QMP command, the state machine is changed to:
>      RUN_STATE_RUNNING,MIGRATION_STATUS_CANCELLING
>=20
> 3. call migration_completion(), and the state machine is
>    switch to: RUN_STATE_RUNNING,MIGRATION_STATUS_COMPLETED
>=20
> 4. call migration_iteration_finish(), because the migration
>    status is COMPLETED, so it will try to set the runstate
>    to POSTMIGRATE, but RUNNING-->POSTMIGRATE is an invalid
>    transition, so abort().
>=20
> The migration_completion() should not change the migration state
> to COMPLETED if it is already changed to CANCELLING.
>=20
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>

Yes I think so; the only downside I see is I think this ends up going
from CACELLNG->FAILED.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index 3263aa5..b11a2bd 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3061,6 +3061,8 @@ static void migration_completion(MigrationState *s)
> =20
>          qemu_savevm_state_complete_postcopy(s->to_dst_file);
>          trace_migration_completion_postcopy_end_after_complete();
> +    } else if (s->state =3D=3D MIGRATION_STATUS_CANCELLING) {
> +        goto fail;
>      }
> =20
>      /*
> --=20
> 1.8.3.1
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


