Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049FE2723DA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 14:25:32 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKKst-0003MQ-2J
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 08:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kKKrZ-0002qe-CQ
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 08:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kKKrX-000881-Li
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 08:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600691047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhAHnmPK1Xx1fZ1xjgbiCBZ23amHiV/wTniIJJkLThw=;
 b=BTyHlnpcYRGWUKatQJVgEjqCE/+4vrpGHhWZKVHE45GRJiygWCJzfapFF70ALPXLe0aoru
 +RhGeEOdG32oSemAj2UXjM5al8A++FhaDKF5wClv9csCKK1kTA/Pu9IGSHiG5/bBylD2un
 z+IF2Yz3zLqB4KF2p8AQAu8kiBWKbAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-k-tm8HVePlWxIWkg3zS2gA-1; Mon, 21 Sep 2020 08:24:05 -0400
X-MC-Unique: k-tm8HVePlWxIWkg3zS2gA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32892640A7;
 Mon, 21 Sep 2020 12:24:04 +0000 (UTC)
Received: from work-vm (ovpn-114-207.ams2.redhat.com [10.36.114.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABA2610027A5;
 Mon, 21 Sep 2020 12:24:02 +0000 (UTC)
Date: Mon, 21 Sep 2020 13:24:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH 3/6] hw/sd/sdcard: Do not use legal address '0' for
 INVALID_ADDRESS
Message-ID: <20200921122400.GI3221@work-vm>
References: <20200918174117.180057-1-f4bug@amsat.org>
 <20200918174117.180057-4-f4bug@amsat.org>
 <874knra5fk.fsf@dusky.pond.sub.org>
 <6384105c-65ca-60f8-4fa0-afd2e46b144a@redhat.com>
 <87pn6f48xx.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87pn6f48xx.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Kevin O'Connor <kevin@koconnor.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
> > +Paolo & Kevin.
> >
> > On 9/21/20 10:40 AM, Markus Armbruster wrote:
> >> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> >> 
> >>> As it is legal to WRITE/ERASE the address/block 0,
> >>> change the value of this definition to an illegal
> >>> address: UINT32_MAX.
> >>>
> >>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >>> ---
> >>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>> Cc: Markus Armbruster <armbru@redhat.com>
> >>>
> >>> Same problem I had with the pflash device last year...
> >>> This break migration :(
> >>> What is the best way to do this?
> >> 
> >> Remind me: did we solve the problem with pflash, and if yes, how?
> >
> > No we can't. The best I could do is add a comment and as this
> > is not fixable. See commit aba53a12bd5: ("hw/block/pflash_cfi01:
> > Document use of non-CFI compliant command '0x00'").
> >
> > I now consider the device in maintenance-only
> > mode and won't add any new features.
> >
> > I started working on a new implementation, hoping it can be a
> > drop in replacement. Laszlo still has hope that QEMU pflash
> > device will support sector locking so firmware developers could
> > test upgrading fw in VMs.
> >
> > Back to the SDcard, it might be less critical, so a migration
> > breaking change might be acceptable. I'm only aware of Paolo
> > and Kevin using this device for testing. Not sure of its
> > importance in production.
> 
> Neither am I.
> 
> Which machine types include this device by default?

To me it looks like it's some of the ARM boards.

Dave

> How can a non-default device be added, and to which machine types?
> 
> I gather the fix changes device state incompatibly.  Always, or only in
> certain states?  I'm asking because if device state remains compatible
> most of the time, we might be able use subsection trickery to keep
> migration working most of the time.  Has been done before, I think.
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


