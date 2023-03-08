Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5704B6B0A21
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:56:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZuGs-00010T-Di; Wed, 08 Mar 2023 08:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZuGq-0000zO-Kg
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:55:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZuGm-0003rr-CF
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678283750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyU6mUQcrzm/fmHW4/7S3l8q2kGjZ4/y1Vp6ZjJQZNM=;
 b=Kat7O4MaCzkV3tXl6cSLEsGtLbR0zil0cqBExg7AH7j3py7yOMS3ybkHgGDWZvDmsZ0Rau
 xqysgOxSRe8WJ281tu3chlbjFZPQTt46S5FLbNW/eXLpev9W9/BysA/fEXmxfaR1NcNbBa
 mmYjQ43lBT7AAI0u75I8WuzIK6can1k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-fwOfMeSlMX6umymI5MCmtQ-1; Wed, 08 Mar 2023 08:55:44 -0500
X-MC-Unique: fwOfMeSlMX6umymI5MCmtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F6BC29A9CA0;
 Wed,  8 Mar 2023 13:55:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F8B40BC781;
 Wed,  8 Mar 2023 13:55:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 39E2621E6A1F; Wed,  8 Mar 2023 14:55:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3] qapi: give available enum values as error hint
References: <20230307145825.2544850-1-marcandre.lureau@redhat.com>
Date: Wed, 08 Mar 2023 14:55:42 +0100
In-Reply-To: <20230307145825.2544850-1-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 7 Mar 2023 18:58:25 +0400")
Message-ID: <877cvrxs81.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This allows for a more pleasant user experience.
>
> Before:
> $ ./qemu-system-x86_64 -display egl-headless,gl=3D
> qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does not =
accept value ''
>
> After:
> $ ./qemu-system-x86_64 -display egl-headless,gl=3D
> qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does not =
accept value ''
> Acceptable values are 'off', 'on', 'core', 'es'
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Nice improvement here.

Slightly ugly:

    $ qemu-system-x86_64 -nic bad
    upstream-qemu: -nic bad: Parameter 'type' does not accept value 'bad'
    Acceptable values are 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket',=
 'stream', 'dgram', 'vde', 'bridge', 'hubport', 'netmap', 'vhost-user', 'vh=
ost-vdpa'

Outright annoying:

$ upstream-qemu -object bad
upstream-qemu: -object bad: Parameter 'qom-type' does not accept value 'bad'
Acceptable values are 'authz-list', 'authz-listfile', 'authz-pam', 'authz-s=
imple', 'can-bus', 'can-host-socketcan', 'colo-compare', 'cryptodev-backend=
', 'cryptodev-backend-builtin', 'cryptodev-backend-lkcf', 'dbus-vmstate', '=
filter-buffer', 'filter-dump', 'filter-mirror', 'filter-redirector', 'filte=
r-replay', 'filter-rewriter', 'input-barrier', 'input-linux', 'iothread', '=
main-loop', 'memory-backend-epc', 'memory-backend-file', 'memory-backend-me=
mfd', 'memory-backend-ram', 'pef-guest', 'pr-manager-helper', 'qtest', 'rng=
-builtin', 'rng-egd', 'rng-random', 'secret', 'secret_keyring', 'sev-guest'=
, 'thread-context', 's390-pv-guest', 'throttle-group', 'tls-creds-anon', 't=
ls-creds-psk', 'tls-creds-x509', 'tls-cipher-suites', 'x-remote-object', 'x=
-vfio-user-server'

Note we already let users ask for this information with -object help or
-object qom-type=3Dhelp.  Sadly, we can't hint at that here, because it's
implemented much further up the call chain, and other call chains don't.

If HMP command sendkey didn't bypass the input visitor, the 26 screen
lines of hint for QKeyCode would likely scroll the error message off the
screen.

Should we suppress this hint when it's too long to be useful?


