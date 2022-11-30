Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C7B63D5A4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 13:32:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0MEs-0002sN-9b; Wed, 30 Nov 2022 07:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0MEp-0002s7-I4
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 07:30:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0MEn-0003eG-MZ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 07:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669811450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nu0Zf8eZHTaZ7Lhb3ZW25vK906HRIAdRZZqIx+3HwOo=;
 b=fA1smiT1fRcxCS6G0v8qJGI6s39LeSEBN0ZgrxYilcHuncTndeHQ9vqJDy+yrtC2oVfBVZ
 vEckRO+BIQjlzkFf96EdkQ0J+E2sLjjDgJHjma7ylRzk7P1auM+xKRZKJH/E+q/StIQzc6
 dq3uQ7Vx/fKkYxP1AuissBZI/X+7daU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-r3JoLh_UM9qhRtEVzVgkLQ-1; Wed, 30 Nov 2022 07:30:47 -0500
X-MC-Unique: r3JoLh_UM9qhRtEVzVgkLQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96D5285A59D
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 12:30:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54BEC492B04;
 Wed, 30 Nov 2022 12:30:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8770421E6921; Wed, 30 Nov 2022 13:30:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Krempa <pkrempa@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Who / what uses QMP command add_client?
References: <878rjtretb.fsf@pond.sub.org> <Y4YgP+ojc+B+dkhO@redhat.com>
Date: Wed, 30 Nov 2022 13:30:43 +0100
In-Reply-To: <Y4YgP+ojc+B+dkhO@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 29 Nov 2022 15:07:43 +0000")
Message-ID: <878rjsmxos.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Nov 29, 2022 at 03:54:56PM +0100, Markus Armbruster wrote:
>> QMP command add_client's schema:
>>=20
>>     ##
>>     # @add_client:
>>     #
>>     # Allow client connections for VNC, Spice and socket based
>>     # character devices to be passed in to QEMU via SCM_RIGHTS.
>>     #
>>     # @protocol: protocol name. Valid names are "vnc", "spice", "@dbus-d=
isplay" or
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
>>=20
>> Spot the design flaw!
>>=20
>> It's overloaded @protocol.  Two issues.
>
> My bad. Can't imagine why I called its impl add_graphics_client
> but then made it work for graphics clients and chardevs all
> the way back in day 1.

We had a lot less experience with QMP interface design back then.

The obvious fix (if we want to) is to add protocol "chardev" with
additional member for the chardev's ID, and deprecate use of chardev IDs
as protocol.

Compatibility break: a chardev with ID "chardev" no longer works.

Could also use "socket" instead of "chardev"if we're confident no other
chardev type will ever be needed here.

>> One, character device IDs "vnc", "spice", "@dbus-display" don't work
>> here.  If we ever add another protocol, we make another device ID not
>> work.  Perhaps this is why Marc-Andr=C3=A9 chose "@dbus-display", which
>> otherwise looks like a typo :)
>>=20
>> Two, introspection can't tell us what protocols are supported.
>>=20
>> As far as I can tell, libvirt does not use this with character devices.
>> It does use the other three protocols.
>>=20
>> Are there any known uses with character devices?

See [*] below.

>> If not, any ideas why one would want to use the command with character
>> devices?
>
> Ordinarily a client will directly connect() to QEMU to setup the
> socket connection. Depending on the protocol this may involve both
> TLS negotiation and authentication. This is a good thing when exposed
> over a public IP address. It is tedious when connecting from a local
> client though.
>
> The idea behind the 'add_client' method was to enable short circuiting
> of encryption and authentication, for local only clients. For example,
> virt-viewer/virt-manager can do socketpair() and pass one of the FDs
> across to QEMU, and bypass any VNC authentication. This is still secure,
> as FD passing is mediated by libvirt which the app has already
> authenticated against.
>
> This is conceptually useful for any backend exposed as a network
> socket, accepting ad-hoc client connections. So it is in scope for
> chardevs, nbd, vnc, spice.

Does libvirt implement this with socket character devices?

[*] If yes, we have a known use.  Else we don't, I presume.

> I notice another flaw for chardevs though - we're ignoring thue
> 'skipauth' parameter, so we're failing to skip TLS on chardevs
> should anyone try to use this.
>
> With regards,
> Daniel


