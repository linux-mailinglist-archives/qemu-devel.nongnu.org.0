Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB8B3906FC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:57:34 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaN3-0003sx-Rt
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1llYjj-00081F-AO
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:12:51 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:23156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1llYjh-0001ek-BJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:12:51 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-_TTHiiXePNWW6FQbz7ENBQ-1; Tue, 25 May 2021 11:12:38 -0400
X-MC-Unique: _TTHiiXePNWW6FQbz7ENBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D3881005D52;
 Tue, 25 May 2021 15:12:37 +0000 (UTC)
Received: from bahia.lan (ovpn-113-46.ams2.redhat.com [10.36.113.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA41B5C1A1;
 Tue, 25 May 2021 15:12:35 +0000 (UTC)
Date: Tue, 25 May 2021 17:12:34 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spapr: propagate LPCR to hot-plugged CPUs
Message-ID: <20210525171234.513f2e83@bahia.lan>
In-Reply-To: <20210524114132.572659-1-clg@kaod.org>
References: <20210524114132.572659-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 May 2021 13:41:32 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Distros have started using the 'scv' instructions (glibc 2.33) which
> relies on the LPCR AIL bits. Unfortunately, the LPCR of hot-plugged
> CPUs is not synchronized with the rest of machine and it breaks the
> guest OS.
>=20
> Fix that by using the first CPU to set the LPCR value of all hot-plugged
> CPUs.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

LGTM

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c23bcc449071..e463c2570c7a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3890,6 +3890,8 @@ static void spapr_core_plug(HotplugHandler *hotplug=
_dev, DeviceState *dev)
>          for (i =3D 0; i < cc->nr_threads; i++) {
>              ppc_set_compat(core->threads[i], POWERPC_CPU(first_cpu)->com=
pat_pvr,
>                             &error_abort);
> +            ppc_store_lpcr(core->threads[i],
> +                           POWERPC_CPU(first_cpu)->env.spr[SPR_LPCR]);
>          }
>      }
> =20


