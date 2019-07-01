Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DEA497C7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 05:27:28 +0200 (CEST)
Received: from localhost ([::1]:53398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd4mM-0004fh-Gj
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 23:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33363)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hd4lQ-0004Gs-C2
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 23:26:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hd4lO-0005sT-9n
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 23:26:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55672)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hd4lN-0005r6-0w
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 23:26:26 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 89D3485550
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 03:26:23 +0000 (UTC)
Received: from [10.72.12.155] (ovpn-12-155.pek2.redhat.com [10.72.12.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318305B2F7;
 Tue, 18 Jun 2019 03:26:16 +0000 (UTC)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com, laine@redhat.com
References: <20190613095924.21908-1-dgilbert@redhat.com>
 <20190613095924.21908-6-dgilbert@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <46411fb1-62d8-30ee-e558-557ad6ceb323@redhat.com>
Date: Tue, 18 Jun 2019 11:26:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613095924.21908-6-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 18 Jun 2019 03:26:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 5/5] net/announce: Expand test for
 stopping self announce
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/6/13 =E4=B8=8B=E5=8D=885:59, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Expand self-announce test to check we can stop an announce timer.
> We set it up to send 300 packets, but after we receive
> the first one we tell it to stop.
>
> We error if:
>     a) We receive more than 30 of the packets
>     b) We're still receiving packets after a lot longer than the
>        30 seconds should have arrived
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   tests/virtio-net-test.c | 57 ++++++++++++++++++++++++++++++++++++++--=
-
>   1 file changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/tests/virtio-net-test.c b/tests/virtio-net-test.c
> index 663cf7ea7e..3b49b431dc 100644
> --- a/tests/virtio-net-test.c
> +++ b/tests/virtio-net-test.c
> @@ -184,21 +184,72 @@ static void announce_self(void *obj, void *data, =
QGuestAllocator *t_alloc)
>       QDict *rsp;
>       int ret;
>       uint16_t *proto =3D (uint16_t *)&buffer[12];
> +    size_t total_received =3D 0;
> +    uint64_t start, now, last_rxt, deadline;
>  =20
> +    /* Send a set of packets over a few second period */
>       rsp =3D qmp("{ 'execute' : 'announce-self', "
>                     " 'arguments': {"
> -                      " 'initial': 50, 'max': 550,"
> -                      " 'rounds': 10, 'step': 50 } }");
> +                      " 'initial': 20, 'max': 100,"
> +                      " 'rounds': 300, 'step': 10, 'id': 'bob' } }");
>       assert(!qdict_haskey(rsp, "error"));
>       qobject_unref(rsp);
>  =20
> -    /* Catch the packet and make sure it's a RARP */
> +    /* Catch the first packet and make sure it's a RARP */
>       ret =3D qemu_recv(sv[0], &len, sizeof(len), 0);
>       g_assert_cmpint(ret, =3D=3D,  sizeof(len));
>       len =3D ntohl(len);
>  =20
>       ret =3D qemu_recv(sv[0], buffer, len, 0);
>       g_assert_cmpint(*proto, =3D=3D, htons(ETH_P_RARP));
> +
> +    /*
> +     * Stop the announcment by settings rounds to 0 on the
> +     * existing timer.
> +     */
> +    rsp =3D qmp("{ 'execute' : 'announce-self', "
> +                  " 'arguments': {"
> +                      " 'initial': 20, 'max': 100,"
> +                      " 'rounds': 0, 'step': 10, 'id': 'bob' } }");
> +    assert(!qdict_haskey(rsp, "error"));
> +    qobject_unref(rsp);
> +
> +    /* Now make sure the packets stop */
> +
> +    /* Times are in us */
> +    start =3D g_get_monotonic_time();
> +    /* 30 packets, max gap 100ms, * 2 for wiggle */
> +    deadline =3D start + 1000 * (100 * 30 * 2);
> +    last_rxt =3D start;
> +
> +    do {


while (ture) looks better here.


> +        int saved_err;
> +        ret =3D qemu_recv(sv[0], buffer, 60, MSG_DONTWAIT);
> +        saved_err =3D errno;
> +        now =3D g_get_monotonic_time();
> +        g_assert_cmpint(now, <, deadline);

The maximum gap allowed is 1000 * 100 * 4, and we allow at most 30=20
packets that's 30 * 1000 * 100 * 4 which is 1200000.

But the deadline is 1000 * 100 * 30 * 2 which is 6000000.

Does this mean deadline is conflict with the assumption above?

Thanks


> +
> +        if (ret >=3D 0) {
> +            if (ret) {
> +                last_rxt =3D now;
> +            }
> +            total_received +=3D ret;
> +
> +            /* Check it's not spewing loads */
> +            g_assert_cmpint(total_received, <, 60 * 30 * 2);
> +        } else {
> +            g_assert_cmpint(saved_err, =3D=3D, EAGAIN);
> +
> +            /* 400ms, i.e. 4 worst case gaps */
> +            if ((now - last_rxt) > (1000 * 100 * 4)) {
> +                /* Nothings arrived for a while - must have stopped */
> +                break;
> +            };
> +
> +            /* 100ms */
> +            g_usleep(1000 * 100);
> +        }
> +    } while (true);
>   }
>  =20
>   static void virtio_net_test_cleanup(void *sockets)

