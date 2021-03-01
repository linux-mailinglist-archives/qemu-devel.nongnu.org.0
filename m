Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D901327831
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 08:21:25 +0100 (CET)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGcrs-0004KW-6P
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 02:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGcqv-0003oE-T1
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:20:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGcqu-0001yo-9G
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 02:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614583223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zZtpH/VwXUeiGGuvHWVWOWekngO75gAT4pEa7bprv4A=;
 b=dlNz+xjChtYtaK4HykVTol9qJkfLjQgYkx+Wwx3gH7FAJ7+d+Jkshx2hRjhpOLkgwRgvzW
 DwJf7Kw+MrGfCAZFp1EVSLKmVmjZVOqnQmoP8I7mnw/Sg5IneuNwRALdzrHx/hcvnoGSsa
 YGGnYiNqb/YESaR01Nbmls4kN4Q8Dj0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-excGpglJMN-xjLBiANwL_A-1; Mon, 01 Mar 2021 02:20:08 -0500
X-MC-Unique: excGpglJMN-xjLBiANwL_A-1
Received: by mail-ed1-f69.google.com with SMTP id q1so8285323edv.5
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 23:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zZtpH/VwXUeiGGuvHWVWOWekngO75gAT4pEa7bprv4A=;
 b=s5Zqfp/tTHWT+gKscQRFbCeJp9bcQ1hN/QKAHebu9rB0rL90rveuqYYK8xaf0QQWCD
 +ZaBfOcohz09FQ/efZQRJFO85QkxmkNl/RaEcVZaKCLQU8N8mMX9RNq0xJcD7335zNA3
 Eh3CuT3jCOae1MhKJFOaqswOmUZdEOPcFDIyPE2M5TVK+qFIrvjq7/Msys/qxchpa2jL
 IvK0iIuPRmk7iVw393N4w0FdAPszShJOx+iltl1sWG0dub5rx+AiJ/y9xB49sYSHgG9t
 tZgSw1KpUTQcVR1WTchX0MIrPd5PfyVgskMpzfooPh1NCU+HUXaBVUr0dr3nYxu9WCOh
 /s5w==
X-Gm-Message-State: AOAM532X6Ee5fyEavA/BYQPHU5L1e3FjdFex/ROkzHRxG0LaaIgcZzpV
 79EQaWVH+bL7fKFbb5zSWMzkh6ArWXjIy+dj5up0nGauY0Yq/Du555RAJ6zJ//+Uz6rtf7PagmS
 Hwi027Rpr6MgYAMM=
X-Received: by 2002:a05:6402:35d0:: with SMTP id
 z16mr4728266edc.151.1614583207104; 
 Sun, 28 Feb 2021 23:20:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaWWFfCFOlF99AagT0387Cw5cq80FJPyKfuuQJQImeHhbdz19vQco8pbyt56RYm3grFJjuGw==
X-Received: by 2002:a05:6402:35d0:: with SMTP id
 z16mr4728253edc.151.1614583206940; 
 Sun, 28 Feb 2021 23:20:06 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id de17sm5925107ejc.16.2021.02.28.23.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 23:20:05 -0800 (PST)
Date: Mon, 1 Mar 2021 02:20:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20210301021449-mutt-send-email-mst@kernel.org>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
 <967d3e1f-d387-0b33-95b0-6560f49657dd@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <967d3e1f-d387-0b33-95b0-6560f49657dd@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, vit9696 <vit9696@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 08:12:35AM +0100, Thomas Lamprecht wrote:
> On 28.02.21 21:43, Michael S. Tsirkin wrote:
> > Sure. The way to do that is to tie old behaviour to old machine
> > versions. We'll need it in stable too ...
> 
> Yeah, using machine types is how its meant to be with solving migration
> breakage, sure.
> But that means we have to permanently pin the VM, and any backup restored from
> that to that machine type *forever*. That'd be new for us as we always could
> allow a newer machine type for a fresh start (i.e., non migration or the like)
> here, and mean that lots of other improvements guarded by a newer machine type
> for those VMs will.

If you don't do that, that is a bug as any virtual hardware
can change across machine types.

> Why not a switch + machine type, solves migration and any special cases of it
> but also allows machine updates but also to keep the old behavior?

I am not really sure what you mean here, sound like a new feature -
at a guess it will take a while to formulate and is unlikely
to be backported to stable and so help with historical
releases.

> And yeah, stable is wanted, but extrapolating from the current stable releases
> frequency, where normally there's maximal one after 5-6 months from the .0
> release, means that this will probably still hit all those distributions I
> mentioned or is there something more soon planned?
> 
> Also, is there any regression testing infrastructure around to avoid such
> changes in the future? This change got undetected for 7 months, which can be
> pretty the norm for QEMU releases, so some earlier safety net would be good? Is
> there anything which dumps various default machine HW layouts and uses them for
> an ABI check of some sorts?

There are various testing efforts the reason this got undetected is
because it does not affect linux guests, and even for windows
they kind of recover, there's just some boot slowdown around reconfiguration.
Not easy to detect automatically given windows has lots of random
downtime during boot around updates etc etc.

-- 
MST


