Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE4627012F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 17:37:38 +0200 (CEST)
Received: from localhost ([::1]:51116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJIS9-0006pv-HW
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 11:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kJIHz-0005CR-OX
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 11:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kJIHx-0004FJ-Lr
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 11:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600442824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IGgB3CnPzgq00vmvTXQFM+QoesJOGJcPYsctVPHCrIk=;
 b=IGLNyFS5rYCr0mBpP3ye45ZO/VhHdts2eY4eH1NJoWPJ6rP8xzMvA3VfS7Iq3NOLjtwSmP
 wa5lu6aNs+D8y3+kDno+rTOzvM4FdnEXL8dst1Q1eikCfaDjjf26UUQkwYas+SQ4rfXLD7
 Op16C3o65GTWhvHEhPAgAr3NX3/jPKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-kyOl0rTUMeW4dYqtZ-4VoQ-1; Fri, 18 Sep 2020 11:27:01 -0400
X-MC-Unique: kyOl0rTUMeW4dYqtZ-4VoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63A5A8730A0;
 Fri, 18 Sep 2020 15:27:00 +0000 (UTC)
Received: from work-vm (ovpn-114-196.ams2.redhat.com [10.36.114.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1326071900;
 Fri, 18 Sep 2020 15:26:58 +0000 (UTC)
Date: Fri, 18 Sep 2020 16:26:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Antoine Damhet <antoine.damhet@blade-group.com>
Subject: Re: [PATCH] target/i386: always create kvmclock device
Message-ID: <20200918152656.GN2816@work-vm>
References: <20200917111306.819263-1-vkuznets@redhat.com>
 <20200917122559.e7i5o64k7rw7urdh@tartarus>
 <87ft7gh6gy.fsf@vitty.brq.redhat.com>
 <20200917144237.GK2793@work-vm>
 <875z8ch2m6.fsf@vitty.brq.redhat.com>
 <20200917174410.GU2793@work-vm>
 <20200918151213.x2dntgytybh7dkmx@tartarus>
MIME-Version: 1.0
In-Reply-To: <20200918151213.x2dntgytybh7dkmx@tartarus>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Antoine Damhet (antoine.damhet@blade-group.com) wrote:
> On Thu, Sep 17, 2020 at 06:44:10PM +0100, Dr. David Alan Gilbert wrote:
> 
> [...]
> 
> > > >> >
> > > >> > Shouldn't the old check used when machine type <= 5.1 in order to avoid
> > > >> > migration incompatibility ?
> > > >> 
> > > >> Hm, when the check fails we just don't create the device and no error is
> > > >> reported, so even if we have kvmclock data in the migration stream but
> > > >> fail to create it migration will still succeed, right? (not a migration
> > > >> expert here :-)
> > > >
> > > > When the migration stream is parsed, it'll try and find a "kvmclock"
> > > > device to pass the data it's reading to; if one doesn't exist it'll
> > > > fail.
> > > 
> > > This may happen with an older machine type when the destination is
> > > running an unfixed QEMU and the source has the fix, right?
> > 
> > Yes I think so.
> > 
> > > The solution
> > > would be to introduce a flag for older machine types (or for new ones)
> > > like 'kvmclock_always'.
> > 
> > Yep sounds the normal answer.
> > (You might want to try it first to trigger the bug)
> 
> So, I tried the patch and:
> 
> # patched -> patched
> 
> Everything working as expected
> 
> # patched -> unpatched
> 
> Migration failure with:
> 
> ```
> Unknown savevm section or instance 'kvmclock' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
> load of migration failed: Invalid argument
> ```

Right, that's what I expected and said we need to wire this fix to the
machine type.

Dave

> 
> # unpatched -> patched
> 
> The guest hangs upon arrival, I don't know which value is restored but
> something is restored (and far enough from 0 to confuse Windows).
> 
> > 
> > > > The other question is in the incoming direction from an older VM;
> > > > you'll have a kvm clock created here, but you won't load the kvm clock
> > > > state from the migration stream - what is this clock going to do?
> > > 
> > > This is not really a problem I believe: the clock was absent on the
> > > source and things somehow worked for the guest so even if we don't
> > > initialize kvmclock properly on the destination nothing bad is expected.
> > 
> > OK.
> > 
> > Dave
> 
> [...]
> 
> -- 
> Antoine 'xdbob' Damhet


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


