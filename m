Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7A3BE930
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:01:37 +0200 (CEST)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m187M-0003me-E5
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1858-0001OT-Ln
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1855-0007TZ-IJ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625666354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MadjxsGDbdKUHx8jUoG0iz57JU4bjIy8deDXtnPk82E=;
 b=Atrh1pk1sy4pxJVdT5o2E6C1hfcFHn14l2i1Gj0aKxzwKtDXpeLZHgATaVWEG03Xt6wiZp
 eGoIKRt9kM9VVZ4wu2VOnjYkxRVS8+ahfvpG/H63Ko7QferKe4CX3kbZMf5+rLsHi41IfH
 D7gSQtOUPtlpeHVIqvlGM+OMz3hgXac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-jrzl6ziyNd67bqJDwcNQ6w-1; Wed, 07 Jul 2021 09:59:13 -0400
X-MC-Unique: jrzl6ziyNd67bqJDwcNQ6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4043C100C609
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 13:59:12 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B4BA60861;
 Wed,  7 Jul 2021 13:59:11 +0000 (UTC)
Date: Wed, 7 Jul 2021 09:59:11 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 0/9] i386: KVM: expand Hyper-V features early
Message-ID: <20210707135911.2lvruqc2ut2l6cd4@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210603114835.847451-1-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 01:48:26PM +0200, Vitaly Kuznetsov wrote:
> Changes since v6 [Eduardo]:
> - First 14 patches of v6 made it upstream!
> - New patches addressing feedback on the already merged patches added:
>   i386: make hyperv_expand_features() return bool
>   i386: hardcode supported eVMCS version to '1'
>   i386: clarify 'hv-passthrough' behavior
>   i386: avoid hardcoding '12' as 'hyperv_vendor_id' length
> - Some comments expanded.
> - HV_HYPERCALL_AVAILABLE setting moved to hyperv_fill_cpuids()
> 
> Note: Windows guest on QEMU are currently completely broken, see Claudio's
> https://lore.kernel.org/kvm/20210529091313.16708-1-cfontana@suse.de/
> 
> The last two functional patches are inspired by 'Fine-grained access check
> to Hyper-V hypercalls and MSRs' work for KVM:
> https://lore.kernel.org/kvm/20210521095204.2161214-1-vkuznets@redhat.com/
> 
> Original description:
> 
> Upper layer tools like libvirt want to figure out which Hyper-V features are
> supported by the underlying stack (QEMU/KVM) but currently they are unable to
> do so. We have a nice 'hv_passthrough' CPU flag supported by QEMU but it has
> no effect on e.g. QMP's 
> 
> query-cpu-model-expansion type=full model={"name":"host","props":{"hv-passthrough":true}}
> 
> command as we parse Hyper-V features after creating KVM vCPUs and not at
> feature expansion time. To support the use-case we first need to make 
> KVM_GET_SUPPORTED_HV_CPUID ioctl a system-wide ioctl as the existing
> vCPU version can't be used that early. This is what KVM part does. With
> that done, we can make early Hyper-V feature expansion (this series).

I'm finally queueing this.  Thanks, and sorry for the delay!

-- 
Eduardo


