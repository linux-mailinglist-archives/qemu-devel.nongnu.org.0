Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B870365827
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:55:40 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYoyh-0004Sj-Fw
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lYovU-0001yz-9s
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lYovI-00069W-W6
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618919520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YZdRHHvUrkdxaFyYFPpN3Cl1TaQwQwRUEBvwzLo14E=;
 b=ZJaBje14/rD02rQLbKqPhKSNehFqmG5btqhkMVIMmZZ8J7bPRrmWE6+GM+t+/aXU+vD/Wx
 I5TW7IACXrzXxBmFif/MUhYA7u3SfEJPBuR1FUPwTTtGFryIwYbMREkDbGjWuAUqqJoQNM
 rXyRveocSyid3O8Lq2sC9HhAyra2Qs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-Y6P3qk4LOCmDUyrG4h2k0g-1; Tue, 20 Apr 2021 07:51:59 -0400
X-MC-Unique: Y6P3qk4LOCmDUyrG4h2k0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1050F8030B5
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 11:51:58 +0000 (UTC)
Received: from work-vm (ovpn-112-16.ams2.redhat.com [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3D960CED;
 Tue, 20 Apr 2021 11:51:46 +0000 (UTC)
Date: Tue, 20 Apr 2021 12:51:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YH7ATwO6DIbKIR4i@work-vm>
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com> <YHh3trxdMQ85NRTh@work-vm>
 <874kg68z07.fsf@vitty.brq.redhat.com>
 <20210416162801.zluqlbvyipoanedw@habkost.net>
 <YH2509yA7qkYFJ0p@work-vm> <YH26x8TkpT5zsgst@redhat.com>
 <YH27H6VmKGXdA4H7@redhat.com> <YH3QRs7VUapXZaTj@work-vm>
 <20210419193228.q5e6vdnqwygh22bq@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210419193228.q5e6vdnqwygh22bq@habkost.net>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eduardo Habkost (ehabkost@redhat.com) wrote:
> On Mon, Apr 19, 2021 at 07:47:34PM +0100, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Mon, Apr 19, 2021 at 06:15:56PM +0100, Daniel P. Berrangé wrote:
> > > > On Mon, Apr 19, 2021 at 06:11:47PM +0100, Dr. David Alan Gilbert wrote:
> > > > > * Eduardo Habkost (ehabkost@redhat.com) wrote:
> > > > > > I would make live migration policy an enum, just to make sure
> > > > > > we are explicit about the requirements:
> > > > > > 
> > > > > > - UNKNOWN: this is the current state in QEMU 6.0, where we don't
> > > > > >   really know what the user expects.
> > > > > >   This can be the default on existing versioned machine types,
> > > > > >   just for compatibility.
> > > > > >   I suggest making this print warnings for every migration
> > > > > >   blocker (like this patch does).
> > > > > >   I suggest deprecating this behavior as soon as we can.
> > > > > > 
> > > > > > - PREFERRED: try to make the VM migratable when possible, but
> > > > > >   don't print a warning or error out if migration is blocked.
> > > > > >   This seems to be the behavior expected by libvirt today.
> > > > > > 
> > > > > > - NOT_NEEDED: live migration is not needed, and QEMU is free to
> > > > > >   enable features that block live migration or change guest ABI.
> > > > > >   We can probably make this the default on machine types that
> > > > > >   never supported live migration.
> > > > > 
> > > > > I suggest you could do this by adding:
> > > > >   -warn-none-migratable
> > > > >   -no-warn-none-migratable
> > > > > 
> > > > > and then argue about defaults another time.
> > > > 
> > > > If we're going to add new args, lets at least future proof our
> > > > approach with an extensible option that we can wire into QMP
> > > > too later
> > > > 
> > > >   -migratable  none|preferred|required 
> > > > 
> > > > and letting us add extra key/value pairs to tune it if desired.
> > > 
> > > Having said that, we potentially don't need a dedicated arg if we
> > > just make  'migratable=none|preferred|required' be a property of
> > > the machine type and hook everything off that
> > 
> > I think my only difficulty with that is that I don't find any of those
> > 3 words 'obvious'.
> 
> Any suggestions of replacements for those 3 words?
> 
> Would the descriptions below be enough to clarify their meaning
> in documentation?

I prefer things that are fairly obvious without needing to look at the
documentation until you want the detail.

> - NONE: live migration is not needed, and device or machine code
>   is allowed to enable features that block live migration or
>   change guest ABI.
>   (Not implemented yet)
> 
> - PREFERRED: machine and device code should try to make the VM
>   migratable when possible, but won't emit a warning or error out
>   if migration is blocked.
>   (Current default behavior)
> 
> - REQUIRED: live migration support is required, and adding a
>   migration blocker will be an error.
>   (Implemented today by --only-migratable)

How about
  -migratable blocked
     Live migration is not allowed; an outbound migration will fail

  -migratable allowed
     Live migration is allowed, but some devices/options may block
     it if they're unable to migrate [current default]

  -migratable warn
      Live migration is allowed, but if some device/option is
      unable to migrate, migration will be blocked and a warning
      printed

  -migratable required
      Live migration is allowed, attempting to add a device or
      enable an option that can't migrate will fail. [--only-migratable]
      
Dave

> -- 
> Eduardo
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


