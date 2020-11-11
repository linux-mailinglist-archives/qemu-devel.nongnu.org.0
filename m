Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E5F2AEE3C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:55:59 +0100 (CET)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmr8-00070X-TP
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcmpW-00068N-Nv
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcmpT-000139-UU
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605088455;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yp3L8s43y0hjGldhKbrFqLX0GN+STeewxqEMhIZmE6o=;
 b=Zo4iHpER44r/CS7zz8TdN300PoqR5NpBHfzz+4yn7s4Js5PlmS/gFBPUb+yW4RVGSyQeSc
 9lMgnT6PyHd36FnB8VYt4DWLS2Ii4bfPHzfuCRFMAHopFu9brwVjh9L8Ivg/kkBzklvlZw
 CRL1rLe8t1t116oZ+tf6sjfGDUbtDq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-W4cMFVKdP_WK3mj-lMeYtA-1; Wed, 11 Nov 2020 04:54:11 -0500
X-MC-Unique: W4cMFVKdP_WK3mj-lMeYtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D77805F18;
 Wed, 11 Nov 2020 09:54:09 +0000 (UTC)
Received: from redhat.com (ovpn-114-221.ams2.redhat.com [10.36.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7146375138;
 Wed, 11 Nov 2020 09:53:59 +0000 (UTC)
Date: Wed, 11 Nov 2020 09:53:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH 10/16] gitlab-ci: Introduce the CI "job maintainer"
 concept
Message-ID: <20201111095355.GB906488@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
 <20201110160140.2859904-11-philmd@redhat.com>
 <87o8k46xou.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87o8k46xou.fsf@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Bin Meng <bin.meng@windriver.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, virt-ci-maint-team@redhat.com,
 Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 09:37:53AM +0000, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
> > When a job fails, someone has to take care of it. As we can
> > not wait indefinitively of volunteers good will, introduce the
> > concept of "job maintainers". A job maintainer is reponsible
> > of keeping it working, or contact the developers having broken
> > it to fix it.
> >
> > When a job is added, it must have a maintainer. A job without
> > maintainer is not run automatically. It can however be run
> > manually from the WebUI.
> >
> > To declare a maintainer, it is as easy as defining the
> > JOB_MAINTAINER_NAME / JOB_MAINTAINER_EMAIL environment variables.
> 
> So I think the problem here is the CI jobs are orthogonal to the actual
> tests. And the tests should be associated via MAINTAINERS with the
> relevant sub-systems.
> 
> That is not to say that the test environments don't need some care and
> attention. So I'm quite happy to track updates needed to
> tests/docker/dockerfiles for example but just because check-block failed
> on an Ubuntu system doesn't mean I'm best placed to diagnose the
> problem. In the first instance it shouldn't happen (not merging code
> that regresses a test) and the second instance probably requires a block
> maintainer to look at the output.
> 
> I think a better solution is to improve our test reporting so we can
> quickly point the failing tests. I notice GitLab gets nice test output
> from check-acceptance. What would we need to do to improve it from
> check, check-block and check-tcg?

That presentation is from the artifacts publishing test results
in junit format. IOW, we need to enhance the build system in some
way such that it can generate a junit report of other tests too.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


