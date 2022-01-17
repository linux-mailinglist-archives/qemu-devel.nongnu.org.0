Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB968490573
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:53:43 +0100 (CET)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Ohq-0000td-U2
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:53:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9Ogq-00005s-J8
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:52:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9Ogo-0000L2-BG
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642413157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7ECIyUIKe53ZPLBdGG4tXhMpT5xAC8WkwVLEPDbo4U=;
 b=dUyiP+NKM+YpsLyjmyu7eC3ftDYDcDO0BXYEDEWZuaAZINpEakyk99y9GDWKjVVvExcJG/
 77h9u+hFzc0IdaYz7ialt4wnlKvH6BQ+EgZ5hAGpWTTlSur9EkU/NWWyXL5hAoIgKRSZW4
 jNYjXrwu7U7Ygvgyl1H6Fs2pN+u+RAc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-X28_on0-MNKfMSWL1sWXRw-1; Mon, 17 Jan 2022 04:52:33 -0500
X-MC-Unique: X28_on0-MNKfMSWL1sWXRw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p14-20020a1c544e000000b003490705086bso4792559wmi.7
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 01:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=P7ECIyUIKe53ZPLBdGG4tXhMpT5xAC8WkwVLEPDbo4U=;
 b=4rYAPDtrzBkwgATsI9QdHhe0GqhlEh86FW3ei9OCBMOsgQc3CdDZ+x9QxzMUb8HgtM
 WEtlUaQKtlz1V2U06qpiFJtBj8IziqBqlCJzTkAReaiEqqWB4kc6PzM93jVkR8qQx7+G
 vv6TXU14PODsQn2DG0rKpbjECJGdlx/9AqR52DifLY9nZyGwWUN4vD+LbCT1QNzvQMJ6
 v16PJGjOxW4PHJEBspJuHahjY+vu5sU61K4YEwgYawKPwmz/T8P+H8yUo7fyH5IA4eJ4
 D1AO7hPtd3w7UU9zqVHXMve9uyDObMZLjUZedK2bwAOVrwULllq3zbZWDLWuQJGNvi6r
 EGVQ==
X-Gm-Message-State: AOAM532IfcojieWtNV7aQp2cM+0MwMnaG/YQTtmHevK0Px76cJpDHgnw
 r0R+5UFqnXn/X2nIRIGmvnDrQifQ/vAWQ77qrdEWscUpJ0DAB579+2VIs8OzTX08peTi/n4v1oz
 hdFVP8MTamemaJYY=
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr11065024wrd.210.1642413152647; 
 Mon, 17 Jan 2022 01:52:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8FqbSUIqbkJzZ9V5Ofp0GqEQ3BVMrt3qx4XRhcYMqi1+DAc6kzZWqEspaPZAi+u+8CgpRtw==
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr11065007wrd.210.1642413152443; 
 Mon, 17 Jan 2022 01:52:32 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id bi24sm19113861wmb.9.2022.01.17.01.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 01:52:32 -0800 (PST)
Date: Mon, 17 Jan 2022 09:52:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: ppc pbr403 vmstate
Message-ID: <YeU8Xbth4iPlBnad@work-vm>
References: <YeB0zGRC/ct8DAzM@work-vm> <YeC4xYrYhdAKKwTx@yekko.fritz.box>
 <a2b11256-5afe-42de-ffb3-dad07c8165b3@kaod.org>
 <YeUEB0lb7mhuoP6G@yekko.fritz.box>
 <8609da8e-e4e6-3b78-6d49-c6cf4cb07ddd@kaod.org>
MIME-Version: 1.0
In-Reply-To: <8609da8e-e4e6-3b78-6d49-c6cf4cb07ddd@kaod.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, quintela@redhat.com,
 danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Cédric Le Goater (clg@kaod.org) wrote:
> On 1/17/22 06:52, David Gibson wrote:
> > On Fri, Jan 14, 2022 at 08:07:21AM +0100, Cédric le Goater wrote:
> > > On 1/14/22 00:41, David Gibson wrote:
> > > > On Thu, Jan 13, 2022 at 06:51:56PM +0000, Dr. David Alan Gilbert wrote:
> > > > > Hi,
> > > > >     Is there any easy way of getting a machine where the pbr403 vmstate
> > > > > would be generated?
> > > > 
> > > > The condition in pbr403_needed is...
> > > > 
> > > >       return (pvr & 0xffff0000) == 0x00200000;
> > > > 
> > > > .. which looks to be the PVR for ppc403 models.  That makes sense with
> > > > the section name... but not so much with the fact that it's under
> > > > cpu/tlb6xx.  The 6xx MMU is basically unrelated to the 40x MMU.  But
> > > > it looks like the vmstate_tlbemb might be shared between then, because
> > > > of bad ideas of the past.
> > > > 
> > > > But in any case, we already dropped what little 403 support we ever
> > > > had - there's nothing with that PVR even listed in
> > > > target/ppc/cpu-models.h.
> > > > 
> > > > So I think we should just drop it.
> > > 
> > > yes. But we can not remove env.pb since this would break migration
> > > compatibility, correct ?
> > 
> > Only if it appears in a migration section that's actually emitted by a
> > supported machine type.  As far as I can tell the only section that
> > does that is vmstate_pbr403, which we're also dropping so we should be
> > fine.
> 
> I sent a patch to remove vmstate_pbr403 first.

Thanks!

Dave

>  > It is also touched in the *super* old cpu_load_old.  I suspect we
> > could probably just drop that completely, since I don't think we
> > realistically support migration from a version that old anyway.  But
> > even if we don't want to do that right now, we can just replace the
> > reads into env->pb with discarding reads and we'll be fine.  We don't
> > implement any cpus that actually used those fields, so we can ignore
> > them in the migration stream.
> 
> I will take a look at this also with follow ups.
> 
> Thanks,
> 
> C.
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


