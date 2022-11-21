Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A640632918
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:12:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9Os-0001Ce-Kc; Mon, 21 Nov 2022 11:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ox9On-00019o-Sj
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:11:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ox9Om-0006gm-73
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669047115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVPwiqgER3HtHrJa7uW489ptahnTVi1DN95I2F5p6+0=;
 b=Ecqg9xgyKYCV8/twSvcfCqYrjorL3QlFwjQikWC9ZWTm4ldsH6IIPLSderB33NOj1oOWqL
 R5XHvTaqjQz622NtRd+RBXKQcepXG0TVJk+YzKO7qgZIRJy3EZ0ROyD2QLGc6/AmQ5BuIE
 Hmd1HWcjcyBQfbYE0O78YYxZJ0RkOC8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-TB5XgA_JM6Sxo-fzP9Ro7Q-1; Mon, 21 Nov 2022 11:11:50 -0500
X-MC-Unique: TB5XgA_JM6Sxo-fzP9Ro7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F6D886EB20;
 Mon, 21 Nov 2022 16:11:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A3061415117;
 Mon, 21 Nov 2022 16:11:48 +0000 (UTC)
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
Subject: Re: [PATCH RESEND v3 1/2] virtio: document ->host_features usage in
 vdc->get_features() callback
In-Reply-To: <20221121155020.1915166-2-stefanha@redhat.com>
Organization: Red Hat GmbH
References: <20221121155020.1915166-1-stefanha@redhat.com>
 <20221121155020.1915166-2-stefanha@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 21 Nov 2022 17:11:45 +0100
Message-ID: <87o7t05ltq.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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

> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/virtio/virtio.h | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


