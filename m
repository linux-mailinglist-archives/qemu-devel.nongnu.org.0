Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC24F176E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 16:44:40 +0200 (CEST)
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbNwd-0006oK-UF
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 10:44:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nbNvH-0005Zv-KL
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 10:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nbNvF-0007Ra-Tm
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 10:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649083392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s+/UP1XfDFOdIFh2ddSYBCUtS2h7uJtOIntZpE6P0Qc=;
 b=BiH96HoNBQHT4c0kSoUbYWMFjxY8zVKEncWfPP+C6MQpaOUBEHeW7i0riz9fliueYOi7wq
 B0TO+67dCNAytzmOn1Chud0I+o3CPXqDgCfHOohiMclyZSi5g7fKM1NwFy34CfXpS/7K3P
 hF60AnYIyEVUY2r8dxe4Sa7GUSC9oPI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-qytz-aOVPDSxI5POkMl2tg-1; Mon, 04 Apr 2022 10:43:11 -0400
X-MC-Unique: qytz-aOVPDSxI5POkMl2tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AF828002BF;
 Mon,  4 Apr 2022 14:43:10 +0000 (UTC)
Received: from localhost (unknown [10.39.195.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 155D92144B45;
 Mon,  4 Apr 2022 14:43:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/4] virtio-ccw: move vhost_ccw_scsi to a separate file
In-Reply-To: <20220328143019.682245-3-pbonzini@redhat.com>
Organization: Red Hat GmbH
References: <20220328143019.682245-1-pbonzini@redhat.com>
 <20220328143019.682245-3-pbonzini@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 04 Apr 2022 16:43:08 +0200
Message-ID: <87k0c4gb9f.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pasic@linux.ibm.com, thuth@redhat.com, borntraeger@linux.ibm.com,
 farman@linux.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 28 2022, Paolo Bonzini <pbonzini@redhat.com> wrote:

> Remove unecessary use of #ifdef CONFIG_VHOST_SCSI, instead just use a
> separate file and a separate rule in meson.build.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/s390x/meson.build       |  1 +
>  hw/s390x/vhost-scsi-ccw.c  | 64 ++++++++++++++++++++++++++++++++++++++
>  hw/s390x/virtio-ccw-scsi.c | 47 ----------------------------
>  3 files changed, 65 insertions(+), 47 deletions(-)
>  create mode 100644 hw/s390x/vhost-scsi-ccw.c
>

> diff --git a/hw/s390x/vhost-scsi-ccw.c b/hw/s390x/vhost-scsi-ccw.c

As Eric already noted, please add an entry in MAINTAINERS under
virtio-ccw for this file.

> new file mode 100644
> index 0000000000..b68ddddd1c
> --- /dev/null
> +++ b/hw/s390x/vhost-scsi-ccw.c
> @@ -0,0 +1,64 @@
> +/*
> + * vhost ccw scsi implementation
> + *
> + * Copyright 2012, 2015 IBM Corp.
> + * Author(s): Cornelia Huck <cornelia.huck@de.ibm.com>

That old copyright notice gets copied around a lot; what I find funny
here is that you actually introduced the device in the first place :)
(commit ccf6916c843edd30ea4ecfaaac68faa865529c97)

(I believe we really can't do any better, and I probably did touch this
while still wearing my IBM hat.)

> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */


