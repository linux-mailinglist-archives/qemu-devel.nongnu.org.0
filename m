Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398E27AFF2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 16:25:04 +0200 (CEST)
Received: from localhost ([::1]:49538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMu5P-0002SS-7O
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 10:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kMu46-0001wc-C8
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 10:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kMu44-0003RQ-NP
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 10:23:42 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601303020;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wN5CzgKGTXdCB4lxfp3H84m9SlwUh5i6IVWBi5wlVk=;
 b=WfHJRd7ComJq7dB0bIHnHNv8oGDe3su1wOxoRhwVNLpdQ7/4FpherM8bKd3honodcjt1QT
 WtwNnUaQbBckO5nfYL0YysQBMDiWogBhVIK+Obs+WtSzW4b0eT15J5/qxiYsCjBL295Ew2
 4Vowr5nu9kfRdCDcqMqv9dODMYMo3bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-cdvWw_o8MNuPEEHRmvEp8w-1; Mon, 28 Sep 2020 10:23:28 -0400
X-MC-Unique: cdvWw_o8MNuPEEHRmvEp8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C11161DDED;
 Mon, 28 Sep 2020 14:23:26 +0000 (UTC)
Received: from redhat.com (ovpn-114-24.ams2.redhat.com [10.36.114.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1AA760DA0;
 Mon, 28 Sep 2020 14:23:24 +0000 (UTC)
Date: Mon, 28 Sep 2020 15:23:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/3] qemu/compiler: Simplify as all compilers support
 attribute 'gnu_printf'
Message-ID: <20200928142322.GJ2230076@redhat.com>
References: <20200928125859.734287-1-philmd@redhat.com>
 <20200928125859.734287-2-philmd@redhat.com>
 <20200928140448.GH2230076@redhat.com>
 <CAFEAcA9THz32JdqVF8JykQebw=ub50vY1RMNV+zLuzSHmAcP0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9THz32JdqVF8JykQebw=ub50vY1RMNV+zLuzSHmAcP0g@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:29:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 28, 2020 at 03:14:45PM +0100, Peter Maydell wrote:
> On Mon, 28 Sep 2020 at 15:06, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > I think this can be simplified even more by using GLib's macros
> >
> >   #define GCC_FMT_ATTR(n, m)  G_GNUC_PRINTF(n, m)
> 
> At least on my system G_GNUC_PRINTF() expands to
> __format__(__printf__,...), not gnu_printf, so it is
> not quite what we want. (The difference is that on Windows
> hosts we still want to mark up our our logging functions as
> taking the glibc style format handling, not whatever the
> MS C library format escapes happen to be.)
> At a minimum you'd need to keep in the "on Windows,
> redefine __printf__ to __gnu_printf__" logic.
> 
> See also commit 95df51a4a02a853.

Oh, that's a bug in old GLib versions. I thought we had a new enough
min to avoid that problem, but i guess not after all.

Modern GLib always uses gnu_printf even on Windows, as they're using a
replacement GNU compatible printf impl for all the GLib APIs that take
format strings.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


