Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E817F1DF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 09:24:34 +0100 (CET)
Received: from localhost ([::1]:55134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBaBl-0004xF-8Y
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 04:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jBaAr-0004Y8-FW
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jBaAp-0001TK-Ec
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:23:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55574
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jBaAp-0001RR-8P
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 04:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583828614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Loeg49si0X+YANqIvcDFEujdKJfttjEMR2Becynuzgo=;
 b=gvecGhrQtcadBybCUFwooEi8XEmBaBB/xwWml19uaKw+k3vf69bABCEVv9yMus/6lvJjtR
 GKLm1QJ2Cp84xh8sVac/AxJiMIXXdTPg17yMpMK4jccB7Lr+DZdrTw73IE+Fr+M9QPfBsy
 /fXHZY/8mpF5z3viMhHL4KNlI/022Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-SecMlvimOVyYHuyCT5GBTQ-1; Tue, 10 Mar 2020 04:23:30 -0400
X-MC-Unique: SecMlvimOVyYHuyCT5GBTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B634B18C8C03;
 Tue, 10 Mar 2020 08:23:29 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0E985C1D4;
 Tue, 10 Mar 2020 08:23:27 +0000 (UTC)
Date: Tue, 10 Mar 2020 09:23:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Pan Nengyuan <pannengyuan@huawei.com>
Subject: Re: [PATCH v2] qom-qmp-cmds: fix two memleaks in qmp_object_add
Message-ID: <20200310092325.39d7d2c0@redhat.com>
In-Reply-To: <20200310064640.5059-1-pannengyuan@huawei.com>
References: <20200310064640.5059-1-pannengyuan@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 euler.robot@huawei.com, pbonzini@redhat.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Mar 2020 14:46:40 +0800
Pan Nengyuan <pannengyuan@huawei.com> wrote:

> 'type/id' forgot to free in qmp_object_add, this patch fix that.
>=20
> The leak stack:
> Direct leak of 84 byte(s) in 6 object(s) allocated from:
>     #0 0x7fe2a5ebf768 in __interceptor_malloc (/lib64/libasan.so.5+0xef76=
8)
>     #1 0x7fe2a5044445 in g_malloc (/lib64/libglib-2.0.so.0+0x52445)
>     #2 0x7fe2a505dd92 in g_strdup (/lib64/libglib-2.0.so.0+0x6bd92)
>     #3 0x56344954e692 in qmp_object_add /mnt/sdb/qemu-new/qemu_test/qemu/=
qom/qom-qmp-cmds.c:258
>     #4 0x563449960f5a in do_qmp_dispatch /mnt/sdb/qemu-new/qemu_test/qemu=
/qapi/qmp-dispatch.c:132
>     #5 0x563449960f5a in qmp_dispatch /mnt/sdb/qemu-new/qemu_test/qemu/qa=
pi/qmp-dispatch.c:175
>     #6 0x563449498a30 in monitor_qmp_dispatch /mnt/sdb/qemu-new/qemu_test=
/qemu/monitor/qmp.c:145
>     #7 0x56344949a64f in monitor_qmp_bh_dispatcher /mnt/sdb/qemu-new/qemu=
_test/qemu/monitor/qmp.c:234
>     #8 0x563449a92a3a in aio_bh_call /mnt/sdb/qemu-new/qemu_test/qemu/uti=
l/async.c:136
>=20
> Direct leak of 54 byte(s) in 6 object(s) allocated from:
>     #0 0x7fe2a5ebf768 in __interceptor_malloc (/lib64/libasan.so.5+0xef76=
8)
>     #1 0x7fe2a5044445 in g_malloc (/lib64/libglib-2.0.so.0+0x52445)
>     #2 0x7fe2a505dd92 in g_strdup (/lib64/libglib-2.0.so.0+0x6bd92)
>     #3 0x56344954e6c4 in qmp_object_add /mnt/sdb/qemu-new/qemu_test/qemu/=
qom/qom-qmp-cmds.c:267
>     #4 0x563449960f5a in do_qmp_dispatch /mnt/sdb/qemu-new/qemu_test/qemu=
/qapi/qmp-dispatch.c:132
>     #5 0x563449960f5a in qmp_dispatch /mnt/sdb/qemu-new/qemu_test/qemu/qa=
pi/qmp-dispatch.c:175
>     #6 0x563449498a30 in monitor_qmp_dispatch /mnt/sdb/qemu-new/qemu_test=
/qemu/monitor/qmp.c:145
>     #7 0x56344949a64f in monitor_qmp_bh_dispatcher /mnt/sdb/qemu-new/qemu=
_test/qemu/monitor/qmp.c:234
>     #8 0x563449a92a3a in aio_bh_call /mnt/sdb/qemu-new/qemu_test/qemu/uti=
l/async.c:136
>=20
> Fixes: 5f07c4d60d091320186e7b0edaf9ed2cc16b2d1e
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v2->v1:
> - do not store both a const and non-const string in the same variable, ch=
ange it to a non-const string.
>   (Suggested by Daniel P. Berrang=C3=A9)
> ---
>  qom/qom-qmp-cmds.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
> index 49db926fcc..435193b036 100644
> --- a/qom/qom-qmp-cmds.c
> +++ b/qom/qom-qmp-cmds.c
> @@ -247,26 +247,22 @@ void qmp_object_add(QDict *qdict, QObject **ret_dat=
a, Error **errp)
>      QDict *pdict;
>      Visitor *v;
>      Object *obj;
> -    const char *type;
> -    const char *id;
> +    g_autofree char *type =3D NULL;
> +    g_autofree char *id =3D NULL;
> =20
> -    type =3D qdict_get_try_str(qdict, "qom-type");
> +    type =3D g_strdup(qdict_get_try_str(qdict, "qom-type"));
>      if (!type) {
>          error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
>          return;
> -    } else {
> -        type =3D g_strdup(type);
> -        qdict_del(qdict, "qom-type");
>      }
> +    qdict_del(qdict, "qom-type");
> =20
> -    id =3D qdict_get_try_str(qdict, "id");
> +    id =3D g_strdup(qdict_get_try_str(qdict, "id"));
>      if (!id) {
>          error_setg(errp, QERR_MISSING_PARAMETER, "id");
>          return;
> -    } else {
> -        id =3D g_strdup(id);
> -        qdict_del(qdict, "id");
>      }
> +    qdict_del(qdict, "id");
> =20
>      props =3D qdict_get(qdict, "props");
>      if (props) {


