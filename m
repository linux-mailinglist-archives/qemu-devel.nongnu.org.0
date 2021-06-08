Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0D939FE19
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:47:17 +0200 (CEST)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfop-0001gk-5k
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqfkI-0006Dq-DM
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:42:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqfkG-0000nY-Kz
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623174151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HpfVA9MK7g1GpzAcuThhM7nvCV3pzPDeKIPIvtHlErs=;
 b=gzHQnbSCXOp7h+MFmY7biIo+dJQyvNauWLfxNL5clbjerHa8xH+TdrR8sj+rssznJsZ0sg
 RWhXQ65eqHUxq2Ym375C7tS8SvHEjxa6PVtQAXdaH6Lli6twxxgDdouZ5UtiCRzHdUN5Cj
 Yv5/1+d+R3i1hhFBy7zx2zyh227q1nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-TT71fOxWM2O4wAKhgTQb_w-1; Tue, 08 Jun 2021 13:42:27 -0400
X-MC-Unique: TT71fOxWM2O4wAKhgTQb_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60881020C33;
 Tue,  8 Jun 2021 17:42:26 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AECF5C1BB;
 Tue,  8 Jun 2021 17:42:23 +0000 (UTC)
Date: Tue, 8 Jun 2021 12:42:21 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 2/7] scsi-generic: pass max_segments via max_iov field
 in BlockLimits
Message-ID: <20210608174221.lu6pgbpai6xtaqwk@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608131634.423904-3-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 03:16:29PM +0200, Paolo Bonzini wrote:
> I/O to a disk via read/write is not limited by the number of segments allowed
> by the host adapter; the kernel can split requests if needed, and the limit
> imposed by the host adapter can be very low (256k or so) to avoid that SG_IO
> returns EINVAL if memory is heavily fragmented.

to avoid SG_IO returning EINVAL

> 
> Since this value is only interesting for SG_IO-based I/O, do not include
> it in the max_transfer and only take it into account when patching the
> block limits VPD page in the scsi-generic device.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c     | 3 +--
>  hw/scsi/scsi-generic.c | 6 ++++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


