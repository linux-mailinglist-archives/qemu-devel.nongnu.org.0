Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA02252C58
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:20:14 +0200 (CEST)
Received: from localhost ([::1]:34476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAtTR-0001v0-VH
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kAtSj-0001PK-Ue
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kAtSi-0004uG-2q
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598440766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWSEyDmNSDDaUlzKBK2wvQJ6tZcksWU4aO220cFHDEo=;
 b=HB4tpc7NQnNsxCNndQjwkBdaf8rKF0Lz9VmK3uEJzIYnGi2Qf5c2yRb+cD3ApLH5ku6ml3
 pdSSBne8w0IRkKztqrTVXjAIVhSiGmAm2/Ja0IKK7UJciRqxzIUFRVvRfocGUb7Pvz3VYU
 eDZYaMzH6xWEEZOJ3yv9MBNZDesKSVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-CIudK8gSOvWWaFqQSRVWFg-1; Wed, 26 Aug 2020 07:19:24 -0400
X-MC-Unique: CIudK8gSOvWWaFqQSRVWFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E0E5189E606;
 Wed, 26 Aug 2020 11:19:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 434A15C1BB;
 Wed, 26 Aug 2020 11:19:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B3DBD112D737; Wed, 26 Aug 2020 13:19:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 2/6] util: refactor qemu_open_old to split off variadic
 args handling
References: <20200821172105.608752-1-berrange@redhat.com>
 <20200821172105.608752-3-berrange@redhat.com>
 <874koqdb9z.fsf@dusky.pond.sub.org>
 <20200825150349.GV107278@redhat.com>
Date: Wed, 26 Aug 2020 13:19:21 +0200
In-Reply-To: <20200825150349.GV107278@redhat.com> ("Daniel P. =?utf-8?Q?Be?=
 =?utf-8?Q?rrang=C3=A9=22's?=
 message of "Tue, 25 Aug 2020 16:03:49 +0100")
Message-ID: <877dtl7iyu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Aug 25, 2020 at 04:56:40PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > This simple refactoring prepares for future patches. The variadic args
>> > handling is split from the main bulk of the open logic. The duplicated
>> > calls to open() are removed in favour of updating the "flags" variable
>> > to have O_CLOEXEC.
>> >
>> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > ---
>> >  util/osdep.c | 40 +++++++++++++++++++++++++++-------------
>> >  1 file changed, 27 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/util/osdep.c b/util/osdep.c
>> > index 9df1b6adec..9ff92551e7 100644
>> > --- a/util/osdep.c
>> > +++ b/util/osdep.c
>> > @@ -22,6 +22,7 @@
>> >   * THE SOFTWARE.
>> >   */
>> >  #include "qemu/osdep.h"
>> > +#include "qapi/error.h"
>> > =20
>> >  /* Needed early for CONFIG_BSD etc. */
>> > =20
>> > @@ -282,10 +283,10 @@ int qemu_lock_fd_test(int fd, int64_t start, int=
64_t len, bool exclusive)
>> >  /*
>> >   * Opens a file with FD_CLOEXEC set
>> >   */
>> > -int qemu_open_old(const char *name, int flags, ...)
>> > +static int
>> > +qemu_open_internal(const char *name, int flags, mode_t mode)
>> >  {
>> >      int ret;
>> > -    int mode =3D 0;
>> > =20
>> >  #ifndef _WIN32
>> >      const char *fdset_id_str;
>> > @@ -323,22 +324,35 @@ int qemu_open_old(const char *name, int flags, .=
..)
>> >      }
>> >  #endif
>> > =20
>> > -    if (flags & O_CREAT) {
>> > -        va_list ap;
>> > -
>> > -        va_start(ap, flags);
>> > -        mode =3D va_arg(ap, int);
>> > -        va_end(ap);
>> > -    }
>> > -
>> >  #ifdef O_CLOEXEC
>> > -    ret =3D open(name, flags | O_CLOEXEC, mode);
>> > -#else
>> > +    flags |=3D O_CLOEXEC;
>> > +#endif /* O_CLOEXEC */
>> > +
>> >      ret =3D open(name, flags, mode);
>> > +
>> > +#ifndef O_CLOEXEC
>> >      if (ret >=3D 0) {
>> >          qemu_set_cloexec(ret);
>> >      }
>> > -#endif
>> > +#endif /* ! O_CLOEXEC */
>>=20
>> I dislike this part, to be honest.  I find
>>=20
>>     #ifdef O_CLOEXEC
>>         flags |=3D O_CLOEXEC;
>>     #endif /* O_CLOEXEC */
>>=20
>>         ret =3D open(name, flags, mode);
>>=20
>>     #ifndef O_CLOEXEC
>>         if (ret >=3D 0) {
>>             qemu_set_cloexec(ret);
>>         }
>>     #endif /* ! O_CLOEXEC */
>>=20
>> harder to read than
>>=20
>>     #ifdef O_CLOEXEC
>>         ret =3D open(name, flags | O_CLOEXEC, mode);
>>     #else
>>         ret =3D open(name, flags, mode);
>>         if (ret >=3D 0) {
>>             qemu_set_cloexec(ret);
>>         }
>>     #endif
>
> We're re-using 'flags' variable again in a later patch and want to
> have O_CLOEXEC present in it then too.

I guess you mean PATCH 5.  I'll get back the the issue there.


