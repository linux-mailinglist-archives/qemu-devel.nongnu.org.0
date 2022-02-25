Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103404C4521
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:01:20 +0100 (CET)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNaDm-0006kT-Hd
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:01:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nNZyF-0006Ul-4w
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nNZyA-00047N-1a
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645793107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5TxCZ6kNCjbjcEjPnm3d0e/CQ32F8HR7SlwSW1hx5s=;
 b=GgayxYYBUgwHjgtnHOhZPOjrJnFwYWnPIrvhcoksifi1Gq2ZioBKNL1hOBAQow74QfZrmZ
 4bLFbk7wiRpPOG96bFmBZ+oSAxPNMdjhD0m17sXD+9l4wdYWL6j4pzr7cTJoFMsncgJl0k
 4ypDq6osAtj1ivqpQeTl2GIhYx+f+nI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-7pvYzQN2NjuswNQu6cWAZQ-1; Fri, 25 Feb 2022 07:45:04 -0500
X-MC-Unique: 7pvYzQN2NjuswNQu6cWAZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BC0051D5;
 Fri, 25 Feb 2022 12:45:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28BBF79901;
 Fri, 25 Feb 2022 12:44:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6FCDC21E6A00; Fri, 25 Feb 2022 13:44:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v9 3/3] qapi/monitor: allow VNC display id in
 set/expire_password
References: <20220225084949.35746-1-f.ebner@proxmox.com>
 <20220225084949.35746-4-f.ebner@proxmox.com>
 <874k4nkwmb.fsf@pond.sub.org>
 <39e1b9b4-d82b-4efc-2a5d-9ce904ecbffe@proxmox.com>
Date: Fri, 25 Feb 2022 13:44:39 +0100
In-Reply-To: <39e1b9b4-d82b-4efc-2a5d-9ce904ecbffe@proxmox.com> (Fabian
 Ebner's message of "Fri, 25 Feb 2022 13:23:00 +0100")
Message-ID: <87wnhjjetk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> Am 25.02.22 um 12:34 schrieb Markus Armbruster:
>> Fabian Ebner <f.ebner@proxmox.com> writes:
>>=20
>>> From: Stefan Reiter <s.reiter@proxmox.com>
>>>
>>> It is possible to specify more than one VNC server on the command line,
>>> either with an explicit ID or the auto-generated ones =C3=A0 la "defaul=
t",
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
>>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>>> [FE: update "Since: " from 6.2 to 7.0
>>>      make @connected a common member of @SetPasswordOptions]
>>> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>>=20
>> [...]
>>=20
>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>> index e112409211..4a13f883a3 100644
>>> --- a/qapi/ui.json
>>> +++ b/qapi/ui.json
>>> @@ -38,20 +38,47 @@
>>>    'data': [ 'keep', 'fail', 'disconnect' ] }
>>> =20
>>>  ##
>>> -# @set_password:
>>> +# @SetPasswordOptions:
>>>  #
>>> -# Sets the password of a remote display session.
>>> +# Options for set_password.
>>>  #
>>>  # @protocol: - 'vnc' to modify the VNC server password
>>>  #            - 'spice' to modify the Spice server password
>>>  #
>>>  # @password: the new password
>>>  #
>>> -# @connected: how to handle existing clients when changing the
>>> -#             password.  If nothing is specified, defaults to 'keep'
>>> -#             'fail' to fail the command if clients are connected
>>> -#             'disconnect' to disconnect existing clients
>>> -#             'keep' to maintain existing clients
>>> +# @connected: How to handle existing clients when changing the
>>> +#             password. If nothing is specified, defaults to 'keep'.
>>> +#             For VNC, only 'keep' is currently implemented.
>>> +#
>>> +# Since: 7.0
>>> +#
>>> +##
>>> +{ 'union': 'SetPasswordOptions',
>>> +  'base': { 'protocol': 'DisplayProtocol',
>>> +            'password': 'str',
>>> +            '*connected': 'SetPasswordAction' },
>>> +  'discriminator': 'protocol',
>>> +  'data': { 'vnc': 'SetPasswordOptionsVnc' } }
>>> +
>>> +##
>>> +# @SetPasswordOptionsVnc:
>>> +#
>>> +# Options for set_password specific to the VNC procotol.
>>> +#
>>> +# @display: The id of the display where the password should be changed=
.
>>> +#           Defaults to the first.
>>=20
>> Is this default equivalent to any value?  "The first" suggests it's not.
>>=20
>
> The value will be NULL and QTAILQ_FIRST(&vnc_displays) is picked, which
> means the display defaults to the first display. But yeah, the value
> doesn't actually default to the id of the first display, it just behaves
> as if it did.

QAPI lets you give "absent" a meaning different from any value (because
it lets you distinguish "absent" from any value).  I prefer not to make
use of it.  But it's not wrong.  My Acked-by stands.


