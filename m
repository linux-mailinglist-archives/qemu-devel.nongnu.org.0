Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DE01B4937
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 17:54:30 +0200 (CEST)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRHhl-0008Qd-QX
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 11:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jRHe8-0005Hn-0e
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 11:50:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jRHe6-0002P7-K6
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 11:50:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50147
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jRHe6-0002LJ-5u
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 11:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587570640;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeocPWnoUecVKSU2mpoeBgxiNe1VFqH34X1iR+W941g=;
 b=U31XYpnJL3yY7WYkusjgVnAhxRA1VbBgfJCFDGfPG101kHN7O3g23qK+A4EVFtnm4PyJ16
 mTFPy/E8afGuVWnLonZ1LPw2jMZyQlsUQeGGxyMfe/3Znev+IDrNlYSMC17EEwzNqHy38f
 9DtcCW62FvChEhWw+SVyfUiqegXXoIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-1WnXrZGFN5eEUuiRoT-hYQ-1; Wed, 22 Apr 2020 11:50:38 -0400
X-MC-Unique: 1WnXrZGFN5eEUuiRoT-hYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E9983DB37;
 Wed, 22 Apr 2020 15:50:37 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6DD05D710;
 Wed, 22 Apr 2020 15:50:36 +0000 (UTC)
Date: Wed, 22 Apr 2020 16:50:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexey Krasikov <alex-krasikov@yandex-team.ru>
Subject: Re: [PATCH 1/2] crypto/secret: fix inconsequential errors.
Message-ID: <20200422155034.GI587120@redhat.com>
References: <20200415201336.24195-1-alex-krasikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20200415201336.24195-1-alex-krasikov@yandex-team.ru>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 09:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 15, 2020 at 11:13:35PM +0300, Alexey Krasikov wrote:
> * change condition from QCRYPTO_SECRET_FORMAT_RAW
>   to QCRYPTO_SECRET_FORMAT_BASE64 in if-operator, because
>   this is potencial error if you add another format value.

I'll drop the bullet point.

>=20
> Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>
> ---
>  crypto/secret.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

and queued.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


