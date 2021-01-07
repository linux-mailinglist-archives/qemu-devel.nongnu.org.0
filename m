Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFE2ECDC3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:28:18 +0100 (CET)
Received: from localhost ([::1]:33942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSWf-0001Hy-Kl
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSV0-0008PE-FG
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSUy-0008AU-Sa
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610015192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ohmst3GpGrysVw6ANXrUt9h8rLdLADk3X6Z0T3B/+l0=;
 b=RYyXpjx+6tPdlVRFe3/oqDZb6a2oh8rP0gBE9WbFvtydp35zC8scMSiHPkbkteSriAwJpt
 NzA/xLn1QWeAJRJa9zVrR57KbdNbi59AvwdzLaAiP9u3QBNNu8PiROQmMY0HRJ1DgJgyv2
 ONLJSpIelqT8iU9wF1p+RDA20tCrWug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-sYZ6pOeSMdKA1i3_l9WD7g-1; Thu, 07 Jan 2021 05:26:30 -0500
X-MC-Unique: sYZ6pOeSMdKA1i3_l9WD7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A1988030A0;
 Thu,  7 Jan 2021 10:26:29 +0000 (UTC)
Received: from starship (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 476FE36FA;
 Thu,  7 Jan 2021 10:26:22 +0000 (UTC)
Message-ID: <e585bbd63a52a4226a7e96f5b83503637f19a744.camel@redhat.com>
Subject: Re: [PATCH 0/3] RFC: few random hacks to improve eventfd fallback path
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 07 Jan 2021 12:26:21 +0200
In-Reply-To: <20201217150040.906961-1-mlevitsk@redhat.com>
References: <20201217150040.906961-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-12-17 at 17:00 +0200, Maxim Levitsky wrote:
> These few patches are the result of a random hacking I did to make the qemu
> cope with eventfd allocation failure, when using an iothread,
> as it happened in bz #1897550.
> 
> I am not 100% sure which patches in this series are worth to merge, or if
> this can be fixed in a better way.
> 
> After this patch series applied, qemu still hangs while running reproducer for
> this BZ due to ABBA lock inversion which needs some heavy rework to get rid of.
> I explained all the (gory) details in the bugzilla.
> 
> This patch series was (lightly) tested with make check, iotests and with
> the reproducer.
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (3):
>   scsi: virtio-scsi: don't process IO on fenced dataplane
>   virtio-scsi: don't uninitialize queues that we didn't initialize
>   event_notifier: handle initialization failure better
> 
>  hw/scsi/virtio-scsi-dataplane.c | 26 +++++++++++++++++++-------
>  include/qemu/event_notifier.h   |  1 +
>  util/event_notifier-posix.c     | 16 ++++++++++++++++
>  3 files changed, 36 insertions(+), 7 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
Any update on this?
Best regards,
	Maxim Levitsky


