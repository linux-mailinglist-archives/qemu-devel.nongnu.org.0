Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC54D995A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:47:59 +0100 (CET)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4id-0001D1-0Z
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:47:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU3Xf-0002z9-UR
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU3Xd-0004Yw-7C
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 05:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647336752;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3TwFNyhwQvjtpQGqsRUz5cTbG+riOtus7MHgmOYrjA=;
 b=CW5RGVnnL9+FCWUAqjwczc7HDMm3OOVpHSMJGCAhnthXUHYY8/UdAyLIeRDVIfkeZdFi6i
 mns3RuRkXk0i2oYObdpdqqjsxk7TQiTegHPsfM18+/F03AByF94y5E/ys8roPQf2tb4i1P
 c6sJP0AhabZNRoLANEAKwubmjFImvsQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-25oJPpJUNh-5YLmkPP00zQ-1; Tue, 15 Mar 2022 05:32:23 -0400
X-MC-Unique: 25oJPpJUNh-5YLmkPP00zQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 374F9811E75;
 Tue, 15 Mar 2022 09:32:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B7462087440;
 Tue, 15 Mar 2022 09:32:18 +0000 (UTC)
Date: Tue, 15 Mar 2022 09:32:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjBdIA7ZecVr7C+f@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9y0xQ2O00y1uJ5@redhat.com>
 <32b0d8eb-e00f-8468-135b-d508b82978ca@redhat.com>
MIME-Version: 1.0
In-Reply-To: <32b0d8eb-e00f-8468-135b-d508b82978ca@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 10:05:32AM +0100, Paolo Bonzini wrote:
> On 3/14/22 17:52, Daniel P. Berrangé wrote:
> >                  RHEL-8: 10.0.1
> >      openSUSE Leap 15.3: 9.0.1
> >        Ubuntu LTS 18.04: 6.0.0
> >              FreeBSD 12: 8.0.1
> > 
> > Ubuntu 18.04 drops off our list after 7.0 comes out
> > 
> > OpenSUSE Leap 15.2 was EOL'd by SUSE themselves in Jan 2022,
> > We use it as a proxy for SLES, but I think we can required
> > SLES 15 sp3.
> 
> (FTR, OpenSUSE Leap 15.3 has GCC 10.3.0).
> 
> > FreeBSD 12 is something we still support until April 2023,
> > but arguably we only care about CLang there.
> > 
> > NetBSD 9 wasn't listed, but it was reported to required
> > GCC 7.4  (commit 3830df5f83b9b52d9496763ce1a50afb9231c998)
> > and that is still the latest release of NetBSD.
> > 
> > So NetBSD is our biggest constraint on requiring GCC 10
> 
> Do we care about the BSDs since they have newer compilers (including gcc10)
> available in pkgsrc?  If you go by the base system, then RHEL8 has 8.5.0 and
> newer version are only available with packages such as gcc-toolset-10 and
> gcc-toolset-11.

I mention NetBSD because we had an explicit request to support
7.4 GCC from there, as it was the current system compiler.

That's a mistake in my original commit logs then wrt RHEL8, as I
only ever intended to consider the standard base repos, not random
addon repos.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


