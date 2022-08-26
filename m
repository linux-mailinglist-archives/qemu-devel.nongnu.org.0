Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A85A27E0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:33:38 +0200 (CEST)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYWm-0007dC-0y
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRYT8-000471-Ea
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRYT5-00028G-61
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661516986;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FMTv/G/f60YdXksPyISQmKgXsgtVSBPueXpbd8/S3FI=;
 b=fB1mh2czmxB3BwitUbkJ76+c7JYgF7YiTLpMWxjEf3W9K5qLAbeUe0sCPqpPN6lB+atA52
 BDep+sn3DKK0CgffJL/80mjvckLigfE+RyiyjudNe5u/QQ9Fs+aDeyYa3mrlkdT4uJ+ptI
 weLvD53zvTWgaqW6XQgISXhLG/2DDKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-UrWuvlC_OdS0z5QTjfSReQ-1; Fri, 26 Aug 2022 08:29:42 -0400
X-MC-Unique: UrWuvlC_OdS0z5QTjfSReQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78979101A54E;
 Fri, 26 Aug 2022 12:29:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB91B1121314;
 Fri, 26 Aug 2022 12:29:41 +0000 (UTC)
Date: Fri, 26 Aug 2022 13:29:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 defualt
Message-ID: <Ywi8s8UZzR2vcLjr@redhat.com>
References: <20220826113900.794046-1-berrange@redhat.com>
 <1c0c72f5-6a4c-1fb3-3fa7-9c78e8ec8c7a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c0c72f5-6a4c-1fb3-3fa7-9c78e8ec8c7a@suse.de>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Aug 26, 2022 at 01:50:40PM +0200, Claudio Fontana wrote:
> On 8/26/22 13:39, Daniel P. Berrangé wrote:
> > The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
> > possible. Historically this hasn't been an issue since it was rare for
> > OS distros to build with a higher mandatory CPU baseline.
> > 
> > With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
> > baseline:
> > 
> >   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
> > 
> > It is likely that other distros may take similar steps in the not too
> > distant future. For example, it has been suggested for Fedora on a
> > number of occassions.
> > 
> > This new baseline is not compatible with the qemu64 CPU model though.
> > While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
> > usage of QEMU doesn't always allow for this. For example, the args
> > are typically controlled via binfmt rules that the user has no ability
> > to change. This impacts users who are trying to use podman on aarch64
> > platforms, to run containers with x86_64 content. There's no arg to
> > podman that can be used to change the qemu-x86_64 args, and a non-root
> > user of podman can not change binfmt rules without elevating privileges:
> > 
> >   https://github.com/containers/podman/issues/15456#issuecomment-1228210973
> > 
> > Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
> > compatibility with binaries it is likely to encounter in the wild,
> > and not likely to have a significant downside for existing usage.
> 
> How do we know for sure? Do we have a base of binaries to test across
> qemu versions?

There are never any perfect guarantees, but this assertion is based on
the view that the x86 instruction set changes are considered backwards
compatible. Existing applications from years (even decades) ago can
generally run on arbitrarily newer CPUs with orders of magnitude more
features, as apps have to intentionally opt-in to use of new CPU
instructions.

So the risk here would be an existing applications, which is able to
dynamically opt-in to optimized code paths if certain CPUID features
exist, and in turn tickles a bug in QEMU's implementation of said
feature that it would not previously hit. That's certainly possible,
but I don't think it would be common, as we would already have seen
that in system emulators.  The la57 feature issue Richard mentions
is one example, but that doesn't impact user emulators I believe.

Weigh that risk against the fact that we have users frequently
hitting problems with the existing qemu64  default because it is
too old. User's have already been making this change in the context
of Docker for this reason. eg

https://github.com/tonistiigi/binfmt/blob/master/patches/cpu-max/0001-default-to-cpu-max-on-x86-and-arm.patch

> 
> > 
> > Most other architectures already use an 'any' CPU model, which is
> > often mapped to 'max' (or similar) already, rather than the oldest
> > possible CPU model.
> > 
> > For the sake of consistency the 'i386' architecture is also changed
> > from using 'qemu32' to 'max'.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  linux-user/i386/target_elf.h   | 2 +-
> >  linux-user/x86_64/target_elf.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
> > index 1c6142e7da..238a9aba73 100644
> > --- a/linux-user/i386/target_elf.h
> > +++ b/linux-user/i386/target_elf.h
> > @@ -9,6 +9,6 @@
> >  #define I386_TARGET_ELF_H
> >  static inline const char *cpu_get_model(uint32_t eflags)
> >  {
> > -    return "qemu32";
> > +    return "max";
> >  }
> >  #endif
> > diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
> > index 7b76a90de8..3f628f8d66 100644
> > --- a/linux-user/x86_64/target_elf.h
> > +++ b/linux-user/x86_64/target_elf.h
> > @@ -9,6 +9,6 @@
> >  #define X86_64_TARGET_ELF_H
> >  static inline const char *cpu_get_model(uint32_t eflags)
> >  {
> > -    return "qemu64";
> > +    return "max";
> >  }
> >  #endif
> 
> Just seems an abrupt change to me if we don't have a mechanism in
> place to ensure we don't break existing workloads.

There are no absolutes here. We have risk of unknown problem possibly
breaking some existing apps, vs a known problem currently breaking
users of CentOS 9 / RHEL 9, which podman and docker need to workaround.

The question is which benefits more users, and which is the better
long term option. I think using modern CPU is better long term, and
if we find bugs in QEMU's TCG impl we just need to fix them regardless.

If we find bugs in applications, however, then the apps need to fix
them.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


