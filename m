Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD4373598
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:30:20 +0200 (CEST)
Received: from localhost ([::1]:57526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBz9-0006JT-Vd
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leBxX-0005T8-4F
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leBxS-0005nd-To
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620199713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zuL0tvqjMBhFvISh46+utKCCHL2S+L8EwZg11aF3j+I=;
 b=Ov22t3AJcbLXfusO9q4BRnyyixY2plReTFMvnB1JoHvuPuJBlsTMX86eLOiHGfOq+TEscB
 CX6xcO82WZpqcg/LIgVHEQE+m+atTqz5IPV0Q5JKhiiwKKaTeRiSbkIN43/F+DX8LDGjI5
 pfic4aPoio1DdAWct2rydX4p0TO514E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-qFKsssO3NP2RCTQjJkAYrQ-1; Wed, 05 May 2021 03:28:31 -0400
X-MC-Unique: qFKsssO3NP2RCTQjJkAYrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74DC86414C;
 Wed,  5 May 2021 07:28:30 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A75F8610DF;
 Wed,  5 May 2021 07:28:21 +0000 (UTC)
Date: Wed, 5 May 2021 12:58:19 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH 2/7] vhost-user-gpu: fix resource leak in
 'vg_resource_create_2d'
In-Reply-To: <20210505045824.33880-3-liq3ea@163.com>
Message-ID: <nq21421n-o484-q2q6-np2n-qqop966oqn3@erqung.pbz>
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-3-liq3ea@163.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
| Call 'vugbm_buffer_destroy' in error path to avoid resource leak.
| 
| Signed-off-by: Li Qiang <liq3ea@163.com>
| ---
|  contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
|  1 file changed, 1 insertion(+)
| 
| diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
| index f73f292c9f..b5e153d0d6 100644
| --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
| +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
| @@ -349,6 +349,7 @@ vg_resource_create_2d(VuGpu *g,
|          g_critical("%s: resource creation failed %d %d %d",
|                     __func__, c2d.resource_id, c2d.width, c2d.height);
|          g_free(res);
| +        vugbm_buffer_destroy(&res->buffer);
|          cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
|          return;
|      }

* Looks good.

Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>

Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


