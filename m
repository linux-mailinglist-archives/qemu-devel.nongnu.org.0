Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E75345F551
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 20:40:32 +0100 (CET)
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqh5A-0006f2-To
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 14:40:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mqh3N-0005z7-Gv
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 14:38:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mqh3K-00021S-4U
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 14:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637955512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dR6DoYpTCx5qfCJK6174O9u+8iNtV309PgvgZ/gnUFQ=;
 b=WHxFVk4thn8PSjOHhwLFhexsfWFTrSkU1TtVigYm/ebbCUtRZBhh2VbkakG6FoMBTgTh9O
 erpI4VuUkoGjatpEmhfKDkK7A0HDjMl1FOhoWqKGYgX6JVQre3V5+jSCfzOZZ7SPUd7tTs
 aX3YqceR0F35F0vIhOj36fzAKJYXgxc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-ePmYFndBOEKA7jaFS2iG-Q-1; Fri, 26 Nov 2021 14:38:29 -0500
X-MC-Unique: ePmYFndBOEKA7jaFS2iG-Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 t9-20020aa7d709000000b003e83403a5cbso8711156edq.19
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 11:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dR6DoYpTCx5qfCJK6174O9u+8iNtV309PgvgZ/gnUFQ=;
 b=eb9B5NhR9PkJ/Bv8ZuklYNEnlmaX7rmkyaqJhNQOb37UAI7d9FZr+sDkmOHBRKLKcQ
 /+nNQx+rHSgPb8vBIXGBjXCXoHvhAGyq6QkAcFdi9jbFxoJ/VUXw6JHjA0ZvIsLtv+Pp
 32/vGjg7Y1tS741vAQxcMDMRkv0lB2rhwq+40grKT0Oq1jGC8uG4w9Hmqdk6q6NMS2pY
 Yvmenj/u23hRDRKf0sqW0GPYDxR52CLqBIoOe0a4oIIO43pwgWmHnfnn/0C8mf83mQit
 KT+/JxiaM7wQNIRWFzaUNmN5EgQkifgxzMwAb/0eH10af/GnEzjh1Deq4kQWH1XtRgwf
 EiBg==
X-Gm-Message-State: AOAM532YvBaHS0J1JcgiYjB33e04plgcYTUE4SezjthHR8zVQoI2gs8A
 ObxrJnhhOuuOkVfQekApRnu2+Jg6BXki29GSg/UyXl26ObTRJDYXb2V1tvxWEyV1ck7aE0XAcqo
 eD3k428xYYvWF5KM=
X-Received: by 2002:a17:907:a40c:: with SMTP id
 sg12mr40287500ejc.408.1637955508458; 
 Fri, 26 Nov 2021 11:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLAZOikHTS1tJCfXZkVr0r/7LWNv61ss6aOJbG24MGsIoMgHWlNpcrnYGXLfYAOH3EA9HEqw==
X-Received: by 2002:a17:907:a40c:: with SMTP id
 sg12mr40287478ejc.408.1637955508222; 
 Fri, 26 Nov 2021 11:38:28 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id hz15sm3481533ejc.63.2021.11.26.11.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 11:38:27 -0800 (PST)
Date: Fri, 26 Nov 2021 20:38:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH-for-6.2] docs: add a word of caution on x-native-hotplug
 property for pcie-root-ports
Message-ID: <20211126203826.3aac3461@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2111261104070.223522@anisinha-lenovo>
References: <20211125120629.187014-1-ani@anisinha.ca>
 <20211125154927-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2111261104070.223522@anisinha-lenovo>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's hardly 6.2 material

On Fri, 26 Nov 2021 11:12:55 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Thu, 25 Nov 2021, Michael S. Tsirkin wrote:
> 
> > On Thu, Nov 25, 2021 at 05:36:29PM +0530, Ani Sinha wrote:  
> > > x-native-hotplug property, when used in order to disable HPC bit on the PCIE
> > > root ports, can lead to unexpected results from the guest operating system.
> > > Users are strongly advised not to touch this property in order to manipulte the
> > > HPC bit. Add a word of caution in the pcie.txt doc file to document this.
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>  
> >
> > Do we want to generally document this for all "x-" options?  
> 
> Yes igor suggested it but I sent this one for two reasons:
> (a) I could not find a place to document this for properties without
> adding a new file. This sounded too bigger a hammer at the present. If you
> can suggest an existing place for documenting this for the property names,
> I will go and add this info there as well.
> 
> (b) I think we need to document this experimental property here regardless
> because this doc deals with hotplug and pcie ports and we had too much of
> a mess with this acpi/pci native switch.
> 
> When things stabilize a bit, Igor suggested elsewhere that we start a
> separate doc just for hotplug and various options we have and at
> that point we can move this info in this new doc.
> 
> https://www.mail-archive.com/libvir-list@redhat.com/msg221746.html

I'd rather put a blanket statement somewhere, like:
 
"x-" prefixed properties are experimental, unstable, internal and
are subject to change/go away without prior notice.
Such properties are not meant for use by users unless explicitly
documented otherwise.

> >  
> > > ---
> > >  docs/pcie.txt | 17 ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/docs/pcie.txt b/docs/pcie.txt
> > > index 89e3502075..e1f99f725f 100644
> > > --- a/docs/pcie.txt
> > > +++ b/docs/pcie.txt
> > > @@ -262,11 +262,26 @@ PCI Express Root Ports (and PCI Express Downstream Ports).
> > >          Port, which may come handy for hot-plugging another device.
> > >
> > >
> > > -5.3 Hot-plug example:
> > > +5.2 Hot-plug example:
> > >  Using HMP: (add -monitor stdio to QEMU command line)
> > >    device_add <dev>,id=<id>,bus=<PCI Express Root Port Id/PCI Express Downstream Port Id/PCI-PCI Bridge Id/>
> > >
> > >
> > > +5.3 A word of caution using hotplug on PCI Express Root Ports:
> > > +Starting Qemu version 6.2, PCI Express Root ports have a property
> > > +"x-native-hotplug" ("native-hotplug" for Qemu version 6.1), that can be used to
> > > +enable or disable hotplug on that port. For example:
> > > +
> > > +-device pcie-root-port,x-native-hotplug=off,... etc.
> > > +
> > > +The "x-" prefix indicates that this property is highly experimental and can
> > > +lead to unexpected results from the guest operating system if users try to use
> > > +it to alter the native hotplug on the port. It also means that the property
> > > +name and its behavior is liable to change in the future and is not expected to
> > > +be stable across Qemu versions. Therefore, end users are advised not to change
> > > +the value of this option from its default set value or use it in the Qemu
> > > +command line.
> > > +
> > >  6. Device assignment
> > >  ====================
> > >  Host devices are mostly PCI Express and should be plugged only into
> > > --
> > > 2.25.1  
> >
> >  
> 


