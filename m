Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F771BD486
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 08:17:37 +0200 (CEST)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTg2K-0007A1-36
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 02:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTfx3-0007Ju-FG
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 02:12:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTfx2-00035k-Ue
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 02:12:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20205
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTfx2-00035d-Gj
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 02:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588140727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fz10Ss7/nZXlUzPCdGjrH9Ql4A9kWuqCsyigRO11rC8=;
 b=eNQP7XWpFRcRkA5B0WVFDJd6x0F7OcZAIOurdtJBir5T+S69JiXxHejag1mHqmOJz1pbo7
 SvFrocBQDYcMPkWVKK3IsA/rZ1isrCszAiNdUOwnaq9m4jMPTAC33D4bZkNFM2CjEcxwQT
 xwK5jr4zyHkeZQwdcHw+hgHzDccc/EM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-QSsOnJmNN-iVTlF3UIsZVg-1; Wed, 29 Apr 2020 02:12:05 -0400
X-MC-Unique: QSsOnJmNN-iVTlF3UIsZVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0E0C107ACCD;
 Wed, 29 Apr 2020 06:12:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9506826570;
 Wed, 29 Apr 2020 06:12:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1C29C11358BC; Wed, 29 Apr 2020 08:12:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 v3 2/7] various: Use &error_abort in
 instance_init()
References: <20200413213825.15584-1-f4bug@amsat.org>
Date: Wed, 29 Apr 2020 08:12:03 +0200
In-Reply-To: <20200413213825.15584-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 13 Apr 2020 23:38:25
 +0200")
Message-ID: <87o8ravn0s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:42:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h \
>     --include-headers --keep-comments --in-place \
>     --sp-file \
>       scripts/coccinelle/use-error_abort-in-instance_init.cocci
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

This one clashes with my "[PATCH 00/17] qom: Spring cleaning".  Where
your patch replaces

    object_property_add_FOO(..., NULL);

by

    object_property_add_FOO(..., &error_abort);

mine drops the parameter outright.

Does not fully replace your patch, which touches other functions, too.


