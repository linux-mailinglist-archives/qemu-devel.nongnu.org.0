Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C10143EFF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 15:13:03 +0100 (CET)
Received: from localhost ([::1]:54854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ituH7-0007pU-Rg
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 09:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1ittLK-0005SV-9J
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:13:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1ittLG-0003nb-DD
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:13:18 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50201
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1ittLG-0003nG-9o
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579612393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIUpcovne41v9DKgRnSY3Z9ST54Nj1Ox+a4JbHvlaYM=;
 b=YOt0zCSmOTZlfcbB6exIm9CAn0CRqBAFCXKOwdq0NguB7c7YdEno4vb/XNKj4Zw4cVgasv
 yyM8ZljQvxxGpahEzSDA3T8sW5QsFjTnoshcg4BqBVkYnku9D4hxIp9BebXQoYBYTGI9nc
 Awk34wOWxn3wg7JNtaHof60/mhXa5rQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-TTxO5168OoS-X1e0LysXug-1; Tue, 21 Jan 2020 08:13:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89B6E10054E3;
 Tue, 21 Jan 2020 13:13:09 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 405E7860F2;
 Tue, 21 Jan 2020 13:13:05 +0000 (UTC)
Message-ID: <dc902f2ba314b63da7ae7a003463f9268e7b3535.camel@redhat.com>
Subject: Re: [PATCH 02/13] qcrypto-luks: implement encryption key management
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Tue, 21 Jan 2020 15:13:01 +0200
In-Reply-To: <87r1zti6r8.fsf@dusky.pond.sub.org>
References: <20200114193350.10830-1-mlevitsk@redhat.com>
 <20200114193350.10830-3-mlevitsk@redhat.com>
 <87r1zti6r8.fsf@dusky.pond.sub.org>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: TTxO5168OoS-X1e0LysXug-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-01-21 at 08:54 +0100, Markus Armbruster wrote:

<trimmed>

> > +##
> > +# @LUKSKeyslotUpdate:
> > +#
> > +# @keyslot:         If specified, will update only keyslot with this index
> > +#
> > +# @old-secret:      If specified, will only update keyslots that
> > +#                   can be opened with password which is contained in
> > +#                   QCryptoSecret with @old-secret ID
> > +#
> > +#                   If neither @keyslot nor @old-secret is specified,
> > +#                   first empty keyslot is selected for the update
> > +#
> > +# @new-secret:      The ID of a QCryptoSecret object providing a new decryption
> > +#                   key to place in all matching keyslots.
> > +#                   null/empty string erases all matching keyslots
> 
> I hate making the empty string do something completely different than a
> non-empty string.
> 
> What about making @new-secret optional, and have absent @new-secret
> erase?

I don't remember already why I and Keven Wolf decided to do this this way, but I think that you are right here.
I don't mind personally to do this this way.
empty string though is my addition, since its not possible to pass null on command line.

> 
> > +#                                                                  unless
> > +#                   last valid keyslot is erased.
> 
> Leaves me to wonder what happens when I try.  If I read your code
> correctly, it's an error.  Suggest "You cannot erase the last valid
> keyslot".
> 
> Not documented here: "Refusing to overwrite active slot".

In my current implementation, if all slots are selected for erase,
I just refuse the erase operation. In former versions of my patches,
I would instead erase all but the last one.
IMHO, its unlikely that more that one slot would have the same password,
thus anyway correct usage for replacing the password would be first add
a new slot, then erase all slots that match the old password.
If all slots are active and have the same password, then user still can
use 'force' option to overwrite one of them.

> 
> > +#
> > +# @iter-time:       number of milliseconds to spend in
> > +#                   PBKDF passphrase processing
> 
> Default?
2000, as in QCryptoBlockCreateOptionsLUKS. I forgot to copy this here.

> 
> > +# Since: 5.0
> > +##
> > +{ 'struct': 'LUKSKeyslotUpdate',
> > +  'data': {
> > +           '*keyslot': 'int',
> > +           '*old-secret': 'str',
> > +           'new-secret' : 'StrOrNull',
> > +           '*iter-time' : 'int' } }
> > +
> > +
> > +##
> > +# @QCryptoBlockAmendOptionsLUKS:
> > +#
> > +# The options that can be changed on existing luks encrypted device
> > +# @keys:           list of keyslot updates to perform
> > +#                  (updates are performed in order)
> > +# @unlock-secret:  use this secret to retrieve the current master key
> > +#                  if not given will use the same secret as one
> 
> "as the one"?
Yea, this is wrong wording, I'll drop those words. Thanks.

> 
> > +#                  that was used to open the image
> > +#
> > +# Since: 5.0
> > +##
> > +{ 'struct': 'QCryptoBlockAmendOptionsLUKS',
> > +  'data' : {
> > +            'keys': ['LUKSKeyslotUpdate'],
> > +             '*unlock-secret' : 'str' } }
> > +
> >   
> >   
> >   ##
> > @@ -324,4 +372,4 @@
> >     'base': 'QCryptoBlockOptionsBase',
> >     'discriminator': 'format',
> >     'data': {
> > -            } }
> > +          'luks': 'QCryptoBlockAmendOptionsLUKS' } }


Thanks for review,
	Best regards,
		Maxim Levitsky


