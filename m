Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFE94C0FDF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:10:56 +0100 (CET)
Received: from localhost ([::1]:38282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMobn-0000Hf-FX
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:10:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMo0C-0006TX-0s
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:32:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMo06-0005pJ-JW
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645608715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dda9byN7utgFEloSUJi3H8yFCE26T8hUuTOjc+rleI=;
 b=YU5C0kEjF/dMuuQJttGC20fN4yIe9xBLPBWtwotr8wdgEDavcaz/0piAcsW23Nd2lVVDiP
 bPXlz6SYfnuW+D4EVi2e0pPDYupr+iE5YYP9/RW9PFoH+6iXwIj0QzAODFS/Ytvdbwz6Av
 OX8YmI+j61JKNx1cx0K0FFqjDaH9b80=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-9vCfsDg4ME-OdP4Xd4E3Sw-1; Wed, 23 Feb 2022 04:31:54 -0500
X-MC-Unique: 9vCfsDg4ME-OdP4Xd4E3Sw-1
Received: by mail-ej1-f72.google.com with SMTP id
 nb1-20020a1709071c8100b006d03c250b6fso6757368ejc.11
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dda9byN7utgFEloSUJi3H8yFCE26T8hUuTOjc+rleI=;
 b=IRJFXV0JzuTxiOYJnBE7fb6Pst6ASPas2A7e2dQAiBDQ05bHZSoSNjTCvWGeJOKbRm
 T8DZdhdd5iuOEDpYN4d5WPoJ+C1ecge55kID9Dy/APH02O7nWW3t8+ntOU01xFxubNjL
 Rl332IX8MCMsiGAGloGEvttVt7yoM/EwDkhFwZ+pOOnVNOCNPfX3Z97s4U4M0IJnJOoQ
 XtVlav88gDAG4p2jKyRZZYtkenZMSpXuLfUgu4mO79ZwtDN6tSg5cgWSvIQTyEWqJ5YX
 ajWeEeWFpiGJVkeCEeWFvY7xFwCA9maE1gg9TG0/UidSSPFgCIdtsb+Bk/MJ95aJ8UY5
 O9gw==
X-Gm-Message-State: AOAM530uYxLpnutQB8uetjF3aqMEj1GoSE81ZyuzIFxDmJsCLSq9rcZd
 SLjP0GCXldQC6yAzhiddqDi5AEIXNWS949LBaHjreJho8x0ZialuAuOw9sErAs3P4P8r6VJ5xFN
 XGoSoLVNAnLJAxGA=
X-Received: by 2002:a17:907:8a04:b0:6b6:1f22:a5e with SMTP id
 sc4-20020a1709078a0400b006b61f220a5emr22218165ejc.528.1645608712763; 
 Wed, 23 Feb 2022 01:31:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrdUrTU5myj8QangZYhWtJq4l199/nKKtBixc3Lw6JBb57ftLCsdp2vSPghdoTNnUBGrm+NA==
X-Received: by 2002:a17:907:8a04:b0:6b6:1f22:a5e with SMTP id
 sc4-20020a1709078a0400b006b61f220a5emr22218139ejc.528.1645608712476; 
 Wed, 23 Feb 2022 01:31:52 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o9sm7213780ejn.16.2022.02.23.01.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:31:52 -0800 (PST)
Date: Wed, 23 Feb 2022 10:31:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220223103151.70f70410@redhat.com>
In-Reply-To: <YhX7g0GjwE5u7+vf@work-vm>
References: <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
 <YgzJE7ufEYm6OFyg@redhat.com> <YhOQfJ8x93+jDSZf@work-vm>
 <20220222094602.66d55613@redhat.com>
 <20220222094255.as2alzu65rhateml@sirius.home.kraxel.org>
 <20220223094343.2e600a22@redhat.com> <YhX7g0GjwE5u7+vf@work-vm>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 09:16:51 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Igor Mammedov (imammedo@redhat.com) wrote:
> > On Tue, 22 Feb 2022 10:42:55 +0100
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   
> > >   Hi,
> > >   
> > > > > And the upstream code is now pretty much identical except for the
> > > > > default;  note that for TCG you do need to keep to 40 I think.    
> > > > 
> > > > will TCG work with 40bits on host that supports less than that?    
> > > 
> > > When I understand things correctly the problem is that the phys-bits
> > > limit applies to the npt/ept tables too, effectively restricting guest
> > > physical address space to host physical address space.
> > > 
> > > TCG is not affected by that and should work just fine.
> > > 
> > > Not sure what happens if you turn off npt/ept and run on softmmu.
> > > Possibly that works fine too.
> > >   
> > > > Also quick look at host-phys-bits shows that it affects only 'host'
> > > > cpu model and is NOP for all other models.    
> > > 
> > > I don't think so.  microvm forces host-phys-bits=on and that works with
> > > all cpu models.  
> > 
> > I just don't see how host-phys-bits can work for other than 'host' cpu model.
> > It's true that property is available for all cpu models, but the field it sets
> > is only used in target/i386/host-cpu.c, the same applies to host-phys-bits-limit.
> > Am I missing something?  
> 
> The hook in kvm/kvm-cpu.c kvm_cpu_realizefn:
> 
>     /*
>      * The realize order is important, since x86_cpu_realize() checks if
>      * nothing else has been set by the user (or by accelerators) in
>      * cpu->ucode_rev and cpu->phys_bits, and updates the CPUID results in
>      * mwait.ecx.
>      * This accel realization code also assumes cpu features are already expanded.
>      *
>      * realize order:
>      *
>      * x86_cpu_realize():
>      *  -> x86_cpu_expand_features()
>      *  -> cpu_exec_realizefn():
>      *            -> accel_cpu_realizefn()
>      *               kvm_cpu_realizefn() -> host_cpu_realizefn()
>      *  -> check/update ucode_rev, phys_bits, mwait
>      */

Thanks,
I didn't expect host_cpu_realizefn being called from elsewhere
beside of cpu model it belongs to or models inherited from it.

> 
> Dave
> 
> > > 
> > > take care,
> > >   Gerd
> > >   
> >   


