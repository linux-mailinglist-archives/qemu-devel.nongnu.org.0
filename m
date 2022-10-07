Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A965F7A78
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:24:55 +0200 (CEST)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpDa-000675-FT
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ognep-0000R6-1d
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ognel-0006gv-Dv
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665150290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4GMPD8oqBS4LOqgQsiw5vIOtVWDGebMorjW0XBAzndo=;
 b=Ml859RmzaOUiaqbEwLCZnqjNxxiqIGGeobHjuM+gO1NSqj0+6OXOnWiW5anHNsZaKsvM6o
 NuTbJK+jRK6bbODlr4T9L8XPyUozws/AzUX/udCMJ3+OpCecaJGhFIQTLmWpMrHTbq5/77
 jOuxDXj4LXOe2muHx0G35xYue6mhpLA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-CXPE5s3iNNinBElHPYKPXA-1; Fri, 07 Oct 2022 09:44:48 -0400
X-MC-Unique: CXPE5s3iNNinBElHPYKPXA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so1409410wmh.6
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 06:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4GMPD8oqBS4LOqgQsiw5vIOtVWDGebMorjW0XBAzndo=;
 b=NlU0DGipLRc04c47ppedJpE/ym1oLyJwNoa+r99P9orfb9D9xRip0+8NjWByXXuGNy
 VQLYrNuFuqYCIc0ZWOi29/3EC+t5Sa3Alicot02vb+wli5K3A5Tk1Ib9AciMG7oULJv5
 Bal1cDyhuKkaZmqFQifAFcclAUoqUwZQSTsN0AVqNo8uXMEaolYUk+HdizDixWj8pwna
 2qSi/mlL+d57S8n1vqerCUeE2T+TjnuXATtMNfmUfUy1osUB5YyYCbZSITA86Cb32/nd
 oP4IzLEtwofQHzBt+0cQUKzGugfDS33zDN5goIDYKK/DAh96Bl6hdF9kPBADS1mppOS3
 mVyA==
X-Gm-Message-State: ACrzQf2xZMfXvqxQuKiM93B8GuqWDhvLVqty9TWOXxnldQEg08ppCA93
 Zk6Aq0eR2vBCHFO5+Wfs2VcXiGqKVRXYltLfgt91ftkFSmZVvhpLu2Oxa4NqGJ2y2VuRsMdvF6q
 t8XOlVhGTzezLGyI=
X-Received: by 2002:a5d:6446:0:b0:22c:df37:4d76 with SMTP id
 d6-20020a5d6446000000b0022cdf374d76mr3335341wrw.247.1665150287591; 
 Fri, 07 Oct 2022 06:44:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JEpMmXo+TF3bHZD/1Xp0gu8UIKxaTqIvgouvJOohRPzIsn3Cy9fqHwCUVF1xdprW/WzoW2g==
X-Received: by 2002:a5d:6446:0:b0:22c:df37:4d76 with SMTP id
 d6-20020a5d6446000000b0022cdf374d76mr3335318wrw.247.1665150287338; 
 Fri, 07 Oct 2022 06:44:47 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b003a319b67f64sm18723614wms.0.2022.10.07.06.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:44:46 -0700 (PDT)
Date: Fri, 7 Oct 2022 09:44:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm <kvm@vger.kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
Message-ID: <20221007094427-mutt-send-email-mst@kernel.org>
References: <20220922101454.1069462-1-kraxel@redhat.com>
 <YyxF2TNwnXaefT6u@redhat.com>
 <20220922122058.vesh352623uaon6e@sirius.home.kraxel.org>
 <CABgObfavcPLUbMzaLQS2Rj2=r5eAhuBuKdiHQ4wJGfgPm_=XsQ@mail.gmail.com>
 <20220922203345.3r7jteg7l75vcysv@sirius.home.kraxel.org>
 <CABgObfZS+xW9dTKNy34d0ew1VbxzH8EKtEZO3MwGsX+DUPzWqw@mail.gmail.com>
 <20220923062312.sibqhfhfznnc22km@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923062312.sibqhfhfznnc22km@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 08:23:12AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > Given newer processors have more than 40 and for older ones we know
> > > the possible values for the two relevant x86 vendors we could do
> > > something along the lines of:
> > >
> > >    phys-bits >= 41                   -> valid
> > >    phys-bits == 40    + AuthenticAMD -> valid
> > >    phys-bits == 36,39 + GenuineIntel -> valid
> > >    everything else                   -> invalid
> > >
> > > Does that look sensible to you?
> > >
> > 
> > Yes, it does! Is phys-bits == 36 the same as invalid?
> 
> 'invalid' would continue to use the current guesswork codepath for
> phys-bits.  Which will end up with phys-bits = 36 for smaller VMs, but
> it can go beyond that in VMs with alot (32G or more) of memory.  That
> logic assumes that physical machines with enough RAM for 32G+ guests
> have a physical address space > 64G.
> 
> 'phys-bits = 36' would be a hard limit.
> 
> So, it's not exactly the same but small VMs wouldn't see a difference.
> 
> take care,
>   Gerd

I dropped the patch for now.

-- 
MST


