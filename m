Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE37F440A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 10:56:29 +0100 (CET)
Received: from localhost ([::1]:51262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT10F-0008P6-VI
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 04:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iT0yn-000707-4W
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 04:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iT0ym-0008GC-5L
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 04:54:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32709
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iT0ym-0008FH-23
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 04:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573206894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOY61J28PjlrTcBZnBklMPUUTJf1MvF8ZgBRGJdTynA=;
 b=BlXB3iqBY6o951Y6FtENUzYSsT6UugkI5fI945kjxSNZR/hwm/K4cfXxEyVJ/D7nRssBG0
 cSa2aVokC1mFLEQbytH31gudYW8YJaixpyM71m64ZTve6DFpEYjjhvVGHxrhCkkB6BP8wi
 DR+iSt9EcTWwHqy6XuPA6UNlQ72mDmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-NP2DwSMdO1-6vBjb0x9kyg-1; Fri, 08 Nov 2019 04:54:53 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 619541005502
 for <qemu-devel@nongnu.org>; Fri,  8 Nov 2019 09:54:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-167.ams2.redhat.com
 [10.36.116.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73E825E1AE;
 Fri,  8 Nov 2019 09:54:25 +0000 (UTC)
Subject: Re: [PATCH 2/3] qtest: fix qtest_qmp_device_add leak
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191107192731.17330-1-marcandre.lureau@redhat.com>
 <20191107192731.17330-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fe6bbd8c-58db-1b12-0420-55f62bf81e81@redhat.com>
Date: Fri, 8 Nov 2019 10:54:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191107192731.17330-3-marcandre.lureau@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: NP2DwSMdO1-6vBjb0x9kyg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/11/2019 20.27, Marc-Andr=C3=A9 Lureau wrote:
> Spotted by ASAN.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/libqtest.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 3706bccd8d..91e9cb220c 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -1274,6 +1274,7 @@ void qtest_qmp_device_add(QTestState *qts, const ch=
ar *driver, const char *id,
>       qdict_put_str(args, "id", id);
>  =20
>       qtest_qmp_device_add_qdict(qts, driver, args);
> +    qobject_unref(args);
>   }
>  =20
>   static void device_deleted_cb(void *opaque, const char *name, QDict *da=
ta)
>=20

Fixes: b4510bb4109f5f ("tests: add qtest_qmp_device_add_qdict() helper")

Reviewed-by: Thomas Huth <thuth@redhat.com>

I can queue this via the qtest tree if nobody else wants to take it.


