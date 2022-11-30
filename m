Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9F63D5E5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 13:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0MQp-0007xb-Fr; Wed, 30 Nov 2022 07:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0MQj-0007xH-I0
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 07:43:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0MQh-0005qX-Oo
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 07:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669812188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xK6bvWhEsKX9sMW3J4SYj3txhoWI7+pwHeMKnLvOyY=;
 b=CgrE7u3MzByQ5Nwkwa9dAkYaEujPJrecKhOws3Zrasbd1aXaWTtXoXkFRD4R5qA5lvD3SW
 C0l87et/5OBVnylcn/4cwNYODKc/wgl3wStBnYP1d8GCGLIs2mu+aqZOueSHugfcwzibTv
 sx1oRuQfShV32/o8ZHdbKDjD4R0iMsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-YfaIaOLYPayuMlzqqtNJKA-1; Wed, 30 Nov 2022 07:43:07 -0500
X-MC-Unique: YfaIaOLYPayuMlzqqtNJKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF6D0811E87
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 12:43:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DE01C15BA4;
 Wed, 30 Nov 2022 12:43:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C3B121E6921; Wed, 30 Nov 2022 13:43:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Peter
 Krempa <pkrempa@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Who / what uses QMP command add_client?
References: <878rjtretb.fsf@pond.sub.org>
 <CAMxuvawocVQ7Fva1CwA9JCO+i+A5a-_AJ+V+ivOwfKo68bREHg@mail.gmail.com>
Date: Wed, 30 Nov 2022 13:43:03 +0100
In-Reply-To: <CAMxuvawocVQ7Fva1CwA9JCO+i+A5a-_AJ+V+ivOwfKo68bREHg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 29 Nov 2022
 19:26:43 +0400")
Message-ID: <8735a0mx48.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Tue, Nov 29, 2022 at 6:55 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> QMP command add_client's schema:
>>
>>     ##
>>     # @add_client:
>>     #
>>     # Allow client connections for VNC, Spice and socket based
>>     # character devices to be passed in to QEMU via SCM_RIGHTS.
>>     #
>>     # @protocol: protocol name. Valid names are "vnc", "spice",
>> "@dbus-display" or
>>     #            the name of a character device (eg. from -chardev id=3D=
XXXX)
>>     #
>>     # @fdname: file descriptor name previously passed via 'getfd' command
>>     #
>>     # @skipauth: whether to skip authentication. Only applies
>>     #            to "vnc" and "spice" protocols
>>     #
>>     # @tls: whether to perform TLS. Only applies to the "spice"
>>     #       protocol
>>     #
>>     # Returns: nothing on success.
>>     #
>>     # Since: 0.14
>>     #
>>     # Example:
>>     #
>>     # -> { "execute": "add_client", "arguments": { "protocol": "vnc",
>>     #                                              "fdname": "myclient" =
} }
>>     # <- { "return": {} }
>>     #
>>     ##
>>     { 'command': 'add_client',
>>       'data': { 'protocol': 'str', 'fdname': 'str', '*skipauth': 'bool',
>>                 '*tls': 'bool' } }
>>
>> Spot the design flaw!
>>
>> It's overloaded @protocol.  Two issues.
>>
>> One, character device IDs "vnc", "spice", "@dbus-display" don't work
>> here.  If we ever add another protocol, we make another device ID not
>> work.  Perhaps this is why Marc-Andr=C3=A9 chose "@dbus-display", which
>> otherwise looks like a typo :)
>>
>
> That's right, I tried to avoid conflicting with chardev ID namespace. IDs
> can't start with '@'.
>
> btw, I have a few patches pending to extend add_client for windows socket=
s.
>
> I also have patches to check if fds are actually sockets, since that
> command doesn't make much sense with other fds.
>
>
>> Two, introspection can't tell us what protocols are supported.
>
> Hmm, not really a big deal I suppose. You would have both compile-time and
> run-time config. There are other means to introspect the display protocol,
> like query-vnc or query-spice. I thought I had something covering dbus as
> well, but I can't find it, I'll look at it.

Defeating introspection like this is careless design.  I agree this one
is no big deal in practice.

> Let me know if you plan to touch that command, it will likely conflict wi=
th
> my work. I plan to submit it soon after the release, but I might do it
> earlier.

I looked at the command only because I'm trying to move crap out of
monitor/.

For PCI, that's "[PATCH 00/12] pci: Move and clean up monitor command
code".

add_client is a bit awkward.  It's in qapi/misc.json and
monitor/qmp-cmds.c.  If it was only about VNC and Spice, I'd move it to
qapi/ui.json and ui/.  If it was only about socket character devices, to
qapi/char.json and char/.  But it's both.  Unless we pick one of the two
arbitrarily, it's stuck in monitor/.


