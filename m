Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C53F8698
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 13:38:16 +0200 (CEST)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJDho-0006br-Rv
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 07:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mJDgW-0005vm-GA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:36:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mJDgV-0001ds-2D
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629977794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNfBd15+Df1aTkq8KpuiuBaE7wHypXE5iz+/4tqAjao=;
 b=VgPq6t3ssHde6hDQa3QT+HCHa/J7yV3vgvtszQFvIIctWqroeIKxvnYNXrE46jU0M0bGdZ
 nyUS2gRoFcpuWmg59Un8sGqA2tCAJTCe8KY5s0WQ9FP6oGGUwQ8YkA6Y2GovQBGsvevB4j
 xccW5qCbJ5LQADMBfBw+wtc4rtUOISo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-HCCOxltmPoS5JiuAJzuUjg-1; Thu, 26 Aug 2021 07:36:33 -0400
X-MC-Unique: HCCOxltmPoS5JiuAJzuUjg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso809027wma.4
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 04:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DNfBd15+Df1aTkq8KpuiuBaE7wHypXE5iz+/4tqAjao=;
 b=bfod4PmNAz2L4SylB5Lhqm5K80+q6bglh2wPPlNthDEkv5cFJkVrEuRNAT7D26Dw29
 Pq7UEty+M2ztGCG5zyjmROmYBmeaX2ajcyzgSM6F56mUKi/V9d66aWDXehOOLWl1lVA6
 TDuz5fzguYM8YvrJ9SF3SkpO63Tvr1Fa0yPHqGu2gZV9QzH7U7kPgelMSJkOrRrhpQGh
 uCGhrs4dRf7FfiTfeyv0k9E1n4MfpEqr76XMXU7g1w11dIecOFY4tFYRnLEGE5wfWMwn
 iwvMFWYW9FTpYDW1aVTUA++lg205cP02gdjl5Z7I6CddxTz/XBgkm6MfMjWgBDAPHu7u
 YpSg==
X-Gm-Message-State: AOAM532eZmnnf8DBvFICTeFCceCtl9wrU8eqnaEu9zRqikUZDcjvF6ye
 5aiHtfkuqKIarfoEeolo2+BlvrNUDZhxM7yGDf3Z6YAZhbDGwwSTtMq6ALpVhjq6kbQIrHTQNwU
 LrO0amMOo1BptaKM=
X-Received: by 2002:adf:eacb:: with SMTP id o11mr3437157wrn.418.1629977791912; 
 Thu, 26 Aug 2021 04:36:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFInCEOd7mIVtvOEgORMCqOdSV7V6RLfLw1ix66tisGgVPEp9fGCUCH0baAALrWg7/6v9Mqw==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr3437130wrn.418.1629977791681; 
 Thu, 26 Aug 2021 04:36:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h8sm7828946wmb.35.2021.08.26.04.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 04:36:30 -0700 (PDT)
Date: Thu, 26 Aug 2021 13:36:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210826133629.2ddd3b88@redhat.com>
In-Reply-To: <87y28oy6rm.fsf@dusky.pond.sub.org>
References: <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net>
 <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net>
 <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 10:01:01 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Peter Xu <peterx@redhat.com> writes:
> 
> > On Wed, Aug 25, 2021 at 05:50:23PM -0400, Peter Xu wrote:  
> >> On Wed, Aug 25, 2021 at 02:28:55PM +0200, Markus Armbruster wrote:  
> >> > Having thought about this a bit more...
...
> > Any further thoughts will be greatly welcomed.  
> 
> I'd like to propose a more modest solution: detect the problem and fail.
That's or proper dependency tracking (which stands chance to work with QMP,
but like it was said it's complex)

> A simple state machine can track "has IOMMU" state.  It has three states
> "no so far", "yes", and "no", and two events "add IOMMU" and "add device
> that needs to know".  State diagram:
> 
>                           no so far
>                    +--- (start state) ---+
>                    |                     |
>          add IOMMU |                     | add device that
>                    |                     |  needs to know
>                    v                     v
>              +--> yes                    no <--+
>              |     |   add device that   |     |
>              +-----+    needs to know    +-----+
> 
> "Add IOMMU" in state "no" is an error.

question is how we distinguish "device that needs to know"
from device that doesn't need to know, and then recently
added feature 'bypass IOMMU' adds more fun to this.
 
> "Add IOMMU" in state "yes" stays in state "yes" if multiple IOMMU make
> sense.  Else it's an error.
> 
> The state machine could be owned by the machine type.
> 
> 


