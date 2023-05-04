Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B4E6F7803
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 23:26:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pugSF-0008Vv-6j; Thu, 04 May 2023 17:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pugSD-0008VL-55
 for qemu-devel@nongnu.org; Thu, 04 May 2023 17:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pugSB-0003mI-GZ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 17:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683235526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EXBTvckOEwAXoXWbpnPFajVuZsPXxwBJqTqoZHV9JvQ=;
 b=LwCDJtdyWLZA3JVOSPOIeAXl/ZUD1kgOc4Lza7nDs26nCJ9MF70UYJFeGo24EDRSLvlOv5
 S2zC9g9M6xfWbvcQlH8epki8No3YMh73QaY4Ibwkh+EazYQ4YRdU5nQpLnIIwzQHgKPgZ8
 O4bR8X0YGQFItSbTy+hHc6sAS8t66P8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-0JHXhtIDOzGjIqozYKIm0A-1; Thu, 04 May 2023 17:25:23 -0400
X-MC-Unique: 0JHXhtIDOzGjIqozYKIm0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB301185A78B;
 Thu,  4 May 2023 21:25:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EA6640C2064;
 Thu,  4 May 2023 21:25:18 +0000 (UTC)
Date: Thu, 4 May 2023 23:25:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 18/20] virtio-scsi: implement
 BlockDevOps->drained_begin()
Message-ID: <ZFQivbkVPcX3nECA@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-19-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425172716.1033562-19-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> The virtio-scsi Host Bus Adapter provides access to devices on a SCSI
> bus. Those SCSI devices typically have a BlockBackend. When the
> BlockBackend enters a drained section, the SCSI device must temporarily
> stop submitting new I/O requests.
> 
> Implement this behavior by temporarily stopping virtio-scsi virtqueue
> processing when one of the SCSI devices enters a drained section. The
> new scsi_device_drained_begin() API allows scsi-disk to message the
> virtio-scsi HBA.
> 
> scsi_device_drained_begin() uses a drain counter so that multiple SCSI
> devices can have overlapping drained sections. The HBA only sees one
> pair of .drained_begin/end() calls.
> 
> After this commit, virtio-scsi no longer depends on hw/virtio's
> ioeventfd aio_set_event_notifier(is_external=true). This commit is a
> step towards removing the aio_disable_external() API.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

> @@ -206,9 +208,11 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
>      }
>      s->dataplane_stopping = true;
>  
> -    aio_context_acquire(s->ctx);
> -    aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
> -    aio_context_release(s->ctx);
> +    if (s->bus.drain_count == 0) {
> +        aio_context_acquire(s->ctx);
> +        aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
> +        aio_context_release(s->ctx);
> +    }

Same question as for virtio-blk: We lose processing the virtqueue one
last time during drain. Is it okay, and if so, why do we need it outside
of drain?

Kevin


