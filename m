Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E364F6AC5DD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:48:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZD3g-0002JK-Sx; Mon, 06 Mar 2023 10:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZD3b-0002J2-TK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:47:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZD3a-0004h9-BH
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678117640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HuR56QwkZ7Z8TdfgLr+k5sVvVyssPXBPT/6dsjPOtI=;
 b=VSlAh2qU1OcG46PsX2ulNlKNiZk4WVTqnWkaRltVP77z3JtadcT6XtOtBq7R0+wEv6zYSo
 bjivdCxvNqxtYCEIKaYE87FO5saitsQ27NOTNLUYRtBHhOBjKfZeUedHkUQCakT0Or1DLz
 low4u/IXB4ezFsNdaxo7m/MTOKjBCU4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-hzDxtPNnODyXytCpftbuDw-1; Mon, 06 Mar 2023 10:45:24 -0500
X-MC-Unique: hzDxtPNnODyXytCpftbuDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6378785CBE2;
 Mon,  6 Mar 2023 15:44:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F0C9440DF;
 Mon,  6 Mar 2023 15:44:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2077121E6A1F; Mon,  6 Mar 2023 16:44:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: marcandre.lureau@redhat.com,  qemu-devel@nongnu.org,  Thomas Huth
 <thuth@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Alex =?utf-8?Q?B?=
 =?utf-8?Q?enn=C3=A9e?=
 <alex.bennee@linaro.org>,  Michael Roth <michael.roth@amd.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Beraldo Leal
 <bleal@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH v4 06/11] monitor: release the lock before calling close()
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-7-marcandre.lureau@redhat.com>
 <87v8jdj3u3.fsf@pond.sub.org>
Date: Mon, 06 Mar 2023 16:44:24 +0100
In-Reply-To: <87v8jdj3u3.fsf@pond.sub.org> (Markus Armbruster's message of
 "Mon, 06 Mar 2023 16:29:24 +0100")
Message-ID: <874jqxj353.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Markus Armbruster <armbru@redhat.com> writes:

> marcandre.lureau@redhat.com writes:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> As per comment, presumably to avoid syscall in critical section.
>>
>> Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>>  monitor/fds.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/monitor/fds.c b/monitor/fds.c
>> index 26b39a0ce6..7daf1064e1 100644
>> --- a/monitor/fds.c
>> +++ b/monitor/fds.c
>> @@ -80,7 +80,8 @@ void qmp_getfd(const char *fdname, Error **errp)
>>          return;
>>      }
>>=20=20
>> -    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
>> +    /* See close() call below. */
>> +    qemu_mutex_lock(&cur_mon->mon_lock);
>>      QLIST_FOREACH(monfd, &cur_mon->fds, next) {
>>          if (strcmp(monfd->name, fdname) !=3D 0) {
>>              continue;
>> @@ -88,6 +89,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>>=20=20
>>          tmp_fd =3D monfd->fd;
>>          monfd->fd =3D fd;
>> +        qemu_mutex_unlock(&cur_mon->mon_lock);
>>          /* Make sure close() is outside critical section */
>>          close(tmp_fd);
>>          return;
>
> Not changed by your patch, but odd: when no fd named @fdname exists, the
> command does nothing silently.  Shouldn't it fail then?

Alex confused me.  Ignore this.

>> @@ -98,6 +100,7 @@ void qmp_getfd(const char *fdname, Error **errp)
>>      monfd->fd =3D fd;
>>=20=20
>>      QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
>> +    qemu_mutex_unlock(&cur_mon->mon_lock);
>>  }
>>=20=20
>>  void qmp_closefd(const char *fdname, Error **errp)
>
> Alex suggested a different way to do this in reply to v3 of this patch.
> Please have a look and reply there.


