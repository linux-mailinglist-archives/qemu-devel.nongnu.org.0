Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81F219560
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 02:55:22 +0200 (CEST)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtKqP-0004Dl-3t
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 20:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtKpS-0003mu-2R
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 20:54:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29693
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtKpQ-0002wz-Jx
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 20:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594256059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEAewR6DMBSdUpuDdRQ5n7oV+Y/XYxQ3xW5tKWXBnDw=;
 b=NrNAYuSHJR0o/bH2WOYI/iBdVjN3Zl2GMFfUhgcJRLFQyo0GseLSvG9EvWbfMXvX67EQDv
 llvb65cT52BataA7JUtihBmx2DVGW8TnJ4XWBYiZHaf8BZugoFJEUBUfqXTBuP6SlcktAj
 VrWcYPNAqEynMd/dJrHuOPEUKDUmSX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-EdVxt1oYPmuBe6xsp1aRgw-1; Wed, 08 Jul 2020 00:51:56 -0400
X-MC-Unique: EdVxt1oYPmuBe6xsp1aRgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC69A800D5C
 for <qemu-devel@nongnu.org>; Wed,  8 Jul 2020 04:51:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C9EC5D9C9;
 Wed,  8 Jul 2020 04:51:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 057FB1132FD2; Wed,  8 Jul 2020 06:51:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] chardev: don't abort on attempt to add duplicated chardev
References: <20200706182156.334207-1-marcandre.lureau@redhat.com>
Date: Wed, 08 Jul 2020 06:51:45 +0200
In-Reply-To: <20200706182156.334207-1-marcandre.lureau@redhat.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Mon, 6 Jul 2020
 22:21:56 +0400")
Message-ID: <87eepm4nj2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> This is a regression from commit
> d2623129a7dec1d3041ad1221dda1ca49c667532 ("qom: Drop parameter @errp of
> object_property_add() & friends").
>
> (qemu) chardev-add id=3Dnull,backend=3Dnull
> (qemu) chardev-add id=3Dnull,backend=3Dnull
> Unexpected error in object_property_try_add() at /home/elmarco/src/qemu/q=
om/object.c:1166:
> attempt to add duplicate property 'null' to object (type 'container')
>
> That case is currently not covered in the test suite, but will be with
> the queued patch "char: fix use-after-free with dup chardev &
> reconnect".
>

Please add

  Fixes: d2623129a7dec1d3041ad1221dda1ca49c667532

Bonus: you can then shorten the hash above for readability.

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index e3051295ac3..876e41bb592 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -998,7 +998,10 @@ static Chardev *chardev_new(const char *id, const ch=
ar *typename,
>      }
> =20
>      if (id) {
> -        object_property_add_child(get_chardevs_root(), id, obj);
> +        object_property_try_add_child(get_chardevs_root(), id, obj, &loc=
al_err);

Suggest to break this line before &local_err.

> +        if (local_err) {
> +            goto end;
> +        }
>          object_unref(obj);
>      }

Sorry for breaking this.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


