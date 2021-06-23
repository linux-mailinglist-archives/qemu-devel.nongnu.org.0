Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7CB3B18E7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:30:37 +0200 (CEST)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw15Y-0006Dc-KE
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw14P-0005X8-NY
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw14L-0004ZY-Lw
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624447760;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5uO2vag2q3WW6gSM9/5YfIoE6UBPb+4ecdb5riyNrc=;
 b=Esp6lJCG5q1Hnwe0TgqA7Lsm3wJbrBjc4yIjucvkUYyXRsWfKZa7YOYeqOzdUdiwSzvRfl
 r8AA5bKE0IhULAuFbImspDZ1NpR9vWogjA8sidfooj8NKxFtsHUP06O2N9hFIMUdz2sVL/
 9nG2RIpzQrl5C8hPQVobGfUxnzC0FD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-CPqTxebUMCKgvS6xXGt2qQ-1; Wed, 23 Jun 2021 07:29:12 -0400
X-MC-Unique: CPqTxebUMCKgvS6xXGt2qQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF61EC1BE;
 Wed, 23 Jun 2021 11:29:10 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C1B5C1A1;
 Wed, 23 Jun 2021 11:29:08 +0000 (UTC)
Date: Wed, 23 Jun 2021 12:29:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Regarding commit a9bcedd (SD card size has to be power of 2)
Message-ID: <YNMbATdEmcYKgc9W@redhat.com>
References: <CAGnHSEnpEpnNHtryR=gMTxcGUd0EGW5h5KQeJvkYHp1Fw844fA@mail.gmail.com>
 <YNL+19TnvDzK5NNh@redhat.com>
 <eb606b89-5c12-8502-aa64-fafdeeb7bae0@amsat.org>
MIME-Version: 1.0
In-Reply-To: <eb606b89-5c12-8502-aa64-fafdeeb7bae0@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: peter.maydell@linaro.org, alistair.francis@wdc.com, qemu-devel@nongnu.org,
 Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 12:59:45PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 6/23/21 11:28 AM, Daniel P. Berrangé wrote:
> > On Mon, Jun 07, 2021 at 04:29:54PM +0800, Tom Yan wrote:
> >> Hi philmd (and others),
> >>
> >> So I just noticed your commit of requiring the size of an emulated SD
> >> card to be a power of 2, when I was trying to emulate one for an
> >> actual one (well, it's a microSD, but still), as it errored out.
> >>
> >> You claim that the kernel will consider it to be a firmware bug and
> >> "correct" the capacity by rounding it up. Could you provide a concrete
> >> reference to the code that does such a thing? I'm not ruling out that
> >> some crazy code could have gone upstream because some reviewers might
> >> not be doing their job right, but if that really happened, it's a
> >> kernel bug/regression and qemu should not do an equally-crazy thing to
> >> "fix" it.
> > 
> > I looked back at the original threads for details, but didn't
> > find any aside from this short message saying it broke Linux:
> > 
> >   https://www.mail-archive.com/qemu-devel@nongnu.org/msg720737.html
> > 
> > Philippe, do you have more details on the problem hit, or pointer
> > to where the power-of-2 restriction is in Linux ?
> 
> Sorry for not responding soon enough, too many things.
> 
> I wrote patches to address Tom's problem, but couldn't fix all
> the cases yet. So far the problem is not Linux but firmwares
> announcing pow2 to Linux without checking card layout.
> 
> It is hard to make everybody happy, security users and odd firmwares.
> 
> I came out with a larger series to be able to classify QEMU API /
> devices code as security sensible or not, and use of some unsafe
> API to taint some security mode (so far only displaying a warning).
> If the security mode is tainted (use of unsafe device, unsafe config,
> unsafe feature), then users shouldn't expect safety in the guest.
> 
> That way I could have classified the SD card model as unsafe and not
> bothered various users by restricting to pow2 card sizes.

Ok, so QEMU has to be robust against guest OS, even if it is the
fault of the firmware for telling guest the wrong size info. I
don't think this means QEMU needs to restrict the sizes though.

If QEMU's CVE fix breaks guest when the firmware is giving wrong
info, then we should just pass that bug report onto the firmware
maintainers.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


