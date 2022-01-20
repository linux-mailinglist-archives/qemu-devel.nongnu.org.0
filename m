Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D6D495633
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 23:01:08 +0100 (CET)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfUR-0000ao-FH
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 17:01:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAZNQ-0002dA-2n
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:29:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAZNK-0005OO-63
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642692560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=naWz8O+3p10VDt/16pgND/SF2JTyTcMHROrc8qUdtqg=;
 b=Q+xWOkzsMsAsDFki0NNEsbhgv//5xz/jAc7FyW11GB1dZ6BqNnwOMrR/X1rkA9Vnb7NuCy
 QPxj54rwaisVKluoOGNhS4gbY7DUBpRQ0FpvMvtj09WMPI2ZXNy7r+zEAfUcL9WGarNQOR
 8mzluF2XkzTtYCfsavmHHYXRlXeb+G4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-YlhUd9RTPjK0IXlhuHbw9A-1; Thu, 20 Jan 2022 10:29:17 -0500
X-MC-Unique: YlhUd9RTPjK0IXlhuHbw9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8CD9760C4;
 Thu, 20 Jan 2022 15:29:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F8D7BB69;
 Thu, 20 Jan 2022 15:28:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF38A113303B; Thu, 20 Jan 2022 16:28:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v7 2/4] qapi/monitor: refactor set/expire_password with
 enums
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <20211021100135.4146766-3-s.reiter@proxmox.com>
 <723a3dd4-a49a-9a97-9ec6-0c270a71e359@proxmox.com>
Date: Thu, 20 Jan 2022 16:28:41 +0100
In-Reply-To: <723a3dd4-a49a-9a97-9ec6-0c270a71e359@proxmox.com> (Fabian
 Ebner's message of "Thu, 20 Jan 2022 14:32:45 +0100")
Message-ID: <87leza77fa.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> Am 21.10.21 um 12:01 schrieb Stefan Reiter:
>> 'protocol' and 'connected' are better suited as enums than as strings,
>> make use of that. No functional change intended.
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>

[...]

>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index d7567ac866..15cc19dcc5 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -9,6 +9,35 @@
>>   { 'include': 'common.json' }
>>   { 'include': 'sockets.json' }
>>   +##
>> +# @DisplayProtocol:
>> +#
>> +# Display protocols which support changing password options.
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'enum': 'DisplayProtocol',
>> +  'data': [ { 'name': 'vnc', 'if': 'CONFIG_VNC' },
>> +            { 'name': 'spice', 'if': 'CONFIG_SPICE' } ] }
>> +
>> +##
>> +# @SetPasswordAction:
>> +#
>> +# An action to take on changing a password on a connection with active clients.
>> +#
>> +# @fail: fail the command if clients are connected
>> +#
>> +# @disconnect: disconnect existing clients
>> +#
>> +# @keep: maintain existing clients
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +{ 'enum': 'SetPasswordAction',
>> +  'data': [ 'fail', 'disconnect', 'keep' ] }
>
> Since 'keep' should be the default, shouldn't it come first? I didn't
> find an explicit mention in the QAPI docs, but testing suggests that
> the first member will be picked. Is that correct?

Not quite.

An optional member @connected generates a pair of C struct members
@connected and @has_connected.

If @has_connected is true, the argument is present, and @connected is
its value.

If @has_connected is false, the argument is absent.  The input visitor
zeros @connected then.  Other code should as well, for robustness, but I
wouldn't bet my own money on it.

Putting the default value first in an enum makes it zero in C.  Instead
of

    has_connected ? connected : SET_PASSWORD_ACTION_KEEP

you can then write just

   connected

when you know absent values are zero.  Easier on the eyes.

A possible improvement to the QAPI schema language: optional members may
have a default value.  When given, we don't generate has_FOO.

> qmp_set_password still relies on has_connected to guard its checks
> here, but the next patch removes that, which AFAICT makes the default
> be 'fail' instead of keeping 'keep'. While it's only temporary
> breakage for VNC as the final patch in the series allows only 'keep'
> (still, should be avoided if possible), it does matter for SPICE.

Even temporary breakage should be avoided whenever practical.

[...]


