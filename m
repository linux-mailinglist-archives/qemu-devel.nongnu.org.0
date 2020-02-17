Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684C160F5B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 10:54:48 +0100 (CET)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3d71-0004j5-BS
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 04:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j3d6G-0004GG-69
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 04:54:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j3d6F-0001Di-4v
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 04:54:00 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43173
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j3d6F-0001DA-17
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 04:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581933238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WdN18LpHL+qh4/SDrYozNLsqbfR4eA60cFBEZ2wXYBs=;
 b=A8E/bJQ5JrkjCCwi/LlLEPmEBK9G/4J7UlU3pa8u+4c1LrCQouC0dSS0xOh99+pZ8Ls8oR
 2dtjZ5zz/HHF8J/XRtP0Hr807Y2pwjGiRyVMsWfGC/7xTk7ztW8GDA1yEHdBrI2N7wowpD
 7lR78xcCYmD19jIYhTmUBIaAbeAntuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-ZpLdc9pnOyapPsAUietKMA-1; Mon, 17 Feb 2020 04:53:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5297B800D50;
 Mon, 17 Feb 2020 09:53:55 +0000 (UTC)
Received: from [10.72.12.250] (ovpn-12-250.pek2.redhat.com [10.72.12.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 707398DC1E;
 Mon, 17 Feb 2020 09:53:53 +0000 (UTC)
Subject: Re: QEMU Sockets Networking Backend Multicast Networking Fix
To: Markus Armbruster <armbru@redhat.com>,
 Faisal Al-Humaimidi <falhumai96@gmail.com>
References: <CAMx8kb2aJ2OOHx6GG9qmXOoSXdQrzQ9+fsK=JR7pM-bJA4QOzg@mail.gmail.com>
 <87mu9knnhn.fsf@dusky.pond.sub.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <968ea798-aedc-7bb3-e2ed-ee8fe9c0aeab@redhat.com>
Date: Mon, 17 Feb 2020 17:53:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87mu9knnhn.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ZpLdc9pnOyapPsAUietKMA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/2/15 =E4=B8=8B=E5=8D=886:39, Markus Armbruster wrote:
> Jason, please have a look.
>
> Faisal Al-Humaimidi <falhumai96@gmail.com> writes:
>
>> Hello QEMU developers,
>>
>> I have noticed a bug in the `mcast` option of the `socket` networking
>> backend, where I simply cannot join a multicast group (tested in Windows=
 10
>> with QEMU 4.2.0 release). I have found a fix to the problem. The problem
>> was mainly due to the fact that QEMU was binding to the multicast addres=
s,
>> and not the local address or the default INADDR_ANY (0.0.0.0) if no loca=
l
>> address is used.
>>
>> Here's the patch text (as well as attached with this email), that outlin=
es
>> my fix:
>>
>> ```
>> diff -uarN qemu-4.2.0.original/net/socket.c qemu-4.2.0.modified/net/sock=
et.c
>> --- qemu-4.2.0.original/net/socket.c 2019-12-12 10:20:48.000000000 -0800
>> +++ qemu-4.2.0.modified/net/socket.c 2020-02-14 10:30:16.395973453 -0800
>> @@ -253,6 +253,15 @@
>>           goto fail;
>>       }
>>
>> +    /* Preserve the multicast address, and bind to a non-multicast grou=
p
>> (e.g. a
>> +     * local address).
>> +     */
>> +    struct in_addr group_addr =3D mcastaddr->sin_addr;
>> +    if (localaddr) {
>> +        mcastaddr->sin_addr =3D *localaddr;
>> +    } else {
>> +        mcastaddr->sin_addr.s_addr =3D htonl(INADDR_ANY);
>> +    }
>>       ret =3D bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr))=
;


This looks wrong, AFAIK the local address should be added through=20
IP_ADD_MEMBERSHIP which is already handled in this function I believe.

Thanks


>>       if (ret < 0) {
>>           error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
>> @@ -260,7 +269,10 @@
>>           goto fail;
>>       }
>>
>> -    /* Add host to multicast group */
>> +    /* Restore the multicast address. */
>> +    mcastaddr->sin_addr =3D group_addr;
>> +
>> +    /* Add host to multicast group. */
>>       imr.imr_multiaddr =3D mcastaddr->sin_addr;
>>       if (localaddr) {
>>           imr.imr_interface =3D *localaddr;
>> @@ -277,7 +289,7 @@
>>           goto fail;
>>       }
>>
>> -    /* Force mcast msgs to loopback (eg. several QEMUs in same host */
>> +    /* Force mcast msgs to loopback (eg. several QEMUs in same host). *=
/
>>       loop =3D 1;
>>       ret =3D qemu_setsockopt(fd, IPPROTO_IP, IP_MULTICAST_LOOP,
>>                             &loop, sizeof(loop));
>> @@ -287,7 +299,7 @@
>>           goto fail;
>>       }
>>
>> -    /* If a bind address is given, only send packets from that address =
*/
>> +    /* If a bind address is given, only send packets from that address.=
 */
>>       if (localaddr !=3D NULL) {
>>           ret =3D qemu_setsockopt(fd, IPPROTO_IP, IP_MULTICAST_IF,
>>                                 localaddr, sizeof(*localaddr));
>> ```
>>
>> Regards,
>> Faisal Al-Humaimidi
>


