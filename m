Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765612FB3DC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:17:31 +0100 (CET)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mCf-0001ek-Vw
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l1mBi-0001Dd-QU
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:16:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l1mBh-0001hK-65
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611044187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6CpEdRf4B3o+kwhJ32w+4smIUz2I29084pCD5mmSA0=;
 b=QgTuFZGs7dchc+OgOccZowlZic0nYZAp6iq9uWG3kIYTOU4NGJrqBpMjB3GG5Hn4fVdwGL
 hcHijqQ0XeaajBH0BqKj91vtfCOe1Zys/TJZO4onMqVnFa56MgRbBCC7rNnXqQwv2Jd1TR
 byh+d3xXP/s1Yy3lSkSeLxenYrQvYFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-E-QR9IApNyiHivYJ-u5Tug-1; Tue, 19 Jan 2021 03:16:24 -0500
X-MC-Unique: E-QR9IApNyiHivYJ-u5Tug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0B3F59;
 Tue, 19 Jan 2021 08:16:21 +0000 (UTC)
Received: from gondolin (ovpn-113-246.ams2.redhat.com [10.36.113.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A517A620D7;
 Tue, 19 Jan 2021 08:16:10 +0000 (UTC)
Date: Tue, 19 Jan 2021 09:16:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v7 07/13] confidential guest support: Introduce cgs
 "ready" flag
Message-ID: <20210119091608.34fff5dc.cohuck@redhat.com>
In-Reply-To: <20210118194730.GH9899@work-vm>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-8-david@gibson.dropbear.id.au>
 <20210118194730.GH9899@work-vm>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 David Gibson <david@gibson.dropbear.id.au>, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jan 2021 19:47:30 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * David Gibson (david@gibson.dropbear.id.au) wrote:
> > The platform specific details of mechanisms for implementing
> > confidential guest support may require setup at various points during
> > initialization.  Thus, it's not really feasible to have a single cgs
> > initialization hook, but instead each mechanism needs its own
> > initialization calls in arch or machine specific code.
> > 
> > However, to make it harder to have a bug where a mechanism isn't
> > properly initialized under some circumstances, we want to have a
> > common place, relatively late in boot, where we verify that cgs has
> > been initialized if it was requested.
> > 
> > This patch introduces a ready flag to the ConfidentialGuestSupport
> > base type to accomplish this, which we verify just before the machine
> > specific initialization function.  
> 
> You may find you need to define 'ready' and the answer might be a bit
> variable; for example, on SEV there's a setup bit and then you may end
> up doing an attestation and receiving some data before you actaully let
> the guest execute code.   Is it ready before it's received the
> attestation response or only when it can run code?
> Is a Power or 390 machine 'ready' before it's executed the magic
> instruction to enter the confidential mode?

I would consider those machines where the guest makes the transition
itself "ready" as soon as everything is set up so that the guest can
actually initiate the transition. Otherwise, those machines would never
be "ready" if the guest does not transition.

Maybe we can define "ready" as "the guest can start to execute in
secure mode", where "guest" includes the bootloader and everything that
runs in a guest context, and "start to execute" implies that some setup
may be done only after the guest has kicked it off?


