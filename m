Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713856AC4FF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:29:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCmM-0003dw-9z; Mon, 06 Mar 2023 10:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZCmK-0003da-7k
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:29:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZCmI-0000tA-Ph
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678116570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFsCAQvvT9aAYNknfTkpUP0+NV7QROsAeZa4YsC082I=;
 b=L5PS02N4qQgcKZ0yCjOtGljT5bvANcezmfqynsWhBUjRikt1+zuVShtm5/OzmvN//TFQSw
 nyUGFVHEhRDKK0dCLtGnekNnQbd9oHj73AERmKgp1qL4T4QuW+TIAWg85kuCCkkfbeVokK
 I5Wstbn8A9AO71+0KeXB6nqq44ckNqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-dVaRPzluPKCm4Oqk8dzslQ-1; Mon, 06 Mar 2023 10:29:28 -0500
X-MC-Unique: dVaRPzluPKCm4Oqk8dzslQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DDAE800B23;
 Mon,  6 Mar 2023 15:29:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAE8FC1602A;
 Mon,  6 Mar 2023 15:29:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED3EE21E6A1F; Mon,  6 Mar 2023 16:29:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: marcandre.lureau@redhat.com,  qemu-devel@nongnu.org,  Beraldo Leal
 <bleal@redhat.com>,  Eric Blake <eblake@redhat.com>,  Stefan Weil
 <sw@weilnetz.de>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent Vivier
 <lvivier@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Markus
 Armbruster <armbru@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Thomas
 Huth <thuth@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 06/10] monitor: release the lock before calling close()
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-7-marcandre.lureau@redhat.com>
 <87ttz3bi8q.fsf@linaro.org>
Date: Mon, 06 Mar 2023 16:29:26 +0100
In-Reply-To: <87ttz3bi8q.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Thu, 02 Mar 2023 09:34:15 +0000")
Message-ID: <87ttyxj3u1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> marcandre.lureau@redhat.com writes:
>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> As per comment, presumably to avoid syscall in critical section.
>>
>> Fixes: 0210c3b39bef08 ("monitor: Use LOCK_GUARD macros")
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I know this is already merged but as an academic exercise we could have
> kept the lock guard with a little restructuring like this:
>
>   void qmp_closefd(const char *fdname, Error **errp)
>   {
>       Monitor *cur_mon =3D monitor_cur();
>       mon_fd_t *monfd;
>       int tmp_fd =3D -1;
>
>       WITH_QEMU_LOCK_GUARD(&cur_mon->mon_lock) {
>           QLIST_FOREACH(monfd, &cur_mon->fds, next) {

No need for QLIST_FOREACH_SAFE(), because ....

>               if (strcmp(monfd->name, fdname) !=3D 0) {
>                   continue;
>               }
>
>               QLIST_REMOVE(monfd, next);
>               tmp_fd =3D monfd->fd;
>               g_free(monfd->name);
>               g_free(monfd);
>               break;

... we break the loop right after modifying the list.  Correct?

>           }
>       }
>
>       if (tmp_fd > 0) {

You mean >=3D

>           /* close() must be outside critical section */
>           close(tmp_fd);
>       } else {
>           error_setg(errp, "File descriptor named '%s' not found", fdname=
);

This error is new.  See also my reply to v4 of this patch.

>       }

If we don't need the new error, we could simply

        close(tmp_fd);

unconditionally.

>   }
>
> To my mind it makes it easier to reason about locking but I probably
> have an irrational aversion to multiple exit paths for locks.

My (possibly irrational) aversion is to

    if (good) {
        do some more
    } else {
        handle error
    }

I prefer

    if (!good) {
        handle error
        bail out
    }
    do some more


