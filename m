Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42160609FC5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 13:07:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvC9-0002Fw-1n; Mon, 24 Oct 2022 07:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1omvC3-00028b-2v
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1omvC1-00049X-NL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666609228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JNAZ05a51GbUnlYYzMLPhMzSa+J+jdwJlMxR4+x/+O8=;
 b=PDHjTCCSGYvoBvrqTqfOlOR7ol696wDd5z+617aoulP8x1ODC8iX7uWezuOGy65xLT/xf/
 jT9B7qj3JCxNL3AePRYBIWzLSwzWmyV8qiKvCh7rSfe0q48M6neuWqtcX3bz0quZpg0Zj8
 P8GnCUzN1xTpISrd9P1CgpjYX1YGo7Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-GfbhPK-tPGSU8XwydhnJrA-1; Mon, 24 Oct 2022 07:00:22 -0400
X-MC-Unique: GfbhPK-tPGSU8XwydhnJrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBC3B3C0F222;
 Mon, 24 Oct 2022 11:00:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE56BC15BB2;
 Mon, 24 Oct 2022 11:00:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E471221E6936; Mon, 24 Oct 2022 13:00:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,
 xen-devel@lists.xenproject.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>,  David Gibson
 <david@gibson.dropbear.id.au>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Paul Durrant <paul@xen.org>,  Eric Blake
 <eblake@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Samuel
 Thibault <samuel.thibault@ens-lyon.org>,  Greg Kurz <groug@kaod.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v14 17/17] net: stream: add QAPI events to report
 connection state
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-18-lvivier@redhat.com>
Date: Mon, 24 Oct 2022 13:00:19 +0200
In-Reply-To: <20221021090922.170074-18-lvivier@redhat.com> (Laurent Vivier's
 message of "Fri, 21 Oct 2022 11:09:22 +0200")
Message-ID: <87sfjdsczg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Laurent Vivier <lvivier@redhat.com> writes:

> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>
> The NETDEV_STREAM_CONNECTED event includes the destination address.
>
> This allows a system manager like libvirt to detect when the server
> fails.
>
> For instance with passt:
>
> { 'execute': 'qmp_capabilities' }
> { "return": { } }
> { "timestamp": { "seconds": 1666341395, "microseconds": 505347 },
>     "event": "NETDEV_STREAM_CONNECTED",
>     "data": { "netdev-id": "netdev0",
>         "addr": { "path": "/tmp/passt_1.socket", "type": "unix" } } }
>
> [killing passt here]
>
> { "timestamp": { "seconds": 1666341430, "microseconds": 968694 },
>     "event": "NETDEV_STREAM_DISCONNECTED",
>     "data": { "netdev-id": "netdev0" } }
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


