Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D13735FA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:02:16 +0200 (CEST)
Received: from localhost ([::1]:40180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCU3-0001Hm-TQ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leCQh-0006pB-HI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:58:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leCQf-0006j5-6j
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620201524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzdXZ7GLrK/6KhTBT+hzrf7kzmwM6qSDVehMFMD6LgU=;
 b=iMifi1PhG+xbCkHZLK/EnqOvJ6RyfI7SZuvTkTcP538+Pw4cu3dtLzuF3dI297XnD4I9NX
 VRNagIRLEawcaPOud+uUFGM/hNcbF1fXbL3w2ySYNpgyMex8u/eSA4U4SFH1Snba4bBjlG
 qDzZRuQ8dJXF7G4E2QcoDXJdd/tNnkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-RfPMyMYeOAaOunujsbX6TQ-1; Wed, 05 May 2021 03:58:42 -0400
X-MC-Unique: RfPMyMYeOAaOunujsbX6TQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B700510066E5;
 Wed,  5 May 2021 07:58:41 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3A7C5C3E0;
 Wed,  5 May 2021 07:58:32 +0000 (UTC)
Date: Wed, 5 May 2021 13:28:30 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH 7/7] vhost-user-gpu: fix OOB write in
 'virgl_cmd_get_capset'
In-Reply-To: <20210505045824.33880-8-liq3ea@163.com>
Message-ID: <743pnq4o-qs68-r754-20p4-8r5nr349ro9@erqung.pbz>
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-8-liq3ea@163.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
| If 'virgl_cmd_get_capset' set 'max_size' to 0,
| the 'virgl_renderer_fill_caps' will write the data after the 'resp'.
| This patch avoid this by checking the returned 'max_size'.
| 
| Signed-off-by: Li Qiang <liq3ea@163.com>
| ---
|  contrib/vhost-user-gpu/virgl.c | 4 ++++
|  1 file changed, 4 insertions(+)
| 
| diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
| index a16a311d80..7172104b19 100644
| --- a/contrib/vhost-user-gpu/virgl.c
| +++ b/contrib/vhost-user-gpu/virgl.c
| @@ -177,6 +177,10 @@ virgl_cmd_get_capset(VuGpu *g,
|  
|      virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
|                                 &max_size);
| +    if (!max_size) {
| +        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
| +        return;
| +    }
|      resp = g_malloc0(sizeof(*resp) + max_size);
|  
|      resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;

* Looks okay.

Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>

Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


