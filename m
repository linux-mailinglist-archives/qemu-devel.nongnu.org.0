Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D8229ACAF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:03:19 +0100 (CET)
Received: from localhost ([::1]:52302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXOdC-0002fG-TO
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kXOVK-00033d-88
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 08:55:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kXOVF-0001MW-Kp
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 08:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603803278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NI696C0arYXyJKNdzV6AT0qwIrcLWRp7/iEfe09jum4=;
 b=iZgJrwyFTt4ARP76AR7d7bw3mAuWWbEIchZjcEcp0VdediHGd5idv/+kEbtLGEpfgu1/0g
 gvT0TqZYHBlWbco+0W4SVldcQond2eUnpbwbDtDGTW0SVNbA957O7b9+MhXR4BAlDkZGqC
 IdcxfdG+8Fn/9jCC00tuc9lEpPqLH/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-W4tvVg4pN5OKUxqp3C9ccQ-1; Tue, 27 Oct 2020 08:54:36 -0400
X-MC-Unique: W4tvVg4pN5OKUxqp3C9ccQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C29802B77
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 12:54:35 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1969F55760;
 Tue, 27 Oct 2020 12:54:28 +0000 (UTC)
Date: Tue, 27 Oct 2020 13:54:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pci: Refuse to hotplug PCI Devices when the Guest OS is
 not ready
Message-ID: <20201027135426.765dd19b@redhat.com>
In-Reply-To: <20201027072430-mutt-send-email-mst@kernel.org>
References: <20201022080354-mutt-send-email-mst@kernel.org>
 <20201022235632.7f69ddc9@yekko.fritz.box>
 <CAC_L=vVi6ngD6j0sZ2uLZ-NHF2WGzKfiOvmsHxOZaBRv6FuBug@mail.gmail.com>
 <20201022100028-mutt-send-email-mst@kernel.org>
 <CAC_L=vWctLK0Yjod_Vz=+xzFKFp4UoUdjSVa4jWeDm+g8en6wQ@mail.gmail.com>
 <20201022102857-mutt-send-email-mst@kernel.org>
 <CAC_L=vX0+H-SfQHneVPd-Mc3wFxHBSbkKHt3SpNOBOY_JsYDUA@mail.gmail.com>
 <20201022110016-mutt-send-email-mst@kernel.org>
 <CAC_L=vUgsh=08m8EEuEucRtdX73X5kw5ov4Ekg7jFjbHsU6f2w@mail.gmail.com>
 <20201026174537.128a4173@yekko.fritz.box>
 <20201027072430-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: David Gibson <dgibson@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Oct 2020 07:26:44 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 26, 2020 at 05:45:37PM +1100, David Gibson wrote:
> > On Fri, 23 Oct 2020 09:26:48 +0300
> > Marcel Apfelbaum <marcel.apfelbaum@gmail.com> wrote:
> >   
> > > Hi Michael,
> > > 
> > > On Thu, Oct 22, 2020 at 6:01 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > 
> > >  [...]  
[...]
> > > Simplistic does not mean wrong or incorrect.
> > > I fail to see why it is not enough.
> > > 
> > > What QEMU can do better? Wait an unbounded time for the blinking to finish?  
> > 
> > It certainly shouldn't wait an unbounded time.  But a wait with timeout
> > seems worth investigating to me.  
racy, timeout is bound to break once it's in overcommited env.

> If it's helpful, I'd add a query to check state
> so management can figure out why doesn't guest see device yet.
that means mgmt would have to poll it and forward it to user
somehow.

> But otherwise just buffer the request until such time as
> we can deliver it to guest ...
I have more questions wrt the suggestion/workflow:
* at what place would you suggest buffering it?
* what would be the request in this case, i.e. create PCI device anyways
and try to signal hotplug event later?
* what would baremethal do in such case?
* what to do in case guest is never ready, what user should do in such case?
* can be such device be removed?

not sure that all of this is worth of the effort and added complexity.

alternatively:
maybe ports can send QMP events about it's state changes, which end user would
be able to see + error like in this patch.

On top of it, mgmt could build a better UIx, like retry/notify logic if
that's what user really wishes for and configures (it would be up to user to
define behaviour).

> > > What if we have a buggy guest with a kernel stuck in blinking?
> > > Is QEMU's responsibility to emulate the operator itself? Because the
> > > operator
> > > is the one who is supposed to wait.
> > > 
> > > 
> > > Thanks,
> > > Marcel
> > > 
> > > [...]  
> > 
> > 
> > -- 
> > David Gibson <dgibson@redhat.com>
> > Principal Software Engineer, Virtualization, Red Hat  
> 
> 
> 


