Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25A9362E74
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 10:04:45 +0200 (CEST)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXfwa-0003IB-Al
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 04:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXfuw-0002kJ-Ea
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 04:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXfus-0002uw-U2
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 04:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618646577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPuwQCDjs7ggorWrjSMZWihT5Ey9m3bmdsr0dWOWdI0=;
 b=OjtxZeFeyodIAfm5NaWCTNKC/bC82laPLFukmHzy3721MI2wKMteLGmOCW8ICbNeRurX6u
 GWGeO5fvNyZ8WbSzv+zufoOrxBkZ/8K2POiNpPdQVtt4O6Eel82BaAmCKbZCXcZ+bsK0M7
 YAgjnZRs5ZXfrugzU5fYBvWbmjzhuiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-M0pd02VtP-WP2uUhsXHvjA-1; Sat, 17 Apr 2021 04:02:53 -0400
X-MC-Unique: M0pd02VtP-WP2uUhsXHvjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29CCB1006C80;
 Sat, 17 Apr 2021 08:02:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD9B05E1A8;
 Sat, 17 Apr 2021 08:02:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5681E113525D; Sat, 17 Apr 2021 10:02:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
 <875z0m4733.fsf@dusky.pond.sub.org>
 <CAJ+F1CKFzgp=ndDER4p4v-_uz0gf0ydzYcxtay7Zz7wwUQUueg@mail.gmail.com>
 <CAJ+F1CLW1rCV1rnxxhtAMEoVttA+nbWetbQkd7C3G16NTR2NRw@mail.gmail.com>
Date: Sat, 17 Apr 2021 10:02:50 +0200
In-Reply-To: <CAJ+F1CLW1rCV1rnxxhtAMEoVttA+nbWetbQkd7C3G16NTR2NRw@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Fri, 16 Apr 2021
 19:28:19 +0400")
Message-ID: <87blad2v9x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Li Zhang <li.zhang@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Fri, Apr 16, 2021 at 6:59 PM Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@gmail.com> wrote:
>
>> Hi
>>
>> On Fri, Apr 16, 2021 at 6:51 PM Markus Armbruster <armbru@redhat.com>
>> wrote:
>>
>>> Marc-Andr=C3=A9, I'd like your opinion for this one, in particular the =
use of
>>> g_source_remove().
>>>
>>
>> My opinion isn't really worth much, my review would have a bit more valu=
e.
>>
>> GSource has indeed some peculiar lifetime management, that I got wrong i=
n
>> the past. So I would be extra careful.
>>
>> But before spending time on review, I would also clarify the motivation
>> and ask for testing.
>>
>> Markus, hot-adding/removing monitors isn't supported?
>>
>>
> I realize you answered my question below. That's surprising me. Wouldn't =
it
> make more sense to support it rather than having a pre-opened null-based
> monitor that can have its chardev swapped?

Yes, it would.  Patches welcome.

This patch is a somewhat ham-fisted and limited solution to the problem
stated in the commit message.  However, it might *also* be a reasonable
improvement to chardev-change on its own.  Not for me to judge.

chardev-change comes with a number of restrictions.  Let's have a closer
look.  It fails

1. when no such character device exists (d'oh)

2. for chardev-mux devices

3. in record/replay mode

4. when a backend is connected that doesn't implement the chr_be_change()
   method

5. when chr_be_change() fails

6. when creating the new chardev fails[*]

Items 2, 3, 4 are restrictions.  I figure 2 and 4 are simply not
implemented, yet.  I'm not sure about 3.

Whether we want to accept patches lifting restrictions is up to the
chardev maintainers.

This patch lifts restriction 4 for QMP monitor backends.  Its monitor
part looks acceptable to me, but I dislike its code duplication.  Before
we spend time on cleaning that up (or on deciding to clean it up later),
I'd like to hear the chardev mantainers' judgement, because that's about
more serious matters than cleanliness.

Do I make sense?

[...]


[*] The code for creating the new chardev in the "no backend connected"
case

    be =3D chr->be;
    if (!be) {
        /* easy case */
        object_unparent(OBJECT(chr));
        return qmp_chardev_add(id, backend, errp);
    }

is problematic: when qmp_chardev_add() fails, we already destroyed the
old chardev.  It should destroy the old chardev only when it can create
its replacement.


