Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C617414C0D1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 20:20:12 +0100 (CET)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwWPD-0004Wi-MF
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 14:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iwVKt-0004o4-NV
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:11:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iwVKr-0001N0-5z
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:11:38 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60453
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iwVKr-0001L9-2O
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580235096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vB8bRgsl1wOabwuyBJiR1sNWzMD1CYoWuLVu6A4rM9c=;
 b=STlVJlhXMFjscH24NREfOjkXSXoNF4wC/HGpX4MzRZjTn5Fy8gL8yvWHf3kxdrnqlzsMqs
 xG+XYQZnnUyr5AEGiYBt+yeYZz0cbSFr+lLqz3adXwI/M1336rG/3WG2JwPhNvkIAn+61E
 2Z06MFm4iAHkr4WjofQa+ccIoSGzO6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-UwrE8JY9MwuPQpTABL7qjQ-1; Tue, 28 Jan 2020 13:11:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E518010DB;
 Tue, 28 Jan 2020 18:11:29 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31EBF83861;
 Tue, 28 Jan 2020 18:11:25 +0000 (UTC)
Date: Tue, 28 Jan 2020 18:11:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v3 06/13] monitor/hmp: move hmp_block_job* to
 block-hmp-cmds.c
Message-ID: <20200128181122.GY3215@work-vm>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
 <20200127103647.17761-7-mlevitsk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200127103647.17761-7-mlevitsk@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: UwrE8JY9MwuPQpTABL7qjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Maxim Levitsky (mlevitsk@redhat.com) wrote:
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  block/monitor/block-hmp-cmds.c     | 52 ++++++++++++++++++++++++++++++
>  include/block/block-hmp-commands.h |  6 ++++
>  include/monitor/hmp.h              |  5 ---
>  monitor/hmp-cmds.c                 | 52 ------------------------------
>  4 files changed, 58 insertions(+), 57 deletions(-)
>=20
> diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmd=
s.c
> index ae3890aaab..ed3c350143 100644
> --- a/block/monitor/block-hmp-cmds.c
> +++ b/block/monitor/block-hmp-cmds.c
> @@ -228,3 +228,55 @@ void hmp_drive_backup(Monitor *mon, const QDict *qdi=
ct)
>      qmp_drive_backup(&backup, &err);
>      hmp_handle_error(mon, err);
>  }
> +
> +void hmp_block_job_set_speed(Monitor *mon, const QDict *qdict)
> +{
> +    Error *error =3D NULL;
> +    const char *device =3D qdict_get_str(qdict, "device");
> +    int64_t value =3D qdict_get_int(qdict, "speed");
> +
> +    qmp_block_job_set_speed(device, value, &error);
> +
> +    hmp_handle_error(mon, error);
> +}
> +
> +void hmp_block_job_cancel(Monitor *mon, const QDict *qdict)
> +{
> +    Error *error =3D NULL;
> +    const char *device =3D qdict_get_str(qdict, "device");
> +    bool force =3D qdict_get_try_bool(qdict, "force", false);
> +
> +    qmp_block_job_cancel(device, true, force, &error);
> +
> +    hmp_handle_error(mon, error);
> +}
> +
> +void hmp_block_job_pause(Monitor *mon, const QDict *qdict)
> +{
> +    Error *error =3D NULL;
> +    const char *device =3D qdict_get_str(qdict, "device");
> +
> +    qmp_block_job_pause(device, &error);
> +
> +    hmp_handle_error(mon, error);
> +}
> +
> +void hmp_block_job_resume(Monitor *mon, const QDict *qdict)
> +{
> +    Error *error =3D NULL;
> +    const char *device =3D qdict_get_str(qdict, "device");
> +
> +    qmp_block_job_resume(device, &error);
> +
> +    hmp_handle_error(mon, error);
> +}
> +
> +void hmp_block_job_complete(Monitor *mon, const QDict *qdict)
> +{
> +    Error *error =3D NULL;
> +    const char *device =3D qdict_get_str(qdict, "device");
> +
> +    qmp_block_job_complete(device, &error);
> +
> +    hmp_handle_error(mon, error);
> +}
> diff --git a/include/block/block-hmp-commands.h b/include/block/block-hmp=
-commands.h
> index fcaf753118..ea6578a5f6 100644
> --- a/include/block/block-hmp-commands.h
> +++ b/include/block/block-hmp-commands.h
> @@ -11,4 +11,10 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict);
>  void hmp_drive_mirror(Monitor *mon, const QDict *qdict);
>  void hmp_drive_backup(Monitor *mon, const QDict *qdict);
> =20
> +void hmp_block_job_set_speed(Monitor *mon, const QDict *qdict);
> +void hmp_block_job_cancel(Monitor *mon, const QDict *qdict);
> +void hmp_block_job_pause(Monitor *mon, const QDict *qdict);
> +void hmp_block_job_resume(Monitor *mon, const QDict *qdict);
> +void hmp_block_job_complete(Monitor *mon, const QDict *qdict);
> +
>  #endif
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index c1b363ee57..592ce0ccfe 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -87,11 +87,6 @@ void hmp_eject(Monitor *mon, const QDict *qdict);
>  void hmp_change(Monitor *mon, const QDict *qdict);
>  void hmp_block_set_io_throttle(Monitor *mon, const QDict *qdict);
>  void hmp_block_stream(Monitor *mon, const QDict *qdict);
> -void hmp_block_job_set_speed(Monitor *mon, const QDict *qdict);
> -void hmp_block_job_cancel(Monitor *mon, const QDict *qdict);
> -void hmp_block_job_pause(Monitor *mon, const QDict *qdict);
> -void hmp_block_job_resume(Monitor *mon, const QDict *qdict);
> -void hmp_block_job_complete(Monitor *mon, const QDict *qdict);
>  void hmp_migrate(Monitor *mon, const QDict *qdict);
>  void hmp_device_add(Monitor *mon, const QDict *qdict);
>  void hmp_device_del(Monitor *mon, const QDict *qdict);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a70bcb1d16..996ce96430 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1975,58 +1975,6 @@ void hmp_block_stream(Monitor *mon, const QDict *q=
dict)
>      hmp_handle_error(mon, error);
>  }
> =20
> -void hmp_block_job_set_speed(Monitor *mon, const QDict *qdict)
> -{
> -    Error *error =3D NULL;
> -    const char *device =3D qdict_get_str(qdict, "device");
> -    int64_t value =3D qdict_get_int(qdict, "speed");
> -
> -    qmp_block_job_set_speed(device, value, &error);
> -
> -    hmp_handle_error(mon, error);
> -}
> -
> -void hmp_block_job_cancel(Monitor *mon, const QDict *qdict)
> -{
> -    Error *error =3D NULL;
> -    const char *device =3D qdict_get_str(qdict, "device");
> -    bool force =3D qdict_get_try_bool(qdict, "force", false);
> -
> -    qmp_block_job_cancel(device, true, force, &error);
> -
> -    hmp_handle_error(mon, error);
> -}
> -
> -void hmp_block_job_pause(Monitor *mon, const QDict *qdict)
> -{
> -    Error *error =3D NULL;
> -    const char *device =3D qdict_get_str(qdict, "device");
> -
> -    qmp_block_job_pause(device, &error);
> -
> -    hmp_handle_error(mon, error);
> -}
> -
> -void hmp_block_job_resume(Monitor *mon, const QDict *qdict)
> -{
> -    Error *error =3D NULL;
> -    const char *device =3D qdict_get_str(qdict, "device");
> -
> -    qmp_block_job_resume(device, &error);
> -
> -    hmp_handle_error(mon, error);
> -}
> -
> -void hmp_block_job_complete(Monitor *mon, const QDict *qdict)
> -{
> -    Error *error =3D NULL;
> -    const char *device =3D qdict_get_str(qdict, "device");
> -
> -    qmp_block_job_complete(device, &error);
> -
> -    hmp_handle_error(mon, error);
> -}
> -
>  typedef struct HMPMigrationStatus
>  {
>      QEMUTimer *timer;
> --=20
> 2.17.2
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


