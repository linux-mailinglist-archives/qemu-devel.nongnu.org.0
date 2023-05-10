Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591E6FDBC9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:35:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhA3-0003wN-NM; Wed, 10 May 2023 06:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwhA0-0003w0-Gp
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwh9y-0000Ml-Sn
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683714902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rOwDtk3KONlkARXu1re7lpbAW5asaeK6s4ie7RG484c=;
 b=h5BvUwEDCm+cwBsG3gpcuyF/1Xe/7ZGZ3ino1X1EPLbgpJd7PdzKGdF5BrsxM05nmXE14R
 XWKrreBJx2K7/aQ6XexCoWZ5OxsRuAoWBP8/dQDWFvO2AUsMdentESl4csz189tWYZPZTk
 whe+e0QZTZbjL5iK4hzjoYIA0jLNGb8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-m0rP5SzYPmac-ZIFi6lMTg-1; Wed, 10 May 2023 06:35:00 -0400
X-MC-Unique: m0rP5SzYPmac-ZIFi6lMTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8B6C3C0F68F
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 10:35:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84D274067582
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 10:35:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 363D021E6924; Wed, 10 May 2023 12:34:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: marcandre.lureau@redhat.com,  qemu-devel@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH] chardev: report the handshake error
References: <20230510072531.3937189-1-marcandre.lureau@redhat.com>
 <877ctg7csj.fsf@pond.sub.org> <ZFtmIDzlZw0/Ygtu@redhat.com>
Date: Wed, 10 May 2023 12:34:59 +0200
In-Reply-To: <ZFtmIDzlZw0/Ygtu@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 10 May 2023 10:38:40 +0100")
Message-ID: <87sfc45vak.fsf@pond.sub.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, May 10, 2023 at 11:31:40AM +0200, Markus Armbruster wrote:
>> marcandre.lureau@redhat.com writes:
>>=20
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > This can help to debug connection issues.
>> >
>> > Related to:
>> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2196182
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >  chardev/char-socket.c | 12 ++++++++++--
>> >  1 file changed, 10 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> > index 8c58532171..e8e3a743d5 100644
>> > --- a/chardev/char-socket.c
>> > +++ b/chardev/char-socket.c
>> > @@ -742,8 +742,12 @@ static void tcp_chr_websock_handshake(QIOTask *ta=
sk, gpointer user_data)
>> >  {
>> >      Chardev *chr =3D user_data;
>> >      SocketChardev *s =3D user_data;
>> > +    Error *err =3D NULL;
>> >=20=20
>> > -    if (qio_task_propagate_error(task, NULL)) {
>> > +    if (qio_task_propagate_error(task, &err)) {
>> > +        error_reportf_err(err,
>> > +                          "websock handshake of character device %s f=
ailed: ",
>> > +                          chr->label);
>>=20
>> Code smell: reports an error without failing the function.
>>=20
>> Should it be a warning instead?
>
> Well it isn't a warning, this is a fatal error wrt continued use
> of the chardev
>
> Not failing the function is expected in this particular code
> pattern. These tcp_chr_(tls,websock)_handshake functions are
> callbacks that are used to handle an async operations progress.
> From the caller's POV, it doesn't matter whether there is an
> error or success. It is upto this function to do whatever is
> required based on the status, hence the call to disconnect
> the chardev on error:
>
>> >          tcp_chr_disconnect(chr);

Can this asynchronous task be started from QMP?

If yes, how is this error reported back to the QMP client?

[...]


