Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8281841BA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 08:51:50 +0100 (CET)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCf6j-0007XO-Cu
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 03:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jCf5w-00074L-TW
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 03:51:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jCf5v-0007jx-Vi
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 03:51:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44656
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jCf5v-0007iW-SK
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 03:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584085859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HS9HuOWOHKe84T80WbF1D6/C2TPEug2GV+/9lm/uW4w=;
 b=JcPVI0WReoSE4xWNUJkLjbMPD5XVaIQiBLMhH1/TwkFmmJtThw9hAC7H93lc47EUmMs2XO
 jjmyTH03+4F9U1MJl05XPRyaVMkB6cbNkrjee+3NbcRFM3T9XQj6eWaFBnWBt62BGt1EPF
 eqQVz9/fE/qcu1f0gTi/4Eu+U11ScTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-8S4xheiBMLWRxhYonGBOWA-1; Fri, 13 Mar 2020 03:50:55 -0400
X-MC-Unique: 8S4xheiBMLWRxhYonGBOWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FFA0801E6D;
 Fri, 13 Mar 2020 07:50:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D115F5C1C3;
 Fri, 13 Mar 2020 07:50:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F75711386A6; Fri, 13 Mar 2020 08:50:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v9 02/10] scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
Date: Fri, 13 Mar 2020 08:50:45 +0100
In-Reply-To: <20200312085936.9552-3-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 12 Mar 2020 11:59:28 +0300")
Message-ID: <87eetwlmlm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

[...]
> +// Warn several Error * definitions.
> +@check1 disable optional_qualifier exists@
> +identifier fn =3D rule1.fn, local_err, local_err2;
> +@@
> +
> + fn(..., Error ** ____, ...)
> + {
> +     ...
> +     Error *local_err =3D NULL;
> +     ... when any
> +     Error *local_err2 =3D NULL;
> +     ... when any
> + }
> +
> +@ script:python @
> +fn << check1.fn;
> +@@
> +
> +print('Warning: function {} has several definitions of '
> +      'Error * local variable'.format(fn))

Printing the positions like you do in the next rule is useful when
examining these warnings.

> +
> +// Warn several propagations in control flow.
> +@check2 disable optional_qualifier exists@
> +identifier fn =3D rule1.fn;
> +symbol errp;
> +position p1, p2;
> +@@
> +
> + fn(..., Error ** ____, ...)
> + {
> +     ...
> +(
> +     error_propagate_prepend(errp, ...);@p1
> +|
> +     error_propagate(errp, ...);@p1
> +)
> +     ...
> +(
> +     error_propagate_prepend(errp, ...);@p2
> +|
> +     error_propagate(errp, ...);@p2
> +)
> +     ... when any
> + }
> +
> +@ script:python @
> +fn << check2.fn;
> +p1 << check2.p1;
> +p2 << check2.p2;
> +@@
> +
> +print('Warning: function {} propagates to errp several times in '
> +      'one control flow: at {}:{} and then at {}:{}'.format(
> +          fn, p1[0].file, p1[0].line, p2[0].file, p2[0].line))
[...]


