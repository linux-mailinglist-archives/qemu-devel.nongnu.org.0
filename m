Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6337F5F408A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:04:48 +0200 (CEST)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofen8-0005GA-WB
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofej2-0003Pd-3Q
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeiy-0006vx-JL
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664877627;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOf344MEl3gMMh35KSX0PktV+uW3ufDgqy18UC/jX3M=;
 b=BdaBh1I+saU20TBc2BJjRA16CY4sgl6df7yv8MCX5KO3b0aSuOPMaswGbu9Bky9P6FGbeC
 EOKq0cO3VgQ7RZjti08iZO4UIcicc9aoW/0pwgDG6e6JUyRTuhRGeXAO8GJU9BHfQulpOl
 UH2AfGzqRYM36MrzIMhPSTMuyJ83ykU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-86KPSfbtPmabVLtZyP5_Eg-1; Tue, 04 Oct 2022 06:00:24 -0400
X-MC-Unique: 86KPSfbtPmabVLtZyP5_Eg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F06D529DD980;
 Tue,  4 Oct 2022 10:00:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C56582166B26;
 Tue,  4 Oct 2022 10:00:22 +0000 (UTC)
Date: Tue, 4 Oct 2022 11:00:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/4] meson: enforce a minimum Linux kernel headers
 version >= 4.18
Message-ID: <YzwENEPk8O/Cr3Fm@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-4-berrange@redhat.com>
 <CAFEAcA_UkN17_eitD7ft+y5HBhiD8zmrttWzfaBGM92O6eNTrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_UkN17_eitD7ft+y5HBhiD8zmrttWzfaBGM92O6eNTrg@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04, 2022 at 10:49:44AM +0100, Peter Maydell wrote:
> On Tue, 4 Oct 2022 at 10:46, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > Various areas of QEMU have a dependency on Linux kernel header
> > definitions. This falls under the scope of our supported platforms
> > matrix, but historically we've not checked for a minimum kernel
> > headers version. This has made it unclear when we can drop support
> > for older kernel headers.
> >
> >   * Alpine 3.14: 5.10
> >   * CentOS 8: 4.18
> >   * CentOS 9: 5.14
> >   * Debian 10: 4.19
> >   * Debian 11: 5.10
> >   * Fedora 35: 5.19
> >   * Fedora 36: 5.19
> >   * OpenSUSE 15.3: 5.3.0
> >   * Ubuntu 20.04: 5.4
> >   * Ubuntu 22.04: 5.15
> >
> > The above ignores the 3rd version digit since distros update their
> > packages periodically and such updates don't generally affect public
> > APIs to the extent that it matters for our build time check.
> >
> > Overall, we can set the baseline to 4.18 currently.
> 
> I wonder if we want to be a bit more conservative about this
> than we would for other library-type dependency setting ?
> At the moment, even if you don't meet our minimum distro
> baseline, you can still build by, for instance, building
> local copies of newer versions of our dependencies and using
> those. That seems harder to do for the system header files.

In theory it ought to be possible to install a newer version of the
linux kernel headers too, as there's no need for them to actually
match the kernel being run. Depending on the age difference of
distro vs newer kernel headers though, I guess there's a small risk
of incompatibility between the new kernel headers and original glibc.

Personally I think we're already pretty generous though in terms of
backcompat though, and at least for the user emulators, people can
do a static build on a newer install and run it on an older install.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


