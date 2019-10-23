Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CEAE1DE0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 16:16:40 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNHRH-0004Rj-Pt
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 10:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iNHNa-0002vQ-Bb
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iNHNY-0001E2-NA
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:12:49 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42523
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iNHNY-0001DZ-JM
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571839967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZ2ebUjKZQajud7UfTgfozy/oBAnurU8efG1PBEKamc=;
 b=LdMyU7IGzCofbLUjLixEx4Mj4HnlcZGy4jT2Vmvlomt+3lQjGRX4/dwARa4KaYSmGsYMcT
 oGbgBrEtUkk7OUzto/iFvNX4X3x84QD5hSzTn2mfDah1EEgC3r1+ldiLTSvG/eLPHpEYNp
 rXKXyinNoCDL8uZdNcUvfiH8oV4PQYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-_1fO1q2pMz60QzPf0CyChQ-1; Wed, 23 Oct 2019 10:12:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07C89800D49;
 Wed, 23 Oct 2019 14:12:43 +0000 (UTC)
Received: from [10.3.117.0] (ovpn-117-0.phx2.redhat.com [10.3.117.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 983B75D6D0;
 Wed, 23 Oct 2019 14:12:42 +0000 (UTC)
Subject: Re: [PATCH 3/3] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
To: Laurent Vivier <laurent@vivier.eu>, Frediano Ziglio <fziglio@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>
References: <20191023122652.2999-1-fziglio@redhat.com>
 <20191023122652.2999-3-fziglio@redhat.com>
 <5f20705e-60bc-08d5-8b6e-72438afabefe@vivier.eu>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c2836c58-5a3c-2356-6e94-9b2341ab2194@redhat.com>
Date: Wed, 23 Oct 2019 09:12:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <5f20705e-60bc-08d5-8b6e-72438afabefe@vivier.eu>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: _1fO1q2pMz60QzPf0CyChQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/19 8:42 AM, Laurent Vivier wrote:
> Le 23/10/2019 =C3=A0 14:26, Frediano Ziglio a =C3=A9crit=C2=A0:
>> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
>> ---
>>   util/qemu-timer.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
>> index d428fec567..094a20a05a 100644
>> --- a/util/qemu-timer.c
>> +++ b/util/qemu-timer.c
>> @@ -322,11 +322,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
>>       ms =3D DIV_ROUND_UP(ns, SCALE_MS);
>>  =20
>>       /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 =
days */
>> -    if (ms > (int64_t) INT32_MAX) {
>> -        ms =3D INT32_MAX;
>> -    }
>> -
>> -    return (int) ms;
>> +    return (int) MIN(ms, (int64_t) INT32_MAX);
>>   }

Why so many casts?  It should also work as:

return MIN(ms, INT32_MAX);

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


