Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D02B23FC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 19:46:47 +0100 (CET)
Received: from localhost ([::1]:56328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kde5t-0007bV-Hy
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 13:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kde3t-00073Q-4Y
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 13:44:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kde3j-0008P0-Td
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 13:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605293070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XA7a1L0QaNP5xEeycdpTKAgWkXwShuI/8w+Rqmt/7oA=;
 b=E3mhjQbuWY00wMZOomR7HAdRgEPs60Xt15170J0FhdFPsTMMil8GGZP1jjQeBPaJu2NV9H
 h12hqRDeaCOU7AVIgS38rLP/ECU5e09/rI66n1ZkDKjvToqDV8DuekcXOxCeG5foWHaYth
 JJhs8nr4Kmc85QuQCrIx36kL7EJ87Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-UapbLK28PgiVLiDiRGJl0Q-1; Fri, 13 Nov 2020 13:44:27 -0500
X-MC-Unique: UapbLK28PgiVLiDiRGJl0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2ED51074648
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 18:44:26 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CEE519C66;
 Fri, 13 Nov 2020 18:44:22 +0000 (UTC)
Date: Fri, 13 Nov 2020 18:44:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 11/13] hmp/char: Use qemu_chr_parse_cli_str() for
 chardev-change
Message-ID: <20201113184419.GV3251@work-vm>
References: <20201112175905.404472-1-kwolf@redhat.com>
 <20201112175905.404472-12-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201112175905.404472-12-kwolf@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> Instead of going through the QemuOpts-based parser, go directly from the
> given option string to ChardevOptions. This doesn't only avoid legacy
> code, but it also simplifies the implementation.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

OK, from HMP I think

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

I'm assuming there's no change in the escaping from you extracting it
from the qdict and then printfing it back to go throguh the parser?

Dave

> ---
>  monitor/hmp-cmds.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
>=20
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a6a6684df1..0244068de8 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1793,34 +1793,25 @@ void hmp_chardev_add(Monitor *mon, const QDict *q=
dict)
>  void hmp_chardev_change(Monitor *mon, const QDict *qdict)
>  {
>      const char *args =3D qdict_get_str(qdict, "args");
> -    const char *id;
> +    const char *id =3D qdict_get_str(qdict, "id");
> +    char *optstr;
>      Error *err =3D NULL;
> -    ChardevBackend *backend =3D NULL;
> +    ChardevOptions *options =3D NULL;
>      ChardevReturn *ret =3D NULL;
> -    QemuOpts *opts =3D qemu_opts_parse_noisily(qemu_find_opts("chardev")=
, args,
> -                                             true);
> -    if (!opts) {
> -        error_setg(&err, "Parsing chardev args failed");
> -        goto end;
> -    }
> =20
> -    id =3D qdict_get_str(qdict, "id");
> -    if (qemu_opts_id(opts)) {
> -        error_setg(&err, "Unexpected 'id' parameter");
> -        goto end;
> -    }
> +    optstr =3D g_strdup_printf("%s,id=3D%s", args, id);
> =20
> -    backend =3D qemu_chr_parse_opts(opts, &err);
> -    if (!backend) {
> +    options =3D qemu_chr_parse_cli_str(optstr, &err);
> +    if (!options) {
>          goto end;
>      }
> =20
> -    ret =3D qmp_chardev_change(id, backend, &err);
> +    ret =3D qmp_chardev_change(options->id, options->backend, &err);
> =20
>  end:
> +    g_free(optstr);
>      qapi_free_ChardevReturn(ret);
> -    qapi_free_ChardevBackend(backend);
> -    qemu_opts_del(opts);
> +    qapi_free_ChardevOptions(options);
>      hmp_handle_error(mon, err);
>  }
> =20
> --=20
> 2.28.0
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


