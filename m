Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9A12AEE0E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:48:05 +0100 (CET)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmjU-00037t-Sh
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcmhP-0002T2-2j
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:45:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcmhK-0006Gk-IY
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605087949;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T22sL41nuAmvukgS0bAs0Cqdipr1txve2hAbmtPVvHo=;
 b=E0CYNYV/vap2dNly94dyRmeM8aTtBxsmCb0DPPTiWYk4eMPOcwlVDT16djfQJ7jwhfstdX
 hNDH+Y3OonFJE6/jS7MdJoHTdOcPlkqauoQbxSnsmaffnbpKaMmq7+CPo2bQilMXBX/GMN
 3EcGXjvetB2c6Asacb6ZkY8FClBVv2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-JcRsuiOVNaag3-vvR0dP0A-1; Wed, 11 Nov 2020 04:45:38 -0500
X-MC-Unique: JcRsuiOVNaag3-vvR0dP0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 441591882FB3;
 Wed, 11 Nov 2020 09:45:37 +0000 (UTC)
Received: from redhat.com (ovpn-114-221.ams2.redhat.com [10.36.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D86A35B4A0;
 Wed, 11 Nov 2020 09:45:23 +0000 (UTC)
Date: Wed, 11 Nov 2020 09:45:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 10/16] gitlab-ci: Introduce the CI "job maintainer"
 concept
Message-ID: <20201111094452.GA906488@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
 <20201110160140.2859904-11-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201110160140.2859904-11-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 05:01:34PM +0100, Philippe Mathieu-Daudé wrote:
> When a job fails, someone has to take care of it. As we can
> not wait indefinitively of volunteers good will, introduce the
> concept of "job maintainers". A job maintainer is reponsible
> of keeping it working, or contact the developers having broken
> it to fix it.
> 
> When a job is added, it must have a maintainer. A job without
> maintainer is not run automatically. It can however be run
> manually from the WebUI.
> 
> To declare a maintainer, it is as easy as defining the
> JOB_MAINTAINER_NAME / JOB_MAINTAINER_EMAIL environment variables.

I don't think we really want/need todo this.

The big problem we're facing is that there is no incentive right now
for maintainers to make sure their code works with GitLab CI before
they send a pull request. Adding job maintainers is just a band-aid,
and not a very good one either, because each job covers features across
many subsystems which should each be dealt with by their existing
maintainers.

The primary solution to this tragedy is to make all the jobs gating
on all pull requests. If a maintainer wants their pull requrst to
get merged they then have no choice but to ensure it doesn't break
any CI jobs.

The main blocker for this right now IIUC is the git repo sync from
qemu to gitlab. Once we switch to gitlab as primary, we need to start
enforcing GitLab as gating for all jobs. At this point making sure
GitLab CI passes is every maintainer's job.

We'll still have some failures periodically from non-deterministic
bugs. If a test shows itself to be flaky though, it should just be
disabled in a very short time frame. Whichever maintainer owned the
test has the job for fixing the flakyness before it can be renabled.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


