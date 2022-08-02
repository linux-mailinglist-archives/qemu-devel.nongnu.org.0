Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6D8587F04
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:35:49 +0200 (CEST)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItvw-0003lM-9P
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oItrz-0008KZ-3K
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oItrv-0001TI-Ok
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659454299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQMIJeOafQk9fF1Za9XM3K121VWikvKPaDCj+6Zzs+4=;
 b=RFZsa1b1nZTrf66+3EsKupUnr6tvlYGDkfaeutkl52a0M+RD3t+10z0IrY0ChoO+fci56W
 xZqFDMIXWxoZZzvBHnOLH0pjtdU+nZ5yvsxoM9dIAS5hF7vCalD/2YmGLeE9nP2Wu2Z66G
 JiSNY4IdaJBe5DyEfh6zqc9klz7NaWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-YNKcrmOyMdOj-mWqPzXREA-1; Tue, 02 Aug 2022 11:31:34 -0400
X-MC-Unique: YNKcrmOyMdOj-mWqPzXREA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59F173C11E68;
 Tue,  2 Aug 2022 15:31:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E02AF2026D4C;
 Tue,  2 Aug 2022 15:31:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>, =?utf-8?Q?Ma?=
 =?utf-8?Q?rc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Fam
 Zheng <fam@euphon.net>, Amit Shah <amit@kernel.org>
Subject: Re: [PATCH] virtio: remove unnecessary host_features in
 ->get_features()
In-Reply-To: <20220802132853.755650-1-stefanha@redhat.com>
Organization: Red Hat GmbH
References: <20220802132853.755650-1-stefanha@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Tue, 02 Aug 2022 17:31:32 +0200
Message-ID: <87sfme8xwr.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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

On Tue, Aug 02 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Since at least commit 6b8f1020540c27246277377aa2c3331ad2bfb160 ("virtio:
> move host_features") the ->get_features() function has been called with
> host_features as an argument.
>
> Some devices manually add host_features in ->get_features() although the
> features argument already contains host_features. Make all devices
> consistent by dropping the unnecessary code.

I wonder whether we should add that explicitly to the contract for
get_features()?

>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/block/virtio-blk.c       | 3 ---
>  hw/char/virtio-serial-bus.c | 1 -
>  hw/net/virtio-net.c         | 3 ---
>  hw/scsi/vhost-scsi-common.c | 3 ---
>  hw/scsi/virtio-scsi.c       | 4 ----
>  hw/virtio/virtio-balloon.c  | 2 --
>  6 files changed, 16 deletions(-)

The change seems sane to me.


