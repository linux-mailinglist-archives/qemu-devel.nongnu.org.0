Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A3CFB51
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 15:29:22 +0200 (CEST)
Received: from localhost ([::1]:55624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHpYH-0001we-Qi
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 09:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iHpXK-0001Rs-VZ
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:28:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iHpXJ-0004TN-Nf
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:28:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42668)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iHpXG-0004Jb-8A; Tue, 08 Oct 2019 09:28:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7C58FA44AC3;
 Tue,  8 Oct 2019 13:28:17 +0000 (UTC)
Received: from [10.3.116.162] (ovpn-116-162.phx2.redhat.com [10.3.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25C2164020;
 Tue,  8 Oct 2019 13:28:17 +0000 (UTC)
Subject: Re: [PATCH] qemu-nbd: Document benefit of --pid-file
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20191007194840.29518-1-eblake@redhat.com>
 <20191008092448.GD1192@redhat.com>
 <04440b88-78f6-e177-924d-e16fc3c29b5c@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d4b715de-6d5d-6f43-e845-86ddc01c3eac@redhat.com>
Date: Tue, 8 Oct 2019 08:28:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <04440b88-78f6-e177-924d-e16fc3c29b5c@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Tue, 08 Oct 2019 13:28:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/19 4:40 AM, Vladimir Sementsov-Ogievskiy wrote:
> 08.10.2019 12:24, Daniel P. Berrang=C3=A9 wrote:
>> On Mon, Oct 07, 2019 at 02:48:40PM -0500, Eric Blake wrote:
>>> One benefit of --pid-file is that it is easier to probe the file
>>> system to see if a pid file has been created than it is to probe if a
>>> socket is available for connection. Document that this is an
>>> intentional feature.
>>
>> I'm not seeing how checking the pid file is better than checking
>> the socket directly ? I think it is probably actually worse.
>>
>> The main problem with the socket is that while we unlink on clean
>> shutdown, it may still exist in disk if the process has exitted
>> abnormally.
>>
>> With the pidfile though we don't ever unlink it, even on clean
>> shutdown, as we don't use the pid files existance as a mutual
>> exclusion check. We instead acquire fcntl locks on it.
>>
>> IOW the pidfile could exist already when qemu-nbd starts up and
>> will still exist when it quits.
>=20
> Good point.
>=20
> I was just a bit confused, because pid file is something unrelated to
> socket, and why use one thing to check the existence of another, if we
> can directly try to connect.

Consider the case of writing a testsuite that involves an nbd client,=20
where you want to fire up qemu-nbd as the server.  Checking for a pid=20
file in shell is easy, and can be done prior to the point of spawning a=20
client.  Checking for a successful connect is harder - the shell is not=20
the point that would actually connect, so checking if connect works=20
involves the shell actually spawning off the child process that attempts=20
the connect.  If the client itself has a retry builtin, then you don't=20
need to do anything in shell - just spawn the client with retry (at=20
which point, the client retrying on the connection is smarter than the=20
client retrying on the pid file).  But pid files are immensely useful=20
when you have a client that does not have builtin retry, and when=20
writing a testing framework where you use shell to learn whether it is=20
safe to spawn the client: rather than having to modify the client or=20
write a shell loop that respawns child attempts, you merely need a shell=20
loop probing for the pid file to exist.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

