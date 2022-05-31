Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535A6538FE9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:33:21 +0200 (CEST)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw07i-0005W8-2h
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nw03G-0002VW-9u
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:28:42 -0400
Received: from mail.ispras.ru ([83.149.199.84]:57132)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nw033-00042L-DE
 for qemu-devel@nongnu.org; Tue, 31 May 2022 07:28:42 -0400
Received: from smtpclient.apple (unknown [178.162.209.142])
 by mail.ispras.ru (Postfix) with ESMTPSA id 95D704076B21;
 Tue, 31 May 2022 11:28:01 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Vitaly Cheptsov <cheptsov@ispras.ru>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] net: fix multicast support with BSD (macOS) socket
 implementations
Date: Tue, 31 May 2022 14:28:00 +0300
Message-Id: <21248AC5-C4D2-43DB-B096-DDFE9312BBE1@ispras.ru>
References: <CACGkMEvhBWkcQwJD3eqY7f2=nqxC6RPBdhMq0iq=qi7NpuJ_3w@mail.gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
In-Reply-To: <CACGkMEvhBWkcQwJD3eqY7f2=nqxC6RPBdhMq0iq=qi7NpuJ_3w@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
X-Mailer: iPad Mail (19F77)
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Jason,

This patch fixes socket communication with QEMU -> host and QEMU <--> QEMU o=
n macOS, which was originally impossible due to QEMU and host program having=
 to bind to the same ip/port in a way not supported by BSD sockets. The chan=
ge was tested on both Linux and macOS.

Basically after applying this patch one will be able to communicate with QEM=
U when using "-nic socket,mcast=3D230.0.0.1:1234,model=3Dvirtio-net-pci" fro=
m QEMU or macOS itself.

Best regards,
Vitaly

> On 31 May 2022, at 10:02, Jason Wang <jasowang@redhat.com> wrote:
>=20
> =EF=BB=BFOn Wed, May 18, 2022 at 3:40 PM Vitaly Cheptsov <cheptsov@ispras.=
ru> wrote:
>>=20
>=20
> Hi Vitaly:
>=20
> We need a changelog to describe why we need this.
>=20
> Thanks
>=20
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Daniel P. Berrange <berrange@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
>> ---
>> net/socket.c | 18 ++++++++++++++++++
>> 1 file changed, 18 insertions(+)
>>=20
>> diff --git a/net/socket.c b/net/socket.c
>> index bfd8596250..583f788a22 100644
>> --- a/net/socket.c
>> +++ b/net/socket.c
>> @@ -239,6 +239,22 @@ static int net_socket_mcast_create(struct sockaddr_i=
n *mcastaddr,
>>         return -1;
>>     }
>>=20
>> +#ifdef __APPLE__
>> +    val =3D 1;
>> +    ret =3D qemu_setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &val, sizeof(v=
al));
>> +    if (ret < 0) {
>> +        error_setg_errno(errp, errno,
>> +                         "can't set socket option SO_REUSEPORT");
>> +        goto fail;
>> +    }
>> +
>> +    struct sockaddr_in bindaddr;
>> +    memset(&bindaddr, 0, sizeof(bindaddr));
>> +    bindaddr.sin_family =3D AF_INET;
>> +    bindaddr.sin_addr.s_addr =3D htonl(INADDR_ANY);
>> +    bindaddr.sin_port =3D mcastaddr->sin_port;
>> +    ret =3D bind(fd, (struct sockaddr *)&bindaddr, sizeof(bindaddr));
>> +#else
>>     /* Allow multiple sockets to bind the same multicast ip and port by s=
etting
>>      * SO_REUSEADDR. This is the only situation where SO_REUSEADDR should=
 be set
>>      * on windows. Use socket_set_fast_reuse otherwise as it sets SO_REUS=
EADDR
>> @@ -253,6 +269,8 @@ static int net_socket_mcast_create(struct sockaddr_in=
 *mcastaddr,
>>     }
>>=20
>>     ret =3D bind(fd, (struct sockaddr *)mcastaddr, sizeof(*mcastaddr));
>> +#endif
>> +
>>     if (ret < 0) {
>>         error_setg_errno(errp, errno, "can't bind ip=3D%s to socket",
>>                          inet_ntoa(mcastaddr->sin_addr));
>> --
>> 2.32.1 (Apple Git-133)
>>=20
>=20

