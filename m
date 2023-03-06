Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609636AC58C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:36:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCsq-0008Hn-8w; Mon, 06 Mar 2023 10:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZCsn-0007vz-QL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:36:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZCsl-0002bL-Rb
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678116971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cmaqt+PQ2zxo3qqmkJ9We836SEQ6j65dr1YeDYFn2lk=;
 b=AQ4NUevIRoBjQHnX7BeFJsUr8ofKo+aghQFgBL5VObwGVsPh+TwCtPWNgC29RUhbVPvB1P
 O35GrSoSDKQzeafXuu1FJzLHsE5052EbZbCahahb3S6DpwyI3kFRcBEn8fGymawRMvAUx8
 X5BqfYDlye01ZjjmZYLiHJmqRrLnkKk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-IwVse5sIOlyHAQAEnXhrcg-1; Mon, 06 Mar 2023 10:36:08 -0500
X-MC-Unique: IwVse5sIOlyHAQAEnXhrcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDD043C21C37;
 Mon,  6 Mar 2023 15:36:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C95452166B2B;
 Mon,  6 Mar 2023 15:36:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 83F4321E6A1F; Mon,  6 Mar 2023 16:35:59 +0100 (CET)
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
Date: Mon, 06 Mar 2023 16:35:59 +0100
In-Reply-To: <87ttz3bi8q.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Thu, 02 Mar 2023 09:34:15 +0000")
Message-ID: <87jzztj3j4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Marc-Andr=C3=A9 is patching qmp_getfd(), not qmp_closefd().

>   {
>       Monitor *cur_mon =3D monitor_cur();
>       mon_fd_t *monfd;
>       int tmp_fd =3D -1;
>
>       WITH_QEMU_LOCK_GUARD(&cur_mon->mon_lock) {
>           QLIST_FOREACH(monfd, &cur_mon->fds, next) {
>               if (strcmp(monfd->name, fdname) !=3D 0) {
>                   continue;
>               }
>
>               QLIST_REMOVE(monfd, next);
>               tmp_fd =3D monfd->fd;
>               g_free(monfd->name);
>               g_free(monfd);
>               break;
>           }
>       }
>
>       if (tmp_fd > 0) {
>           /* close() must be outside critical section */
>           close(tmp_fd);
>       } else {
>           error_setg(errp, "File descriptor named '%s' not found", fdname=
);
>       }
>   }
>
> To my mind it makes it easier to reason about locking but I probably
> have an irrational aversion to multiple exit paths for locks.


