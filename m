Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC8B30F4EB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:28:48 +0100 (CET)
Received: from localhost ([::1]:54410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fcl-0003DZ-6D
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7fbB-0002eV-7d
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7fb9-0003CM-Et
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612448826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DutrP1uz4kRrDww2uWDkP07dwE4u2Gj+H3DrU0icnVU=;
 b=aLUUgLYC1LRhsYXziSHqZookmDpoMkDIQDYu8On8b4IFz/UDWoYK5xk4naYjkVc1t0ckqr
 Q10vZb1+LjNs9vjs+NCzahMwVllehZYYP9+Nr/Yyy37j+o+R1r92cYOsIw/1p8zZEphp2+
 xP0aR7l2BzWoBYYjl5t0qVC5OEUnBzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-bAWLhdymNu2Sbtr71y8X1A-1; Thu, 04 Feb 2021 09:27:05 -0500
X-MC-Unique: bAWLhdymNu2Sbtr71y8X1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F0AA107ACE6;
 Thu,  4 Feb 2021 14:27:03 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9344A514BC;
 Thu,  4 Feb 2021 14:26:53 +0000 (UTC)
Date: Thu, 4 Feb 2021 14:26:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jinhao Gao <gaojinhao@huawei.com>
Subject: Re: [PATCH v3 0/3] Fix memory leak of some device state in migration
Message-ID: <20210204142650.GA24147@work-vm>
References: <20201231061020.828-1-gaojinhao@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201231061020.828-1-gaojinhao@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jinhao Gao (gaojinhao@huawei.com) wrote:
> For some device state having some fields of VMS_ALLOC flag, they
> don't free memory allocated for the fields in vmstate_save_state
> and vmstate_load_state. We add funcs or sentences of free memory
> before and after VM saves or loads device state to avoid memory leak.

Queued

> 
> v2
>  - Drop patch1-3,6-8 of v1
>  - Address Michael's comment (free memory before load vmsd centrally)
>  - Add David's Acked-by and Michael's Signed-off-by
> 
> v3
>  - Add Euler's Reported-by and Michael's Reviewed-by
> 
> Jinhao Gao (3):
>   spapr_pci: Fix memory leak of vmstate_spapr_pci
>   savevm: Fix memory leak of vmstate_configuration
>   vmstate: Fix memory leak in vmstate_handle_alloc()
> 
>  hw/ppc/spapr_pci.c  | 11 +++++++++++
>  migration/savevm.c  | 31 +++++++++++++++++++++++++++----
>  migration/vmstate.c |  1 +
>  3 files changed, 39 insertions(+), 4 deletions(-)
> 
> -- 
> 2.23.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


