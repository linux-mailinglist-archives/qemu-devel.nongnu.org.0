Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36B191982
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 19:55:30 +0100 (CET)
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGoi1-0001UZ-At
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 14:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jGohA-0000mM-Fd
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jGoh8-0003Wr-NP
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:54:35 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:43390)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jGoh8-0003Vt-Iw
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585076073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cy/KeuZy/dXv7BaYtH1itI04Gh8570R5tn5KNjIF9u4=;
 b=EFeAkVnbhm0iFMgWGjIISDRIMZz1N5QnqEMMkn3QrmcuvIdgLaeyu7Q1uaNkyNvbK1Igyq
 13e2KvjwZ3g7/SWyw0aKd0jwlq1w7tILC/5CtkrcFsmSrVO39UPnJj1EpRWMKt1OWLKDxz
 Aeobb6hhRZc3ydedNWiV9tkFxyZpGkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-ApVRB7npPDONiGyOCXNDVA-1; Tue, 24 Mar 2020 14:54:29 -0400
X-MC-Unique: ApVRB7npPDONiGyOCXNDVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00284800D50;
 Tue, 24 Mar 2020 18:54:28 +0000 (UTC)
Received: from work-vm (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F6C5BBBCE;
 Tue, 24 Mar 2020 18:54:24 +0000 (UTC)
Date: Tue, 24 Mar 2020 18:54:21 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH] hmp/vnc: Fix info vnc list leak
Message-ID: <20200324185421.GD17043@work-vm>
References: <20200323120822.51266-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200323120822.51266-1-dgilbert@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> We're iterating the list, and then freeing the iteration pointer rather
> than the list head.
>=20
> Fixes: 0a9667ecdb6d ("hmp: Update info vnc")
> Reported-by: Coverity (CID 1421932)
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> ---
>  monitor/hmp-cmds.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a00248527c..1d473e809c 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -527,10 +527,11 @@ static void hmp_info_vnc_servers(Monitor *mon, VncS=
erverInfo2List *server)
> =20
>  void hmp_info_vnc(Monitor *mon, const QDict *qdict)
>  {
> -    VncInfo2List *info2l;
> +    VncInfo2List *info2l, *info2l_head;
>      Error *err =3D NULL;
> =20
>      info2l =3D qmp_query_vnc_servers(&err);
> +    info2l_head =3D info2l;
>      if (err) {
>          hmp_handle_error(mon, err);
>          return;
> @@ -559,7 +560,7 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
>          info2l =3D info2l->next;
>      }
> =20
> -    qapi_free_VncInfo2List(info2l);
> +    qapi_free_VncInfo2List(info2l_head);
> =20
>  }
>  #endif
> --=20
> 2.25.1
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


