Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE13FBCC4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 21:05:34 +0200 (CEST)
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKmb6-0007mn-JI
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 15:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mKmYk-0005r3-Ar
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 15:03:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mKmYe-0004cu-Ks
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 15:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630350178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ccc2ABZFzTRWkBjbJf2g2wleBQDQMDfMm64Qr4HN/k=;
 b=MWPwXeBVGMsgcHownwmCdstWIqNsnC5ssQ6W/xYr7e2e3CxmnARElzFUYGYatJ62flZoiX
 ZQdwpoPGSTjAty++vtZkrT6x462Z2MpOM1IUvLmun1PJ4dr6tOZleK606cjX004oJfd5VH
 wgTYapRYl+4k7qmSzqjbeLsfJBjVGJ4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-440hk3FON0KcODIPRZBtbQ-1; Mon, 30 Aug 2021 15:02:57 -0400
X-MC-Unique: 440hk3FON0KcODIPRZBtbQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 q19-20020ac87353000000b0029a09eca2afso183432qtp.21
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 12:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ccc2ABZFzTRWkBjbJf2g2wleBQDQMDfMm64Qr4HN/k=;
 b=NFP1mBn7S37JbcFA1J4tLbFozGsBc5zSRCmkizpMbYL3eLszqXUhLocLkuepqGHDwU
 z/+Rz+CooGXV4bkU4bAuWwJoeQ0S3X0Kt3NLmP0m/QDMfnVxqOPsjbOTXKdx8TOi3+pP
 x63USSjfgrjiXNouBB2Ba95PV2oyswYwkcjpw+G4U9g3W3lajVy18+RFclwuDCGm1EWy
 vNUXpzYxXtbrmYz4DwAk//rRxGW1x7m3K+tMdc4a8eDmJ8Fx7j1TJY//G+THdZpMHDhp
 MTbPaaAtl7DxCYPadRy+pQS/oRDSK5gBf1rivVErnquOJPMY3/cMXm1Gh3gvAzJ//mn6
 oshw==
X-Gm-Message-State: AOAM5330cnVomiW28kB7qEqjIsmxKdUnne44PfQyFgu0rfTcaZrE/yLy
 gtTD7wqiASe4O6w65zRR98ak3xv/0XXCyuvjesVX5A/64HQuevuW3eo3RzzNCpID4W29ndicFO2
 IR3uRIaDdI0dl240=
X-Received: by 2002:a0c:e790:: with SMTP id x16mr24480619qvn.6.1630350176503; 
 Mon, 30 Aug 2021 12:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjn1wq6W7hR5o32XgZhvT22OB6v46/Zl0+VWfZXHiXGnrKsWx36DYSFiElSeMDkBOflW8xLQ==
X-Received: by 2002:a0c:e790:: with SMTP id x16mr24480588qvn.6.1630350176193; 
 Mon, 30 Aug 2021 12:02:56 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id f28sm11744425qkk.10.2021.08.30.12.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 12:02:55 -0700 (PDT)
Date: Mon, 30 Aug 2021 15:02:53 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YS0rXQXwqKjhr4TA@t490s>
References: <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net>
 <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
MIME-Version: 1.0
In-Reply-To: <YSean3PIkslbTHeU@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 09:43:59AM -0400, Peter Xu wrote:
> > > A simple state machine can track "has IOMMU" state.  It has three states
> > > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
> > > that needs to know".  State diagram:
> > > 
> > >                           no so far
> > >                    +--- (start state) ---+
> > >                    |                     |
> > >          add IOMMU |                     | add device that
> > >                    |                     |  needs to know
> > >                    v                     v
> > >              +--> yes                    no <--+
> > >              |     |   add device that   |     |
> > >              +-----+    needs to know    +-----+
> > > 
> > > "Add IOMMU" in state "no" is an error.
> > 
> > question is how we distinguish "device that needs to know"
> > from device that doesn't need to know, and then recently
> > added feature 'bypass IOMMU' adds more fun to this.
> 
> Maybe we can start from "no device needs to know"? Then add more into it when
> the list expands.
> 
> vfio-pci should be a natural fit because we're sure it won't break any valid
> old configurations.  However we may need to be careful on adding more devices,
> e.g. when some old configuration might work on old binaries, but I'm not sure.

Btw, I think this state machine is indeed bringing some complexity on even
understanding it - it is definitely working but it's not obvious to anyone at
the first glance, and it's only solving problem for vIOMMU.  E.g., do we need
yet another state machine for some other ordering constraints?

From that POV, I don't like this solution more than the simple "assign priority
for device realization" idea..

-- 
Peter Xu


