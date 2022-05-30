Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1F537A60
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:09:39 +0200 (CEST)
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveDK-0004QW-Fe
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nvdte-0006ZW-D0
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:49:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nvdtY-0005Fv-Lm
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653911349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1jBLgUxgHH8kcMeU83Uqv8BeFNU4gu6zKWN29kUJs70=;
 b=LD1lJ4TXO2K/pkaPk41Ddm1CCIhr04bDJJb4yHh3mslW9Fcrr3xKlMmAASo2UVpPtUx50w
 iq/EAI+/cRuwJsNE4XVKLMh5DqrAaKcqTkneVhDMJgeWKr6j8OhJqRrfZsgwwOXJJ81QRL
 ZJBFNcrRaBIKYvxcemQcHTkTjyAJPnQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-2pVTSCIONnyhIaPVCzKfUA-1; Mon, 30 May 2022 07:49:06 -0400
X-MC-Unique: 2pVTSCIONnyhIaPVCzKfUA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 208D7811E75;
 Mon, 30 May 2022 11:49:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9387492CA2;
 Mon, 30 May 2022 11:49:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2AD82180039F; Mon, 30 May 2022 13:49:04 +0200 (CEST)
Date: Mon, 30 May 2022 13:49:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 18/36] i386/tdx: Skip BIOS shadowing setup
Message-ID: <20220530114904.242xqql3xfugy2a7@sirius.home.kraxel.org>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-19-xiaoyao.li@intel.com>
 <20220524070804.tcrsg7cwlnbkzhjz@sirius.home.kraxel.org>
 <b294af31-fe92-f251-5d3e-0e439a59ee1e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b294af31-fe92-f251-5d3e-0e439a59ee1e@intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 26, 2022 at 10:48:56AM +0800, Xiaoyao Li wrote:
> On 5/24/2022 3:08 PM, Gerd Hoffmann wrote:
> > On Thu, May 12, 2022 at 11:17:45AM +0800, Xiaoyao Li wrote:
> > > TDX guest cannot go to real mode, so just skip the setup of isa-bios.
> > 
> > Does isa-bios setup cause any actual problems?
> > (same question for patch #19).
> 
> It causes mem_region split and mem_slot deletion on KVM.
> 
> TDVF marks pages starting from 0x800000 as TEMP_MEM and TD_HOB, which are
> TD's private memory and are TDH_MEM_PAGE_ADD'ed to TD via
> KVM_TDX_INIT_MEM_REGION
> 
> However, if isa-bios and pc.rom are not skipped, the memory_region
> initialization of them is after KVM_TDX_INIT_MEM_REGION in
> tdx_machine_done_notify(). (I didn't figure out why this order though)
> 
> And the it causes memory region split that splits
> 	[0, ram_below_4g)
> to
> 	[0, 0xc0 000),
> 	[0xc0 000, 0xe0 000),
> 	[0xe0 000, 0x100 000),
> 	[0x100 000, ram_below_4g)
> 
> which causes mem_slot deletion on KVM. On KVM side, we lose the page content
> when mem_slot deletion.  Thus, the we lose the content of TD HOB.

Hmm, removing and re-creating memory slots shouldn't cause page content
go away.   I'm wondering what the *real* problem is?  Maybe you loose
tdx-specific state, i.e. this removes TDH_MEM_PAGE_ADD changes?

> Yes, the better solution seems to be ensure KVM_TDX_INIT_MEM_REGION is
> called after all the mem region is settled down.

Yes, especially if tdx can't tolerate memory slots coming and going.

> But I haven't figured out the reason why the isa-bios and pc.rom
> initialization happens after machine_init_done_notifier

Probably happens when a flatview is created from the address space.

Maybe that is delayed somehow for machine creation, so all the address
space updates caused by device creation don't lead to lots of flatviews
being created and thrown away.

> on the other hand, to keep isa-bios and pc.rom, we need additional work to
> copy the content from the end_of_4G to end_of_1M.

There is no need for copying, end_of_1M is a alias memory region for
end_of_4G, so the backing storage is the same.

> I'm not sure if isa-bios and pc.rom are needed from people on TD guest, so I
> just skip them for simplicity,

Given that TDX guests start in 32bit mode not in real mode everything
should work fine without isa-bios.

I'd prefer to avoid creating a special case for tdx though.  Should make
long-term maintenance a bit easier when this is not needed.

take care,
  Gerd


