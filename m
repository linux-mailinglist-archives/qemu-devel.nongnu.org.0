Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A749C65D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:34:49 +0100 (CET)
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCehT-0007Gf-Jh
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:34:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCeev-0005aw-Eo
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:32:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCees-0001hA-3X
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643189524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K8pNh0QjloaUMe8ZEJImo0ORKqBE6c9zETOHjIwPBls=;
 b=A+yHf5dSabBhujP+pl+ok2t/WW0Cbid5rjFytUxp/fn/gUs9qZpTaAkTmNSGl1shfnDGtQ
 jhCuBNB1MPwn/xyvC24j3xBbsxuFW5+J24uq3ujz2xN9xTe320v9BM9ltCQ0fcn3ihgwPA
 I/FolHlYGH7EOsxbSaVnCaPIqQH2QhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-UkVPW1zYNw2LLOrlnfq9VA-1; Wed, 26 Jan 2022 04:31:58 -0500
X-MC-Unique: UkVPW1zYNw2LLOrlnfq9VA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B252A8519E3;
 Wed, 26 Jan 2022 09:31:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1003E4EC77;
 Wed, 26 Jan 2022 09:31:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7885618000AA; Wed, 26 Jan 2022 10:31:53 +0100 (CET)
Date: Wed, 26 Jan 2022 10:31:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: ~dengxuehua <dengxh2@chinatelecom.cn>
Subject: Re: [PATCH qemu] qxl: COLO secondary node not need to release
 resources
Message-ID: <20220126093153.qylqy5s2dzitxsgt@sirius.home.kraxel.org>
References: <164310239719.1016.2386682120107304758-0@git.sr.ht>
MIME-Version: 1.0
In-Reply-To: <164310239719.1016.2386682120107304758-0@git.sr.ht>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> During COLO checkpoint, the Secondary VM's qemu has loaded Primary
> VM's qxl states, so it not need to release qxl resources.

> +#include "migration/colo.h"
>  #include "trace.h"
>  
>  #include "qxl.h"
> @@ -757,6 +758,10 @@ static void interface_release_resource(QXLInstance *sin,
>      if (!ext.info) {
>          return;
>      }
> +    /* The SVM load PVM states,so it not need to release resources */
> +    if (get_colo_mode() == COLO_MODE_SECONDARY) {
> +        return;
> +    }
>      if (ext.group_id == MEMSLOT_GROUP_HOST) {
>          /* host group -> vga mode update request */
>          QXLCommandExt *cmdext = (void *)(intptr_t)(ext.info->id);
> @@ -880,6 +885,10 @@ static int interface_flush_resources(QXLInstance *sin)
>      PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
>      int ret;
>  
> +    /* The SVM load PVM states,so it not need to release resources */
> +    if (get_colo_mode() == COLO_MODE_SECONDARY) {
> +        return 0;
> +    }
>      ret = qxl->num_free_res;
>      if (ret) {
>          qxl_push_free_res(qxl, 1);

Hmm, not sure what to do with this one.  I know next to nothing about
COLO, but I suspect this is just papering over the root cause.

Some qxl functionality is handed by a thread started by libspice-server.
The thread can be started and stopped (see qemu_spice_display_start,
qemu_spice_display_stop).  There is a handler (vm_change_state_handler)
which starts/stops depending on vm state, specifically the thread is
stopped when saving+loading vmstate to avoid problems simliar to the one
you are seeing with colo.

What I think you need is proper management of that thread when colo is
active.  Possibly it should just never be active on a secondary node,
but I don't know enough about colo to be sure.

HTH & take care,
  Gerd


