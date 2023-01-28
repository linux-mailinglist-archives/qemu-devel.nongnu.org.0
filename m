Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F374F67F718
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 11:27:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLiPm-0004S7-DG; Sat, 28 Jan 2023 05:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiPj-0004Rw-6x
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:26:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiPh-0003o5-DI
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 05:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674901584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ka1vOq4LfjHSl0KhaSctRc/OaiwlQgu0FHYv27yfiXw=;
 b=WRKH5d44GEJnXO+7ylDfCqc9bwQE+rtaId0PeHoi+Jklv6L3pTNd3fVnXfRkCJ/bFLMpwx
 qTJ0bbjhFDyn0H4NQZEffrTnkuZtCH6DTmyO4p55HB9a0oMMiwC6DFuiBWwql9EM99bqkP
 fj3I1xcuJamlOPFQv0SSk8NxJytt1M8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-TGu8wjWyM4G1QsgVcixHkA-1; Sat, 28 Jan 2023 05:26:17 -0500
X-MC-Unique: TGu8wjWyM4G1QsgVcixHkA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l19-20020a05600c1d1300b003dc13fc9e42so4193589wms.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 02:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ka1vOq4LfjHSl0KhaSctRc/OaiwlQgu0FHYv27yfiXw=;
 b=uNhfHFhywD963V4eNioi0EBE2sL7azfbohqLqD3Vse/LMgRNt6yLjJm993ICYC9Aau
 jpqQDvrGHdkd/XMGQ08sqNrdNoQMH3/kcUCc3hrBSN2fe+ruPpi7CZNsPnTt/Bygrnlw
 g1BLNRfq8RirPKV5eSWF3fzgo+7WJOXtvD/V0RtQAX0rvqP+BpWmEmW4YpA6piX9eC1j
 UH+ukX28jveqH9iDv00vWyzV4UH+0xBfw3dE9VodaztUkFZLC0f+mLE9ExwQnN0LRYa/
 pha7/phPZvSUBCQ3UGIH8/jUEkYZTD7vjVfSd/GmFEEpOaTD515zANL0HFGShB/3Yh4n
 p3tQ==
X-Gm-Message-State: AO0yUKVfBP9KfwQFtKqluNR2AsOhdO1ub8mzuekU7j9aY9c+anOHkzWe
 43TrwTai9hDyUwug7yGbmjLQBAl/uB2oidF5ZgGQS6sqMqR/G7+oWP8YcaYXMTZfu4iN1HLr7t8
 tdqq+zQsPFq+GXyA=
X-Received: by 2002:a05:6000:12c6:b0:2bf:df72:fe03 with SMTP id
 l6-20020a05600012c600b002bfdf72fe03mr1055689wrx.70.1674901576060; 
 Sat, 28 Jan 2023 02:26:16 -0800 (PST)
X-Google-Smtp-Source: AK7set8b2ti/gWPbjmkcayt8iuh0AStfnsvYss5Aj6vVblbw1eOBNUY6Si8tbAlR1i3POB10MV/ong==
X-Received: by 2002:a05:6000:12c6:b0:2bf:df72:fe03 with SMTP id
 l6-20020a05600012c600b002bfdf72fe03mr1055670wrx.70.1674901575806; 
 Sat, 28 Jan 2023 02:26:15 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 h12-20020a056000000c00b002bdd96d88b4sm6277361wrx.75.2023.01.28.02.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 02:26:15 -0800 (PST)
Date: Sat, 28 Jan 2023 05:26:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
Message-ID: <20230128052506-mutt-send-email-mst@kernel.org>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
 <20230127082240-mutt-send-email-mst@kernel.org>
 <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Jan 27, 2023 at 10:39:28PM -0500, Chuck Zmudzinski wrote:
> On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
> > On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
> > > The current reserved slot check in do_pci_register_device(), added with
> > > commit 8b8849844fd6
> >
> > add ("subject here") please
> >
> > > ,is done even if the pci device being added is
> > > configured manually for a particular slot. The new property, when set
> > > to false, disables the check when the device is configured to request a
> > > particular slot. This allows an administrator or management tool to
> > > override slot_reserved_mask for a pci device by requesting a particular
> > > slot for the device. The new property is initialized to true which
> > > preserves the existing behavior of slot_reserved_mask by default.
> > > 
> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >
> > Thanks!
> > I'm trying to think of the best default for this.
> 
> I think it would be better for the default value of
> enforce_slot_reserved_mask_manual to be false, so that a
> user-specified slot will by default override slot_reserved_mask.
> But doing that would change the current behavior of
> slot_reserved_mask.
> 
> Currently, this is the only place where slot_reserved_mask is used in all
> of the Qemu source (code from hw/sparc64/sun4u.c):
> 
> ------ snip -------
>     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
>        reserved (leaving no slots free after on-board devices) however slots
>        0-3 are free on busB */
>     pci_bus->slot_reserved_mask = 0xfffffffc;
>     pci_busA->slot_reserved_mask = 0xfffffff1;
>     pci_busB->slot_reserved_mask = 0xfffffff0;
> ------ snip -------
> 
> I think we could safely change the default value of
> enforce_slot_reserved_mask_manual to false but set
> it to true for the sparc64 sun4u board here to preserve
> the current behavior of the only existing board in Qemu
> that uses slot_reserved_mask.
> 
> What do you think?

I guess first can you answer whether this is still needed
with the latest Xen patches?

-- 
MST


