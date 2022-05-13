Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE052695D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:33:33 +0200 (CEST)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npa6W-0006SU-O3
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1npa0x-0007wz-O0
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:27:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1npa0u-0001tO-Lw
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652466463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HV/tpQ64PaLONrJnNJUSjEmeMESpEER5E/itTCuRsY=;
 b=OjAUDHSvCvo/Ki2yWczDj2tQ1rK2Ornkil+udG2i5O9GGrBfwVje1f0/2jDbC4zhcMqV64
 PrZErfON/+v7fmEpkxWcjRwzAuJN98BSrL9GvZIBLUx1UU29IeaHpE5k4olxJdJf9R4FAg
 4C4q0PZ0WqqSL4KFqwvH/Q+f83yZXgI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-DgiQKb-bMe68XyilrOCo1g-1; Fri, 13 May 2022 14:27:40 -0400
X-MC-Unique: DgiQKb-bMe68XyilrOCo1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 004C63806708;
 Fri, 13 May 2022 18:27:40 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA309111F3B6;
 Fri, 13 May 2022 18:27:39 +0000 (UTC)
Date: Fri, 13 May 2022 20:27:36 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Ralph Schmieder <ralph.schmieder@gmail.com>,
 "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <20220513202736.3844375e@elisabeth>
In-Reply-To: <20220512080932.735962-1-lvivier@redhat.com>
References: <20220512080932.735962-1-lvivier@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 May 2022 10:09:24 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> "-netdev socket" only supports inet sockets.
>=20
> It's not a complex task to add support for unix sockets, but
> the socket netdev parameters are not defined to manage well unix
> socket parameters.
>=20
> As discussed in:
>=20
>   "socket.c added support for unix domain socket datagram transport"
>   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60=
@gmail.com/
>=20
> This series adds support of unix socket type using SocketAddress QAPI str=
ucture.
>=20
> Two new netdev backends, "stream" and "dgram" are added, that are barely =
a copy of "socket"
> backend but they use the SocketAddress QAPI to provide socket parameters.
> And then they also implement unix sockets (TCP and UDP).
>=20
> Some examples of CLI syntax:
>=20
>   for TCP:
>=20
>   -netdev stream,id=3Dsocket0,addr.type=3Dinet,addr.host=3Dlocalhost,addr=
.port=3D1234
>   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dinet,addr.host=3Dl=
ocalhost,addr.port=3D1234
>=20
>   -netdev dgram,id=3Dsocket0,\
>           local.type=3Dinet,local.host=3Dlocalhost,local.port=3D1234,\
>           remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D1235
>=20
>   for UNIX:
>=20
>   -netdev stream,id=3Dsocket0,addr.type=3Dunix,addr.path=3D/tmp/qemu0
>   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dunix,addr.path=3D/=
tmp/qemu0
>=20
>   -netdev dgram,id=3Dsocket0,\
>           local.type=3Dunix,local.path=3D/tmp/qemu0,\
>           remote.type=3Dunix,remote.path=3D/tmp/qemu1
>=20
>   for FD:
>=20
>   -netdev stream,id=3Dsocket0,addr.type=3Dfd,addr.str=3D4
>   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dfd,addr.str=3D5
>=20
>   -netdev dgram,id=3Dsocket0,local.type=3Dfd,addr.str=3D4
>=20
> v2:
>   - use "stream" and "dgram" rather than "socket-ng,mode=3Dstream"
>     and ""socket-ng,mode=3Ddgram"
>   - extract code to bypass qemu_opts_parse_noisily() to
>     a new patch
>   - do not ignore EINVAL (Stefano)
>   - fix "-net" option
>=20
> CC: Ralph Schmieder <ralph.schmieder@gmail.com>
> CC: Stefano Brivio <sbrivio@redhat.com>
> CC: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
>=20
> Laurent Vivier (7):
>   net: introduce convert_host_port()
>   qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
>   qapi: net: add stream and dgram netdevs
>   net: stream: add unix socket
>   net: dgram: make dgram_dst generic
>   net: dgram: move mcast specific code from net_socket_fd_init_dgram()
>   net: dgram: add unix socket
>=20
> Stefano Brivio (1):
>   net: stream: Don't ignore EINVAL on netdev socket connection

Except for 4/8:
Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

Except for 6/8 to 8/8:
Tested-by: Stefano Brivio <sbrivio@redhat.com>

--=20
Stefano


