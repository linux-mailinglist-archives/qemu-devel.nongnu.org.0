Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31723735BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:43:23 +0200 (CEST)
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCBn-0001MO-21
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leC8D-0005PK-8t
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leC8A-0004C2-JJ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620200377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DZpkTsHu6MG9G8x+wdLJkInSI7ql47GoO05yabw5CA=;
 b=ZJdbSOnIlpjVPcwLm36ARlwlzGpTwqggBqnSZe7Hahxz9DGWfKoWbHg1nPLxWUFhfVQjh5
 2iIQ0T9jAFL0Fre2wRqgyYoiW0ZoTtZTrWmA8jFjOL/gHN4oQFIRTIPG4KcS0BeBsn/zks
 /85+RPix7FzqUOWjEIw0RG8F71GzQIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-goqgpbSeMqullor7IrN2xg-1; Wed, 05 May 2021 03:39:35 -0400
X-MC-Unique: goqgpbSeMqullor7IrN2xg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 145B1835DE0;
 Wed,  5 May 2021 07:39:35 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B038A59446;
 Wed,  5 May 2021 07:39:26 +0000 (UTC)
Date: Wed, 5 May 2021 13:09:24 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH 3/7] vhost-user-gpu: fix memory leak in
 vg_resource_attach_backing
In-Reply-To: <20210505045824.33880-4-liq3ea@163.com>
Message-ID: <69s57r0-9534-294-p4ns-o56p9698o9p@erqung.pbz>
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-4-liq3ea@163.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppandit@redhat.com;
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
| Check whether the 'res' has already been attach_backing to avoid
| memory leak.
| 
| Signed-off-by: Li Qiang <liq3ea@163.com>
| ---
|  contrib/vhost-user-gpu/vhost-user-gpu.c | 5 +++++
|  1 file changed, 5 insertions(+)
| 
| diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
| index b5e153d0d6..0437e52b64 100644
| --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
| +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
| @@ -489,6 +489,11 @@ vg_resource_attach_backing(VuGpu *g,
|          return;
|      }
|  
| +    if (res->iov) {
| +        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
| +        return;
| +    }
| +
|      ret = vg_create_mapping_iov(g, &ab, cmd, &res->iov);
|      if (ret != 0) {
|          cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;


* While it'll work, should the check be done by 'virtio_gpu_find_resource()' 
  before returning 'res' ? ie. if 'res->iov' is being used, then it's similar 
  case as 'illegal resource specified %d'.


Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


