Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E24112A20
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 12:28:47 +0100 (CET)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icSpp-0000ee-U4
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 06:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1icRI3-0003qO-CK
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:49:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1icRHp-0006wA-RL
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:49:39 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55335
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1icRHp-0006pp-L8
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575452971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDinaY1YZSTyB2irVxLQQzvXNGdwom/wvbFxh5/FZpU=;
 b=Pq3AxdR6s4drs9jOsxuvsSf4lY2gtqjBSqA9++rvv1GTzERWEdPAo9QGa5EnbBY8d7I2SM
 /0qBAGh11ky7xnpJ7orXR0f6zw6HcF+1hOiNjEMDChLuxQDHIgnN7hKirbjNfyPBccrexf
 7ccwFnyjPJjmKJjkH456JlHSSZC3CpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-2MVL-Q2nPX2gEwyfdcgyvg-1; Wed, 04 Dec 2019 04:49:28 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51D0C1005512;
 Wed,  4 Dec 2019 09:49:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B209160C80;
 Wed,  4 Dec 2019 09:49:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 43BDB1138606; Wed,  4 Dec 2019 10:49:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/18] Error handling fixes
References: <20191204093625.14836-1-armbru@redhat.com>
Date: Wed, 04 Dec 2019 10:49:19 +0100
In-Reply-To: <20191204093625.14836-1-armbru@redhat.com> (Markus Armbruster's
 message of "Wed, 4 Dec 2019 10:36:07 +0100")
Message-ID: <87y2vse7z4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 2MVL-Q2nPX2gEwyfdcgyvg-1
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Neglected to mention: I'm fine with taking care of getting the whole
series merged.  Maintainers, feel free to take "your" parts through your
tree regardless.  Whatever is left after a while I'll take through mine.


