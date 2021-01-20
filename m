Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DBB2FDA3D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:58:39 +0100 (CET)
Received: from localhost ([::1]:36048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Jck-0007Wj-Ec
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l2JZj-0004Hn-D6
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:55:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l2JZa-0003ca-NW
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611172519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBc50VcAxlu9IaFWC6jZfQeiqP/tYXNfmNQChbR2OFU=;
 b=dxmiU/lW53hlZd73jExlF8SmbrLAdKsy9ccOJKfP8ar4PqXxXKS2o9ci+gdA+hwjMBqqnO
 8vxdL8Qq32VAeAMV5FKzTeg4yWp/D/c+pxcd5wTh8PWXAmh4Cr+e8Um6KFkiKoqOT+2mMW
 7nxG+d6mZvL+mrQol8gkpbpaQco7jt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-jTVW_RUhMperPTiaTYRCUw-1; Wed, 20 Jan 2021 14:55:17 -0500
X-MC-Unique: jTVW_RUhMperPTiaTYRCUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9964781440E
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 19:55:16 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C5AF2C15A;
 Wed, 20 Jan 2021 19:55:16 +0000 (UTC)
Date: Wed, 20 Jan 2021 14:55:15 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 18/19] i386: provide simple 'hv-default=on' option
Message-ID: <20210120195515.GQ1227584@habkost.net>
References: <20210107150640.539239-1-vkuznets@redhat.com>
 <20210107151449.541062-1-vkuznets@redhat.com>
 <20210115031142.7c171a7f@redhat.com>
 <87h7ni7e08.fsf@vitty.brq.redhat.com>
 <20210120141312.0a1e6c33@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210120141312.0a1e6c33@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 02:13:12PM +0100, Igor Mammedov wrote:
> On Fri, 15 Jan 2021 10:20:23 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> 
> > Igor Mammedov <imammedo@redhat.com> writes:
> > 
> > > On Thu,  7 Jan 2021 16:14:49 +0100
> > > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
[...]
> > >> -No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
> > >> -QEMU, individual enlightenments can be enabled through CPU flags, e.g:
> > >> +All currently supported Hyper-V enlightenments can be enabled by specifying
> > >> +'hv-default=on' CPU flag:
> > >>  
> > >> -  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
> > >> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default ...
> > >> +
> > >> +Alternatively, it is possible to do fine-grained enablement through CPU flags,
> > >> +e.g:
> > >> +
> > >> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-relaxed,hv-vpindex,hv-time ...  
> > >
> > > I'd put here not '...' but rather recommended list of flags, and update
> > > it every time when new feature added if necessary.
> > >  
> 
> 1)
>  
> > This is an example of fine-grained enablement, there is no point to put
> > all the existing flags there (hv-default is the only recommended way
> > now, the rest is 'expert'/'debugging').
> so users are kept in dark what hv-default disables/enables (and it might depend
> on machine version on top that). Doesn't look like a good documentation to me
> (sure everyone can go and read source code for it and try to figure out how
> it's supposed to work)

Why is this a problem?  This is not different from CPU feature
flags hidden by CPU model names.  Or virtio feature bits hidden
by virtio devices and machine type compat code.


> > > (not to mention that if we had it to begin with, then new 'hv-default' won't
> > > be necessary, I still see it as functionality duplication but I will not oppose it)
> > >  
> > 
> > Unfortunately, upper layer tools don't read this doc and update
> > themselves to enable new features when they appear.
> rant: (just merge all libvirt into QEMU, and make VM configuration less low-level.
> why stop there, just merge with yet another upper layer, it would save us a lot
> on communication protocols and simplify VM creation even more,
> and no one will have to read docs and write anything new on top.)
> There should be limit somewhere, where QEMU job ends and others pile hw abstraction
> layers on top of it.

If there should be a limit somewhere, I'd say low level hyperv
flags are a very long way from crossing that limit.  It is
completely reasonable to provide a higher level knob for them in
QEMU.  Vitaly is trying to solve a real problem here, because the
existing solution is not working.

We only need to offer more complex and lower level interfaces if
we have to.  I don't think we have real world examples where
libvirt or management software developers/users are asking for
low level hyperv feature flag knobs, do we?

> 
> > Similarly, if when these tools use '-machine q35' they get all the new features we add
> > automatically, right?
> it depends, in case of CPUs, new features usually 'off' by default
> for existing models. In case of bugs, features sometimes could be
> flipped and versioned machines were used to keep broken CPU models
> on old machine types.
> 
>    
[...]

-- 
Eduardo


