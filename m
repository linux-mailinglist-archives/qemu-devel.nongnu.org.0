Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCBC1757FF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 11:09:31 +0100 (CET)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8i0w-0002QS-JQ
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 05:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j8i02-0001QE-2E
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:08:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j8i00-0008PK-I0
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:08:33 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42576
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j8i00-0008OB-9t
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583143711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKyWxaWmo3/HTOCxBoIbTYCYfIRqxME1LdqtWZRU/Xc=;
 b=HNivVMAZR1IrkoOkWWxh/7RNWmoljIu5JKlNITh6jIMmrzdlR9RCvwJgx8IU7J959OIUuD
 Ac9ikKqdYoPaq7vKqB5vwCBB/9I0PTkp3bqy3VMBg1NoxArEArn9Nq1LQYUI9qbVDbWjsP
 0CjxqWEfEYZpAo0j7pZiLTBliTG1FDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-j8ig-wLGOLmNwMZ-ggsrHg-1; Mon, 02 Mar 2020 05:08:28 -0500
X-MC-Unique: j8ig-wLGOLmNwMZ-ggsrHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C9E38010F7;
 Mon,  2 Mar 2020 10:08:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB3AF9051B;
 Mon,  2 Mar 2020 10:08:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 443FF11386A6; Mon,  2 Mar 2020 11:08:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/4] misc: Improve error reporting on Windows
References: <20200228100726.8414-1-philmd@redhat.com>
Date: Mon, 02 Mar 2020 11:08:23 +0100
In-Reply-To: <20200228100726.8414-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 28 Feb 2020 11:07:22
 +0100")
Message-ID: <871rqbax2g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?B?VG9tw6HFoSBHb2xlbWJp?= =?utf-8?B?b3Zza8O9?= <tgolembi@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Few patches to improve bug reports on Windows.
> (i.e. https://bugs.launchpad.net/qemu/+bug/1657841)

Queued, thanks!


