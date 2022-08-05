Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1958AF0A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:43:35 +0200 (CEST)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1ME-00050M-C3
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1oK1JL-0003W8-Me
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1oK1JI-00064T-5B
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659721230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gc1ZnP3ol+2jAgYGikgJMIWNQw6Jxwwj5Gd229LArOU=;
 b=ZKQbfkTBxO74RdimiyCxy8t8S9IrvRNX2fM0G6IaDDkmWe7XlAGQ71JrWISjHUlgpsznMC
 /VwmoVvLUiA1lDrFFNlQcyEvLhv4A0QLUKbIsw7IlbP5uxcQM5NogE7T7W1co+8cNMai2V
 25OHB1eZsfHw3+JVXVERB8HDfWVbPEU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-IxL4yTWGOq6aNPFD99yf-w-1; Fri, 05 Aug 2022 13:39:20 -0400
X-MC-Unique: IxL4yTWGOq6aNPFD99yf-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D99A81C1A940;
 Fri,  5 Aug 2022 17:39:19 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A10DE94571;
 Fri,  5 Aug 2022 17:39:19 +0000 (UTC)
Date: Fri, 5 Aug 2022 19:39:14 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Jason Wang <jasowang@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Ralph Schmieder <ralph.schmieder@gmail.com>
Subject: Re: [PATCH v7 00/14] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <20220805193914.51e20dc4@elisabeth>
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Fri, 22 Jul 2022 21:04:28 +0200
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

...specifically, the stream-oriented AF_UNIX support, with passt
(https://passt.top) and its test suite, running qemu (x86_64 KVM, and
armv6l, armv7l, aarch64, ppc64, ppc64le, s390x TCG) with something on
the lines of:

  -device virtio-net-pci,netdev=socket0 -netdev stream,id=socket0,server=off,addr.type=unix,addr.path=...

-- 
Stefano


