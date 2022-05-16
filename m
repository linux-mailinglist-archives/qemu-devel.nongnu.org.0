Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CAF5287D1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:01:34 +0200 (CEST)
Received: from localhost ([::1]:33632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcE1-0008UY-CV
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nqbz7-0004Qw-5M
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:46:09 -0400
Received: from mail.ispras.ru ([83.149.199.84]:55776)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nqbvq-0006qH-Nh
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:43:11 -0400
Received: from smtpclient.apple (unknown [77.37.166.174])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4B88340D403E;
 Mon, 16 May 2022 14:42:05 +0000 (UTC)
Content-Type: multipart/signed;
 boundary="Apple-Mail=_05D285F5-F33C-4E28-8CD6-49C019B726F7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] net: fix multicast support with BSD (macOS) socket
 implementations
From: Vitaly Cheptsov <cheptsov@ispras.ru>
In-Reply-To: <7B495F49-26B8-4064-A36B-0296BC740ADF@ispras.ru>
Date: Mon, 16 May 2022 17:42:04 +0300
Cc: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-Id: <6036CB16-CB7C-430D-9AC5-FA30C8FF57C5@ispras.ru>
References: <20220502003830.31062-1-cheptsov@ispras.ru>
 <YnEqYRUpnZCIBfet@redhat.com>
 <7B495F49-26B8-4064-A36B-0296BC740ADF@ispras.ru>
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_05D285F5-F33C-4E28-8CD6-49C019B726F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Gentle ping :)

> On 3 May 2022, at 19:10, Vitaly Cheptsov <cheptsov@ispras.ru> wrote:
>=20
> Hi Daniel,
>=20
> Thank you for your comment. Socket implementation on all the systems =
is rather complicated, and while I am fine to update the patch with =
better reasoning, it needs to work on macOS. Given the situation with =
Windows, I think we may want to ifdef the change to be macOS-specific.
>=20
> Other than that, perhaps, we can come to something better if you give =
some ideas what should we try. So far this was the only working =
combination, however. If you do not have the hardware, I am can perform =
these tests for you.
>=20
> To simplify the situation, I attached two minimal python scripts, =
which closely resemble QEMU actions, and allow testing bidirectional =
multicast sockets.
>=20
>> When looking in Google there's a comprehensive looking
>> description of SO_REUSEADDR + SO_REUSEPORT across all the
>> different OS which insists that SO_REUSEPORT and SO_REUSEADDR
>> are functionally equivalent for multicast IP addresses:
>>=20
>> =
https://stackoverflow.com/questions/14388706/how-do-so-reuseaddr-and-so-re=
useport-differ
>>=20
>> And AFAIK, macOS should behave the same way, which suggests
>> this patch is not needed.
>>=20
>> Oddly though, I don't find this in the FreeBSD man page - its
>> description seems fairly clear that SO_REUSEPORT is needed for
>> multicast
>>=20
>> [quote]
>> SO_REUSEPORT allows completely duplicate bindings by multiple =
processes
>> if they all set SO_REUSEPORT before binding the port. This option
>> permits multiple instances of a program to each receive UDP/IP =
multicast
>> or broadcast datagrams destined for the bound port.
>> [/quote]
>=20
> I also saw this description, and it is possible it is a little =
outdated. I can safely (entirely) drop setting SO_REUSEADDR on macOS, =
but it will not work without socket.SO_REUSEPORT. This can be easily =
proven with a.py/b.py.
>=20
>> I didn't find a quote about this in the FreeBSD man pages I looked
>> at, and it feels dubious to me. If the user gives QEMU a address to
>> bind to, we should surely be honouring that, not changing it to
>> INADDR_ANY.
>>=20
>> If using INADDR_ANY though, thsi could explain the need for
>> SO_REUSEPORT, since INADDR_ANY is not a designated mcast address.
>=20
> I made this judgement from the following part of ip(4):
>=20
>> If the IP_BINDANY option is enabled on a SOCK_STREAM, SOCK_DGRAM or a
>> SOCK_RAW socket, one can bind(2) to any address, even one not bound =
to
>> any available network interface in the system.
>=20
>=20
> This makes some sense, because if I change a.py and b.py
> - to bind to MCAST_GRP instead of =E2=80=9C0.0.0.0=E2=80=9D
> - to not set SO_REUSEPORT
>=20
> I get "Can't assign requested address=E2=80=9D error at sendto in =
b.py. Same thing happens in QEMU.
>=20
> Best regards,
> Vitaly
>=20
>=20
> # a.py
> import socket
> import struct
> import scapy.all as scapy
>=20
> MCAST_GRP =3D '230.0.0.1'
> MCAST_PORT =3D 1234
> MULTICAST_TTL =3D 2
> MAX_PACKET_SIZE =3D 65535
>=20
> sock =3D socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
> sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
> sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
> sock.bind(("0.0.0.0", MCAST_PORT))
> mreq =3D struct.pack('4sL', socket.inet_aton(MCAST_GRP), =
socket.INADDR_ANY)
> sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
>=20
> data, _ =3D sock.recvfrom(MAX_PACKET_SIZE)
> print(data)
> sock.sendto(b"message_from_a", (MCAST_GRP, MCAST_PORT))
>=20
> # b.py
> import socket
> import struct
> import scapy.all as scapy
>=20
> MCAST_GRP =3D '230.0.0.1'
> MCAST_PORT =3D 1234
> MULTICAST_TTL =3D 2
> MAX_PACKET_SIZE =3D 65535
>=20
> sock =3D socket.socket(socket.AF_INET, socket.SOCK_DGRAM, 0)
> sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
> sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
> sock.bind(("0.0.0.0", MCAST_PORT))
> mreq =3D struct.pack('4sL', socket.inet_aton(MCAST_GRP), =
socket.INADDR_ANY)
> sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
>=20
> sock.sendto(b"message_from_b", (MCAST_GRP, MCAST_PORT))
>=20
> data, _ =3D sock.recvfrom(MAX_PACKET_SIZE)
> print(data)
>=20
> data, _ =3D sock.recvfrom(MAX_PACKET_SIZE)
> print(data)
>=20
> % python3 ./a.py
> WARNING: No IPv4 address found on en2 !
> WARNING: No IPv4 address found on en1 !
> WARNING: more No IPv4 address found on p2p0 !
> b'message_from_b'
>=20
> % python3 ./b.py
> WARNING: No IPv4 address found on en2 !
> WARNING: No IPv4 address found on en1 !
> WARNING: more No IPv4 address found on p2p0 !
> b'message_from_b'
> b'message_from_a'
>=20
>> On 3 May 2022, at 16:13, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>=20
>> On Mon, May 02, 2022 at 03:38:30AM +0300, Vitaly Cheptsov wrote:
>>> This patch fixes socket communication with QEMU -> host on macOS,
>>> which was originally impossible due to QEMU and host program
>>> having to bind to the same ip/port in a way not supported by BSD
>>> sockets. The change was tested on both Linux and macOS.
>>>=20
>>> As per BSD manual pages SO_REUSEPORT allows completely duplicate
>>> bindings by multiple processes, permitting multiple instances of
>>> a program to each receive UDP/IP multicast datagrams destined
>>> for the bound port. Without this option macOS, unlike Linux,
>>> which (ab)uses SO_REUSEADDR for this purpose, will return
>>> "Address already in use" on bind().
>>=20
>>=20
>> When looking in Google there's a comprehensive looking
>> description of SO_REUSEADDR + SO_REUSEPORT across all the
>> different OS which insists that SO_REUSEPORT and SO_REUSEADDR
>> are functionally equivalent for multicast IP addresses:
>>=20
>> =
https://stackoverflow.com/questions/14388706/how-do-so-reuseaddr-and-so-re=
useport-differ
>>=20
>> And AFAIK, macOS should behave the same way, which suggests
>> this patch is not needed.
>>=20
>> Oddly though, I don't find this in the FreeBSD man page - its
>> description seems fairly clear that SO_REUSEPORT is needed for
>> multicast
>>=20
>> [quote]
>> SO_REUSEPORT allows completely duplicate bindings by multiple =
processes
>> if they all set SO_REUSEPORT before binding the port. This option
>> permits multiple instances of a program to each receive UDP/IP =
multicast
>> or broadcast datagrams destined for the bound port.
>> [/quote]
>>=20
>>=20
>>>=20
>>> As per BSD manual pages binding to any address, even one not bound
>>> to any available network interface in the system, should be
>>> IP_BINDANY. Without binding to INADDR_ANY macOS will return
>>> "Can't assign requested address" on send().
>>=20
>> I didn't find a quote about this in the FreeBSD man pages I looked
>> at, and it feels dubious to me. If the user gives QEMU a address to
>> bind to, we should surely be honouring that, not changing it to
>> INADDR_ANY.
>>=20
>> If using INADDR_ANY though, thsi could explain the need for
>> SO_REUSEPORT, since INADDR_ANY is not a designated mcast address.
>>=20
>>> Cc: Jason Wang <jasowang@redhat.com>
>>> Cc: Daniel P. Berrange <berrange@redhat.com>
>>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
>>> ---
>>> net/socket.c | 18 ++++++++++++++++--
>>> 1 file changed, 16 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/net/socket.c b/net/socket.c
>>> index ea5220a2eb..8b2c6c4bb8 100644
>>> --- a/net/socket.c
>>> +++ b/net/socket.c
>>> @@ -252,10 +252,24 @@ static int net_socket_mcast_create(struct =
sockaddr_in *mcastaddr,
>>> goto fail;
>>> }
>>>=20
>>> - ret =3D bind(fd, (struct sockaddr *)mcastaddr, =
sizeof(*mcastaddr));
>>> + val =3D 1;
>>> + ret =3D qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &val, =
sizeof(val));
>>> + if (ret < 0) {
>>> + error_setg_errno(errp, errno,
>>> + "can't set socket option SO_REUSEPORT");
>>> + goto fail;
>>> + }
>>=20
>> AFAIK, this likely won't compile on Windows since it lacks =
SO_REUSEPORT
>>=20
>>> +
>>> + struct sockaddr_in bindaddr;
>>> + memset(&bindaddr, 0, sizeof(bindaddr));
>>> + bindaddr.sin_family =3D AF_INET;
>>> + bindaddr.sin_addr.s_addr =3D htonl(INADDR_ANY);
>>> + bindaddr.sin_port =3D mcastaddr->sin_port;
>>> + ret =3D bind(fd, (struct sockaddr *)&bindaddr, sizeof(bindaddr));
>>> +
>>> if (ret < 0) {
>>> error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
>>> - inet_ntoa(mcastaddr->sin_addr));
>>> + inet_ntoa(bindaddr.sin_addr));
>>> goto fail;
>>> }
>>=20
>>=20
>> With regards,
>> Daniel
>> --
>> |: https://berrange.com -o- https://www.flickr.com/photos/dberrange =
:|
>> |: https://libvirt.org -o- https://fstop138.berrange.com :|
>> |: https://entangle-photo.org -o- https://www.instagram.com/dberrange =
:|
>=20


--Apple-Mail=_05D285F5-F33C-4E28-8CD6-49C019B726F7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEsLABAI5Y5VbvBdmpL8K2O86Eyz4FAmKCYrwACgkQL8K2O86E
yz51MBAAlNkORG/A/Mf6GWiBMGjVpxm9Z3iTlnDQUWG/RdsBP+nK6otMmNbmSmEV
DCVhKpckIGnwivW+SACsc1aCyAaUXf24JEwRCeGk9rcD5lgkHpyt6s7tlvIY00R6
Sh9TvRqLuYViWRg1pZWVUBtkV9iI9VVpCkYRBp6wM+AW9tQA58tVurlGW9yhvCyU
Mq0dRIzWrWIuG4DBZBVlaK37kclsmKGos1Am0BTCiKMCWzk7AFfMcpNP0l4xQymM
mvtRMdkbW0Hd7lRvFtWZcqFHy6jMfOKHAI5BLmr6U6N4HLdNRFB8X98bH1ELqp2i
fyQqkSPU8QLp+/MvHiufyZJJ9rvnElsWOEzZz+X13d1PH4XlgwSs9TSZHHkp2lHw
WQ4bhFz81xAYivBVUztQIXTWQXIyirDLO1UECWM+acGR1vJ+yj58ZnKgeMvk6z74
EGuQwGdXfZnR7qc9q1CNmwFJecGf/DVqas7mt7eh1J5K5AdwrWbsbh82wzPjBtsu
CpLy8prhKV9axbxxrOelCxMe7kLcUgnswcWFrLrRANwyfOYw4/6BX+IxeA7dyrpj
wbf0JuJOLAEAZjvK+qxtyDJXdJVZLDtJG5RVJajinU4WaevWVuMiVZyZ+UCi5LPA
DPjnGCpa1auAnKSuz7Wu9ee6KIceWSPVhlBBwwmZZ7f0SQfULSE=
=XQMV
-----END PGP SIGNATURE-----

--Apple-Mail=_05D285F5-F33C-4E28-8CD6-49C019B726F7--

