Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D344DB00
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:13:20 +0100 (CET)
Received: from localhost ([::1]:35138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDdX-00038T-Ku
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:13:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlDbu-0001jh-Tz
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:11:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mlDbs-0002Lk-9L
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636650694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S97dAS51ngt0lc3om5cP3fO5Tio6hbeGZK5FtI51I1E=;
 b=R/TDqu2lWXKuVeHNUv3OmZzt3K27qT/6RHqh6ABjs9YtBHk+qYBCoAkwJLqg8j4vrydMQu
 rDx3yD8VColpjlXFjL3gzT+owy10zVtRl6nJlHmdd0tPsppIBg3PNRVuIZwjouRpK4XQmO
 J1k5j6gMPCvwOkKtZt0OpDViP/2MtGY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-RGIH1FwGMpGIBzLfyZkDVA-1; Thu, 11 Nov 2021 12:11:25 -0500
X-MC-Unique: RGIH1FwGMpGIBzLfyZkDVA-1
Received: by mail-ed1-f72.google.com with SMTP id
 g3-20020a056402424300b003e2981e1edbso6009086edb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S97dAS51ngt0lc3om5cP3fO5Tio6hbeGZK5FtI51I1E=;
 b=Eebh5JRYtrJXVtRkqgOR2vrXikeX9gfBScCw0ebDk5/lOHDPZbt8+oNkECQNE1ncVL
 pa66eKUIS2tBccjPDzrPc5u+HQQ7/WDP0TDyneX2vzogtxND7I1Ulo9YOkG61fEOGzGc
 SGowA83NxG18upLTd4MIIZW2vNGfl3IO8F6MnrK9/gMM1rU/M2BjUsjSXtXpzbjM3Z+c
 LAcMicaWH3wyEiL9stQqo7yF5Q3t/7c6fs1zYzmQNvlDMj3jqfmkh8eIdHojflRuUEI2
 U7r0R5X/SiJAqheYq60Rt1f9VCTSWfELuUeYs0ueLCs4G2IWLcDoZWLxqDHG2/EGEovP
 e4YQ==
X-Gm-Message-State: AOAM530Dx+uYwm+GVAkeNRDCgzZolzWKGF/KGvlApASPQU8/diO40AmT
 sV0jiRMduqbdxsIaKDl4X3GST+rnYOIewvmxy9S34fur4UUk6RWzRBcArJ5StccTEpXQjMRC88x
 iromsxVXsZofPCEU=
X-Received: by 2002:a05:6402:44c:: with SMTP id
 p12mr11896314edw.234.1636650683572; 
 Thu, 11 Nov 2021 09:11:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXiUmekehcDH7aUFaoL2KhPWPQTyO1O0SIAhmTt6s4n6ZHKWC+aHOKdI0zwc0Xp9azL4Ctzw==
X-Received: by 2002:a05:6402:44c:: with SMTP id
 p12mr11896276edw.234.1636650683356; 
 Thu, 11 Nov 2021 09:11:23 -0800 (PST)
Received: from redhat.com ([2.55.135.246])
 by smtp.gmail.com with ESMTPSA id x14sm1615259ejs.124.2021.11.11.09.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 09:11:22 -0800 (PST)
Date: Thu, 11 Nov 2021 12:11:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211111120439-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
 <YYzj6Yizd+ESnoOE@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YYzj6Yizd+ESnoOE@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 09:35:37AM +0000, Daniel P. Berrangé wrote:
> On Thu, Nov 11, 2021 at 03:20:07AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Nov 11, 2021 at 08:53:06AM +0100, Gerd Hoffmann wrote:
> > >   Hi,
> > > 
> > > > Given it's a bugfix, and given that I hear through internal channels
> > > > that QE results so far have been encouraging, I am inclined to bite the
> > > > bullet and merge this for -rc1.
> > > 
> > > Fine with me.
> > > 
> > > > I don't think this conflicts with Julia's patches as users can still
> > > > disable ACPI hotplug into bridges.  Gerd, agree?  Worth the risk?
> > > 
> > > Combining this with Julia's patches looks a bit risky to me and surely
> > > needs testing.  I expect the problematic case is both native and acpi
> > > hotplug being enabled.
> > >  When the guest uses acpi hotplug nobody will
> > > turn on slot power on the pcie root port ...
> > 
> > I'm not sure I understand what the situation is, and how to trigger it.
> > Could you clarify pls?
> > 
> > > I'd suggest to just revert to pcie native hotplug for 6.2.
> > 
> > Hmm that kind of change seems even riskier to me. I think I'll try with
> > Igor's patches.
> 
> Why would it be risky ? PCIE native hotplug is what we've used in
> QEMU for years & years, until 6.1 enabled the buggy ACPI hotplug.
> The behaviour of the current PCIE native hotplug impl is a known
> quantity.
> 
> Regards,
> Daniel

For example we might regress some of the bugs that the switch to ACPI fixed back to
6.0 state. There were a bunch of these. For example it should be
possible for guests to disable native and use ACPI then, but isn't.
I'm very willing to consider the switch back to native by default
but given the timing doing big changes like that at the last
minute seems unusual.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


