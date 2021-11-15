Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97F450342
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 12:16:48 +0100 (CET)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmZyf-0006rc-Tq
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 06:16:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmZvu-0005OW-UM
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 06:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmZvr-00074s-Ey
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 06:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636974829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I53WFztPYHWrih3ZwqeQzqBXeXSG9Tb3cVKGyNleOvk=;
 b=N9AiXi07gOls6bWQbUDjqWtYPaQhKKppsp8yDzExZPvlfYwz2jl9oiuqr1ngzBCjFdfIlW
 ZhCHqhEe9apuSdVb7kH87gvNxr6I7Hj9YiyKBxy71UUhCvoNXGNHzQdk/5ommZ4SHenmuy
 czVDYUOnriad7uccoT3hcja3xUj2IX0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-YzfemdvFNm6tp5dx43onbw-1; Mon, 15 Nov 2021 06:13:48 -0500
X-MC-Unique: YzfemdvFNm6tp5dx43onbw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso1933401edt.2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 03:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I53WFztPYHWrih3ZwqeQzqBXeXSG9Tb3cVKGyNleOvk=;
 b=v74v0DyEQ8Adrtlh+QzAURYmhBpEaqzPwACIbZ1NUQqFet6K1VmDSFsRwtuC0lkGBx
 /cdniYOV/AB+liBwzT0amWCM2+ERcX71+GN62kOl4HC2HS7xgzyz1WYVrJ3i0QVUlWx5
 RoHmWk5In3KwUU9TR85IKaRwFYbsjMZb8ZV+VRJg6k1hNUhwWngD32f1j+32ba9rxer1
 Y3LUuqwav3IR0EGVxLelHO60Kpiiq/FhJfYVfRFLWB4IbqxZNcjJBqOx5J6ZRjQ/KM2p
 ZrIirgXF/4D8CLF9K5cOnXgU5me8OT7Xp+BoP8hDzeHEAJzhMwSV1HemOnLP3cqf8VXQ
 5k8w==
X-Gm-Message-State: AOAM530Yuec9o3uIA0BG2BO/LU/lmRsgN6uP/DLnm775jtuT+IfOqWME
 RppZMuiHs6xBDWyW6gwNhJpCnAHKmqHzCU825Oxp3VZTwsdwUPgp/UAaRojgfts2EXR5/ZdDGXS
 THHKaqI8/iFxMC4w=
X-Received: by 2002:a05:6402:653:: with SMTP id
 u19mr17040063edx.106.1636974827240; 
 Mon, 15 Nov 2021 03:13:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdfXz56gnfI33f+cTI7KEY8HugE3q2bIfYnhZVQn+5VTYjnyMIeSMb5fbACe/pVf0cwyVItw==
X-Received: by 2002:a05:6402:653:: with SMTP id
 u19mr17040038edx.106.1636974827078; 
 Mon, 15 Nov 2021 03:13:47 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:df69:ff62:2a44:6244:f60e])
 by smtp.gmail.com with ESMTPSA id x5sm3393866edv.29.2021.11.15.03.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 03:13:43 -0800 (PST)
Date: Mon, 15 Nov 2021 06:13:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211115061259-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
 <20211111093425.6x2a37npcnnewdis@sirius.home.kraxel.org>
 <20211111120905.ozy5iucoqjhhoc72@sirius.home.kraxel.org>
 <20211111103354-mutt-send-email-mst@kernel.org>
 <20211112111528.i43jhiybvwc2eyfz@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211112111528.i43jhiybvwc2eyfz@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 12:15:28PM +0100, Gerd Hoffmann wrote:
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
> 
> > I feel switching to native so late would be inappropriate, looks more
> > like a feature than a bugfix. Given that - we need Igor's patches.
> > Given that - would you say I should apply yours?
> 
> I think when setting power_controller_present=off for acpi hotplug it is
> safe to merge both mine and igor's.
> 
> take care,
>   Gerd

So this did not surface yet but I guess we can do this as
a patch on top, either of you can post it.

-- 
MST


