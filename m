Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD424532D7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:27:49 +0100 (CET)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyV2-0001d1-L1
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmyJA-0006wa-24
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mmyJ7-0008SC-MJ
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637068528;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLKZ+aa/sy2B24DednoQ6PDfzS4Mt2y1l6AUiUYmIUY=;
 b=ZDB2lj/3sxD99GvUIHfK26uXkUu8B/XcH+wlZHD9LwR4lcftW/hQdjOXJ/RBu5gW37nTLW
 aOz389P6OmKaCPUvl/9HtGGCzF37AkCDx5uKoi98TOcg9obfW3JHCGW8ytO9obbm57RJE3
 +lGKaWBo8dGu/YQoQWxzZytvyjnHfmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-cFIdcmzdNYyIpUkYitk53A-1; Tue, 16 Nov 2021 08:15:23 -0500
X-MC-Unique: cFIdcmzdNYyIpUkYitk53A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F87E15723;
 Tue, 16 Nov 2021 13:15:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 369CC5C1D5;
 Tue, 16 Nov 2021 13:15:15 +0000 (UTC)
Date: Tue, 16 Nov 2021 13:15:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] meson: fix botched compile check conversions
Message-ID: <YZOu4IQOf6nTtoZq@redhat.com>
References: <20211116093834.76615-1-pbonzini@redhat.com>
 <CAFEAcA8=RsA37ErttuGKKfrb8Ooy9NJs=F4o4agQbgu=On9P5w@mail.gmail.com>
 <YZOdRHZn9h9Rdjlr@redhat.com>
 <CAFEAcA_PKATU93e2UuoiJB2xbt_y5WKtYY_D5t+SaozcDKQcyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PKATU93e2UuoiJB2xbt_y5WKtYY_D5t+SaozcDKQcyg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 01:10:04PM +0000, Peter Maydell wrote:
> On Tue, 16 Nov 2021 at 12:00, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > I wonder if the problem is more fundamental than that. Passing
> > stuff in --extra-cflags is done to influence the flags used to
> > compile the QEMU end user binaries. Unfortunately --extra-cflags
> > is also getting applied to all the meson.build feature checks.
> >
> > IMHO we would get a more reliable result if the meson.build
> > checks were fully isolated from the cflags we used for building
> > everything else, so the checks get a well understood, predictable
> > environment.
> 
> If you're using --extra-cflags to pass in "-I/path/to/libfoo/headers"
> then you do want that to be used in the meson check for "do we have
> libfoo", though...

For pkg-config-ized things meson lets you override those paths
per-library IIRC.

For the non-pkg-config-izied case, that could be an argument for
specialized --extra-header-dir=PATH and --extra-lib-dir=$PATH args.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


