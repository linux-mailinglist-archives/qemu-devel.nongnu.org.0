Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFD4B8FCF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:02:52 +0100 (CET)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOdf-0003Fn-VK
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:02:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOIT-0003zg-4c
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOIR-0000qI-8Q
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r3w8kFgKUkBLG/xw8lPYmYcKH/Euks5bn2zBodJeRzI=;
 b=hSG8fSncE413FmV68XPYH0oW8BZpUa/WSyEHDkbyY2K/UHwzSYkff/lYZJi9HzgJoBwi1M
 O225sZflf7wkwxOLf7g3X24fTlyD5oqq/H3eOqx6yj0CFe8sZjAsFAk+9KgIltWQ2M3TH8
 kv1Lkg1xf4gdi+RYiWiECF7AwVfem5c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-QJgxn_Q8MWOmd8BSL9IMLA-1; Wed, 16 Feb 2022 12:40:48 -0500
X-MC-Unique: QJgxn_Q8MWOmd8BSL9IMLA-1
Received: by mail-wr1-f72.google.com with SMTP id
 f14-20020adfc98e000000b001e8593b40b0so692790wrh.14
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r3w8kFgKUkBLG/xw8lPYmYcKH/Euks5bn2zBodJeRzI=;
 b=ySr377fSnL9Olmt5X37m+b9PSeWzrMo84CkqWeOZgD++jmKeGz2ZrQLKDpfA3uH/aV
 oSWlKUwLEJZmprDERmCETMp+eoUoIW0ui86cPivai7YiC5PnVycTJlke1VP2pNq+mNQE
 VD094N027uijrYY4L9aokyLQDjcDFgyRHLIyw0yE5pHGjAOIfjVOYnb8aEKce0gIGmep
 T8ahbVYy98kI/qZ0oQOZ84Q1pfiKUlGRxRTpMT46av3mRmdLz6bUDX2+2okM2oWyF9RX
 yhfh5ALI1rUlzl05GcCLlP1P3+E244mVMJ+zPD5GmGdrzVkmiS2ktfhPcLRobz2GtLbC
 /zEg==
X-Gm-Message-State: AOAM5316yqesYxsvlmU220EGbO7xZTBsQMN95OmR+QGAvQMDFJ435M1n
 PBYXNnjacAMNTx8h6FatazvxcsOrQ5iIZkFoewU/kMO1057pzWiu/BvD0SHPNlAUBdJqM9p4WTN
 4jMNjcRMFCcC/qoA=
X-Received: by 2002:adf:e890:0:b0:1b3:6d7b:b29b with SMTP id
 d16-20020adfe890000000b001b36d7bb29bmr3141803wrm.692.1645033247441; 
 Wed, 16 Feb 2022 09:40:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuxGPDmle8D4w2o+kT3uSlI73jbevDoDsJERyUbL8R+qaMY+96i4OcGMGTphCXR3/d8KzMpw==
X-Received: by 2002:adf:e890:0:b0:1b3:6d7b:b29b with SMTP id
 d16-20020adfe890000000b001b36d7bb29bmr3141790wrm.692.1645033247206; 
 Wed, 16 Feb 2022 09:40:47 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n5sm19420819wrm.3.2022.02.16.09.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 09:40:46 -0800 (PST)
Date: Wed, 16 Feb 2022 17:40:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <Yg03HB5KHGYWyI0J@work-vm>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: eduardo@habkost.net,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
> > * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > >    Hi,
> > > > Given the semantic differences from 'i440fx', changing the default
> > > > machine type has effects that are equivalent to breaking command
> > > > line syntax compatibility, which is something we've always tried
> > > > to avoid.
> > > 
> > > And if we are fine breaking backward compatibility I'd rather *not* pick
> > > a default, effectively making -M $something mandatory, similar to arm.
> > 
> > Oh, that's probably easy to do;  what are other peoples thoughts on
> > that?
> 
> I agree with Gerd. Getting rid of a default machine on x86 is likely better
> than silently changing it to q35. But I'd maybe say that this should go
> through the deprecation process first?

So just adding something like the following under 'System emulator
machines':

x86 default machine type
------------------------

x86 currently defaults to the very old ```pc``` machine type
which is based on the very old ```i440f``` chipset.  This default
will be removed and the user will be required to specify a machine
type explicitly using -M; users are encouraged to switch to the
not quite as old ```q35``` machine types.


(This option is going to take a lot more work switching all the
test cases over; in my world here I'd only changed the tests that broke
on q35, now everything is going to need to specify a type).

Dave



>  Thomas
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


