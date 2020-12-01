Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB82CAAF0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:42:27 +0100 (CET)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkAba-0001kN-L3
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkAaM-00016O-T2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:41:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkAaK-0005zW-I0
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 13:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606848067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EDLMKMOMeQcOO8kAElzyOyqRcVJFfn9e5B+cCQQXzUU=;
 b=EYoLlsZkEjNtpZrmK4w+eX2rrjphAT7yoyRHUR2oVFMo1KI+hbHTlZuTFu0vlqqA2Mv+9/
 hDvWREKvOqhVouQ4opBflGL7JVoGPTbOV8nLKAyRDFCYW5Hw4XWBIWwVDbxxa7KvSasARi
 O1ZCsCIeaZi3RA20w2KpCpixcoojPP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-FvrNusRaNnacShaL511ipw-1; Tue, 01 Dec 2020 13:41:05 -0500
X-MC-Unique: FvrNusRaNnacShaL511ipw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 328AC1005E58;
 Tue,  1 Dec 2020 18:41:04 +0000 (UTC)
Received: from work-vm (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 731DD5D6AD;
 Tue,  1 Dec 2020 18:40:58 +0000 (UTC)
Date: Tue, 1 Dec 2020 18:40:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201201184055.GM4338@work-vm>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
 <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: Peter Krempa <pkrempa@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> On 01.12.2020 13:53, Peter Krempa wrote:
> > On Tue, Dec 01, 2020 at 11:42:18 +0300, Andrey Gruzdev wrote:
> > > On 01.12.2020 10:08, Peter Krempa wrote:
> > > > On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
> > > > > This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> > 
> > [...]
> > 
> > > > Note that in cases when qemu can't guarantee that the
> > > > background_snapshot feature will work it should not advertise it. We
> > > > need a way to check whether it's possible to use it, so we can replace
> > > > the existing --live flag with it rather than adding a new one and
> > > > shifting the problem of checking whether the feature works to the user.
> > > > 
> > > 
> > > Hi,
> > > 
> > > May be you are using hugetlbfs as memory backend?
> > 
> > Not exactly hugepages, but I had:
> > 
> >    <memoryBacking>
> >      <access mode='shared'/>
> >    </memoryBacking>
> > 
> > which resulted into the following commandline to instantiate memory:
> > 
> > -object memory-backend-file,id=pc.ram,mem-path=/var/lib/libvirt/qemu/ram/6-upstream-bj/pc.ram,share=yes,size=33554432000,host-nodes=0,policy=bind \
> > 
> > When I've removed it I got:
> > 
> > -object memory-backend-ram,id=pc.ram,size=33554432000,host-nodes=0,policy=bind \
> > 
> > And the migration didn't fail in my quick test. I'll have a more
> > detailed look later, thanks for the pointer.
> > 
> 
> Yep, seems that current userfaultfd supports hugetlbfs and shared memory for
> missing pages but not for wr-protected..

For hugepages, you'd need kernel support - but also you'd want to make
sure you write the whole hugepage at once.

For shared, there's a harder problem to ask; what happens if RAM is
written by the other process - for postcopy, we get the other process
to send us a userfaultfd that they have registered with their VM.

Dave

> > > I totally agree that we need somehow check that kernel and VM memory backend
> > > support the feature before one can enable the capability.
> > > Need to think about that..
> > 
> > Definitely. Also note that memory backed by memory-backend-file will be
> > more and more common, for cases such as virtiofs DAX sharing and
> > similar.
> > 
> 
> I see.. That needs support from kernel side, so far 'background-snapshots'
> are incompatible with memory-backend-file sharing.
> 
> -- 
> Andrey Gruzdev, Principal Engineer
> Virtuozzo GmbH  +7-903-247-6397
>                 virtuzzo.com
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


