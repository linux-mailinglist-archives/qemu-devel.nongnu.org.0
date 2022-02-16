Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E26C4B8FE1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:10:20 +0100 (CET)
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOkt-0003y9-7R
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:10:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOYD-0001S9-9g
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:57:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOY9-0003kB-Uo
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645034228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GbFNPXQEQlilfzBDz9EtLKbrmfxZtReoAbH0tAYpss=;
 b=SFURtfKHqzizfQgtG4mx597FpYk5PZ2APD6LZzqCzSFxTfDKGzhpe+f77KTa/W0+ukNJS3
 wVmCHFbOSG27GIqrdceZ5XREFBYkFMqaf+Ztcfvk7WSYMkGR8XzQ3WTwgx5ZDn5HxEB/6b
 vwa+qEl9TA0te8wkaVV7nWr3FjZ6SYE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-gDFRxmU7PCywU1yQ7hSmMQ-1; Wed, 16 Feb 2022 12:57:06 -0500
X-MC-Unique: gDFRxmU7PCywU1yQ7hSmMQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so1356127wrd.22
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+GbFNPXQEQlilfzBDz9EtLKbrmfxZtReoAbH0tAYpss=;
 b=Avl5D0r9dIc+rlt0x+eKB8FOTJdnImnUMjWjM245B8LdZ2COUElzumn2ejQt3eCbZW
 wyBbuLbgE/hvO2j3NA6rPfOpHo2Pd7kE7pSGqoT8z/PUVzEAMFYuwSp4n+CkgLcHKBpQ
 L8ynypQpUaZ7BNMH9ImpSCODiOShRqbvb8X7mDbdgrywAOsRpha99BtsgcabLpS1lbV3
 pw64/fTMvjO1HhR491ERHOuxa7MDFlQ5+nkwcO59A88ujSbR2p5C8fQvh6D9VDrVTzUy
 Tc3ckTtk7ThWQMTD2U159avTh402cz/UX6bnh1G1snp+M5TkTIWx6nzo8/kGWtQQ0gya
 Iw0A==
X-Gm-Message-State: AOAM531iF/qpzBNYoRCv/QdPlZkuJmzQ57TyKtn6QFEyjXvWjKNBZJ8G
 852zxUSZN5fE0JzBszOnk1PRCntRHwPE7gUJQcnq0zwUAe+8avGatcejt89/be5j5PQDscLoqQf
 w4/kuu9HfyM/dUcE=
X-Received: by 2002:a05:6000:258:b0:1e4:eee1:93b9 with SMTP id
 m24-20020a056000025800b001e4eee193b9mr3268914wrz.558.1645034225725; 
 Wed, 16 Feb 2022 09:57:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyltHV+EdxwknhQNJ77gneoZUySs9O5SS+qtHe1WgYoNYXlp0UNW5cklO9qbTyptnC1hDkT5w==
X-Received: by 2002:a05:6000:258:b0:1e4:eee1:93b9 with SMTP id
 m24-20020a056000025800b001e4eee193b9mr3268900wrz.558.1645034225489; 
 Wed, 16 Feb 2022 09:57:05 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id s26sm18731706wmh.47.2022.02.16.09.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 09:57:04 -0800 (PST)
Date: Wed, 16 Feb 2022 17:57:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <Yg067jLmVM4aIFIq@work-vm>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm> <Yg042JzxCjgF2siM@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yg042JzxCjgF2siM@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, Thomas Huth <thuth@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Feb 16, 2022 at 05:40:44PM +0000, Dr. David Alan Gilbert wrote:
> > * Thomas Huth (thuth@redhat.com) wrote:
> > > On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
> > > > * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > > > >    Hi,
> > > > > > Given the semantic differences from 'i440fx', changing the default
> > > > > > machine type has effects that are equivalent to breaking command
> > > > > > line syntax compatibility, which is something we've always tried
> > > > > > to avoid.
> > > > > 
> > > > > And if we are fine breaking backward compatibility I'd rather *not* pick
> > > > > a default, effectively making -M $something mandatory, similar to arm.
> > > > 
> > > > Oh, that's probably easy to do;  what are other peoples thoughts on
> > > > that?
> > > 
> > > I agree with Gerd. Getting rid of a default machine on x86 is likely better
> > > than silently changing it to q35. But I'd maybe say that this should go
> > > through the deprecation process first?
> > 
> > So just adding something like the following under 'System emulator
> > machines':
> > 
> > x86 default machine type
> > ------------------------
> > 
> > x86 currently defaults to the very old ```pc``` machine type
> > which is based on the very old ```i440f``` chipset.  This default
> > will be removed and the user will be required to specify a machine
> > type explicitly using -M; users are encouraged to switch to the
> > not quite as old ```q35``` machine types.
> > 
> > 
> > (This option is going to take a lot more work switching all the
> > test cases over; in my world here I'd only changed the tests that broke
> > on q35, now everything is going to need to specify a type).
> 
> ....which is still nothing compared to how many users will be impacted
> and the docs all over the internet we'll never be able to change, which
> give illustrations using qemu command lines without '-M pc'

What's your prreference - it sounds like you'd prefer to leave the
default as 'pc' ?

aarch's message is:
qemu-system-aarch64: No machine specified, and there is no default
Use -machine help to list supported machines

We could add a:
'Use -machine pc for the old default behaviour'

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


