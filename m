Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA8387922
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:47:41 +0200 (CEST)
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liz8O-0007fp-8y
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1liz4W-0004b5-3z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1liz4P-0005al-H2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621341808;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9skpm/erEv8RoD5YBVicR4fdxKL6dteiYFrspGec40=;
 b=S0/zEBD7fWDqqMFfwWMezPJeY/kNsr/yGzW/GbxLx9D8s9VWAfhuSowbig+nt8QFsfMGsf
 EkFZr2J8NgwWki0ARvt7CJZsfp6hq9wd6T3kHElLtjczkgvYo9CoAQzRANZB/+haSPt6Bl
 ivICb+OQETxq6zVxKraKl+B6e8CRi0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-V0x9GY_xMy-eioKq9KerDQ-1; Tue, 18 May 2021 08:43:23 -0400
X-MC-Unique: V0x9GY_xMy-eioKq9KerDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 613DA8042AA;
 Tue, 18 May 2021 12:43:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-56.ams2.redhat.com [10.36.115.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7896267D;
 Tue, 18 May 2021 12:43:20 +0000 (UTC)
Date: Tue, 18 May 2021 13:43:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] ci: do not use #processors+1 jobs, #processors is
 enough
Message-ID: <YKO2ZbDsphiXh/pE@redhat.com>
References: <20210518084139.97957-1-pbonzini@redhat.com>
 <20210518084139.97957-3-pbonzini@redhat.com>
 <40f9d46b-d234-c029-3ba2-f5dcac8b87fc@redhat.com>
 <7155c55a-1566-d7f0-d59e-ee48707302cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7155c55a-1566-d7f0-d59e-ee48707302cf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021 at 02:30:04PM +0200, Paolo Bonzini wrote:
> On 18/05/21 12:49, Thomas Huth wrote:
> > > 
> > > -    - JOBS=$(expr $(nproc) + 1)
> > > +    - JOBS=$(nproc || echo 1)
> > 
> > The basic idea of the "+ 1" was to make sure that there is always a
> > thread that runs on a CPU while maybe another one is waiting for I/O to
> > complete.
> 
> Ah, I see.  It doesn't make much sense for "make check" jobs however, which
> is where I wanted to get with the next patch.
> 
> I'm not sure it's even true anymore with current build machines (which tend
> to have a large buffer cache for headers) and optimizing compilers that
> compilation is I/O bound, so I'll time the two and see if there is an actual
> difference.

I'd be surprised if you can measure any statistically reliable difference
at all wrt public CI. I've tried measuring CI performance for small changes
and found it impossible in short time frames, as the deviation between runs
is way too large. GitLab CI speeds tend to slow down as the day goes on and
US wakes up, so by time you run QEMU CI a second time in the day, it will
be slower. They clearly overcommit resources on the cloud host so you're
at the mercy of whatever else is running.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


