Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E2666B3B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 07:39:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFrEF-0003pZ-MA; Thu, 12 Jan 2023 01:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFrE7-0003p3-Ks
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 01:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFrE5-0001B2-3i
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 01:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673505491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERAzqsTZPc6VlUvIQfnM8cwJo4BOGqafCeYSkGIQDsI=;
 b=XuUvvEPtdJUyZRRYnfOXat85dK3b+VUGW/XfU8h7eCrf9o9qibpyEAVpYpi4wvU318Sh7C
 jmWL1T1+1ZsFFVTePHHTZujqf7Xf+Lx4sXAutg1GX9Jd8bK9D3wr5bnaYy02nLq4EsipMh
 Wzbkjoz1PVIt2pHjXzGG3d/dit5XqXM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-e18vJV6DPsWOMw38wC006w-1; Thu, 12 Jan 2023 01:38:08 -0500
X-MC-Unique: e18vJV6DPsWOMw38wC006w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9C4F101A521;
 Thu, 12 Jan 2023 06:38:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75EA22166B26;
 Thu, 12 Jan 2023 06:38:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E90F21E5DCF; Thu, 12 Jan 2023 07:38:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  quintela@redhat.com,
 dgilbert@redhat.com,  pbonzini@redhat.com,  berrange@redhat.com,
 eblake@redhat.com,  Manish Mishra <manish.mishra@nutanix.com>,  Aravind
 Retnakaran <aravind.retnakaran@nutanix.com>
Subject: Re: [PATCH 5/5] migration: Established connection for listener
 sockets on the dest interface
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-6-het.gala@nutanix.com>
Date: Thu, 12 Jan 2023 07:38:06 +0100
In-Reply-To: <20221226053329.157905-6-het.gala@nutanix.com> (Het Gala's
 message of "Mon, 26 Dec 2022 05:33:29 +0000")
Message-ID: <87lem89s1d.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> writes:

> From: Author Het Gala <het.gala@nutanix.com>
>
> Modified 'migrate-incoming' QAPI supports MigrateChannel parameters to pr=
event
> multi-level encodings of uri on the destination side.
>
> socket_start_incoming_migration() has been depricated as it's only purpos=
e was
> uri parsing.
> Renamed socket_outgoing_migration_internal() as socket_start_incoming_mig=
ration().
> qemu_uri_parsing() is used to populate the new struct from 'uri' string
> needed for migration connection. The function will no longer be used once=
 the
> 'uri' parameter is depricated, as the parameters will already be mapped i=
nto
> new struct.
>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  migration/migration.c | 48 ++++++++++++++++++++++++++++---------------
>  migration/socket.c    | 16 ++-------------
>  migration/socket.h    |  2 +-
>  3 files changed, 35 insertions(+), 31 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 838940fd55..c70fd0ab4f 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -520,27 +520,43 @@ static void qemu_uri_parsing(const char *uri,
>      }
>  }
>=20=20
> -static void qemu_start_incoming_migration(const char *uri, Error **errp)
> +static void qemu_start_incoming_migration(const char *uri,
> +                                          MigrateChannel *channel,
> +                                          Error **errp)
>  {
> -    const char *p =3D NULL;
> +    MigrateAddress *addrs =3D g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr =3D g_new0(SocketAddress, 1);
> +
> +    /*
> +     * motive here is just to have checks and convert uri into
> +     * socketaddress struct
> +     */
> +    if (uri && channel) {
> +        error_setg(errp, "uri and channels options should be used "
> +                          "mutually exclusive");
> +    } else if (uri) {
> +        qemu_uri_parsing(uri, &channel, errp);
> +    }
>=20=20
>      migrate_protocol_allow_multi_channels(false); /* reset it anyway */
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> -    if (strstart(uri, "tcp:", &p) ||
> -        strstart(uri, "unix:", NULL) ||
> -        strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multi_channels(true);
> -        socket_start_incoming_migration(p ? p : uri, errp);
> +    if (addrs->transport =3D=3D MIGRATE_TRANSPORT_SOCKET) {
> +        if (saddr->type =3D=3D SOCKET_ADDRESS_TYPE_INET ||
> +            saddr->type =3D=3D SOCKET_ADDRESS_TYPE_UNIX ||
> +            saddr->type =3D=3D SOCKET_ADDRESS_TYPE_VSOCK) {
> +            migrate_protocol_allow_multi_channels(true);
> +            socket_start_incoming_migration(saddr, errp);
> +        } else if (saddr->type =3D=3D SOCKET_ADDRESS_TYPE_FD) {
> +            fd_start_incoming_migration(saddr->u.fd.str, errp);
> +        }
>  #ifdef CONFIG_RDMA
> -    } else if (strstart(uri, "rdma:", &p)) {
> -        rdma_start_incoming_migration(p, errp);
> +    } else if (addrs->transport =3D=3D MIGRATE_TRANSPORT_RDMA) {
> +        rdma_start_incomng_migration(addrs->u.rdma.rdma_str, errp);


Fails to compile:

    ../migration/migration.c: In function =E2=80=98qemu_start_incoming_migr=
ation=E2=80=99:
    ../migration/migration.c:554:9: error: implicit declaration of function=
 =E2=80=98rdma_start_incomng_migration=E2=80=99; did you mean =E2=80=98rdma=
_start_incoming_migration=E2=80=99? [-Werror=3Dimplicit-function-declaratio=
n]
      554 |         rdma_start_incomng_migration(addrs->u.rdma.rdma_str, er=
rp);
          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
          |         rdma_start_incoming_migration
    ../migration/migration.c:554:9: error: nested extern declaration of =E2=
=80=98rdma_start_incomng_migration=E2=80=99 [-Werror=3Dnested-externs]

Please fix that, and also test RDMA.

>  #endif
> -    } else if (strstart(uri, "exec:", &p)) {
> -        exec_start_incoming_migration(p, errp);
> -    } else if (strstart(uri, "fd:", &p)) {
> -        fd_start_incoming_migration(p, errp);
> +    } else if (addrs->transport =3D=3D MIGRATE_TRANSPORT_EXEC) {
> +        exec_start_incoming_migration(addrs->u.exec.exec_str, errp);
>      } else {
> -        error_setg(errp, "unknown migration protocol: %s", uri);
> +        error_setg(errp, "unknown migration protocol: %i", addrs->transp=
ort);
>      }
>  }
>=20=20

[...]


