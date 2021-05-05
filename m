Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90187373587
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:25:50 +0200 (CEST)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBun-0001bD-2M
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leBtA-0000J8-V1
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1leBt8-0002vl-G5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620199444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BYTBUNDvhtr+QhpXoCalZId5DdOEDxvoy8rRzubkD5o=;
 b=ByOIAeLWgXA+PF040yIyoqnr+nlxjbrYmMXqAUE7tOFz98rW91foegav1A8O6LewKJBvfR
 Ip+4q2j2g+CziA8F9QvOrNsEGfn5OglA8TCaG/ltAhpsUxN6t5Dq/xfpTXHoGCeeDjXuAg
 UH/oVgOGKxoBMCY+kFn8QlnkjNedOPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-Gmwqq7pfOSmV1JGlf51t0w-1; Wed, 05 May 2021 03:24:03 -0400
X-MC-Unique: Gmwqq7pfOSmV1JGlf51t0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1D451854E26;
 Wed,  5 May 2021 07:24:01 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 482F56062C;
 Wed,  5 May 2021 07:23:51 +0000 (UTC)
Date: Wed, 5 May 2021 12:53:49 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH 1/7] vhost-user-gpu: fix memory disclosure in
 virgl_cmd_get_capset_info
In-Reply-To: <20210505045824.33880-2-liq3ea@163.com>
Message-ID: <8o22o26q-9342-o822-2758-372s9s59r2qn@erqung.pbz>
References: <20210505045824.33880-1-liq3ea@163.com>
 <20210505045824.33880-2-liq3ea@163.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
| Otherwise some of the 'resp' will be leaked to guest.
| 
| diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
| index 9e6660c7ab..6a332d601f 100644
|  
| +    memset(&resp, 0, sizeof(resp));
|      if (info.capset_index == 0) {
|          resp.capset_id = VIRTIO_GPU_CAPSET_VIRGL;
|          virgl_renderer_get_cap_set(resp.capset_id,

-   vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+   vg_ctrl_response(g, cmd, &resp.hdr, sizeof(resp.hdr));

* While memset(3) is okay, should it also send header(hdr) size as 'resp_len'?


Thank you.
--
 - P J P
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


