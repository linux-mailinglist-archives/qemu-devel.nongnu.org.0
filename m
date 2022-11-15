Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274486297F9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:03:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouueO-0006nY-6w; Tue, 15 Nov 2022 07:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ouue2-0006kM-Ak
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:02:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ouudi-00027z-7C
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668513710;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQXzU83c6mAkYyD5+DHqR7I3CA+LQd8i5HYAwtaCOxs=;
 b=dibJkt+3nEJesiWZSmiTFOi9hrmsa5LSJHstq/fMfzzrpCg1AIWCofDy9gPektYkqY79lN
 j4RnYHmUMLyWJutVl8hEa+mRLs2IAeE0a+vjNhr9hsW8B52aHenwK37N3Vpa3BjLsP75Ht
 TxRhOQCMdqYPjyVDWsVU901fUuqw3zE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-vW70Y9muNZqqOKHvHOh7mQ-1; Tue, 15 Nov 2022 07:01:44 -0500
X-MC-Unique: vW70Y9muNZqqOKHvHOh7mQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 377B98027EA;
 Tue, 15 Nov 2022 12:01:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F81C40C6EC3;
 Tue, 15 Nov 2022 12:01:42 +0000 (UTC)
Date: Tue, 15 Nov 2022 12:01:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, tobias.roehmel@rwth-aachen.de,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 4/7] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
Message-ID: <Y3N/ohgiJ/OyuGw8@redhat.com>
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-5-tobias.roehmel@rwth-aachen.de>
 <CAFEAcA-kCEySTWUGXwqA=aw4E+TBjbUaewsLe5ExtXj0xja0Vg@mail.gmail.com>
 <e1da1500-f8c7-48ec-52bb-d3ac49d07a4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1da1500-f8c7-48ec-52bb-d3ac49d07a4e@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Nov 15, 2022 at 12:37:45PM +0100, Philippe Mathieu-Daudé wrote:
> On 14/11/22 18:19, Peter Maydell wrote:
> > On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
> > > 
> > > From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
> > > 
> > > ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
> > > tough they don't have the TTBCR register.
> > > See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
> > > AArch32 architecture profile Version:A.c section C1.2.
> > > 
> > > Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
> > > ---
> > >   target/arm/debug_helper.c | 3 +++
> > >   target/arm/internals.h    | 4 ++++
> > >   target/arm/tlb_helper.c   | 3 +++
> > >   3 files changed, 10 insertions(+)
> > > 
> > > diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> > > index c21739242c..73665f988b 100644
> > > --- a/target/arm/debug_helper.c
> > > +++ b/target/arm/debug_helper.c
> > > @@ -437,6 +437,9 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *env)
> > > 
> > >       if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
> > >           using_lpae = true;
> > > +    } else if (arm_feature(env, ARM_FEATURE_PMSA)
> > > +            && arm_feature(env, ARM_FEATURE_V8)) {
> > 
> > Indentation looks wrong here. Generally the second line of a
> > multiline if (...) condition starts in the column after the '(',
> > so it lines up with the first part of the condition.

This illustrates the problem with putting '&&' at start of line.
It harms the vertical alignment of the expressions, leading to
the desire to un-indent the block by 3 spaces to get 'arm_feature'
to line up. Understandable, but no editor/code indentors will
preserve this kind of indentation/alignment, so it shouldn't
be done.

Both ways you can choose to line up the indent for operator at
start of line are unpleasant - it is a no-win scenario IMHO.

> > > +        using_lpae = true;
> > >       } else {
> > >           if (arm_feature(env, ARM_FEATURE_LPAE) &&
> > >               (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {
> > 
> > For instance this is an example in the existing code.
> > 
> > We are inconsistent about whether we put operators like '&&' at
> > the end of the first line or beginning of the second line, so
> > pick whichever you like best, I guess.
> Personally I find the operator at the end aesthetically nicer, but
> few years ago Eric Blake reasoned that moving it at the beginning
> was more explicit (to reviewers) thus safer, and I now I tend to
> place it at the beginning.

I'm not convinced that operator at start of line makes any
difference at all to reviewability, and as above it leads
to undesirable indentation choices.

> Maybe part of the justification was cases where copy/pasting new
> conditions in pre-existing could introduce a bug when the operator
> is at the end?

The QEMU defacto standard is operators at end of line, given what
appears as the usage ratio of 6:1

$ git grep -E '^\s*(&&|&|\||\|\|)\s' '*.c' | wc -l
1692

$ git grep -E '\s(&&|&|\||\|\|)\s*$' '*.c' | wc -l
10289

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


