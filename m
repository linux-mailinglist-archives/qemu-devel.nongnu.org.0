Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F162DBBEF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 08:26:29 +0100 (CET)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpRCe-0002Xs-2A
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 02:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kpRAZ-0001wu-LF
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:24:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kpRAU-0006J5-FU
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 02:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608103452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HhY7pZAp+jq0qbHXvEw7A+INyJm/1/hBSkcL6a2jzoE=;
 b=BsxLBNB+EXbPP8qu2bkFG6bzbHLgac7enzzv+U6g4UgXEvfhhDY37J9IACr5/eJGz9Ldnf
 XjJOdWuyPYKcbzQZioUtyABfvbBem0/8CPrHvY5+d4I2a9tK+9PPNtiRNZKGqkcsDNMAFX
 KIJOAHrDtwcxb0pzAIydFPqbXfd4P4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-Hr_wFm5QM0Su50GXNV2CAA-1; Wed, 16 Dec 2020 02:24:09 -0500
X-MC-Unique: Hr_wFm5QM0Su50GXNV2CAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6781107AD24;
 Wed, 16 Dec 2020 07:24:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E19566F926;
 Wed, 16 Dec 2020 07:24:01 +0000 (UTC)
Date: Wed, 16 Dec 2020 08:23:58 +0100
From: Andrew Jones <drjones@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH 2/2] accel: kvm: Add aligment check for
 kvm_log_clear_one_slot
Message-ID: <20201216072358.bmac5twmtoyxcna3@kamzik.brq.redhat.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-3-zhukeqian1@huawei.com>
 <20201215115541.vgbt7aaiueyw7ury@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201215115541.vgbt7aaiueyw7ury@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 12:55:50PM +0100, Andrew Jones wrote:
> On Tue, Dec 15, 2020 at 03:19:48PM +0800, Keqian Zhu wrote:
> > The parameters start and size are transfered from QEMU memory
> > emulation layer. It can promise that they are TARGET_PAGE_SIZE
> > aligned. However, KVM needs they are qemu_real_page_size aligned.
> > 
> > Though no caller breaks this aligned requirement currently, we'd
> > better add an explicit check to avoid future breaking.
> > 
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > ---
> >  accel/kvm/kvm-all.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > index c5e06288eb..3d0e3aa872 100644
> > --- a/accel/kvm/kvm-all.c
> > +++ b/accel/kvm/kvm-all.c
> > @@ -701,6 +701,11 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
> >      unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
> >      int ret;
> >  
> > +    /* Make sure start and size are psize aligned */
> > +    if (!QEMU_IS_ALIGNED(start, psize) || !QEMU_IS_ALIGNED(size, psize)) {
> > +        return -EINVAL;
> > +    }
> > +
> >      /*
> >       * We need to extend either the start or the size or both to
> >       * satisfy the KVM interface requirement.  Firstly, do the start
> > -- 
> > 2.23.0
> > 
> >
> 
> It's not clear to me that this function has any restrictions on start
> and size. If it does, then please document those restrictions in the
> function's header and assert rather than return.
>

Also, I see this patch is on its way in

https://patchwork.ozlabs.org/project/qemu-devel/patch/20201215175445.1272776-27-pbonzini@redhat.com/

Thanks,
drew 


