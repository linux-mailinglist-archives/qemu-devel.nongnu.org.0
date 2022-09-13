Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89385B6BA7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:30:53 +0200 (CEST)
Received: from localhost ([::1]:35602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3Bt-0000NS-0Y
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1oY37K-0004Kv-Km
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1oY37E-0005GT-HE
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663064761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUjxIwyaVR8u9IfJrAGsggGXXT0y+hLR4nMCEzojP9s=;
 b=DhoWad59UBc/pjKPnWkAgn7TmFdlP2+sJ5OwpLLCUU4it7B7KfZkpMg3kIZmS01m1KgquY
 wU3UqpG5nxfihxQuJIWuxCd0rJPGWtCaR6fOFWRAqz59o6dPAMA4TIbKNLFsAQ1uo7SHLH
 8iD6QM2kKP0nAB8Z7VxTj3qgvgSij+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-2En8MbgeNWCX5QUJoeAhPQ-1; Tue, 13 Sep 2022 06:24:39 -0400
X-MC-Unique: 2En8MbgeNWCX5QUJoeAhPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1DF2185A7BA;
 Tue, 13 Sep 2022 10:24:38 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF99C15BA4;
 Tue, 13 Sep 2022 10:24:38 +0000 (UTC)
Date: Tue, 13 Sep 2022 11:24:31 +0100
From: Stefano Brivio <sbrivio@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Thomas Huth
 <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Ralph Schmieder
 <ralph.schmieder@gmail.com>
Subject: Re: [PATCH v8 00/14] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <20220913112431.12d164de@elisabeth>
In-Reply-To: <20220913064000.79353-1-lvivier@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, 13 Sep 2022 08:39:46 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> "-netdev socket" only supports inet sockets.
> 
> It's not a complex task to add support for unix sockets, but
> the socket netdev parameters are not defined to manage well unix
> socket parameters.
> 
> As discussed in:
> 
>   "socket.c added support for unix domain socket datagram transport"
>   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
> 
> This series adds support of unix socket type using SocketAddress QAPI structure.
> 
> Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
> backend but they use the SocketAddress QAPI to provide socket parameters.
> And then they also implement unix sockets (TCP and UDP).

For the series,

Tested-by: Stefano Brivio <sbrivio@redhat.com>

...specifically, same as v7, the stream-oriented AF_UNIX support, with
passt (https://passt.top) and its test suite, running qemu (x86_64 KVM,
and armv6l, armv7l, aarch64, ppc64, ppc64le, s390x TCG) with something
on the lines of:

  -device virtio-net-pci,netdev=socket0 -netdev stream,id=socket0,server=off,addr.type=unix,addr.path=...

-- 
Stefano


