Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA53735C3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:43:43 +0200 (CEST)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCC6-0001x7-Lp
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leCBC-0000uQ-1k
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:42:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leCBA-00061n-Dv
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620200563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ppEC4cCZIIzecBBRsFjSz/Ax5dz4Z6kcRZiiLBRxhs=;
 b=FWvEVOgEmIy2TbXVc+jHuYAxcMEGMtNLqAC1jEmJZ3wAUiCHszDJ65xGOf3I71XMZkHtGV
 TtnEUNwiWGjmWpJX7CMeJZpC+Xgca7/xvBHScVIb3kzJY1OmeWyRG51dhpslUIbJDWwNou
 NC7dQ4zDQagMwQ3tNOTghecipx18EM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Xz9Mi8DdNvO8cJlF2m1DiQ-1; Wed, 05 May 2021 03:42:42 -0400
X-MC-Unique: Xz9Mi8DdNvO8cJlF2m1DiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 671CF5137;
 Wed,  5 May 2021 07:42:41 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 413575D9C0;
 Wed,  5 May 2021 07:42:31 +0000 (UTC)
Date: Wed, 5 May 2021 13:12:29 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH 4/7] vhost-user-gpu: fix memory link while calling
 'vg_resource_unref'
In-Reply-To: <20210505045824.33880-5-liq3ea@163.com>
Message-ID: <o3ps33ps-5963-9328-3499-p78o795qos7p@erqung.pbz>
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-5-liq3ea@163.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
| If the guest trigger following sequences, the attach_backing will be leaked:
| 
| 	vg_resource_create_2d
| 	vg_resource_attach_backing
| 	vg_resource_unref
| 
| This patch fix this by freeing 'res->iov' in vg_resource_destroy.
| 
| Signed-off-by: Li Qiang <liq3ea@163.com>
| ---
|  contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
|  1 file changed, 1 insertion(+)
| 
| diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
| index 0437e52b64..770dfad529 100644
| --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
| +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
| @@ -400,6 +400,7 @@ vg_resource_destroy(VuGpu *g,
|      }
|  
|      vugbm_buffer_destroy(&res->buffer);
| +    g_free(res->iov);
|      pixman_image_unref(res->image);
|      QTAILQ_REMOVE(&g->reslist, res, next);
|      g_free(res);
| 

* Looks good.

Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>


Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


