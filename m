Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6431156A2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 18:40:07 +0100 (CET)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idHaI-00064X-1S
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 12:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1idFrF-0004le-VC
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:49:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1idFrE-0002Rv-MS
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:49:29 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39997
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1idFrE-0002Qg-G0
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575647367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YS4gCNU8emS1GDlvJh6nFStWPdluqDPtOYpzcgiqm6I=;
 b=SvE8rFdXCh6pDS55SBeOHsByFEm/tBj+hR1aNuJn5AginqyLAI0VVAvB5ZwCzPpBrBi21d
 4Ld5mtzv0dmN823S69ZaNSPJ3L9PIVuUY8z46JDR0+XRKQTEBT26I+IpMf0Z+9bseJ8y+j
 rHKaGD5iv7HbSRgxVGwtbTpa0iIlMLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-EmNUj4VTM-2lj8OkNNXAKQ-1; Fri, 06 Dec 2019 10:49:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 176E5DBBB;
 Fri,  6 Dec 2019 15:49:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC0EB5C1C3;
 Fri,  6 Dec 2019 15:49:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 697941138606; Fri,  6 Dec 2019 16:49:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v8 03/21] error: make Error **errp const where it is
 appropriate
References: <20191205174635.18758-1-vsementsov@virtuozzo.com>
 <20191205174635.18758-4-vsementsov@virtuozzo.com>
Date: Fri, 06 Dec 2019 16:49:22 +0100
In-Reply-To: <20191205174635.18758-4-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 5 Dec 2019 20:46:17 +0300")
Message-ID: <87fthxcv3x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: EmNUj4VTM-2lj8OkNNXAKQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Mostly, Error ** is for returning error from the function, so the
> callee sets it. However these three functions get already filled errp
> parameter. They dont change the pointer itself, only change the
> internal state of referenced Error object. So we can make it
> Error *const * errp, to stress the behavior. It will also help
> coccinelle script (in future) to distinguish such cases from common
> errp usage.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


