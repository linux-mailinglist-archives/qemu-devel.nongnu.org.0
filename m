Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A23387C6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:40:45 +0100 (CET)
Received: from localhost ([::1]:39530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdLe-0005Ku-FT
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKdIB-00012A-1J
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:37:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKdI8-0002Ji-AC
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615538223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TciFQnf1uw/xq7r2EWzshJq2NtDTXa2eQBa7xH0QfVU=;
 b=cM0IFk0GIfRIQ5CRIZw0vfA+gfubU3RyxB8MCUQJlmosm7Frt7N4wHMLHby1rpZIuLCFL+
 FcpoDI4wx3tZhtF8gS+We5Nz9cbzVtxhEdJSfuHFyAfafY7VPyrJBr9zW3GHmyRVKkZ7Wn
 04NWh7y30pLBu8RWIF8HsT/hHmkWIus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170--YO05loaOSuJzCaDHvaxnA-1; Fri, 12 Mar 2021 03:37:01 -0500
X-MC-Unique: -YO05loaOSuJzCaDHvaxnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EAE2107ACCA;
 Fri, 12 Mar 2021 08:37:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E23105C234;
 Fri, 12 Mar 2021 08:36:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5B2A71132C12; Fri, 12 Mar 2021 09:36:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 47/53] scripts: Coccinelle script to use ERRP_GUARD()
References: <20200707212503.1495927-1-armbru@redhat.com>
 <20200707212503.1495927-48-armbru@redhat.com>
 <a569c1e3-401e-c6d2-128d-3a846f46440c@redhat.com>
Date: Fri, 12 Mar 2021 09:36:58 +0100
In-Reply-To: <a569c1e3-401e-c6d2-128d-3a846f46440c@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 11 Mar 2021 20:21:29
 +0100")
Message-ID: <87sg506a51.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/7/20 11:24 PM, Markus Armbruster wrote:
>> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>=20
>> Script adds ERRP_GUARD() macro invocations where appropriate and
>> does corresponding changes in code (look for details in
>> include/qapi/error.h)
>>=20
>> Usage example:
>> spatch --sp-file scripts/coccinelle/errp-guard.cocci \
>>  --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
>>  --max-width 80 FILES...
>>=20
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Message-Id: <20200707165037.1026246-3-armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> [ERRP_AUTO_PROPAGATE() renamed to ERRP_GUARD(), and
>> auto-propagated-errp.cocci to errp-guard.cocci]
>> ---
>>  scripts/coccinelle/errp-guard.cocci | 336 ++++++++++++++++++++++++++++
>>  include/qapi/error.h                |   2 +
>>  MAINTAINERS                         |   1 +
>>  3 files changed, 339 insertions(+)
>>  create mode 100644 scripts/coccinelle/errp-guard.cocci
>
> Odd, this script fails on Fedora rawhide:
>
> $ spatch --macro-file scripts/cocci-macro-file.h --sp-file
> scripts/coccinelle/errp-guard.cocci --use-gitgrep --dir .
> There is no standard.iso in /usr/lib64/coccinelle.
> Are you sure you run a properly installed version of spatch
> ?\ninit_defs_builtins: /usr/lib64/coccinelle/standard.h
> init_defs: scripts/cocci-macro-file.h
> minus: parse error:
>   File "scripts/coccinelle/errp-guard.cocci", line 54, column 5, charpos
> =3D 1899
>   around =3D '<...',
>   whole content =3D      <...

Double-checking: it fails only for this script, other scripts work?

>
> $ spatch --version
> There is no standard.iso in /usr/lib64/coccinelle.
> Are you sure you run a properly installed version of spatch ?\nspatch
> version 1.1.0-gc4cc9f6-dirty compiled with OCaml version 4.12.0
> Flags passed to the configure script: --build=3Dx86_64-redhat-linux-gnu
> --host=3Dx86_64-redhat-linux-gnu --program-prefix=3D
> --disable-dependency-tracking --prefix=3D/usr --exec-prefix=3D/usr
> --bindir=3D/usr/bin --sbindir=3D/usr/sbin --sysconfdir=3D/etc
> --datadir=3D/usr/share --includedir=3D/usr/include --libdir=3D/usr/lib64
> --libexecdir=3D/usr/libexec --localstatedir=3D/var --sharedstatedir=3D/va=
r/lib
> --mandir=3D/usr/share/man --infodir=3D/usr/share/info
> --with-python=3D/usr/bin/python3 --with-menhir=3D/usr/bin/menhir
> OCaml scripting support: yes
> Python scripting support: yes
> Syntax of regular expressions: PCRE
>
> $ ls /usr/lib64/coccinelle
> ocaml  spatch  standard.h  standard.iso


