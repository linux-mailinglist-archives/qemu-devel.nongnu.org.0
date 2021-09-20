Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DDA410F70
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:10:52 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSCVu-0005ai-Mf
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSCTt-0004oN-Jh
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSCTp-00021d-Iu
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632118120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HBCN97KuNtC/IzitxBu1URnErWf2pVEp5ugVYJb/oRo=;
 b=E2I/WR0jfLxsWeuRoB6UKxven5kZC4ScwUyE3uY/v+WbPzLLeZ3scF/liVJq+y9CYeJ5PO
 IZf1mxnLVdrkw1ByyPG7bSgEsk2rxori0u/suU3f8FAP2rv8ASWa2Wua0HCvV96pDcQmP1
 dU1cHq8wJV3YPXyylmQTiHSAFGDZXew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-bd95DlY8Mby7Xl6aZZY64A-1; Mon, 20 Sep 2021 02:08:39 -0400
X-MC-Unique: bd95DlY8Mby7Xl6aZZY64A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EE1F1084683;
 Mon, 20 Sep 2021 06:08:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 684EF19729;
 Mon, 20 Sep 2021 06:08:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 015B7113865F; Mon, 20 Sep 2021 08:08:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 6/8] qdev: realize BlockParentClass
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-7-vsementsov@virtuozzo.com>
Date: Mon, 20 Sep 2021 08:08:28 +0200
In-Reply-To: <20210802185416.50877-7-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 2 Aug 2021 21:54:14 +0300")
Message-ID: <87v92v4w4j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 dim@virtuozzo.com, igor@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, yur@virtuozzo.com, nshirokovskiy@virtuozzo.com,
 stefanha@redhat.com, den@openvz.org, pbonzini@redhat.com, mreitz@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  softmmu/qdev-monitor.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 0117989009..2e149aa9b8 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -18,6 +18,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "block/block-parent.h"
>  #include "hw/sysbus.h"
>  #include "monitor/hmp.h"
>  #include "monitor/monitor.h"
> @@ -1023,3 +1024,44 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>      }
>      return true;
>  }
> +
> +static int qdev_find_child(const char *parent_id, const char *child_name,
> +                           BlockDriverState *child_bs,
> +                           BdrvChild **child, Error **errp)
> +{
> +    int ret;
> +    DeviceState *dev;
> +    BlockBackend *blk;
> +
> +    ret = find_device_state(parent_id, &dev, errp);
> +    if (ret <= 0) {
> +        return ret;
> +    }
> +
> +    blk = blk_by_dev(dev);
> +    if (!blk || !blk_root(blk)) {
> +        error_setg(errp, "Device '%s' does not have a block device backend",
> +                   parent_id);
> +        return -EINVAL;
> +    }
> +
> +    if (child_bs && blk_bs(blk) != child_bs) {
> +        error_setg(errp, "Root child of device '%s' doesn't match", parent_id);

What is a "root child", and why would a user care?

The contract missing in PATCH 2 leaves me floundering.

> +        return -EINVAL;
> +    }
> +
> +    *child = blk_root(blk);
> +    return 1;
> +}
> +
> +BlockParentClass block_parent_qdev = {
> +    .name = "qdev",
> +    .find_child = qdev_find_child,
> +};
> +
> +static void qdev_monitor_init(void)
> +{
> +    block_parent_class_register(&block_parent_qdev);
> +}
> +
> +block_init(qdev_monitor_init);


