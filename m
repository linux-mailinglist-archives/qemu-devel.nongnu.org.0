Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B452564DD4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 08:42:25 +0200 (CEST)
Received: from localhost ([::1]:52276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Fmo-00084e-PW
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 02:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o8Fjp-0007HP-VO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o8Fjl-0004mz-3N
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656916751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2pdVxtfjTdmwf4oDklr1LUkJIbnrOyq/CaHnBuXUOFA=;
 b=VeJmnAbokhclCtmGCL6y2WNVEdurPpwH4SpsFSPV33v9kQNoH++FrJN+/Cu8Hk1ib+QRU+
 0h6iny5Gm1iVIkFV5rf8Nois9HEpIQHMiMcd6JSzAhRZj6BRmFwiQyAAt4SYkHQYJ+EQNp
 F7/rDLwaXPtB7cTq8heHeLHkO8Cemdo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-01yKD4dvNfC0Z5Ib34rDXQ-1; Mon, 04 Jul 2022 02:39:08 -0400
X-MC-Unique: 01yKD4dvNfC0Z5Ib34rDXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F1643C01DAA;
 Mon,  4 Jul 2022 06:39:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C981C1121315;
 Mon,  4 Jul 2022 06:39:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH 02/12] pc-bios/s390-ccw/virtio: Introduce a macro for
 the DASD block size
In-Reply-To: <907d519e-8286-52bd-be45-90c2e8fd332c@redhat.com>
Organization: Red Hat GmbH
References: <20220628131032.213986-1-thuth@redhat.com>
 <20220628131032.213986-3-thuth@redhat.com> <87wnd0c49r.fsf@redhat.com>
 <907d519e-8286-52bd-be45-90c2e8fd332c@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Mon, 04 Jul 2022 08:39:06 +0200
Message-ID: <87a69p2xh1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Jul 02 2022, Thomas Huth <thuth@redhat.com> wrote:

> On 28/06/2022 15.21, Cornelia Huck wrote:
>> On Tue, Jun 28 2022, Thomas Huth <thuth@redhat.com> wrote:
>> 
>>> Use VIRTIO_DASD_BLOCK_SIZE instead of the magic value 4096.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   pc-bios/s390-ccw/virtio.h        | 1 +
>>>   pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
>>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
>>> index 19fceb6495..c2c17c29ca 100644
>>> --- a/pc-bios/s390-ccw/virtio.h
>>> +++ b/pc-bios/s390-ccw/virtio.h
>>> @@ -198,6 +198,7 @@ extern int virtio_read_many(ulong sector, void *load_addr, int sec_num);
>>>   #define VIRTIO_SECTOR_SIZE 512
>>>   #define VIRTIO_ISO_BLOCK_SIZE 2048
>>>   #define VIRTIO_SCSI_BLOCK_SIZE 512
>>> +#define VIRTIO_DASD_BLOCK_SIZE 4096
>>>   
>>>   static inline ulong virtio_sector_adjust(ulong sector)
>>>   {
>>> diff --git a/pc-bios/s390-ccw/virtio-blkdev.c b/pc-bios/s390-ccw/virtio-blkdev.c
>>> index 7d35050292..49ed2b4bee 100644
>>> --- a/pc-bios/s390-ccw/virtio-blkdev.c
>>> +++ b/pc-bios/s390-ccw/virtio-blkdev.c
>>> @@ -155,7 +155,7 @@ void virtio_assume_eckd(void)
>>>       vdev->config.blk.physical_block_exp = 0;
>>>       switch (vdev->senseid.cu_model) {
>>>       case VIRTIO_ID_BLOCK:
>>> -        vdev->config.blk.blk_size = 4096;
>>> +        vdev->config.blk.blk_size = VIRTIO_DASD_BLOCK_SIZE;
>>>           break;
>>>       case VIRTIO_ID_SCSI:
>>>           vdev->config.blk.blk_size = vdev->scsi_block_size;
>> 
>> Unrelated to this change, but can't dasd be formatted with other block
>> sizes as well?
>
> You're right, "dasdfmt" has a parameter for this. Shall I rename the macro 
> to VIRTIO_DASD_DEFAULT_BLOCK_SIZE ?

Sounds good to me.


