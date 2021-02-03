Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1130DA0B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 13:46:29 +0100 (CET)
Received: from localhost ([::1]:40144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7HYC-0006xj-01
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 07:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l7HWJ-0006Lk-5R
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 07:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l7HWG-0004jC-4D
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 07:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612356261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AoJskb5KZHOPgYw60QJDxGb0zrejjWtc7p1KFWztZmU=;
 b=XzzlbUGhFUR5rqttbqk5SZXq9M8lmFe/w/d220ADS8rAriRbkf7mCxw4VLG72clTT0ywqW
 Cf9LfKz3R1xad9jhJei3JzbIA0FgEUkR1EEGvwIOrHPKoLQHDmtwnRAhmuWj0rXPB5+vo8
 cWyOpqpBJWPYmIjC/QiMOdMwL7mp5ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-0IhTu-m9MYSDtjKDOyGoBg-1; Wed, 03 Feb 2021 07:44:20 -0500
X-MC-Unique: 0IhTu-m9MYSDtjKDOyGoBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA942107ACE4;
 Wed,  3 Feb 2021 12:44:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B935C6B8;
 Wed,  3 Feb 2021 12:44:14 +0000 (UTC)
Date: Wed, 3 Feb 2021 13:44:12 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ARM Snapshots Not Backwards-Compatible
Message-ID: <20210203124412.xioafvptnovzalle@kamzik.brq.redhat.com>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
 <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
 <20210203104920.GE2950@work-vm>
 <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 10:52:59AM +0000, Peter Maydell wrote:
> On Wed, 3 Feb 2021 at 10:49, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> > > >
> > > > * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> > > > > Cc'ing migration team and qemu-arm@ list.
> > > >
> > > > I'll have to leave the detail of that to the ARM peole; but from a
> > > > migration point of view I think we do want the 64 bit ARM migrations to
> > > > be stable now.  Please tie incompatible changes to machine types.
> > >
> > > That is the intention, but because there's no upstream testing
> > > of migration compat, we never notice if we get it wrong.
> > > What is x86 doing to keep cross-version migration working ?
> >
> > I know there used to be some of our team running Avocado tests for
> > compatibility regularly, I'm not sure of the current status.
> > It's something we also do regularly around when we do downstream
> > releases, so we tend to catch them then, although even on x86 that
> > often turns out to be a bit late.
> 
> So downstream testing only?

Not even downstream for the Arm architecture, at least not at Red Hat. The
support we have for Arm Virt is still limited to the use cases for which
it has been deployed. To this day that hasn't included migration[*].

> I think that unless we either (a) start
> doing migration-compat testing consistently upstream or

This is the best choice and it can certainly be an additional approach
regardless of what goes on downstream. I can look into this. A pointer
to the x86 tests would be a good start. It's pretty simple to do a
quick migration test between two versions of QEMU, but we need the
whole build two versions of QEMU stuff first, which I hope already
exists.

> (b) RedHat or
> some other downstream start testing and reporting compat issues
> to us for aarch64 as they do for x86-64,

Red Hat isn't currently allocating resources to this type of testing
for AArch64. And, even if it were to start, it would likely focus on
compat testing of RHEL arm-virt machine types, which aren't exactly the
same thing as the upstream arm-virt machine types. In fact, currently,
there are only two (virt-rhel8.2.0 and virt-rhel8.3.0).

Thanks,
drew

[*] Migration support hasn't been a real high priority for AArch64 KVM,
    because it currently requires identical host CPU types and identical
    host kernels to work. It'd be nice if the destination host kernel
    could at least be a later version, but not even that is guaranteed
    to work at this time.


