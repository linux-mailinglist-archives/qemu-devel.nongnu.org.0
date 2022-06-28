Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7056155E1C9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:34:27 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BMH-0005Py-W0
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o6BA0-0007Nt-7F
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o6B9y-0001nm-Ms
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656422502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zC9+0sb/q98yo5YEHfDzQcbT2JgCVY6SF0jdjucpuEA=;
 b=YeV4SIYEZjvIwGpxp38xJzsJQ/EqMjM0OCRizn5uNgnm0JRJKC+kEwvDB0rL/rmm7qUEb2
 ikLV+66duEvw2j7sUW81VE5gILG84nYQWz62fX7Ic+VQxQoy+OPrtmC4Sb0uS4HlHvpy/F
 ISnOaBlDuzo5DIOaW/xQ/Tnh97CUmeg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-nK9W6GJ6NIaAdXX1IDcSmQ-1; Tue, 28 Jun 2022 09:21:38 -0400
X-MC-Unique: nK9W6GJ6NIaAdXX1IDcSmQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58C22801E6B;
 Tue, 28 Jun 2022 13:21:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14438492CA3;
 Tue, 28 Jun 2022 13:21:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH 02/12] pc-bios/s390-ccw/virtio: Introduce a macro for
 the DASD block size
In-Reply-To: <20220628131032.213986-3-thuth@redhat.com>
Organization: Red Hat GmbH
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-3-thuth@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Tue, 28 Jun 2022 15:21:36 +0200
Message-ID: <87wnd0c49r.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28 2022, Thomas Huth <thuth@redhat.com> wrote:

> Use VIRTIO_DASD_BLOCK_SIZE instead of the magic value 4096.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/virtio.h        | 1 +
>  pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
> index 19fceb6495..c2c17c29ca 100644
> --- a/pc-bios/s390-ccw/virtio.h
> +++ b/pc-bios/s390-ccw/virtio.h
> @@ -198,6 +198,7 @@ extern int virtio_read_many(ulong sector, void *load_addr, int sec_num);
>  #define VIRTIO_SECTOR_SIZE 512
>  #define VIRTIO_ISO_BLOCK_SIZE 2048
>  #define VIRTIO_SCSI_BLOCK_SIZE 512
> +#define VIRTIO_DASD_BLOCK_SIZE 4096
>  
>  static inline ulong virtio_sector_adjust(ulong sector)
>  {
> diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
> index 7d35050292..49ed2b4bee 100644
> --- a/pc-bios/s390-ccw/virtio-blkdev.c
> +++ b/pc-bios/s390-ccw/virtio-blkdev.c
> @@ -155,7 +155,7 @@ void virtio_assume_eckd(void)
>      vdev->config.blk.physical_block_exp = 0;
>      switch (vdev->senseid.cu_model) {
>      case VIRTIO_ID_BLOCK:
> -        vdev->config.blk.blk_size = 4096;
> +        vdev->config.blk.blk_size = VIRTIO_DASD_BLOCK_SIZE;
>          break;
>      case VIRTIO_ID_SCSI:
>          vdev->config.blk.blk_size = vdev->scsi_block_size;

Unrelated to this change, but can't dasd be formatted with other block
sizes as well?


