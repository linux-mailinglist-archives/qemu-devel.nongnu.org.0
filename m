Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF304DC254
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 10:08:06 +0100 (CET)
Received: from localhost ([::1]:54592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUm73-0007AU-BL
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 05:08:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nUm4m-0005QP-T9
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nUm4k-0003YS-9C
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 05:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647507941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+ukIf3kiOVMXn/ERkS8gsiSbJcPYbKIeczTnmt6zIs=;
 b=Nk3whXwhT2t8/9t+7d/PMFMEqpl83NNSBEqMXySCdMt8vSjKB0bwjTjAmqXMbqoiH0LfE7
 ykNbkcDAzex1qp7kygMMDhTvUIxiijfyrakcfTOiMaLQRFKJNESoaMNkt9yiwXMn/eDhk/
 Jn8gZEiGBCZVeNlHUB6YbrZgzkEC/tk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-4VDSApnhP0mj7jEjx_pa4Q-1; Thu, 17 Mar 2022 05:05:40 -0400
X-MC-Unique: 4VDSApnhP0mj7jEjx_pa4Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 b24-20020a50e798000000b0041631767675so2727575edn.23
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 02:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+ukIf3kiOVMXn/ERkS8gsiSbJcPYbKIeczTnmt6zIs=;
 b=5BCT0pUyR65vT6jZtSwnoxBBoVblvTi5f23kYbE1gX6PBIJTDpv0DZHdwJQ5Y4UjF1
 h6ElIzT09nYP7MDflHg/kiCrCFoMF4ZTWhbCQsF03KqeSLMSHBwqpGdZOA0QTMsCkvKe
 piCMnde0pVTI0mkewMoN7AVnSzZqmLC8hPDNvEwqJhkrWjqdGrzdgTcEdVS6wK5gEKOI
 fbcSfne+7Xa8S13Nx6QHJBuhzky6um35v9dBPvuNi4jYIaslpIEbiUJvbrqVkzYFLsSJ
 TMLP1upIf+dMaZREK+A1Fkew2CFN71rUQ2bQEg0PWLTuqJlvOrCuDoJoTYYj00K89+N/
 +kDQ==
X-Gm-Message-State: AOAM532Oo6msP0lWJqjoLd7P+SKuDopjvxU4pFWKsFhBEb6LfF4+JC8b
 ccIoiD2uCkUrQSAl8mFeEwMDCuM453YbAxtM12jjQRSrzcEQ+S9BPEz5/pJYo6ZBoVbLE6SZJsV
 ylfC6aDMOvffecIs=
X-Received: by 2002:a17:906:3583:b0:6d1:c07:fac0 with SMTP id
 o3-20020a170906358300b006d10c07fac0mr3267540ejb.749.1647507938726; 
 Thu, 17 Mar 2022 02:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAEpAf2oe79CJKooaY+Hdrq2dwgzYT5+C9uD9b7cVPMaIs2fpCbjk5CQdy6+XNKQp1HWBFOg==
X-Received: by 2002:a17:906:3583:b0:6d1:c07:fac0 with SMTP id
 o3-20020a170906358300b006d10c07fac0mr3267509ejb.749.1647507938397; 
 Thu, 17 Mar 2022 02:05:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a1709064ad800b006d70e40bd9esm2095558ejt.15.2022.03.17.02.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:05:37 -0700 (PDT)
Date: Thu, 17 Mar 2022 10:05:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/4] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <20220317100536.6ccabfe0@redhat.com>
In-Reply-To: <20220317094209.2888b431@redhat.com>
References: <20220314142544.150555-1-dwmw2@infradead.org>
 <20220316100425.2758afc3@redhat.com>
 <d374107ebd48432b6c2b13c13c407a48fdb2d755.camel@infradead.org>
 <20220316055333-mutt-send-email-mst@kernel.org>
 <c359ac8572d0193dd65bb384f68873d24d0c72d3.camel@infradead.org>
 <20220316064631-mutt-send-email-mst@kernel.org>
 <20220316122842.0bc78825@redhat.com>
 <2d2eb49f7a59918521c1614debe5b87017f5789b.camel@infradead.org>
 <20220317094209.2888b431@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

re-sending reply as something went wrong with headers (I suspect Daniel's name formatting)
and email got bounced back.

On Wed, 16 Mar 2022 14:31:33 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Wed, 2022-03-16 at 12:28 +0100, Igor Mammedov wrote:  
> > Generally Daniel is right, as long as it's something that what real hardware
> > supports. (usually it's job if upper layers which know what guest OS is used,
> > and can tweak config based on that knowledge).
> > 
> > But it's virt only extension and none (tested with
> >  Windows (hangs on boot),
> >  Linux (brings up only first 255 cpus)
> > ) of mainline OSes ended up up working as expected (i.e. user asked for this
> > many CPUs but can't really use them as expected).    
> 
> As I said, that kind of failure mode will happen even with the split
> irq chip and EXT_DEST_ID, with Windows and older (pre-5.10) Linux
> kernels.
> 
> For older guests it would also happen on real hardware, and in VMs
> where you expose an IOMMU with interrupt remapping. Some guests don't
> support interrupt remapping, or don't support X2APIC at all.
>   
> > Which would just lead to users reporting (obscure) bugs.    
> 
> It's not virt only. This could happen with real hardware.  

I was talking about EXT_DEST_ID kvm extension.
With current upstream guest kernel, user gets only "bad cpu" messages
and then go figure what's wrong with configuration or
simply hangs in case of Windows.

> > Testing shows, Windows (2019 and 2004 build) doesn't work (at least with
> > just kernel-irqchip=on in current state). (CCing Vitaly, he might know
> > if Windows might work and under what conditions)
> > 
> > Linux(recentish) was able to bring up all CPUs with APICID above 255
> > with 'split' irqchip and without iommu present (at least it boots to
> > command prompt).    
> 
> That'll be using the EXT_DEST_ID support.
>   
> > What worked for both OSes (full boot), was split irqchip + iommu
> > (even without irq remapping, but I haven't tested with older guests
> > so irq remapping might be required anyways).    
> 
> Hm, that's surprising for Windows unless it's learned to use the
> EXT_DEST_ID support. Or maybe it *can* cope with only targeting
> external interrupts at CPUs < 255 but has a gratuitous check that
> prevents it bringing them up unless there's an IOMMU... *even* if that
> IOMMU doesn't have irq remapping anyway?  

or maybe we are enabling irq remapping by default now.
I'll try to check, if guest is actually brings all CPUs up.

> Anyway, as fas as I'm concerned it doesn't matter very much whether we
> insist on the split irq chip or not. Feel free to repost your patch
> rebased on top of my fixes, which are also in my tree at
> https://git.infradead.org/users/dwmw2/qemu.git
> 
> The check you're modifying has moved to x86_cpus_init().  

if we are to keep iommu dependency then moving to x86_cpus_init()
isn't an option, it should be done at pc_machine_done() time.

in practice partial revert of your c1bb5418e to restore
iommu check including irq remapping.
In which case, do we still need kvm_enable_x2apic() check
you are adding here?


