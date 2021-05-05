Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA83748BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:33:41 +0200 (CEST)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leNHA-0001Gp-Kz
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1leNFP-0000OL-Nd
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1leNFM-0003uz-Vl
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620243107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gwgwu16Ws4F3z9VhAdQLnRWeDCnpv7XqjFiwFJ/OEe0=;
 b=U0RRQI1of4EsxjnffbMyoA2M4SIBbN3qdsMG7B6kMo+6qedWe6euClFwzmiil3MkJZXjns
 erdYBSa+VJF0/U+/2zgVgO9keHCnLVsHaCFtQSGntaYPbYUTLdGO8ByBMoS8ovM73KsezP
 IL0lAjQDHpqeASjqhT60ItITwc7JovU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-xXXTVwS3ORmWEDA4YakDXg-1; Wed, 05 May 2021 15:31:44 -0400
X-MC-Unique: xXXTVwS3ORmWEDA4YakDXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89BD61083E9C;
 Wed,  5 May 2021 19:31:42 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51A3919D7C;
 Wed,  5 May 2021 19:31:41 +0000 (UTC)
Date: Wed, 5 May 2021 15:31:41 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
Message-ID: <20210505193141.4tb6k5cupbovctbs@habkost.net>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de>
 <875z21aghn.fsf@linaro.org>
 <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de>
 <87o8dpo4ww.fsf@linaro.org>
 <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
MIME-Version: 1.0
In-Reply-To: <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 02:15:29PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/5/21 12:04 PM, Alex Bennée wrote:
> > Claudio Fontana <cfontana@suse.de> writes:
> >> On 3/8/21 3:02 PM, Alex Bennée wrote:
> >>> Claudio Fontana <cfontana@suse.de> writes:
> >>>
> >>>> Hi,
> >>>>
> >>>> anything else for me to do here?
> >>>
> >>> It looks to me that this series is looking pretty good. Every patch has
> >>> at least one review so I think it's just waiting on the maintainers to
> >>> pick it up.
> >>>
> >>> Paolo/Richard - are you intending to take the series as is or are you
> >>> waiting for something else? I'd like to see the patch delta reduced for
> >>> the ARM cleanup work which is still ongoing.
> >>
> >> I am a bit at a loss here, as this has been reviewed for a while, but nothing is happening.
> >> Rebasing is starting to become more and more draining;
> > 
> > This is still the latest re-factor right?
> > 
> >   Subject: [PATCH v28 00/23] i386 cleanup PART 2
> >   Date: Mon, 22 Mar 2021 14:27:36 +0100
> >   Message-Id: <20210322132800.7470-1-cfontana@suse.de>
> > 
> >> I am seeing some changes from Phil that redo some of the patches here (like target arch user),
> >> maybe you would like to drive this?
> > 
> > AIUI his changes where to get qtest passing.
> 
> I hadn't read Claudio's mail, I think he's mentioning commit 46369b50ee3
> 
>     meson: Introduce meson_user_arch source set for arch-specific user-mode
> 
>     Similarly to the 'target_softmmu_arch' source set which allows
>     to restrict target-specific sources to system emulation, add
>     the equivalent 'target_user_arch' set for user emulation.
> 
> The patch only contains 6 lines in 2 hunks, if it introduced a conflict
> it should be trivial to resolve (I wasn't expecting it to conflict with
> your work when I merged it TBH).
> 
> > I've just been chatting to
> > Paolo on IRC so I think we are almost ready to go.
> > 
> >   > bonzini_: what's currently holding up getting Claudio's re-factoring
> >       work merged?
> >   > f4bug: also ^ - I'm a little worried we have splintering
> >       re-factoring forks
> >   *** First activity: f4bug joined 2 hours 8 minutes 6 seconds ago.
> >   <f4bug> stsquad: the qtests series is pending imammedo review then
> >       could go in
> >   <f4bug> stsquad: which would simplify a bit Claudio's series (on
> >       respin he could drop a pair of patches)
> >   <f4bug> stsquad: my understanding was bonzini_ would merge the x86
> >       series, then pm215 could merge the arm one on top
> >   *** First activity: bonzini_ joined 1 hour 17 minutes 25 seconds ago.
> >   <bonzini_> ok i can queue it in my next PR
> >   <f4bug> the only blocking part is qtest not passing, but Claudio's
> >       refactor series is not the culprit
> >   <bonzini_> ok
> 
> I was referring to:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg804015.html
> 
> Then these aren't required:
> - tests: restrict TCG-only arm-cpu-features tests to TCG builds
> - tests: device-introspect-test: cope with ARM TCG-only devices
> 
> These could be reworked to use qtest_has_accel() instead of the
> /* XXX */ comments:
> - tests: do not run test-hmp on all machines for ARM KVM-only
> - tests: do not run qom-test on all machines for ARM KVM-only
> 
> I didn't noticed the following patch had its content changed:
> Revert "target/arm: Restrict v8M IDAU to TCG"
> So now this is not a full revert, only the TYPE_IDAU_INTERFACE
> type is moved back.
> 
> While this fixes the build, we still have a QOM design problem.
> QOM interfaces can't be Kconfig-selected out. <- Eduardo, Markus?

I don't get it.  Why exactly QOM interfaces can't be
Kconfig-selected out?

Do you want to be able to compile out an interface while not
compiling out types that implement that interface?  Why?


> 
> 
> More generally I think more code should be automatically stripped
> out by Kconfig instead. In [1,2] I suggested to tie accel-specific
> Kconfig selectors:
> 
>   config ARM_V7R
>     bool
>     depends on TCG && ARM
> 
>   config ARM_V7M
>     bool
>     depends on TCG && ARM
>     select PTIMER
> 
>   config XLNX_ZYNQMP_ARM
>     bool
>     default y if TCG && AARCH64
> 
> But this can certainly be done on top of Claudio's work.
> 
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg777710.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg777719.html
> 

-- 
Eduardo


