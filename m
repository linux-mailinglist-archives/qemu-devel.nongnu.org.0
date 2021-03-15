Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FC33BBDB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:26:36 +0100 (CET)
Received: from localhost ([::1]:43692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoB1-00084p-LC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLo9m-0007T7-Na
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lLo9k-0004ic-SB
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615818316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0yVY8V3gSm3iir+JcGhZB643zJTdTTEGzg02FHczpk=;
 b=BwIkHyXFIChbtPzXnN/veaZxl1filj1RqK0PfPjxqw8SuybOYv7tupnZTh7QLHaouPkZxW
 f92XXxH+8WoQhxK9KBOLQ7OmzjF/YHu+5CDNra2HQXHsHR0umQM7jOiNyew8PeLwvOytdG
 /9PJ/kqvM5aEb6oVc+rIggGxRM1rN1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-zTVpRko3PXSCbrTNQWJWQQ-1; Mon, 15 Mar 2021 10:25:12 -0400
X-MC-Unique: zTVpRko3PXSCbrTNQWJWQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3180018460E0;
 Mon, 15 Mar 2021 14:25:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3C2A5D9D3;
 Mon, 15 Mar 2021 14:25:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7171D1132C12; Mon, 15 Mar 2021 15:25:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 2/2] util/compatfd.c: Replaced a malloc call with g_malloc.
References: <20210315105814.5188-1-ma.mandourr@gmail.com>
 <20210315105814.5188-3-ma.mandourr@gmail.com>
 <210a44d9-ab4c-5863-1556-d5a7c368adc2@redhat.com>
 <CAD-LL6g9Aha-PZpBPiNK09JkDavL0dM8cwKzcysj2MUxwQQ6Mg@mail.gmail.com>
Date: Mon, 15 Mar 2021 15:25:09 +0100
In-Reply-To: <CAD-LL6g9Aha-PZpBPiNK09JkDavL0dM8cwKzcysj2MUxwQQ6Mg@mail.gmail.com>
 (Mahmoud Mandour's message of "Mon, 15 Mar 2021 13:30:56 +0200")
Message-ID: <87im5sfq9m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mahmoud, it's generally a good idea to cc: people who commented on a
previous iteration of the same patch.  In this case, Thomas.  I'm doing
that for you now.

Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> On Mon, Mar 15, 2021 at 1:13 PM Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com>
> wrote:
>
>> Hi Mahmoud,
>>
>> On 3/15/21 11:58 AM, Mahmoud Mandour wrote:
>> > Replaced a call to malloc() and its respective call to free()
>> > with g_malloc() and g_free().
>> >
>> > g_malloc() is preferred more than g_try_* functions, which
>> > return NULL on error, when the size of the requested
>> > allocation  is small. This is because allocating few
>> > bytes should not be a problem in a healthy system.
>> > Otherwise, the system is already in a critical state.
>> >
>> > Subsequently, removed NULL-checking after g_malloc().
>> >
>> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>> > ---
>> >  util/compatfd.c | 8 ++------
>> >  1 file changed, 2 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/util/compatfd.c b/util/compatfd.c
>> > index 174f394533..a8ec525c6c 100644
>> > --- a/util/compatfd.c
>> > +++ b/util/compatfd.c
>> > @@ -72,14 +72,10 @@ static int qemu_signalfd_compat(const sigset_t *ma=
sk)
>> >      QemuThread thread;
>> >      int fds[2];
>> >
>> > -    info =3D malloc(sizeof(*info));
>> > -    if (info =3D=3D NULL) {
>> > -        errno =3D ENOMEM;
>> > -        return -1;
>> > -    }
>> > +    info =3D g_malloc(sizeof(*info));
>>
>> Watch out...
>>
>> https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html
>>
>>   If any call to allocate memory using functions g_new(), g_new0(),
>>   g_renew(), g_malloc(), g_malloc0(), g_malloc0_n(), g_realloc(),
>>   and g_realloc_n() fails, the application is terminated.
>>
>> So with your change instead of handling ENOMEM the QEMU process is
>> simply killed.
>>
>> Don't you want to use g_try_new(struct sigfd_compat_info, 1) here
>> instead?
>>
>> >
>> >      if (pipe(fds) =3D=3D -1) {
>> > -        free(info);
>> > +        g_free(info);
>> >          return -1;
>> >      }
>> >
>> >
>>
>>
> Hello Mr. Philippe,
>
> That's originally what I did and I sent a patch that uses a g_try_*
> variant, and was
> instructed by Mr. Thomas Huth that it was better to use g_malloc instead
> because this is a small allocation and the process is better killed if su=
ch
> an allocation fails because the system is already in a very critical stat=
e
> if it does not handle a small allocation well.

You even explained this in the commit message.  Appreciated.

> You can find Mr. Thomas reply to my previous patch here:
> Re: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib's variant
> (gnu.org)
> <https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05067.html>
>
> You can instruct me on what to do further.

I figure this patch is fine.  Thomas?


