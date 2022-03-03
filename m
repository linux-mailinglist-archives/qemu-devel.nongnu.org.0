Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F64CC59D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:07:04 +0100 (CET)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqn1-0004s6-7F
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPqgG-0001xB-Gp
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:00:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPqgE-0004cI-CS
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646334001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nytj4+x10d5jutOmtAHB1yS0AA/9inIAn+/QubiM3nA=;
 b=BbuwY+7ezVzuR1rKsOT6i1uT6i4k4qOSksLXl9IbWj8E4kyu0nfNVhG5M3O18GznuJs9AD
 QLyiLtmzWDjXjbw7HnwZRb1FyrYMb/vojxyhp0oh0q7KUNO5mMTw1LK8fw9LlDxAM9K/g3
 JXvSIlog8NQWH+L9leybhvp0dT3e9eY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-g9nLzqYcO6mmYTj0N9xk7Q-1; Thu, 03 Mar 2022 13:59:55 -0500
X-MC-Unique: g9nLzqYcO6mmYTj0N9xk7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 l19-20020a05600c4f1300b003818783847eso1686484wmq.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Nytj4+x10d5jutOmtAHB1yS0AA/9inIAn+/QubiM3nA=;
 b=nLVqMLtqgHwHo9nje2r1sKIb6Y2OZ1nGEhzWgWYZZQwy5j84rSarZjYmwYwuwU/JVe
 FV3tbds0qeSw3Vp6VnYhPmLZBz94y+G5edeowwxMlgTNuw77UX3bp/7WqG/pFRAY+ALg
 D7PdTDlAl4QpcuDVUqNVZbluv2ErjlHjoTIW7qej2ABHDU4VZ3ThCnTyODddQXJuWb2B
 c/b0ltMJ35kDCdFY8v/ryyleSzxujl2EFgT6wuINFqjng9CpVBtsKaNaW3O6cQcYn9kw
 NswmuOE7AquxXz3WmW4lO1QY0Wbkh091TEGpwlwh6i6lPgORaatawVQD+MZU1UJOMpDB
 CCIw==
X-Gm-Message-State: AOAM532/cV29c2s0ASMC4BenuV3a3lWOjTm7rw1mean6dwJQ4XJzG6kh
 Sblo/OlNVGtM77RFj5pD4vqlkGLY63n3x9fFsnxTd9B40RTabCv8ED6icyV2PzaY6tqRNnD0zTm
 XpTfnVAFQWyblkrQ=
X-Received: by 2002:a5d:6446:0:b0:1f0:3429:7767 with SMTP id
 d6-20020a5d6446000000b001f034297767mr6447918wrw.151.1646333994364; 
 Thu, 03 Mar 2022 10:59:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGl//+X+wHlSt3ZHLJf0z9hUJAdU6Ai84aJ3Sl51Ox9IjaAqvD4MB+njOy8VIqLd3VaDuHHg==
X-Received: by 2002:a5d:6446:0:b0:1f0:3429:7767 with SMTP id
 d6-20020a5d6446000000b001f034297767mr6447896wrw.151.1646333994052; 
 Thu, 03 Mar 2022 10:59:54 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b00386744cb31bsm4441663wmq.35.2022.03.03.10.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:59:53 -0800 (PST)
Date: Thu, 3 Mar 2022 18:59:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] deprecation: x86 default machine types
Message-ID: <YiEQJ3EecMQPmBb0@work-vm>
References: <20220301195432.114252-1-dgilbert@redhat.com>
 <Yh+sbYC5n4DsZWWg@redhat.com> <Yh/HzPymVWPZpVaf@work-vm>
 <YiCDiKqxyE+dXNUz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YiCDiKqxyE+dXNUz@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: eduardo@habkost.net, libvir-list@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Mar 02, 2022 at 07:38:52PM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Tue, Mar 01, 2022 at 07:54:32PM +0000, Dr. David Alan Gilbert (git) wrote:
> > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > > 
> > > > Declare the intent to require a machine type to be specified on x86
> > > > system emulation.
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > ---
> > > >  docs/about/deprecated.rst | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > > index 85773db631..143c60d105 100644
> > > > --- a/docs/about/deprecated.rst
> > > > +++ b/docs/about/deprecated.rst
> > > > @@ -324,6 +324,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
> > > >  been implemented), so there is not much value added by this board. Use the
> > > >  ``ref405ep`` machine instead.
> > > >  
> > > > +x86 default machine type
> > > > +''''''''''''''''''''''''
> > > > +
> > > > +x86 currently defaults to the ```pc``` machine type which is based on the very
> > > > +old ```i440fx``` chipset.  This default will be removed and the user will be
> > > > +required to specify a machine type explicitly using -M; users are encouraged to
> > > > +switch to the not quite as old ```q35``` machine types.
> > > 
> > > This will have no impact on anyone using libvirt as a mgmt app,
> > > because it will explicitly set 'pc' if the user doesn't request
> > > a machine type.
> > > 
> > > It will, however, break a huge number of users who don't use
> > > libvirt or a similar mgmt app.
> > > 
> > > 'q35' is not a drop in replacement for 'pc', and even though
> > > it is slightly newer, the features it brings are not likely
> > > to be important enough for most users who aren't using a mgmt
> > > app to care about switching.
> > 
> > I can see it having advantages for those who do things like PCIe pass
> > through of graphics cards.
> > However, my main concern is that there's a split happening where
> > downstream we're working primarily on q35 but a lot of people still use
> > i440fx; eventually that split will mean the i440fx users will have a
> > pretty bad experience instability/features.
> > So I'd like to encourage them onto a35.
> 
> We've still got quite significant testing coverage of i440fx and outside
> of PCI-Express much logic is shared with q35. Right now at least i440fx
> feels mature and stable, while q35 is still showing significant
> instability with PCI-Express and hotplug in particular. I'd hoppe at
> least the combination of maturity of our plain PCI code and testing
> coverage would address risk of significant regressions in i440fx even
> when attention is on q35. 

OK, lets drop this for now.

> > > In the ongoing work to introduce a completely new system
> > > emulator binary that is exclusively runtime QMP configured,
> > > the machine type will almost certainly be mandatory, without
> > > affecting existing users. That would also apply consistently
> > > across all target arches.
> > 
> > I'm assuming that will also cause the disruption to those end users.
> 
> The difference is that people would opt-in to usage of the new system
> binaries. So existing users, scripts and documentation won't be impacted
> unless they decide to switch - at least as long as we keep the old
> system emulators around. If did eventually decide to remove the old
> binaries, then there would be disruption but that's more of a clean
> break with the past.

So I guess that when this happens people will be pushed to the new
binaries and the old ones will degrade reasonably fast.

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


