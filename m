Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DE7632926
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9Pu-0001kM-C8; Mon, 21 Nov 2022 11:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ox9PX-0001Wf-UN
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:12:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ox9PU-0006lI-HV
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669047159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPRo7EaUCLraDNg/23OXkVmOxwi28SyX8Uc7542ZPqA=;
 b=TTa1ckUjHphtYAIRe3WsJhgiBERk1D5jYetgewxkOhzy2rjfVd9hqjikwqvfqDqbsGUte4
 hFxAuWlk6KXTV+oPecMRSdyf95TA5Uu/Mvk61o7easOXPx6lLDEemH653NtfQNoXcBzMCX
 ZLIwkdSO7eHkZaV+SYFLrmCGAXxdUhc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-yIg9d3F8NZaktuFUUlvyYw-1; Mon, 21 Nov 2022 11:12:35 -0500
X-MC-Unique: yIg9d3F8NZaktuFUUlvyYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A252E2A59549;
 Mon, 21 Nov 2022 16:12:34 +0000 (UTC)
Received: from localhost (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3957B2166B2E;
 Mon, 21 Nov 2022 16:12:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Hanna Reitz
 <hreitz@redhat.com>, qemu-block@nongnu.org, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-ppc@nongnu.org, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>, Kevin Wolf
 <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RESEND v3 2/2] virtio: remove unnecessary host_features
 in ->get_features()
In-Reply-To: <20221121155020.1915166-3-stefanha@redhat.com>
Organization: Red Hat GmbH
References: <20221121155020.1915166-1-stefanha@redhat.com>
 <20221121155020.1915166-3-stefanha@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 21 Nov 2022 17:12:30 +0100
Message-ID: <87leo45lsh.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 21 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Since at least commit 6b8f1020540c27246277377aa2c3331ad2bfb160 ("virtio:
> move host_features") the ->get_features() function has been called with
> host_features as an argument.
>
> Some devices manually add host_features in ->get_features() although the
> features argument already contains host_features. Make all devices
> consistent by dropping the unnecessary code.
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

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


