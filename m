Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD334009F8
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 08:11:24 +0200 (CEST)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMOte-0004zW-Sa
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 02:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMOrX-0003hj-IQ
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 02:09:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMOrU-0002j4-AB
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 02:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630735746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5je8kmK3pp5SosMyAC5s2OriUCA/MvNT+V+JR+UlRU=;
 b=IA+ofRxoiCuDANIdUiGePqQpAI0VJbLejBmertGeyfmye0oy/qmjgIR0Ww1ZKwRyo/jF/6
 VUJNE6LqnOC/52ZcKfKeD+0MOGhs9d0CeuxQ6oAqYoGutPzhWdFma8ZabtTn+lfY5iGjGY
 ZwpOL9YUlL7dFsktnVjGmbQdwOhPDFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Mjz2KT0INkKZjx1LKSNVpA-1; Sat, 04 Sep 2021 02:09:05 -0400
X-MC-Unique: Mjz2KT0INkKZjx1LKSNVpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFD38802CBE;
 Sat,  4 Sep 2021 06:09:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11FD76091B;
 Sat,  4 Sep 2021 06:08:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9E0521138606; Sat,  4 Sep 2021 08:08:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 3/3] monitor: allow VNC related QMP and HMP commands
 to take a display ID
References: <20210901151748.1712048-1-s.reiter@proxmox.com>
 <20210901151748.1712048-4-s.reiter@proxmox.com>
 <20210903190221.6hik7knycpj6xeqs@redhat.com>
Date: Sat, 04 Sep 2021 08:08:53 +0200
In-Reply-To: <20210903190221.6hik7knycpj6xeqs@redhat.com> (Eric Blake's
 message of "Fri, 3 Sep 2021 14:02:21 -0500")
Message-ID: <87pmtorhxm.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
 Stefan Reiter <s.reiter@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Wed, Sep 01, 2021 at 05:17:48PM +0200, Stefan Reiter wrote:
>> It is possible to specify more than one VNC server on the command line,
>> either with an explicit ID or the auto-generated ones =C3=A0 la "default=
",
>> "vnc2", "vnc3", ...
>>=20
>> It is not possible to change the password on one of these extra VNC
>> displays though. Fix this by adding a "display" parameter to the
>> "set_password" and "expire_password" QMP and HMP commands.
>>=20
>> For HMP, the display is specified using the "-d" value flag.
>>=20
>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>> ---
>
> QMP review:
>
>> +++ b/qapi/ui.json
>> @@ -25,6 +25,9 @@
>>  #             'disconnect' to disconnect existing clients
>>  #             'keep' to maintain existing clients
>>  #
>> +# @display: In case of VNC, the id of the display where the password
>> +#           should be changed. Defaults to the first.
>> +#
>>  # Returns: - Nothing on success
>>  #          - If Spice is not enabled, DeviceNotFound
>>  #
>> @@ -38,7 +41,8 @@
>>  #
>>  ##
>>  { 'command': 'set_password',
>> -  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
>> +  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str',
>
> Pre-existing, but given the documentation that protocol is either
> 'vnc' or 'spice', this feels like set_password should take a
> discriminated union type with 'protocol' as an enum type,...
>
>> +           '*display': 'str'} }
>
> ...so that you only add the optional 'display' member to 'vnc'.  This
> would keep the status quo of rejecting it as invalid when protocol is
> 'spice', and make it easier to introspect that no other protocols are
> supported.
>
> Markus may have better advice on whether cleaning this up is worth it.

Changing @protocol from str to enum is straightforward, and backward
compatible.  qmp_set_password() becomes simpler (we lose a failure
mode).  If we ever add another protocol, introspection will show it.  It
also reflects CONFIG_VNC and CONFIG_SPICE, which is perhaps less useful
than it was before modularization, but still nice.  Yes, please.

Same for @connected.

We may have more 'str' parameters that should be enum elsewhere.  I'm
not demanding you hunt them down :)

Adding the new parameter only to the protocol that actually supports it
is more complicated.  Untested:

    { 'command': 'set_password', 'boxed': true,
      'data': 'SetPasswordOptions' }

    { 'union': 'SetPasswordOptions',
      'base': { 'protocol: 'PasswordProtocol',
                'connected': 'FailDisconnectKeep' },
      'discriminator': protocol',
      'data': {
          'vnc': 'SetPasswordOptionsVnc' } }

    { 'enum': 'PasswordProtocol'
      'data': [ { 'name': 'vnc', 'if': 'CONFIG_VNC' },
                { 'name': 'spice', 'if': 'CONFIG_SPICE } ] }

    { 'enum': 'FailDisconnectKeep',
      'data': [ 'fail', 'disconnect', 'keep' ] }

    { 'struct': 'SetPasswordOptionsVnc',
      'data': { '*display': 'str } }

Advangages are similar: qmp_set_password() doesn't have to reject
@display for protocols other than 'vnc', and introspection is more
accurate.  Please give it a try.

>> =20
>>  ##
>>  # @expire_password:
>> @@ -54,6 +58,9 @@
>>  #        - '+INT' where INT is the number of seconds from now (integer)
>>  #        - 'INT' where INT is the absolute time in seconds
>>  #
>> +# @display: In case of VNC, the id of the display where the password
>> +#           should be set to expire. Defaults to the first.
>> +#
>>  # Returns: - Nothing on success
>>  #          - If @protocol is 'spice' and Spice is not active, DeviceNot=
Found
>>  #
>> @@ -71,7 +78,8 @@
>>  # <- { "return": {} }
>>  #
>>  ##
>> -{ 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'st=
r'} }
>> +{ 'command': 'expire_password',
>> +  'data': {'protocol': 'str', 'time': 'str', '*display': 'str'} }
>
> This would benefit from the same treatment, if we decide to use a QAPI
> enum type and discriminated union.

Either both or neither.


