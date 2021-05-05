Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90073735D4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:49:26 +0200 (CEST)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCHd-0004iS-Po
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leCGr-0004Hz-7b
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leCGp-0001HG-NV
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620200915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BEVNH0qGlDT5JBxkees6nfsPQ5pRhMmmsxJNlPTGuU=;
 b=a+i2kiUCKiOBPOUQnZCtDZdgB6FjGzC+XpMw1u0xiigvFWvDIvZn+wGywHr+bfuZyfvqMX
 OwK4dDIoi/7z77F5aZo2I7fhh3DoaemJai+c7mKXikF3TnowodBzEvkusZFGYAMwovLvPd
 KEzMMr3R8C4WqKu9x2MiiNq2mMJ1vL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-D6l7Mr_pNVmDSA0U85MQjw-1; Wed, 05 May 2021 03:48:33 -0400
X-MC-Unique: D6l7Mr_pNVmDSA0U85MQjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 848688464D0;
 Wed,  5 May 2021 07:48:32 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2BE41001901;
 Wed,  5 May 2021 07:48:23 +0000 (UTC)
Date: Wed, 5 May 2021 13:18:21 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH 5/7] vhost-user-gpu: fix memory leak in
 'virgl_cmd_resource_unref'
In-Reply-To: <20210505045824.33880-6-liq3ea@163.com>
Message-ID: <o617p20-s2pp-6p4n-69pn-31o9s74pq97r@erqung.pbz>
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-6-liq3ea@163.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, liq3ea@gmail.com, kraxel@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Tue, 4 May 2021, Li Qiang wrote --+
| diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
| index 6a332d601f..c669d73a1d 100644
| --- a/contrib/vhost-user-gpu/virgl.c
| +++ b/contrib/vhost-user-gpu/virgl.c
| @@ -108,9 +108,16 @@ virgl_cmd_resource_unref(VuGpu *g,
|                           struct virtio_gpu_ctrl_command *cmd)
|  {
|      struct virtio_gpu_resource_unref unref;
| +    struct iovec *res_iovs = NULL;
| +    int num_iovs = 0;
|  
|      VUGPU_FILL_CMD(unref);
|  
| +    virgl_renderer_resource_detach_iov(unref.resource_id,
| +                                       &res_iovs,
| +                                       &num_iovs);
| +    g_free(res_iovs);
| +
|      virgl_renderer_resource_unref(unref.resource_id);

* Should this also call 'virtio_gpu_cleanup_mapping_iov' similar to 
  'hw/display/virtio-gpu-3d.c:virgl_cmd_resource_unref'?

    if (res_iovs != NULL && num_iovs != 0) {                                    
        virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);                  
    }


Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


