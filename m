Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEEC63D735
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NUy-0002JH-T0; Wed, 30 Nov 2022 08:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0NUx-0002GT-4C
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:51:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0NUv-0003Fq-23
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669816295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1+yoF56ev/1Wx4CMT2HaiQXnxS6EXm2SY18e4AoHuc=;
 b=RyTgy6cJ0Ya2s5VR7dRhPyDt+le6VKlRDeZVI+rJ4dRscwy0py250PU4QDfnr7IXmgzFc1
 02kryrSUnEBGkUkowNRMmX9NRr0lvgYfrf+cVm/RMU9pc6aaF5qpuRonULk0PBlSSG7tix
 BhysoM0C68+M6egreYCf7WJc9XV94Ao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-GRT4ExmROsCFsL_CO2wdhQ-1; Wed, 30 Nov 2022 08:51:34 -0500
X-MC-Unique: GRT4ExmROsCFsL_CO2wdhQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5121185A7AB
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 13:51:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A8E9492B04;
 Wed, 30 Nov 2022 13:51:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 441E821E6921; Wed, 30 Nov 2022 14:51:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Krempa <pkrempa@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Who / what uses QMP command add_client?
References: <878rjtretb.fsf@pond.sub.org> <Y4YgP+ojc+B+dkhO@redhat.com>
 <878rjsmxos.fsf@pond.sub.org> <Y4dYjjy5m0Nyre1y@redhat.com>
Date: Wed, 30 Nov 2022 14:51:30 +0100
In-Reply-To: <Y4dYjjy5m0Nyre1y@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 30 Nov 2022 13:20:14 +0000")
Message-ID: <878rjslfdp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Nov 30, 2022 at 01:30:43PM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Tue, Nov 29, 2022 at 03:54:56PM +0100, Markus Armbruster wrote:
>> >> QMP command add_client's schema:
>> >>=20
>> >>     ##
>> >>     # @add_client:
>> >>     #
>> >>     # Allow client connections for VNC, Spice and socket based
>> >>     # character devices to be passed in to QEMU via SCM_RIGHTS.
>> >>     #
>> >>     # @protocol: protocol name. Valid names are "vnc", "spice", "@dbu=
s-display" or
>> >>     #            the name of a character device (eg. from -chardev id=
=3DXXXX)
>> >>     #
>> >>     # @fdname: file descriptor name previously passed via 'getfd' com=
mand
>> >>     #
>> >>     # @skipauth: whether to skip authentication. Only applies
>> >>     #            to "vnc" and "spice" protocols
>> >>     #
>> >>     # @tls: whether to perform TLS. Only applies to the "spice"
>> >>     #       protocol
>> >>     #
>> >>     # Returns: nothing on success.
>> >>     #
>> >>     # Since: 0.14
>> >>     #
>> >>     # Example:
>> >>     #
>> >>     # -> { "execute": "add_client", "arguments": { "protocol": "vnc",
>> >>     #                                              "fdname": "myclien=
t" } }
>> >>     # <- { "return": {} }
>> >>     #
>> >>     ##
>> >>     { 'command': 'add_client',
>> >>       'data': { 'protocol': 'str', 'fdname': 'str', '*skipauth': 'boo=
l',
>> >>                 '*tls': 'bool' } }
>> >>=20
>> >> Spot the design flaw!
>> >>=20
>> >> It's overloaded @protocol.  Two issues.
>> >
>> > My bad. Can't imagine why I called its impl add_graphics_client
>> > but then made it work for graphics clients and chardevs all
>> > the way back in day 1.
>>=20
>> We had a lot less experience with QMP interface design back then.
>>=20
>> The obvious fix (if we want to) is to add protocol "chardev" with
>> additional member for the chardev's ID, and deprecate use of chardev IDs
>> as protocol.
>>=20
>> Compatibility break: a chardev with ID "chardev" no longer works.
>>=20
>> Could also use "socket" instead of "chardev"if we're confident no other
>> chardev type will ever be needed here.
>
> Or introduce a new 'id' field that are refer to a qdev ID, since
> we can assign IDs to VNC/SPICE server instances too, when there
> are multiple instances, and they'll be non-overlapping with
> chardev IDs ?
>
> IOW we make 'protocol' and 'id' both optional in QAPI schema, and
> declare them mutually exclusive. Deprecate 'protocol' in favour
> of 'id'. Then eventually delete 'protocol' and make 'id'
> mandatory.

This would work nicely if we had had the good sense to require IDs to be
globally unique.  As is, nothing stops you from naming one character
device, one vnc, and one spice configuration object each "foo".

Is the any appetite for fixing this?

>> >> Are there any known uses with character devices?
>>=20
>> See [*] below.
>>=20
>> >> If not, any ideas why one would want to use the command with character
>> >> devices?
>> >
>> > Ordinarily a client will directly connect() to QEMU to setup the
>> > socket connection. Depending on the protocol this may involve both
>> > TLS negotiation and authentication. This is a good thing when exposed
>> > over a public IP address. It is tedious when connecting from a local
>> > client though.
>> >
>> > The idea behind the 'add_client' method was to enable short circuiting
>> > of encryption and authentication, for local only clients. For example,
>> > virt-viewer/virt-manager can do socketpair() and pass one of the FDs
>> > across to QEMU, and bypass any VNC authentication. This is still secur=
e,
>> > as FD passing is mediated by libvirt which the app has already
>> > authenticated against.
>> >
>> > This is conceptually useful for any backend exposed as a network
>> > socket, accepting ad-hoc client connections. So it is in scope for
>> > chardevs, nbd, vnc, spice.
>>=20
>> Does libvirt implement this with socket character devices?
>
> Opps, I meant to say that libvirt only uses add_client for
> graphics devices. We've never used it for chardevs AFAICT.

Thanks!

>> [*] If yes, we have a known use.  Else we don't, I presume.

No known uses so far.

[...]


