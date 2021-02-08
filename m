Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A09E313B26
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:42:12 +0100 (CET)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AY7-0005Xq-BP
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94AK-0001bD-D8
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:53:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l949z-0000UW-Ht
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612781567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6OXDdQ4c5EZdpIofaJRtdaDaBD4ON4b9UYk/e3ZDmaY=;
 b=XoePkCxUn61ErR8OcgzlJqmNrY1ZJCy1zEgeBFQp/8n1BS5flpNdTdsLso8um5LoVdQLWp
 OExQKNQHVCqhthq0kcd7VLhebIUQYpXDPdbG5DZDsmeVsbTJBwR85KU7uwlZiRjmocH4od
 eMXvrpfXox+lUme2ImiBlhCIy+ROKn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-kLJvd9QeMWKBrCV_ie58kA-1; Mon, 08 Feb 2021 05:52:45 -0500
X-MC-Unique: kLJvd9QeMWKBrCV_ie58kA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58F6A107ACC7;
 Mon,  8 Feb 2021 10:52:44 +0000 (UTC)
Received: from work-vm (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A36B65B4B5;
 Mon,  8 Feb 2021 10:52:35 +0000 (UTC)
Date: Mon, 8 Feb 2021 10:52:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jinhao Gao <gaojinhao@huawei.com>
Subject: Re: [PATCH v3 3/3] vmstate: Fix memory leak in vmstate_handle_alloc()
Message-ID: <20210208105232.GA3033@work-vm>
References: <20201231061020.828-1-gaojinhao@huawei.com>
 <20201231061020.828-4-gaojinhao@huawei.com>
 <20210105111818.GA2945@work-vm>
MIME-Version: 1.0
In-Reply-To: <20210105111818.GA2945@work-vm>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Jinhao Gao (gaojinhao@huawei.com) wrote:
> > Some memory allocated for fields having a flag of VMS_ALLOC in SaveState
> > may not free before VM load vmsd in migration. So we pre-free memory before
> > allocation in vmstate_handle_alloc() to avoid memleaks.
> > 
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Yes, I think that's OK; it's actually pretty rare for this to happen;
> normally inwards migrations either succeed or fail and exit; doing
> multiple loads from snapshots is valid and I guess COLO hits this as well.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

I'm having to unqueue this because it's triggering a seg fault on Power
in iotest 267 (just run make check).

#2  0x0000000116d0d4c8 in vmstate_handle_alloc (opaque=<optimized out>, field=0x11799e0c8 <__compound_literal.1+312>, ptr=0x1001f8f14b0) at ../qemu/migration/vmstate.c:73
#3  0x0000000116d0d4c8 in vmstate_load_state (f=0x1001f6d0000, vmsd=0x117928730 <vmstate_spapr_tce_table>, opaque=0x1001f8f1400, version_id=<optimized out>) at ../qemu/migration/vmstate.c:122
#4  0x0000000116fb4a4c in vmstate_load (f=0x1001f6d0000, se=0x1001fc7bc40) at ../qemu/migration/savevm.c:910
#5  0x0000000116fb5010 in qemu_loadvm_section_start_full (f=f@entry=0x1001f6d0000, mis=<optimized out>) at ../qemu/migration/savevm.c:2433

It's the mig_nb_table that Power is doing some special
handling with; so it needs some more checking before
we can fix this.

Dave

> > ---
> >  migration/vmstate.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/migration/vmstate.c b/migration/vmstate.c
> > index e9d2aef66b..873f76739f 100644
> > --- a/migration/vmstate.c
> > +++ b/migration/vmstate.c
> > @@ -70,6 +70,7 @@ static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
> >          gsize size = vmstate_size(opaque, field);
> >          size *= vmstate_n_elems(opaque, field);
> >          if (size) {
> > +            g_free(*(void **)ptr);
> >              *(void **)ptr = g_malloc(size);
> >          }
> >      }
> > -- 
> > 2.23.0
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


