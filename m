Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFB128C9C5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 10:12:07 +0200 (CEST)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSFPi-000369-Qm
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 04:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kSFNm-0001na-0L
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 04:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kSFNi-0001UF-2L
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 04:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602576601;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vESFGpWrlzAvRFf0x+A5VuxgdF/UMK5FnnFPTHZZlO8=;
 b=eKKa6SP6iRhtyWOwhOhmfgK3pj4MZNdhT+UheP8J7WSHfmb6cM2QDb2uRlUKD81KZGFjI4
 WQ81WeuVwwzHQSNnYK77YuLrA4NeGxlKIP3JfuQmLUavc/tRIWJlYKYiu4XoJchoGbK+dz
 NtiTuYlrxk+HgHf6mUSKe18NJq+3VW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-wXx1Jh1DNR-Qz_IScBYYSQ-1; Tue, 13 Oct 2020 04:09:57 -0400
X-MC-Unique: wXx1Jh1DNR-Qz_IScBYYSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A1FB1091061;
 Tue, 13 Oct 2020 08:09:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-78.ams2.redhat.com [10.36.114.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EB0360C07;
 Tue, 13 Oct 2020 08:09:52 +0000 (UTC)
Date: Tue, 13 Oct 2020 09:09:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/3] gitlab: add a CI job for running checkpatch.pl
Message-ID: <20201013080949.GB70612@redhat.com>
References: <20200918132903.1848939-1-berrange@redhat.com>
 <20200918132903.1848939-2-berrange@redhat.com>
 <34ecfca3-e8f1-4faa-d55d-df40310f08a0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <34ecfca3-e8f1-4faa-d55d-df40310f08a0@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 13, 2020 at 10:08:56AM +0200, Thomas Huth wrote:
> On 18/09/2020 15.29, Daniel P. Berrangé wrote:
> > This job is advisory since it is expected that certain patches will fail
> > the style checks and checkpatch.pl provides no way to mark exceptions to
> > the rules.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  .gitlab-ci.d/check-patch.py | 48 +++++++++++++++++++++++++++++++++++++
> >  .gitlab-ci.yml              | 12 ++++++++++
> >  2 files changed, 60 insertions(+)
> >  create mode 100755 .gitlab-ci.d/check-patch.py
> [...]
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index a18e18b57e..3ed724c720 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -369,3 +369,15 @@ check-crypto-only-gnutls:
> >    variables:
> >      IMAGE: centos7
> >      MAKE_CHECK_ARGS: check
> > +
> > +
> > +check-patch:
> > +  stage: test
> 
> Would it be ok to move this to the "build" stage, so that the job does not
> have to wait for all the slow build jobs to finish?
> (same question applies for the next patch, too)
> 
> If you agree, I can do the change when picking up the patches, no need to
> resend just because of this.

Sure, fine with me.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


