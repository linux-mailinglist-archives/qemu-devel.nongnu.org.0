Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD026E68C5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 17:58:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ponho-00056N-7U; Tue, 18 Apr 2023 11:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ponhj-00055x-VD
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ponhi-0004d7-Bp
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 11:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681833433;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jucnprft4R7dkXcGIPdnJO21tm1y/lrpfc+RdMe0Vr4=;
 b=Z9MTuGFgeDq+An5F9xxlBDBhusaQB/0o2JbJCAL2gIOUIU05K5kNFdIyqRZpnLJCm6fslr
 l0YMgf5OT2HDbb0/VqI2woC2Gxa7rBbbGps04tXLDSbDC67mtulRK6q63P+xojNw8nTzSb
 OrN/3rRwCrq6wpNEHN/npqOykO2uKEs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-ucSSOUnQMAuOp75x4TYC7w-1; Tue, 18 Apr 2023 11:57:10 -0400
X-MC-Unique: ucSSOUnQMAuOp75x4TYC7w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B5E8884EC3;
 Tue, 18 Apr 2023 15:57:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FE28492C3E;
 Tue, 18 Apr 2023 15:57:06 +0000 (UTC)
Date: Tue, 18 Apr 2023 16:57:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, nsg@linux.ibm.com,
 frankja@linux.ibm.com
Subject: Re: [PATCH v19 01/21] s390x/cpu topology: add s390 specifics to CPU
 topology
Message-ID: <ZD690MgTNAxcfkKp@redhat.com>
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-2-pmorel@linux.ibm.com>
 <4118bb4e-0505-26d3-3ffe-49245eae5364@kaod.org>
 <bd5cc488-20a7-54d1-7c3e-86136db77f84@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd5cc488-20a7-54d1-7c3e-86136db77f84@linux.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 04, 2023 at 02:26:05PM +0200, Pierre Morel wrote:
> 
> On 4/4/23 09:03, Cédric Le Goater wrote:
> > On 4/3/23 18:28, Pierre Morel wrote:
> > > diff --git a/include/hw/s390x/cpu-topology.h
> > > b/include/hw/s390x/cpu-topology.h
> > > new file mode 100644
> > > index 0000000000..83f31604cc
> > > --- /dev/null
> > > +++ b/include/hw/s390x/cpu-topology.h
> > > @@ -0,0 +1,15 @@
> > > +/*
> > > + * CPU Topology
> > > + *
> > > + * Copyright IBM Corp. 2022
> > 
> > Shouldn't we have some range : 2022-2023 ?
> 
> There was a discussion on this in the first spins, I think to remember that
> Nina wanted 22 and Thomas 23,
> 
> now we have a third opinion :) .
> 
> I must say that all three have their reasons and I take what the majority
> wants.
> 
> A vote?

Whether or not to include a single year, or range of years in
the copyright statement is ultimately a policy decision for the
copyright holder to take (IBM in this case I presume), and not
subject to community vote/preferences.

I will note that some (possibly even many) organizations consider
the year to be largely redundant and devoid of legal benefit, so
are happy with basically any usage of dates (first year, most recent
year, a range of years, or none at all). With this in mind, QEMU is
willing to accept any usage wrt dates in the copyright statement.

It is possible that IBM have a specific policy their employees are
expected to follow. If so, follow that.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


