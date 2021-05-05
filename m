Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649A3735FC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:03:52 +0200 (CEST)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCVb-0003Wt-I9
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leCOC-0004os-In
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leCO8-0005be-5N
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620201363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y2tM4RGXH9pkvuvLKpxLpx/gWOAtqDjsVgUWFNKTogE=;
 b=TImLsg8F1M2zPkEbsZaLs+PWBDsgxfRfvl0OREm2DSeWEIdGBDFr3mTUa37LVUwQa13C5h
 HIKoO4l5NW4UewffH5SMyjzPquyiA6l35Z9fqY30So6dhV6hdT6+KsC/AdRvSBrk7JXP9q
 gTVIRS4KlqdDEnqXlBi/PmYeC8B8naA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-TsOoIarzO5-w6RY8VCcTQg-1; Wed, 05 May 2021 03:56:02 -0400
X-MC-Unique: TsOoIarzO5-w6RY8VCcTQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5750D8189DA;
 Wed,  5 May 2021 07:56:01 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE4F5D9DE;
 Wed,  5 May 2021 07:55:51 +0000 (UTC)
Date: Wed, 5 May 2021 13:25:49 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH 6/7] vhost-user-gpu: fix memory leak in
 'virgl_resource_attach_backing'
In-Reply-To: <20210505045824.33880-7-liq3ea@163.com>
Message-ID: <qq3n3949-n544-no21-649q-rqq0r7569n19@erqung.pbz>
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-7-liq3ea@163.com>
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
| diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
| index c669d73a1d..a16a311d80 100644
| --- a/contrib/vhost-user-gpu/virgl.c
| +++ b/contrib/vhost-user-gpu/virgl.c
| @@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,
|          return;
|      }
|  
| -    virgl_renderer_resource_attach_iov(att_rb.resource_id,
| +    ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
|                                         res_iovs, att_rb.nr_entries);
| +    if (ret != 0) {
| +        g_free(res_iovs);
| +    }
|  }

* Similar to earlier, 
  hw/display/virtio-gpu-3d.c:virgl_resource_attach_backing() calls 
  'virtio_gpu_cleanup_mapping_iov'

* should it be same for vhost-user-gpu?


Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


