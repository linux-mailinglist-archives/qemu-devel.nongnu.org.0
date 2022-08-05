Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C258A9A8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:48:17 +0200 (CEST)
Received: from localhost ([::1]:43050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJusJ-0001mL-70
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oJuLV-0004pW-KB
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:14:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oJuLQ-0006ra-Pw
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659694455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gC67k+11SVEN7I5PZYi44RT9oEl/9YA6nhjkchv00Uc=;
 b=I0PNbDPOroSyx+zNIV5neAyskftjseRhvtkSxriYyOJB4VCvCbOSwdHBDgKxS1Om71/7zA
 j5UH4EruSvJ8bdQMXM7GQ4IUseRfT/p5pVmkxpwnCTGIoNXfxOKCikeGA1+bUmlvZMvXHg
 MD5Kiazaa87NhtjdZwyXV8umi5geWS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-617RlTc1OgKXeydzMjziwQ-1; Fri, 05 Aug 2022 06:14:12 -0400
X-MC-Unique: 617RlTc1OgKXeydzMjziwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F7B5803520;
 Fri,  5 Aug 2022 10:14:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F122C1121315;
 Fri,  5 Aug 2022 10:14:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Fix booting with logical block size <
 physical block size
In-Reply-To: <20220805094214.285223-1-thuth@redhat.com>
Organization: Red Hat GmbH
References: <20220805094214.285223-1-thuth@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 05 Aug 2022 12:14:10 +0200
Message-ID: <875yj780b1.fsf@redhat.com>
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

On Fri, Aug 05 2022, Thomas Huth <thuth@redhat.com> wrote:

> For accessing single blocks during boot, it's the logical block size that
> matters. (Physical block sizes are rather interesting e.g. for creating
> file systems with the correct alignment for speed reasons etc.).
> So the s390-ccw bios has to use the logical block size for calculating
> sector numbers during the boot phase, the "physical_block_exp" shift
> value must not be taken into account. This change fixes the boot process
> when the guest hast been installed on a disk where the logical block size
> differs from the physical one, e.g. if the guest has been installed
> like this:
>
>  qemu-system-s390x -nographic -accel kvm -m 2G \
>   -drive if=none,id=d1,file=fedora.iso,format=raw,media=cdrom \
>   -device virtio-scsi -device scsi-cd,drive=d1 \
>   -drive if=none,id=d2,file=test.qcow2,format=qcow2
>   -device virtio-blk,drive=d2,physical_block_size=4096,logical_block_size=512
>
> Linux correctly uses the logical block size of 512 for the installation,
> but the s390-ccw bios tries to boot from a disk with 4096 block size so
> far, as long as this patch has not been applied yet (well, it used to work
> by accident in the past due to the virtio_assume_scsi() hack that used to
> enforce 512 byte sectors on all virtio-block disks, but that hack has been
> well removed in commit 5447de2619050a0a4d to fix other scenarios).

I wonder whether there's more stuff lurking in there; the old code seems
to have "worked" in many cases by accident, and cleaning up things might
expose more odd code. Generally, reading ccw bios code gives me a
headache :)

>
> Fixes: 5447de2619 ("pc-bios/s390-ccw/virtio-blkdev: Remove virtio_assume_scsi()")
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2112303
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/virtio-blkdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks sane to me.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


