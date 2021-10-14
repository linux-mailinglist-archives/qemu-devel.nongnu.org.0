Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1B042D3E8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 09:39:18 +0200 (CEST)
Received: from localhost ([::1]:52274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mavKf-0005SE-FT
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 03:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mavI2-0001aB-83
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mavHw-0002KY-OO
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634196986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N68fdT2VO5sflWRko4AgvnsdfULFyokgbeTdKHPATss=;
 b=JexAd8Cg31ANKnWnb4lr6JobZSX5Bd+wjPCghvcodlBMu3fATLJICCJokIh9Vp3XDJS/Tp
 8XEF7JDwBhy2GD7DHyuBD79Xgz6HsPTVqIm4NbtW2ggzt061gudd8ioSSG4G335+AKdudI
 8c1VIWlVFBE7nhm1hIZ4kK2JUtxewAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-R0lVrnqUNfW7ONz2E-Tdqw-1; Thu, 14 Oct 2021 03:36:23 -0400
X-MC-Unique: R0lVrnqUNfW7ONz2E-Tdqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC7210144F5;
 Thu, 14 Oct 2021 07:36:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EEA0694B4;
 Thu, 14 Oct 2021 07:36:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 093BD11380A7; Thu, 14 Oct 2021 09:14:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v4 2/2] monitor: refactor set/expire_password and allow
 VNC display id
References: <20210928090326.1056010-1-s.reiter@proxmox.com>
 <20210928090326.1056010-3-s.reiter@proxmox.com>
 <87zgrebnod.fsf@dusky.pond.sub.org>
 <69473cd0-b01b-a189-e4e8-fcb02738b7b1@proxmox.com>
Date: Thu, 14 Oct 2021 09:14:04 +0200
In-Reply-To: <69473cd0-b01b-a189-e4e8-fcb02738b7b1@proxmox.com> (Stefan
 Reiter's message of "Wed, 13 Oct 2021 18:09:21 +0200")
Message-ID: <87bl3skrib.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> On 10/12/21 11:24 AM, Markus Armbruster wrote:
>> Stefan Reiter <s.reiter@proxmox.com> writes:
>>=20
>>> It is possible to specify more than one VNC server on the command line,
>>> either with an explicit ID or the auto-generated ones =C3=A0 "default",
>>> "vnc2", "vnc3", ...
>>>
>>> It is not possible to change the password on one of these extra VNC
>>> displays though. Fix this by adding a "display" parameter to the
>>> "set_password" and "expire_password" QMP and HMP commands.
>>>
>>> For HMP, the display is specified using the "-d" value flag.
>>>
>>> For QMP, the schema is updated to explicitly express the supported
>>> variants of the commands with protocol-discriminated unions.
>>>
>>> Suggested-by: Eric Blake <eblake@redhat.com>
>>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>>=20
>> [...]
>>=20
>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>> index d7567ac866..4244c62c30 100644
>>> --- a/qapi/ui.json
>>> +++ b/qapi/ui.json
>>> @@ -9,22 +9,23 @@
>>>   { 'include': 'common.json' }
>>>   { 'include': 'sockets.json' }
>>>  =20
>>> +##
>>> +# @DisplayProtocol:
>>> +#
>>> +# Display protocols which support changing password options.
>>> +#
>>> +# Since: 6.2
>>> +#
>>> +##
>>> +{ 'enum': 'DisplayProtocol',
>>> +  'data': [ { 'name': 'vnc', 'if': 'CONFIG_VNC' },
>>> +            { 'name': 'spice', 'if': 'CONFIG_SPICE' } ] }
>>> +
>>=20
>>=20
>>=20
>>>   ##
>>>   # @set_password:
>>>   #
>>>   # Sets the password of a remote display session.
>>>   #
>>> -# @protocol: - 'vnc' to modify the VNC server password
>>> -#            - 'spice' to modify the Spice server password
>>> -#
>>> -# @password: the new password
>>> -#
>>> -# @connected: how to handle existing clients when changing the
>>> -#             password.  If nothing is specified, defaults to 'keep'
>>> -#             'fail' to fail the command if clients are connected
>>> -#             'disconnect' to disconnect existing clients
>>> -#             'keep' to maintain existing clients
>>> -#
>>>   # Returns: - Nothing on success
>>>   #          - If Spice is not enabled, DeviceNotFound
>>>   #
>>> @@ -37,33 +38,106 @@
>>>   # <- { "return": {} }
>>>   #
>>>   ##
>>> -{ 'command': 'set_password',
>>> -  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} =
}
>>> +{ 'command': 'set_password', 'boxed': true, 'data': 'SetPasswordOption=
s' }
>>> +
>>> +##
>>> +# @SetPasswordOptions:
>>> +#
>>> +# Data required to set a new password on a display server protocol.
>>> +#
>>> +# @protocol: - 'vnc' to modify the VNC server password
>>> +#            - 'spice' to modify the Spice server password
>>> +#
>>> +# @password: the new password
>>> +#
>>> +# Since: 6.2
>>> +#
>>> +##
>>> +{ 'union': 'SetPasswordOptions',
>>> +  'base': { 'protocol': 'DisplayProtocol',
>>> +            'password': 'str' },
>>> +  'discriminator': 'protocol',
>>> +  'data': { 'vnc': 'SetPasswordOptionsVnc',
>>> +            'spice': 'SetPasswordOptionsSpice' } }
>>> +
>>> +##
>>> +# @SetPasswordAction:
>>> +#
>>> +# An action to take on changing a password on a connection with active=
 clients.
>>> +#
>>> +# @fail: fail the command if clients are connected
>>> +#
>>> +# @disconnect: disconnect existing clients
>>> +#
>>> +# @keep: maintain existing clients
>>> +#
>>> +# Since: 6.2
>>> +#
>>> +##
>>> +{ 'enum': 'SetPasswordAction',
>>> +  'data': [ 'fail', 'disconnect', 'keep' ] }
>>> +
>>> +##
>>> +# @SetPasswordActionVnc:
>>> +#
>>> +# See @SetPasswordAction. VNC only supports the keep action. 'connecti=
on'
>>> +# should just be omitted for VNC, this is kept for backwards compatibi=
lity.
>>> +#
>>> +# @keep: maintain existing clients
>>> +#
>>> +# Since: 6.2
>>> +#
>>> +##
>>> +{ 'enum': 'SetPasswordActionVnc',
>>> +  'data': [ 'keep' ] }
>>> +
>>> +##
>>> +# @SetPasswordOptionsSpice:
>>> +#
>>> +# Options for set_password specific to the VNC procotol.
>>> +#
>>> +# @connected: How to handle existing clients when changing the
>>> +#             password. If nothing is specified, defaults to 'keep'.
>>> +#
>>> +# Since: 6.2
>>> +#
>>> +##
>>> +{ 'struct': 'SetPasswordOptionsSpice',
>>> +  'data': { '*connected': 'SetPasswordAction' } }
>>> +
>>> +##
>>> +# @SetPasswordOptionsVnc:
>>> +#
>>> +# Options for set_password specific to the VNC procotol.
>>> +#
>>> +# @display: The id of the display where the password should be changed=
.
>>> +#           Defaults to the first.
>>> +#
>>> +# @connected: How to handle existing clients when changing the
>>> +#             password.
>>> +#
>>> +# Features:
>>> +# @deprecated: For VNC, @connected will always be 'keep', parameter sh=
ould be
>>> +#              omitted.
>>> +#
>>> +# Since: 6.2
>>> +#
>>> +##
>>> +{ 'struct': 'SetPasswordOptionsVnc',
>>> +  'data': { '*display': 'str',
>>> +            '*connected': { 'type': 'SetPasswordActionVnc',
>>> +                            'features': ['deprecated'] } } }
>>=20
>> Let me describe what you're doing in my own words, to make sure I got
>> both the what and the why:
>>=20
>> 1. Change @protocol and @connected from str to enum.
>>=20
>> 2. Turn the argument struct into a union tagged by @protocol, to enable
>>     3. and 4.
>>=20
>> 3. Add argument @display in branch 'vnc'.
>>=20
>> 4. Use a separate enum for @connected in each union branch, to enable 4.
>>=20
>> 5. Trim this enum in branch 'vnc' to the values that are actually
>>     supported.  Note that just one value remains, i.e. @connected is now
>>     an optional argument that can take only the default value.
>>=20
>> 6. Since such an argument is pointless, deprecate @connected in branch
>>     'vnc'.
>>=20
>> Correct?
>
> Yes.

Thanks!

>> Ignorant question: is it possible to have more than one 'spice' display?
>
> Not in terms of passwords anyway. So only one SPICE password can be set a=
t
> any time, i.e. the 'display' parameter in this function does not apply.
>
>>=20
>> Item 5. is not a compatibility break: before your patch,
>> qmp_set_password() rejects the values you drop.
>
> Yes.
>
>>=20
>> Item 5. adds another enum to the schema in return for more accurate
>> introspection and slightly simpler qmp_set_password().  I'm not sure
>> that's worthwhile.  I think we could use the same enum for both union
>> branches.
>
> I tried to avoid mixing manual parsing and declarative QAPI stuff as much
> as I could, so I moved as much as possible to QAPI. I personally like the
> extra documentation of having the separate enum.

It's a valid choice.  I'm just pointing out another valid choice.  The
difference between them will go away when we remove deprecated
@connected.  You choose :)

>> I'd split this patch into three parts: item 1., 2.+3., 4.-6., because
>> each part can stand on its own.
>
> The reason why I didn't do that initially is more to do with the C side.
> I think splitting it up as you describe would make for some awkward diffs
> on the qmp_set_password/hmp_set_password side.
>
> I can try of course.

It's a suggestion, not a demand.  I'm a compulsory patch splitter.

>                      Though I also want to have it said that I'm not a fa=
n
> of how the HMP functions have to expand so much to accommodate the QAPI
> structure in general.

Care to elaborate?

[...]


