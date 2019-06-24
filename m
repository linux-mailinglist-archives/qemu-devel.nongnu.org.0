Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2509750A13
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 13:47:59 +0200 (CEST)
Received: from localhost ([::1]:50138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfNS2-0001TW-A9
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 07:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37259)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hfNPn-00012R-Cg
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hfNPl-0007yk-NA
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:45:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47254)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hfNPl-0007tf-Gr
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:45:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 51A9687633
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 11:45:28 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66C405D717;
 Mon, 24 Jun 2019 11:45:26 +0000 (UTC)
Date: Mon, 24 Jun 2019 12:45:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190624114524.GG17698@redhat.com>
References: <20190619201050.19040-1-armbru@redhat.com>
 <20190619201050.19040-5-armbru@redhat.com>
 <6cca5383-fdd4-ab9b-d227-d2de1083d398@redhat.com>
 <87imsvs01m.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87imsvs01m.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 24 Jun 2019 11:45:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 04/17] qapi: Split qom.json and qdev.json
 off misc.json
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 24, 2019 at 01:19:33PM +0200, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
>=20
> > On 19/06/19 22:10, Markus Armbruster wrote:
> >> Move commands device-list-properties, device_add, device-del, and
> >> event DEVICE_DELETED from misc.json to new qdev.json.  qdev.json
> >> remains uncovered by MAINTAINERS, like the rest of qdev.
> >
> > qdev should be added to either QOM or machine core.  QOM would be fin=
e
> > for me as the (newly,self)-appointed maintainer.
>=20
> Awesome!  Daniel, Eduardo, any objections?
>=20
> I figure these are the files to add:
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 63390eadb5..e2cb1726dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2033,12 +2033,18 @@ M: Paolo Bonzini <pbonzini@redhat.com>
>  R: Daniel P. Berrange <berrange@redhat.com>
>  R: Eduardo Habkost <ehabkost@redhat.com>
>  S: Supported
> +F: docs/qdev-device-use.txt
> +F: hw/core/qdev*
> +F: include/hw/qdev*
> +F: include/monitor/qdev.h
>  F: include/qom/
>  X: include/qom/cpu.h
> +F: qdev-monitor.c
>  F: qom/
>  X: qom/cpu.c
>  F: tests/check-qom-interface.c
>  F: tests/check-qom-proplist.c
> +F: tests/test-qdev-global-props.c
> =20
>  QMP
>  M: Markus Armbruster <armbru@redhat.com>

For this addition

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

