Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7014336D56
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 08:54:21 +0100 (CET)
Received: from localhost ([::1]:54940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKG9E-0004Uk-L6
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 02:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lKG7G-0003M5-H9
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:52:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lKG7B-0006xb-3M
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615449132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uplIfHrQfrFCBzMmSpurBtTKQDhjr/a+BIIATNQByrw=;
 b=WTQGn7MSl2C+bVdWRkrAI2pkuviprCQb65pZNg23xheHDnODkWbsXyl8UqLuKHQkujzksf
 cOqMR8liJRc+9FaRCzMwDa3vKPnxX9HpI9kyLIpVhxPS+LHbP0a5ODDD+J3RH0MDXDGWxU
 f4JU1Zluq3TE8xQBSBaqL40YbkyBN+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-tTEg77PQP2KKLqDT1Kbxgw-1; Thu, 11 Mar 2021 02:52:07 -0500
X-MC-Unique: tTEg77PQP2KKLqDT1Kbxgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 715D418D6A32;
 Thu, 11 Mar 2021 07:52:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AD125C1BD;
 Thu, 11 Mar 2021 07:52:06 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42ED057DC0;
 Thu, 11 Mar 2021 07:52:06 +0000 (UTC)
Date: Thu, 11 Mar 2021 02:52:05 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <1108640443.40122524.1615449125762.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210310183123.1212612-1-philmd@redhat.com>
References: <20210310183123.1212612-1-philmd@redhat.com>
Subject: Re: [PATCH v6 0/7] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
MIME-Version: 1.0
X-Originating-IP: [10.40.193.51, 10.4.195.24]
Thread-Topic: net/eth: Fix stack-buffer-overflow in _eth_get_rss_ex_dst_addr()
Thread-Index: pecBSWdBzDcYZVEhSVrr1fomS71BDg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: qemu-devel@nongnu.org
> Cc: "Jason Wang" <jasowang@redhat.com>, "Stefano Garzarella" <sgarzare@re=
dhat.com>, "Thomas Huth" <thuth@redhat.com>,
> "Miroslav Rezanina" <mrezanin@redhat.com>, "Dmitry Fleytman" <dmitry.fley=
tman@gmail.com>, "Paolo Bonzini"
> <pbonzini@redhat.com>, "Laurent Vivier" <lvivier@redhat.com>, "Philippe M=
athieu-Daud=C3=A9" <philmd@redhat.com>
> Sent: Wednesday, March 10, 2021 7:31:16 PM
> Subject: [PATCH v6 0/7] net/eth: Fix stack-buffer-overflow in _eth_get_rs=
s_ex_dst_addr()
>=20
> I had a look at the patch from Miroslav trying to silence a
> compiler warning which in fact is a nasty bug. Here is a fix.
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html
>

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
=20
> Since v5:
> - addressed Stefano's review comments:
> - add now patch fixing in6_address offset
>=20
> Since v4:
> - reworked again, tested it with Fedora Raw Hide
>=20
> Philippe Mathieu-Daud=C3=A9 (7):
>   net/eth: Use correct in6_address offset in _eth_get_rss_ex_dst_addr()
>   net/eth: Simplify _eth_get_rss_ex_dst_addr()
>   net/eth: Better describe _eth_get_rss_ex_dst_addr's offset argument
>   net/eth: Check size earlier in _eth_get_rss_ex_dst_addr()
>   net/eth: Check iovec has enough data earlier
>   net/eth: Read ip6_ext_hdr_routing buffer before accessing it
>   net/eth: Add an assert() and invert if() statement to simplify code
>=20
>  net/eth.c                      | 46 ++++++++++++++---------------
>  tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |  1 +
>  tests/qtest/meson.build        |  1 +
>  4 files changed, 78 insertions(+), 23 deletions(-)
>  create mode 100644 tests/qtest/fuzz-e1000e-test.c
>=20
> --
> 2.26.2
>=20
>=20
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


