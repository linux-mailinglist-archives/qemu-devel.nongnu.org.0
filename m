Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEA3A76C2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 07:51:26 +0200 (CEST)
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt1yv-0006vT-V1
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 01:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt1yA-0006Ej-3N
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 01:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lt1y6-0005hL-M2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 01:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623736232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oQ8zDNnovT+la9ExgOD54BDQv/0NMDdVw/DJxS60UrM=;
 b=e2LkOiBAZ8cZcJkagNe9qDNBspdXFDmfyDecPYRxffAV8ajqtNNfF0SR0+hLFgcwAP5d9+
 HGv54wOqkdgvMcromNxD9bKpBjVk8dF0QU+licQ2ir3A0npfzTCSnZQJbtyr/yIGeHIZA5
 uffGEfoIYOv8QmDXGuN7CGI7CjGcqWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-lnJx2rCKN8elM39tnQO5Ng-1; Tue, 15 Jun 2021 01:50:29 -0400
X-MC-Unique: lnJx2rCKN8elM39tnQO5Ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96D471932481;
 Tue, 15 Jun 2021 05:50:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8421037E80;
 Tue, 15 Jun 2021 05:50:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF46D18000B2; Tue, 15 Jun 2021 07:50:26 +0200 (CEST)
Date: Tue, 15 Jun 2021 07:50:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 8/8] virtio-gpu: Add gl_flushed callback
Message-ID: <20210615055026.m5az4qqmvh72iwbc@sirius.home.kraxel.org>
References: <20210610224837.670192-1-vivek.kasireddy@intel.com>
 <20210610224837.670192-9-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210610224837.670192-9-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> -    if (!cmd->finished) {
> +    if (!cmd->finished && !(cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_FENCE)) {
>          virtio_gpu_ctrl_response_nodata(g, cmd, cmd->error ? cmd->error :
>                                          VIRTIO_GPU_RESP_OK_NODATA);
>      }

My idea would be more along the lines of ...

if (!cmd->finished) {
    if (renderer_blocked) {
       g->pending_completion = cmd;
    } else {
       virtio_gpu_ctrl_response_nodata(...)
    }
}

Then, when resuming processing after unblock check pending_completion
and call virtio_gpu_ctrl_response_nodata if needed.

Workflow:

virtio_gpu_simple_process_cmd()
 -> virtio_gpu_resource_flush()
   -> dpy_gfx_update()
     -> gd_gl_area_update()
        call graphic_hw_gl_block(true), create fence.
virtio_gpu_simple_process_cmd()
  -> will see renderer_blocked and delays RESOURCE_FLUSH completion.

Then, when the fence is ready, gtk will:
 - call graphic_hw_gl_block(false)
 - call graphic_hw_gl_flush()
   -> virtio-gpu resumes processing the cmd queue.

When you use the existing block/unblock functionality the fence can be a
gtk internal detail, virtio-gpu doesn't need to know that gtk uses a
fence to wait for the moment when it can unblock virtio queue processing
(the egl fence helpers still make sense).

take care,
  Gerd


