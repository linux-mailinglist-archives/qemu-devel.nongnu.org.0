Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC42A02B8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 11:22:24 +0100 (CET)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYRY7-0003Nr-FW
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 06:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kYRWr-0002tg-S9
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 06:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kYRWo-0007Pw-CX
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 06:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604053261;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFXpDZCUMxT4fmwjB5J1o3Ja04Joh+pW67fdMJjzKUU=;
 b=bRxZoiV1p/FHHOPCFIZdrztTfhWe5Z9yUClvR63LDcNb/N93vgLarF+UEpr+WxTpY6IbXP
 fqmm5jo8raDPCLonXmOeNLq65PqNBbnQXy62FmiawUmJUIXrIarg8eUkJscC/HV97T1/Yy
 77OKaTDvIGFWmE8JXG0MiWiaf0cPGdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-UXgH5jNFPW2wiI3U1-Koyg-1; Fri, 30 Oct 2020 06:20:58 -0400
X-MC-Unique: UXgH5jNFPW2wiI3U1-Koyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63343802B63;
 Fri, 30 Oct 2020 10:20:57 +0000 (UTC)
Received: from redhat.com (ovpn-113-50.ams2.redhat.com [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BCC05D98C;
 Fri, 30 Oct 2020 10:20:52 +0000 (UTC)
Date: Fri, 30 Oct 2020 10:20:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 00/11] sockets: Attempt to drain the abstract socket swamp
Message-ID: <20201030102049.GI99222@redhat.com>
References: <20201029133833.3450220-1-armbru@redhat.com>
 <CAJ+F1CLW=zfWq3apgrKear2v42LYarSMQKw07BHadM-rYjcmoA@mail.gmail.com>
 <87pn50vxa0.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87pn50vxa0.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 QEMU <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 30, 2020 at 11:11:19AM +0100, Markus Armbruster wrote:
> Marc-André Lureau <marcandre.lureau@gmail.com> writes:
> 
> > Hi Markus,
> >
> > On Thu, Oct 29, 2020 at 5:43 PM Markus Armbruster <armbru@redhat.com> wrote:
> >
> >> In my opinion, the Linux-specific abstract UNIX domain socket feature
> >> introduced in 5.1 should have been rejected.  The feature is niche,
> >> the interface clumsy, the implementation buggy and incomplete, and the
> >> test coverage insufficient.  Review fail.
> >>
> >
> > I also failed (as chardev maintainer..) to not only review but weigh in and
> > discuss the merits or motivations behind it.
> >
> > I agree with you. Also the commit lacks motivation behind this "feature".
> >
> >
> >> Fixing the parts we can still fix now is regrettably expensive.  If I
> >> had the power to decide, I'd unceremoniously revert the feature,
> >> compatibility to 5.1 be damned.  But I don't, so here we go.
> >>
> >> I'm not sure this set of fixes is complete.  However, I already spent
> >> too much time on this, so out it goes.  Lightly tested.
> >>
> >> Regardless, I *will* make time for ripping the feature out if we
> >> decide to do that.  Quick & easy way to avoid reviewing this series
> >> *hint* *hint*.
> >>
> >
> > well, fwiw, I would also take that approach too, to the risk of upsetting
> > the users.
> 
> Reverting the feature requires rough consensus and a patch.
> 
> I can provide a patch, but let's give everybody a chance to object
> first.
> 
> >            But maybe we can get a clear reason behind it before that
> > happens. (sorry, I didn't dig the ML archive is such evidence is there, it
> > should have been in the commit message too)
> 
> I just did, and found next to nothing.
> 
> This is the final cover letter:
> 
>     qemu-sockets: add abstract UNIX domain socket support
> 
>     qemu does not support abstract UNIX domain
>     socket address. Add this ability to make qemu handy
>     when abstract address is needed.
> 
> Boils down to "$feature is needed because it's handy when it's needed",
> which is less than helpful.

Well if you have an existing application that uses abstract sockets,
and you want to connect QEMU to it, then QEMU needs to support it,
or you are forced to interject a proxy between your app and QEMU
which is an extra point of failure and lantency. I was interested
in whether there was a specific application they were using, but
that is largely just from a curiosity POV. There's enough usage of
abstract sockets in apps in general that is it clearly a desirable
feature to enable.

Even if no external app is involved and you're just connecting
together 2 QEMU processes' chardevs, abstract sockets are interesting
because of their differing behaviour to non-abstract sockets.

Most notably non-abstract sockets are tied to the filesystem mount
namespace in Linux, where as abstract sockets are tied to the network
namespace. This is a useful distinction in the container world. Ordinarily
you can't connect QEMUs in 2 separate containers together, because they
always have distinct mount namespaces. There is often the ability to
share network namespaces between containers though, and thus unlock
use of abstract sockets for communications. 

> v2: https://lists.nongnu.org/archive/html/qemu-devel/2020-04/msg03803.html
> 
>     Minor cleanup.
> 
>     Daniel asks why it's needed, points out listen is missing, and
>     suggests the two boolean flags abstract, tight.
> 
> v3: https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg02291.html
> 
>     Implement interface proposed by Daniel, default of @tight broken,
>     tests (which don't catch the broken default), documentation.
> 
>     Eric suggests QAPI schema doc improvements (but doesn't challenge
>     the interface).
> 
>     R-by Daniel for the code.  He asks for randomized @path in tests.
> 
> v4: https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg04036.html
> 
>     Daniel points out style nits in tests.
> 
>     Eric suggests a few more QAPI schema doc improvements.
> 
> v5: https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg04144.html
> 
>     R-by Daniel for the tests.
> 
> v6: https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg04508.html
> 
>     No further review comments.
> 
> PR: https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg05747.html
> 
>     Pull request catches my eye.  The interface looks odd, and I
>     challenge @tight.  I silently accept Daniel's defense of it without
>     digging deeper.
> 
> This is a review failure.  I do not blame the patch submitter.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


