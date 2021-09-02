Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910E13FEA9D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:27:50 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLi4b-0000ZS-BJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLi3E-0007YJ-5u
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLi3C-00045L-HA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630571181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c02FoSRfX5VcMXk/8BL2rNfYtTQE8/eZ4x/pcRidF8M=;
 b=O8KLfAqfI/VXkXxOC53l5Np2CSZ/hoNYYdZH99vM2OfRD71gQozCrBfoV/PoZjkWP/T9xE
 lGLuse3k9ee657C5/O9Ax3HpInhbU2S+nRpWqG1nX+Vj7WHrhyC0Hbu5N/IhmCOcXhqFqe
 XUWy98IIJrWv7WRNuk7bsdNqaKzMiSA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-YzkmFNPPP5SmUI7AM7uo_Q-1; Thu, 02 Sep 2021 04:26:20 -0400
X-MC-Unique: YzkmFNPPP5SmUI7AM7uo_Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so416762wmj.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 01:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c02FoSRfX5VcMXk/8BL2rNfYtTQE8/eZ4x/pcRidF8M=;
 b=a0vLeuKftNSGNYX5C++Mi4T5Q43fiAhsP8Ff1z5CvryhaGetyrZS3OPfqINlzit1y1
 LFTdyXlHxHNBsluTK58Q2JpwRJ3wzfmJ8RwFioOJpHwpQun7cNP/H8i4TIiadENe2tZQ
 TBZSDqoA7sEJa8PKYgSChJHfTuWQQYrJi7KNjC58VCth6m6LfObrKJd4XbtZs/4Qslj0
 IUDYoiYjIAHEoz+WGTzzB2HtRUTdZEFr286b8Gl+TkE0qkARmJWbRGGiEnqOQwcO0DGr
 ppoNsfJ9uel8Yjm0TEQmejTJEy+FCgejAVSb4eXYfYpHUJohik3N9jbe+X8wIy5CXGBr
 XcVA==
X-Gm-Message-State: AOAM532nVeyw3r08DRHKtZxKWJE9/Q87e/XF9g/abbZhSv1o0I3YgPRA
 LitBQ7u5wDYRD8WnL4yG+b1ap+4/PmzrCt8zSnx5vey65VtuCjT40oueulZatx52jMqHOOqFodQ
 CP6kSGLJGQlPAgeI=
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr2260770wro.46.1630571179411; 
 Thu, 02 Sep 2021 01:26:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlVPiell3VpLfm8TlGhHdocvrV5ZRFePXmnU7ruV8xju3ubNMBbQvRcOJjmB7Hp8KKL6ohOQ==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr2260737wro.46.1630571179210; 
 Thu, 02 Sep 2021 01:26:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z1sm986248wmi.34.2021.09.02.01.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 01:26:18 -0700 (PDT)
Date: Thu, 2 Sep 2021 10:26:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210902102616.1b596104@redhat.com>
In-Reply-To: <YS0rXQXwqKjhr4TA@t490s>
References: <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net>
 <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P . =?UTF-8?B?QmVycmFu?=
 =?UTF-8?B?Z8Op?=" <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Aug 2021 15:02:53 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Thu, Aug 26, 2021 at 09:43:59AM -0400, Peter Xu wrote:
> > > > A simple state machine can track "has IOMMU" state.  It has three states
> > > > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
> > > > that needs to know".  State diagram:
> > > > 
> > > >                           no so far
> > > >                    +--- (start state) ---+
> > > >                    |                     |
> > > >          add IOMMU |                     | add device that
> > > >                    |                     |  needs to know
> > > >                    v                     v
> > > >              +--> yes                    no <--+
> > > >              |     |   add device that   |     |
> > > >              +-----+    needs to know    +-----+
> > > > 
> > > > "Add IOMMU" in state "no" is an error.  
> > > 
> > > question is how we distinguish "device that needs to know"
> > > from device that doesn't need to know, and then recently
> > > added feature 'bypass IOMMU' adds more fun to this.  
> > 
> > Maybe we can start from "no device needs to know"? Then add more into it when
> > the list expands.
> > 
> > vfio-pci should be a natural fit because we're sure it won't break any valid
> > old configurations.  However we may need to be careful on adding more devices,
> > e.g. when some old configuration might work on old binaries, but I'm not sure.  
> 
> Btw, I think this state machine is indeed bringing some complexity on even
> understanding it - it is definitely working but it's not obvious to anyone at
> the first glance, and it's only solving problem for vIOMMU.  E.g., do we need
> yet another state machine for some other ordering constraints?
>
> From that POV, I don't like this solution more than the simple "assign priority
> for device realization" idea..
It seems simple but implicit dependencies are fragile (good or
I'd rather say bad example implicit dependencies is vl.c magic code,
where changing order of initialization can easily break QEMU,
which happens almost every time it's refactored),
and as Markus already mentioned it won't work in QMP case.

What could work for both cases is explicit dependencies,
however it would be hard to describe such dependency in this case,
where device can work both with and without IOMMU depending
on the bus settings it's attached to.

Have you considered another approach, i.e. instead of reordering,
change vfio-pci device model to reconfigure DMA address space
after realize time (ex: at reset time)?



