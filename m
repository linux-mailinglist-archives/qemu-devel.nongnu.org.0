Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8CC323BB5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:58:44 +0100 (CET)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsoV-0007B9-LF
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEsnM-0006E7-O3
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEsnK-0005xJ-Ni
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614167849;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBGjk30guB/RYsOk+1F6Ni5X+zFZ4/2FiFaJmr1H+RI=;
 b=Ow0NFubiUzmgRXOdIuxHv1X/JozG5YyLZtNEw4ZqhKZMEmgzLeYaAoBZZqUcinv9yW7eUe
 3iEdrFY13McDWbA3myDzOjZ1c/uy59ObpwJ/ha+RYhfnwk979SKi0rb0ljTatqeIVNI+4R
 CvkecCCOVyeRGj/zyREcohVnQRRlOds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-w5w1K25mN7-A7Dif3wvtGw-1; Wed, 24 Feb 2021 06:57:23 -0500
X-MC-Unique: w5w1K25mN7-A7Dif3wvtGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD8521005501;
 Wed, 24 Feb 2021 11:57:22 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA4CE60916;
 Wed, 24 Feb 2021 11:57:15 +0000 (UTC)
Date: Wed, 24 Feb 2021 11:57:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/3] fix build failures from incorrectly skipped
 container build jobs
Message-ID: <YDY/GK9TWgCEnqOD@redhat.com>
References: <20210216132954.295906-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210216132954.295906-1-berrange@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping - can we get this series merged so we reduce the chances of
stale container images for people working across multiple branches

On Tue, Feb 16, 2021 at 01:29:51PM +0000, Daniel P. Berrangé wrote:
> This series fixes a problem with our gitlab CI rules that cause
> container builds to be skipped. See the commit description in the
> first patch for the details on this problem.
> 
> The overall result of this series though is a small increase in overall
> pipeline time.
> 
> Previously
> 
>  - When container jobs are skipped: approx 1hr 5 mins
>  - When container jobs are run, cached by docker: approx 1hr 15 mins
>  - When container jobs are run, not cached by docker: approx 1hr 30 mins
> 
> With this series applied the first scenario no longer exists, so
> all piplines are either 1hr 15 or 1hr 30 depending on whether the
> container phase is skipped.
> 
> On the plus side the builds are more reliable as we're actually
> building container images at correct times.
> 
> There is still a race condition though where build jobs can run
> with the wrong containers. This happens if you push two different
> branches to gitlab with different docker file content. If the
> container jobs for the 2nd branch finish before the 1st
> branch runs its build jobs, the 1st branch can end up using
> containers fro the second branch.  The only fix to truely fix
> that would be to stop using "latest" docker tag and always
> use a tag based on the branch name. This would mean we build
> up a growing set of docker images in the gitlab registry.
> 
> At least this series is much more correct that what exists in
> git currently. I'm intending to continue to investigate a solution
> for the remaining race condition, but don't want to block this
> series from merging, since this already solves the problem for the
> majority of contributors' usage.
> 
> Changed in v2:
> 
>  - Set needs rules for cross jobs too
> 
> Daniel P. Berrangé (3):
>   gitlab: always build container images
>   gitlab: add fine grained job deps for all build jobs
>   gitlab: fix inconsistent indentation
> 
>  .gitlab-ci.d/containers.yml  |  7 ----
>  .gitlab-ci.d/crossbuilds.yml | 46 ++++++++++++++++++++++
>  .gitlab-ci.yml               | 74 ++++++++++++++++++++++++++++++++----
>  3 files changed, 112 insertions(+), 15 deletions(-)
> 
> -- 
> 2.29.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


