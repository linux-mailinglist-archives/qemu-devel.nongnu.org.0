Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F054253011
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 15:37:36 +0200 (CEST)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAvcN-0000RV-Et
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 09:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAvbg-0008RR-M6
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 09:36:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54924
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAvbe-0006fK-Fr
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 09:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598449009;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1g8amj6zMF8d08abjkQZOc5L5cNYqr2NtB0aF5i//iE=;
 b=iFOWNELbMVWk49b3AqAw235B/+QP4sZnwQFRqpOzpmX9zvZ498BPxlA7DxnRaLiaYxMeQm
 c+9qXRXoftSmQSLtxifXmcd/NwaO+AiV6UkAfXWp+fWjPDXXh2MNQO2WB/7g5cSKfE94Qf
 SRP+sesMg27Chdon8VuleelEo7wSWlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-68XG6J36MkeSg9hrQJQWXQ-1; Wed, 26 Aug 2020 09:36:47 -0400
X-MC-Unique: 68XG6J36MkeSg9hrQJQWXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6260801ABE;
 Wed, 26 Aug 2020 13:36:45 +0000 (UTC)
Received: from redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE7B17E722;
 Wed, 26 Aug 2020 13:36:40 +0000 (UTC)
Date: Wed, 26 Aug 2020 14:36:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v5 0/8] Remove EPYC mode apicid decode and use generic
 decode
Message-ID: <20200826133638.GO168515@redhat.com>
References: <159804762216.39954.15502128500494116468.stgit@naples-babu.amd.com>
 <20200826143849.59f6970b@redhat.com>
 <20200826125059.GN168515@redhat.com>
 <20200826153034.115126cb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200826153034.115126cb@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: ehabkost@redhat.com, mst@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 qemu-devel@nongnu.org, Babu Moger <babu.moger@amd.com>, pbonzini@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 26, 2020 at 03:30:34PM +0200, Igor Mammedov wrote:
> On Wed, 26 Aug 2020 13:50:59 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Wed, Aug 26, 2020 at 02:38:49PM +0200, Igor Mammedov wrote:
> > > On Fri, 21 Aug 2020 17:12:19 -0500
> > > Babu Moger <babu.moger@amd.com> wrote:
> > >   
> > > > To support some of the complex topology, we introduced EPYC mode apicid decode.
> > > > But, EPYC mode decode is running into problems. Also it can become quite a
> > > > maintenance problem in the future. So, it was decided to remove that code and
> > > > use the generic decode which works for majority of the topology. Most of the
> > > > SPECed configuration would work just fine. With some non-SPECed user inputs,
> > > > it will create some sub-optimal configuration.
> > > > Here is the discussion thread.
> > > > https://lore.kernel.org/qemu-devel/c0bcc1a6-1d84-a6e7-e468-d5b437c1b254@amd.com/
> > > > 
> > > > This series removes all the EPYC mode specific apicid changes and use the generic
> > > > apicid decode.  
> > > 
> > > the main difference between EPYC and all other CPUs is that
> > > it requires numa configuration (it's not optional)
> > > so we need an extra patch on top of this series to enfoce that, i.e:
> > > 
> > >  if (epyc && !numa) 
> > >     error("EPYC cpu requires numa to be configured")  
> > 
> > Please no. This will break 90% of current usage of the EPYC CPU in
> > real world QEMU deployments. That is way too user hostile to introduce
> > as a requirement.
> > 
> > Why do we need to force this ?  People have been successfuly using
> > EPYC CPUs without NUMA in QEMU for years now.
> > 
> > It might not match behaviour of bare metal silicon, but that hasn't
> > obviously caused the world to come crashing down.
> So far it produces warning in linux kernel (RHBZ1728166),
> (resulting performance might be suboptimal), but I haven't seen
> anyone reporting crashes yet.
> 
> 
> What other options do we have?
> Perhaps we can turn on strict check for new machine types only,
> so old configs can keep broken topology (CPUID),
> while new ones would require -numa and produce correct topology.

No, tieing this to machine types is not viable either. That is still
going to break essentially every single management application that
exists today using QEMU.

Breaking stuff existing apps is not acceptable for something that is
merely reporting sub-optimal performance. That's simply a documentation
task to highlight best practice to app developers.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


