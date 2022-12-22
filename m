Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCC6653EC1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:10:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8JSE-0004qZ-3S; Thu, 22 Dec 2022 06:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p8JSB-0004nw-8l
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:09:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p8JS9-0001sT-5N
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671707369;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FibxfexI68u4RdNlVIKyJieKfm2YRz83G+KEPIVJqzA=;
 b=EWa61N1M3C5TQC+dm0qDQzKDYrcNF6aE3BTBCeJ2gkxlSUkHL+EwC5o0COMRgwV3trmxT1
 8gZqpCr+ZaUR4bE7VhiEciRiYIB+QGBLW4jxNffvejiG4CPB3dMBHle8FQxqucr603EjiQ
 7Hey7yTEr3JCx3NCZHQX9uQk31he4DU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-gH9Vl_-RNPSRqM51OsznQA-1; Thu, 22 Dec 2022 06:09:24 -0500
X-MC-Unique: gH9Vl_-RNPSRqM51OsznQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B84248F6E84;
 Thu, 22 Dec 2022 11:09:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6D8D51EF;
 Thu, 22 Dec 2022 11:09:21 +0000 (UTC)
Date: Thu, 22 Dec 2022 11:09:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, eric.auger.pro@gmail.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 stefanha@fmail.com, peter.maydell@linaro.org, sw@weilnetz.de
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Message-ID: <Y6Q636fbFWDnF0w7@redhat.com>
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
 <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
 <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Dec 22, 2022 at 11:07:31AM +0100, Eric Auger wrote:
> Hi Philippe,
> 
> On 12/22/22 10:01, Philippe Mathieu-Daudé wrote:
> > On 22/12/22 09:18, Paolo Bonzini wrote:
> >> On 12/21/22 17:36, Eric Auger wrote:
> >>> To avoid compilation errors when -Werror=maybe-uninitialized is used,
> >>> replace 'case 3' by 'default'.
> >>>
> >>> Otherwise we get:
> >>>
> >>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
> >>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
> >>> uninitialized in this function [-Werror=maybe-uninitialized]
> >>>     2495 |     d->Q(3) = r3;
> >>>          |     ~~~~~~~~^~~~
> >>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
> >>> uninitialized in this function [-Werror=maybe-uninitialized]
> >>>     2494 |     d->Q(2) = r2;
> >>>          |     ~~~~~~~~^~~~
> >>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
> >>> uninitialized in this function [-Werror=maybe-uninitialized]
> >>>     2493 |     d->Q(1) = r1;
> >>>          |     ~~~~~~~~^~~~
> >>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
> >>> uninitialized in this function [-Werror=maybe-uninitialized]
> >>>     2492 |     d->Q(0) = r0;
> >>>          |     ~~~~~~~~^~~~
> >
> > With what compiler? Is that a supported one?
> https://lore.kernel.org/qemu-devel/3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com/
> >
> >>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>> Suggested-by: Stefan Weil <sw@weilnetz.de>
> >>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
> >>> ---
> >>>   target/i386/ops_sse.h | 4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> >>> index 3cbc36a59d..c442c8c10c 100644
> >>> --- a/target/i386/ops_sse.h
> >>> +++ b/target/i386/ops_sse.h
> >>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
> >>> *s, uint32_t order)
> >>>           r0 = s->Q(0);
> >>>           r1 = s->Q(1);
> >>>           break;
> >>> -    case 3:
> >>> +    default:
> >>>           r0 = s->Q(2);
> >>>           r1 = s->Q(3);
> >>>           break;
> >>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
> >>> *s, uint32_t order)
> >>>           r2 = s->Q(0);
> >>>           r3 = s->Q(1);
> >>>           break;
> >>> -    case 3:
> >>> +    default:
> >>>           r2 = s->Q(2);
> >>>           r3 = s->Q(3);
> >>>           break;
> >>
> >> Queued, but this compiler sucks. :)
> >
> > Can't we simply add a dumb 'default' case? So when reviewing we don't
> > have to evaluate 'default' means 3 here.
> >
> > -- >8 --
> > --- a/target/i386/ops_sse.h
> > +++ b/target/i386/ops_sse.h
> > @@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
> > uint32_t order)
> >          r0 = s->Q(2);
> >          r1 = s->Q(3);
> >          break;
> > +    default:
> > +        qemu_build_not_reached();
> >      }
> >      switch ((order >> 4) & 3) {
> >      case 0:
> > @@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
> > uint32_t order)
> >          r2 = s->Q(2);
> >          r3 = s->Q(3);
> >          break;
> > +    default:
> > +        qemu_build_not_reached();
> >      }
> I guess this won't fix the fact r0, r1, r2, r3 are not initialized, will it?

This ultimately expands to assert() and the compiler should see that it
terminates the control flow at this point, so shouldn't have a reason
to warn.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


