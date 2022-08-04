Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8B589BFA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:56:34 +0200 (CEST)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaOt-0002MP-SZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJaH1-00026L-L7
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJaGy-0005Pa-Ei
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659617299;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPyD4/CW8c3pc1Gfu9bW3RFuzBV3R+cx62j0UTrPbaE=;
 b=V2Zk/K0VGL/Fhcwi72GGHG0XVtirvovnq/poDl2gTBGrS4gPD6vmOyrmd+AuYMvr5eCNLQ
 fO3THlXVsRYjO1wgzrc1gmbT1lnuKb/5iF3y2a0qGUW+PdZHsDGjDeg7xyX7JU/XKZuWa3
 4lfvn5p+omwuKj7lTksaSxZ5gj+YcQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-MvWA6uL4PqKV4xyV-hVmkA-1; Thu, 04 Aug 2022 08:48:16 -0400
X-MC-Unique: MvWA6uL4PqKV4xyV-hVmkA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E26431035349;
 Thu,  4 Aug 2022 12:48:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA091401E5C;
 Thu,  4 Aug 2022 12:48:13 +0000 (UTC)
Date: Thu, 4 Aug 2022 13:48:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=83=C2=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Message-ID: <YuvAC3tqRAYeeVJm@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <Yuu1Eod8rwKY3pIS@redhat.com>
 <CAHmME9rNo7omz8s1rgDPjZnd9Pmzj5TjCenvQU30wMTS99_5GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9rNo7omz8s1rgDPjZnd9Pmzj5TjCenvQU30wMTS99_5GQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 02:13:41PM +0200, Jason A. Donenfeld wrote:
> Hi Daniel,
> 
> On Thu, Aug 4, 2022 at 2:01 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Jul 21, 2022 at 06:36:21PM +0200, Paolo Bonzini wrote:
> > > From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> > >
> > > Tiny machines optimized for fast boot time generally don't use EFI,
> > > which means a random seed has to be supplied some other way. For this
> > > purpose, Linux (â‰¥5.20) supports passing a seed in the setup_data table
> > > with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
> > > specialized bootloaders. The linked commit shows the upstream kernel
> > > implementation.
> > >
> > > At Paolo's request, we don't pass these to versioned machine types â‰¤7.0.
> >
> >
> > This change has also broken direct kernel measured boot with AMD SEV
> > confidential virtualization.
> >
> > The vmlinuz that we pass in with -kernel is measured by the BIOS and
> > since that gets munged with a random seed, the measurement no longer
> > matches the expected measurements the person attesting boot will
> > have pre-calculated.
> >
> > The kernel binary passed to the firmware must be 100% unchanged
> > from what the user provided in order for boot measurements to
> > succeed.
> >
> > So at the very least this codes needs to be conditionalized to
> > not run when AMD SEV is active.
> 
> If you look at the v2 patch, I move all of the setup_data stuff
> outside of the kernel image, so the kernel image itself doesn't get
> modified. So SEV should still work.
> 
> Can you test that patch and see?

It looks like the v2 patch fixes it, 'kernel' is no longer modified
and we throw away the modified 'setup' data for SEV.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|

|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


