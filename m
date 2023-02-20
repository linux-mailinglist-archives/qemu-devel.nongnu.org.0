Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066969C7B3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2W7-0005Ov-7K; Mon, 20 Feb 2023 04:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU2Vr-0004go-W2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU2Vn-00083J-0H
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676885465;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V2Ajk5PsYz80osvea1e62Xj/D1S9l0K4VAh4hzlqcxo=;
 b=CHnRl3dnrKf8KMVS7yxBwQnQ2nLY2UkVFjAVhwDdJ9ABQ72g1HSFp+t1pYG/7nB1t5NQWy
 1y6d3nGQ66+E7RAvRCPGsEtJ197hiVOZ0ou40Q8XZ7H7hfuExVK8FBagFt3yxm+Y4K1cUj
 b1Dn7gigP5EiRb38zXhwvWRGToLJokA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-K7is-beBPCOIGnduDqgFcA-1; Mon, 20 Feb 2023 04:31:00 -0500
X-MC-Unique: K7is-beBPCOIGnduDqgFcA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDBD12A59559;
 Mon, 20 Feb 2023 09:30:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 234A4492B00;
 Mon, 20 Feb 2023 09:30:57 +0000 (UTC)
Date: Mon, 20 Feb 2023 09:30:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 08/10] qmp: teach 'getfd' to import sockets on win32
Message-ID: <Y/M9zgAz8r49hCPS@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-9-marcandre.lureau@redhat.com>
 <87zg9chbat.fsf@pond.sub.org>
 <CAJ+F1CJYYRzKPpDVuuX7Q0bB9M8cAO4OcD_BTeMRe7goueiUgg@mail.gmail.com>
 <87zg98zqrz.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zg98zqrz.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 20, 2023 at 09:26:24AM +0100, Markus Armbruster wrote:
> Marc-André Lureau <marcandre.lureau@gmail.com> writes:
> 
> > Hi Markus
> >
> > On Fri, Feb 17, 2023 at 1:49 PM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> marcandre.lureau@redhat.com writes:
> >>
> >> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > A process with enough capabilities can duplicate a socket to QEMU.
> >> > Modify 'getfd' to import it and add it to the monitor fd list, so it can
> >> > be later used by other commands.
> >> >
> >> > Note that we actually store the SOCKET in the FD list, appropriate care
> >> > must now be taken to use the correct socket functions (similar approach
> >> > is taken by our io/ code and in glib, this is internal and shouldn't
> >> > affect the QEMU/QMP users)
> >> >
> >> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> > ---
> >> >  qapi/misc.json     | 16 ++++++++--
> >> >  monitor/fds.c      | 79 ++++++++++++++++++++++++++++++++++++----------
> >> >  monitor/hmp-cmds.c |  6 +++-
> >> >  3 files changed, 81 insertions(+), 20 deletions(-)
> >> >
> >> > diff --git a/qapi/misc.json b/qapi/misc.json
> >> > index 27ef5a2b20..cd36d8befb 100644
> >> > --- a/qapi/misc.json
> >> > +++ b/qapi/misc.json
> >> > @@ -249,10 +249,18 @@
> >> >  ##
> >> >  # @getfd:
> >> >  #
> >> > -# Receive a file descriptor via SCM rights and assign it a name
> >> > +# On UNIX, receive a file descriptor via SCM rights and assign it a name.
> >> > +#
> >> > +# On Windows, (where ancillary socket fd-passing isn't an option yet), add a
> >> > +# socket that was duplicated to QEMU process with WSADuplicateSocketW() via
> >> > +# WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A SOCKET is
> >> > +# considered as a kind of "file descriptor" in QMP context, for historical
> >> > +# reasons and simplicity. QEMU takes care to use socket functions appropriately.
> >>
> >> The Windows part explains things in terms of the C socket API.  Less
> >> than ideal for the QEMU QMP Reference Manual, isn't it?  I don't know
> >> nearly enough about this stuff to suggest concrete improvements...
> >
> > We don't have to, after all we don't explain how to use sendmsg/cmsg
> > stuff to pass FDs.
> >
> > I will drop the part about "A SOCKET is considered as a kind of "file
> > descriptor" in QMP context", after we get "[PATCH 0/4] win32: do not
> > mix SOCKET and fd space"
> > (https://patchew.org/QEMU/20230212204942.1905959-1-marcandre.lureau@redhat.com/)
> > merged.
> 
> Would it make sense to rebase this series on top of that one, so we
> can have simpler documentation from the start?
> 
> >> What does this command do under Windows before this patch?  Fail always?
> >
> > Without ancillary data support on Windows, you can't make it work.
> 
> Yes, but how does it fail?  Hmm, you actually answer that below.
> 
> >> Wrap your lines a bit earlier, please.
> >>
> >> >  #
> >> >  # @fdname: file descriptor name
> >> >  #
> >> > +# @wsa-info: a WSAPROTOCOL_INFOW structure (encoded in base64). Since 8.0.
> >> > +#
> >>
> >> No way around passing a binary blob?
> >
> > WSAPROTOCOL_INFOW is a fairly big structure, with private/reserved fields,
> > it contains another structure (WSAPROTOCOLCHAIN), has fixed-length arrays,
> > GUID, and utf16 string.
> >
> > QAPI'fying that structure back and forth would be tedious and
> > error-prone. Better to treat it as an opaque blob imho.
> 
> I worry about potential consequences of baking Windows ABI into QMP.
> 
> What if the memory representation of this struct changes?
> 
> Such ABI changes are unpleasant, but they are not impossible.

IIUC, the Windows API aims to be append only. So any need to change
this struct would instead result in creating a new struct + new
corresponding API.

FWIW, there's also a WSAPROTOCOL_INFOA version of this struct which
has an ascii string instead of utf16 string.

I'm not especially happy about encoding a struct as a blob either,
but in this case I'm coming around to the view that it is probably
the least worst option.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


