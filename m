Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D292CA0E8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:07:20 +0100 (CET)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3V9-0002bi-OW
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kk3HZ-00038H-Ms
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:53:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kk3HX-0001hB-Sr
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606819995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Eu7lJn0aKflqPDi85Ziokul6w//LMkjmBVs6tEGTSRY=;
 b=CdOY2C7Si8ZkkG0V8Nna6vbG2egyyrdqcy40yqP9ZHM+BSiSxHnta9NLdouEOXAXkteaAw
 a8JlLYYfjkSiG+8H7xUuSVgDoyOBzIs3HEjcP642bfKfB21XxUuz6FJarSy3Vf0kvoglJg
 izOSySePgUelszkMRmdEjco3VaWzveI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-eOmWBz0XMyKzy49VhyfXuw-1; Tue, 01 Dec 2020 05:53:13 -0500
X-MC-Unique: eOmWBz0XMyKzy49VhyfXuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E17B817B92;
 Tue,  1 Dec 2020 10:53:12 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F2119C47;
 Tue,  1 Dec 2020 10:53:03 +0000 (UTC)
Date: Tue, 1 Dec 2020 11:53:00 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201201105300.GQ105758@angien.pipo.sk>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 11:42:18 +0300, Andrey Gruzdev wrote:
> On 01.12.2020 10:08, Peter Krempa wrote:
> > On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
> > > This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's

[...]

> > Note that in cases when qemu can't guarantee that the
> > background_snapshot feature will work it should not advertise it. We
> > need a way to check whether it's possible to use it, so we can replace
> > the existing --live flag with it rather than adding a new one and
> > shifting the problem of checking whether the feature works to the user.
> > 
> 
> Hi,
> 
> May be you are using hugetlbfs as memory backend?

Not exactly hugepages, but I had:

  <memoryBacking>
    <access mode='shared'/>
  </memoryBacking>

which resulted into the following commandline to instantiate memory:

-object memory-backend-file,id=pc.ram,mem-path=/var/lib/libvirt/qemu/ram/6-upstream-bj/pc.ram,share=yes,size=33554432000,host-nodes=0,policy=bind \

When I've removed it I got:

-object memory-backend-ram,id=pc.ram,size=33554432000,host-nodes=0,policy=bind \

And the migration didn't fail in my quick test. I'll have a more
detailed look later, thanks for the pointer.

> I totally agree that we need somehow check that kernel and VM memory backend
> support the feature before one can enable the capability.
> Need to think about that..

Definitely. Also note that memory backed by memory-backend-file will be
more and more common, for cases such as virtiofs DAX sharing and
similar.


