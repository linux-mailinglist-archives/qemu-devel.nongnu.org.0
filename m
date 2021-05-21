Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1938C9CC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:09:23 +0200 (CEST)
Received: from localhost ([::1]:38308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6mA-00087b-KC
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk6ks-0006ib-F5
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:08:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk6kq-0003h5-4R
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621609679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jSLys7LpiidKYzzc8Ncg3VQ/8uCJ2YHWe8ImY+6CuI=;
 b=cGz4PVz747Ec3dVto6yP/+P4ucJE2RkodEZmvrgjDlp0Y6ZwiUL2yHePZ94RVW71jN57mB
 jSqV06nqycIgXhkz8+/h2romkfRTym6mX5vQj2nNtYnXMZvDPJKWjz91LSf3HK0ohIhMqq
 TJwq9bBCpghzxwMUhPAqz/KvCQQAthY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-bCNmCoHVO3qhJp5nslqxJw-1; Fri, 21 May 2021 11:07:57 -0400
X-MC-Unique: bCNmCoHVO3qhJp5nslqxJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B2C5106BB29;
 Fri, 21 May 2021 15:07:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FA2860BD8;
 Fri, 21 May 2021 15:07:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1C451113865F; Fri, 21 May 2021 17:07:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v4 8/9] qapi: make 'if' condition strings simple
 identifiers
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
 <20210517163040.2308926-9-marcandre.lureau@redhat.com>
 <871ra05m6r.fsf@dusky.pond.sub.org>
 <CAJ+F1C+st7399x7RYfW38DjQKWMFWhXq+C+x0QGkZnD23mDofw@mail.gmail.com>
Date: Fri, 21 May 2021 17:07:51 +0200
In-Reply-To: <CAJ+F1C+st7399x7RYfW38DjQKWMFWhXq+C+x0QGkZnD23mDofw@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Fri, 21 May 2021
 16:26:12 +0400")
Message-ID: <87mtso15x4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> On Fri, May 21, 2021 at 4:03 PM Markus Armbruster <armbru@redhat.com> wro=
te:

[...]

>> At this point in your series, the documentation does not yet reflect the
>> code changes you've made.  You now add another change together with a
>> doc update.  Now the docs match *no* version of the code, past, present,
>> or future.  I find this confusing.  Swap the last two patches?
>>
>> How do you feel about updating documentation before the code?
>>
>
> I thought it would be simpler to update the doc in one go as the last pat=
ch
> of this series. But if you prefer intermediary doc update, I can do that.

Updating docs along the way (so it's consistent with the code at all
times) is nice.  But sometimes updating docs just once is easier and
good enough.  Whether to do it first or last is a matter of taste.
First can be nice when it serves specification for the code patches that
follow.

However, what we have here is "none of the above": you update docs last
[PATCH 9], except for one detail, which you update together with the
code in [PATCH 8].

I suggested two possible quick fixes:

1. Swap PATCH 8 and 9.  Now you update docs for PATCH 1-7 last, in PATCH
   8 (formerly 9), and then you update code and docs in PATCH 9
   (formerly 8).

2. Move PATCH 9 to the front.  Now you update docs for PATCH 2-8
   (formerly 1-7) first, in PATCH 1 (formerly 9), and then you update
   both code and docs in PATCH 9 (formerly 8).

If you prefer another way to clean this up, go right ahead!


