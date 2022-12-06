Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C8E6440E4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Uko-0002aq-JA; Tue, 06 Dec 2022 05:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p2Ukb-0002aR-GK
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p2UkZ-0006EH-PK
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670320829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PhpEYtg3B6fwL0VMC3rnY3V+K2JDa422/vI54xRurU=;
 b=Sx0OxwCRNo3Oh5y+r8o8T1c7hsuwOwJhifAkArPH19ir5CfsOhxysYkm0eY1+dSGCqm4Ib
 zFMSy3kp5w0E8eN2Auz3sC9fVcJsgVlH+2cx1FbH7EWgO1Qnws+yGnFSl15yy7GzZbjbiS
 UoizF6ygziAQi8xlPVo8Q6YTFnly2Aw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-dFfF0DSzPLilwiBI_InCQQ-1; Tue, 06 Dec 2022 05:00:28 -0500
X-MC-Unique: dFfF0DSzPLilwiBI_InCQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so5446743wme.8
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 02:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4PhpEYtg3B6fwL0VMC3rnY3V+K2JDa422/vI54xRurU=;
 b=iWbjSYBx1BzC0OKSTz52ChjYOEgqOz5NAlVVKEakH/cudnEV9+1GoeE2mEJaNkj4QD
 WK7VqE9yQROM7BT3nSkgPeb1RMSoJ+54D++EvluO+ANeIT4Fo6i/q774bOshgWFeS86G
 SeGvQR9/hvDxy+fT3EdiUMnmqt984mMWTlO5LfgeShmZFwzlwbYc/L1Et/j7DfM2bMCs
 JLrtBh2EFuU0a71rZzdAL9CrnsU9c3v3lFpfFECO23NWq4Qx7mjk6+h5KXBD07S8hmsU
 OV2N7/6V4nkb3rLqIS3WaOnX5hJkiDuV9kB7mesUtGUmsdbPlS72CJgHrzvd7Ii3S1T2
 4Z+Q==
X-Gm-Message-State: ANoB5pky47mnfTBLAjA5yo9EJxOWPP4bV6ahYUnb3Jst9VceUa3Xoc5A
 PDPlXTZ8pb95obIlmx24d8bhRzQ0uS12WUFSZ8FGlIG9P1xp4JVyz/Fxn6RK5xWfWB9CTT4hJZu
 +sm1KfsTAbwRqqYQ=
X-Received: by 2002:a5d:4e83:0:b0:242:63de:2f58 with SMTP id
 e3-20020a5d4e83000000b0024263de2f58mr5021863wru.28.1670320826366; 
 Tue, 06 Dec 2022 02:00:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7He1dzCtEfoYD5jCqxxqAZ97hIOnWDlwqKinYtagMy+6wEbfnKU0cvxHe6MDr5s540uGRbWw==
X-Received: by 2002:a5d:4e83:0:b0:242:63de:2f58 with SMTP id
 e3-20020a5d4e83000000b0024263de2f58mr5021845wru.28.1670320826086; 
 Tue, 06 Dec 2022 02:00:26 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 co16-20020a0560000a1000b00241b6d27ef1sm16798849wrb.104.2022.12.06.02.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 02:00:25 -0800 (PST)
Date: Tue, 6 Dec 2022 10:00:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC PATCH 12/21] i386/xen: set shared_info page
Message-ID: <Y48Sty6Q6xHlClU3@work-vm>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-13-dwmw2@infradead.org>
 <cbb522e1-3d8d-5332-7ac8-c0e054be33e2@linaro.org>
 <ffcf677c1669a8dc43f8eda498e0d7914028a3c1.camel@infradead.org>
 <73e22a62-d319-7a18-098f-1e4df70e5439@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73e22a62-d319-7a18-098f-1e4df70e5439@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> +Juan/David/Claudio.
> 
> On 6/12/22 03:20, David Woodhouse wrote:
> > On Mon, 2022-12-05 at 23:17 +0100, Philippe Mathieu-Daudé wrote:
> > > On 5/12/22 18:31, David Woodhouse wrote:
> > > > From: Joao Martins <joao.m.martins@oracle.com>
> > > > 
> > > > This is done by implementing HYPERVISOR_memory_op specifically
> > > > XENMEM_add_to_physmap with space XENMAPSPACE_shared_info. While
> > > > Xen removes the page with its own, we instead use the gfn passed
> > > > by the guest.
> > > > 
> > > > Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> > > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > > ---
> > > >    accel/kvm/kvm-all.c      |  6 ++++
> > > >    include/hw/core/cpu.h    |  2 ++
> > > >    include/sysemu/kvm.h     |  2 ++
> > > >    include/sysemu/kvm_int.h |  3 ++
> > > >    target/i386/cpu.h        |  8 ++++++
> > > >    target/i386/trace-events |  1 +
> > > >    target/i386/xen-proto.h  | 19 +++++++++++++
> > > >    target/i386/xen.c        | 61 ++++++++++++++++++++++++++++++++++++++++
> > > >    8 files changed, 102 insertions(+)
> > > >    create mode 100644 target/i386/xen-proto.h
> > > 
> > > 
> > > > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > > > index 8830546121..e57b693528 100644
> > > > --- a/include/hw/core/cpu.h
> > > > +++ b/include/hw/core/cpu.h
> > > > @@ -443,6 +443,8 @@ struct CPUState {
> > > >        /* track IOMMUs whose translations we've cached in the TCG TLB */
> > > >        GArray *iommu_notifiers;
> > > > +
> > > > +    struct XenState *xen_state;
> > > 
> > > Since you define a type definition below, use it.
> > 
> > Ack.
> > 
> > More importantly though, some of that state needs to be persisted
> > across live migration / live update.
> > 
> > There is per-vCPU state (the GPAs for vcpu_info etc., upcall vector,
> > timer info). I think I see how I could add that to the vmstate_x86_cpu
> > defined in target/i386/machine.c.
> > 
> > For the machine-wide state, where do I add that? Should I just
> > instantiate a dummy device (a bit like TYPE_KVM_CLOCK, AFAICT) to hang
> > that state off?
> 
> XenState in CPUState indeed is an anti-pattern.
> 
> As you said elsewhere (patch 2 maybe) your use is not a new accelerator
> but a machine, so new state should go in a derived MachineState.

I *think* the vmstate tends to be attached to a device rather than the
machinetype itself; eg a PCIe bridge that the Machine instantiates.
But yes, a 'dummy' type is fine for hanging vmstate off.

> Migration is not my area of expertise, but since only the xenfv machine
> will use this configuration, it seems simpler to store the vCPUs
> migration states there...

As long as ordering issues don't bite; i.e. between loading the
new Xen specific stuff and loading the main cpu;  you can force
order using the MIG_PRI_ constants on the .priority field.

I was going to suggest maybe you could add it to vmstate_cpu_common
as a subsection; but I don't *think* that's used for x86
(I think that's vmstate_x86_cpu instead???)

Dave

> Regards,
> 
> Phil.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


