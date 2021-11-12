Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256A744E63D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:19:16 +0100 (CET)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVWV-0003cH-9f
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:19:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlVUg-0001RB-NL
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:17:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mlVUe-0007l7-S8
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636719439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Va8CaTNjsi5vy5PvQVgHseyzfMb5Hv7M9txYpSClpcw=;
 b=GzVQ4FKJrXxIqb7a+a2csMiptxd38RydkYKndEv204SlxTSdvEHXEFQ0DTDMAb+k8V0b3D
 nF3D4i4CWXGEFByT1ak2pVcov1F/f33kdRd4hdFdO2qdnsWApA/yR+YBYrTCO0V6neA2hg
 zVPfugHyw55ahcu/6O97PpMbBmevR08=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-2hFNJL3aN7CCgaj-m71-vA-1; Fri, 12 Nov 2021 07:17:18 -0500
X-MC-Unique: 2hFNJL3aN7CCgaj-m71-vA-1
Received: by mail-ed1-f70.google.com with SMTP id
 q6-20020a056402518600b003e28d92bb85so8084057edd.7
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 04:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Va8CaTNjsi5vy5PvQVgHseyzfMb5Hv7M9txYpSClpcw=;
 b=5fpOzstQRBcYP5z3+FcF55ZRODMra6srkuvjVCF2/EtszFuwHczzomnxiTOxWJFEq1
 79X0+QVdFvh0ApZlQIXraxntkn/NFotz1Q+IJ7gWqVW0gETdyrBKXrbZyEAJkuzPiLDd
 bdLzgRtyvtkhD+wtoaJeh3OKdRZ9byw5of+x7TADzoGxSNTyiYbHuAXJFGTCYAHOn7mZ
 V/2ZYoDnO9dhu1Z7ah46MaR6ZXvVl/56I3tv2UIFNaPed3BjqtpDm0RHOPeKZjOvg8bH
 34HGlNOuQF6yGov3qgg/hZz5KAmnQcscwLDZ8dj5hO8Bo//JrGiMG75bF+WoJnoACfrf
 SgBA==
X-Gm-Message-State: AOAM5337eS1Y2o8WWLZq3dLIzKkLdJ1VqgP7wgkYkgKJEAw3urOSD4EP
 wOCvMgi0sRuCFD8NsJvasxHnM2VZlVBaTzx7bFkPo1RoK3l+PEUsVFsQbakeCNQxErHTFzwdClj
 RRGLSb3vlgJN59/I=
X-Received: by 2002:a17:906:3157:: with SMTP id
 e23mr18632650eje.359.1636719436989; 
 Fri, 12 Nov 2021 04:17:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVomCZ8PEk5wzuaEtVzQLf/cFVlPmq2R6Hhxw917tmMkCZHZe02Zke05NR/Eg4aFeDcasDdg==
X-Received: by 2002:a17:906:3157:: with SMTP id
 e23mr18632482eje.359.1636719435765; 
 Fri, 12 Nov 2021 04:17:15 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id g21sm3155171edb.89.2021.11.12.04.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 04:17:15 -0800 (PST)
Date: Fri, 12 Nov 2021 13:17:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211112131714.5a54eb8a@redhat.com>
In-Reply-To: <20211112111528.i43jhiybvwc2eyfz@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
 <20211111093425.6x2a37npcnnewdis@sirius.home.kraxel.org>
 <20211111120905.ozy5iucoqjhhoc72@sirius.home.kraxel.org>
 <20211111103354-mutt-send-email-mst@kernel.org>
 <20211112111528.i43jhiybvwc2eyfz@sirius.home.kraxel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Nov 2021 12:15:28 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Thu, Nov 11, 2021 at 10:39:59AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Nov 11, 2021 at 01:09:05PM +0100, Gerd Hoffmann wrote:  
> > >   Hi,
> > >   
> > > > When the acpihp driver is used the linux kernel will just call the aml
> > > > methods and I suspect the pci device will stay invisible then because
> > > > nobody flips the slot power control bit (with native-hotplug=on, for
> > > > native-hotplug=off this isn't a problem of course).  
> > > 
> > > Hmm, on a quick smoke test with both patch series (mine + igors) applied
> > > everything seems to work fine on a quick glance.  Dunno why.  Maybe the
> > > pcieport driver turns on slot power even in case pciehp is not active.  
> 
> Digged deeper.  Updating power status is handled by the plug() callback,
> which is never called in case acpi hotplug is active.  The guest seems
> to never touch slot power control either, so it's working fine.  Still
> feels a bit fragile though.
> 
> > Well power and hotplug capabilities are mostly unrelated, right?  
> 
> At least they are separate slot capabilities.  The linux pciehp driver
> checks whenever the power control is present before using it, so having
> PwrCtrl- HotPlug+ seems to be a valid combination.
> 
> We even have an option for that: pcie-root-port.power_controller_present
> 
> So flipping that to off in case apci hotplug is active should make sure
> we never run into trouble with pci devices being powered off.
> 
> Igor?  Can you add that to your patch series?

Sorry, saw it too late.
I'll test idea with my set of guests to see if there are any adverse effects.


> > I feel switching to native so late would be inappropriate, looks more
> > like a feature than a bugfix. Given that - we need Igor's patches.
> > Given that - would you say I should apply yours?  
> 
> I think when setting power_controller_present=off for acpi hotplug it is
> safe to merge both mine and igor's.
> 
> take care,
>   Gerd
> 


