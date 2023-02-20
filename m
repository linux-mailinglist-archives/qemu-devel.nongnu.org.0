Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85669C68F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 09:28:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1Vh-0005j2-CC; Mon, 20 Feb 2023 03:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU1VL-0005ij-8V
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:26:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pU1VI-0003lP-9g
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 03:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676881590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bi93Ez8hG7qySlM7OxVvgP5bgNpEkYf+v38GGaAvIk=;
 b=VjK6Fmu+qNLe5ewAEVEziZwJhENEVesRqGsTj34ER6lQGFVpMp1oz3VIcxutyeH4nDBGLX
 ys/dTu6QrJBysbbm3yJff17DnbAaPg+6nyraXBWOvH6W/5dYqQB61QrMskIT8BZz9ab/hm
 ZDrf7cqnzGvnuQ1TQLsL6rC1R9R4eRg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-NZegOOe_OEGp4DNAsuvaPw-1; Mon, 20 Feb 2023 03:26:25 -0500
X-MC-Unique: NZegOOe_OEGp4DNAsuvaPw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C35F3C02B66;
 Mon, 20 Feb 2023 08:26:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A0A9492B03;
 Mon, 20 Feb 2023 08:26:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0938C21E6A1F; Mon, 20 Feb 2023 09:26:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org,  Beraldo Leal <bleal@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 08/10] qmp: teach 'getfd' to import sockets on win32
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-9-marcandre.lureau@redhat.com>
 <87zg9chbat.fsf@pond.sub.org>
 <CAJ+F1CJYYRzKPpDVuuX7Q0bB9M8cAO4OcD_BTeMRe7goueiUgg@mail.gmail.com>
Date: Mon, 20 Feb 2023 09:26:24 +0100
In-Reply-To: <CAJ+F1CJYYRzKPpDVuuX7Q0bB9M8cAO4OcD_BTeMRe7goueiUgg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Sat, 18 Feb 2023
 14:15:11 +0400")
Message-ID: <87zg98zqrz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi Markus
>
> On Fri, Feb 17, 2023 at 1:49 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > A process with enough capabilities can duplicate a socket to QEMU.
>> > Modify 'getfd' to import it and add it to the monitor fd list, so it c=
an
>> > be later used by other commands.
>> >
>> > Note that we actually store the SOCKET in the FD list, appropriate care
>> > must now be taken to use the correct socket functions (similar approach
>> > is taken by our io/ code and in glib, this is internal and shouldn't
>> > affect the QEMU/QMP users)
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > ---
>> >  qapi/misc.json     | 16 ++++++++--
>> >  monitor/fds.c      | 79 ++++++++++++++++++++++++++++++++++++----------
>> >  monitor/hmp-cmds.c |  6 +++-
>> >  3 files changed, 81 insertions(+), 20 deletions(-)
>> >
>> > diff --git a/qapi/misc.json b/qapi/misc.json
>> > index 27ef5a2b20..cd36d8befb 100644
>> > --- a/qapi/misc.json
>> > +++ b/qapi/misc.json
>> > @@ -249,10 +249,18 @@
>> >  ##
>> >  # @getfd:
>> >  #
>> > -# Receive a file descriptor via SCM rights and assign it a name
>> > +# On UNIX, receive a file descriptor via SCM rights and assign it a n=
ame.
>> > +#
>> > +# On Windows, (where ancillary socket fd-passing isn't an option yet)=
, add a
>> > +# socket that was duplicated to QEMU process with WSADuplicateSocketW=
() via
>> > +# WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A S=
OCKET is
>> > +# considered as a kind of "file descriptor" in QMP context, for histo=
rical
>> > +# reasons and simplicity. QEMU takes care to use socket functions app=
ropriately.
>>
>> The Windows part explains things in terms of the C socket API.  Less
>> than ideal for the QEMU QMP Reference Manual, isn't it?  I don't know
>> nearly enough about this stuff to suggest concrete improvements...
>
> We don't have to, after all we don't explain how to use sendmsg/cmsg
> stuff to pass FDs.
>
> I will drop the part about "A SOCKET is considered as a kind of "file
> descriptor" in QMP context", after we get "[PATCH 0/4] win32: do not
> mix SOCKET and fd space"
> (https://patchew.org/QEMU/20230212204942.1905959-1-marcandre.lureau@redha=
t.com/)
> merged.

Would it make sense to rebase this series on top of that one, so we
can have simpler documentation from the start?

>> What does this command do under Windows before this patch?  Fail always?
>
> Without ancillary data support on Windows, you can't make it work.

Yes, but how does it fail?  Hmm, you actually answer that below.

>> Wrap your lines a bit earlier, please.
>>
>> >  #
>> >  # @fdname: file descriptor name
>> >  #
>> > +# @wsa-info: a WSAPROTOCOL_INFOW structure (encoded in base64). Since=
 8.0.
>> > +#
>>
>> No way around passing a binary blob?
>
> WSAPROTOCOL_INFOW is a fairly big structure, with private/reserved fields,
> it contains another structure (WSAPROTOCOLCHAIN), has fixed-length arrays,
> GUID, and utf16 string.
>
> QAPI'fying that structure back and forth would be tedious and
> error-prone. Better to treat it as an opaque blob imho.

I worry about potential consequences of baking Windows ABI into QMP.

What if the memory representation of this struct changes?

Such ABI changes are unpleasant, but they are not impossible.

>> >  # Returns: Nothing on success
>> >  #
>> >  # Since: 0.14
>> > @@ -270,7 +278,11 @@
>> >  # <- { "return": {} }
>> >  #
>> >  ##
>> > -{ 'command': 'getfd', 'data': {'fdname': 'str'} }
>> > +{ 'command': 'getfd', 'data': {
>> > +    'fdname': 'str',
>> > +    '*wsa-info': {'type': 'str', 'if': 'CONFIG_WIN32'}
>> > +  }
>> > +}
>>
>> What happens when QEMU runs on a Windows host and the client doesn't
>> pass @wsa-info?
>
> It attempts to get the fd from the last recv, but it will fail on
> Windows, this is not available.

So it fails exactly like it fails on a POSIX host when you execute getfd
without passing along a file descriptor with SCM_RIGHTS.  Correct?


