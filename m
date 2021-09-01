Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A419B3FDFA1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:19:18 +0200 (CEST)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSxJ-0008GD-N6
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLSZ2-0003iO-Kl
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLSYx-00086S-DB
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630511646;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TrRM3NGI73q/ugrwUUQlc2dOw7ighTJXZM6sHGKlWY=;
 b=ULAPVhF8HwW9ba2IvbVLRY+lr8IhoSrOKBpClVppZ50INSVSywpKHsiozKUIWceKhey4+g
 /eU+ueLgv7kct29zMxooYUYei58on0Hx0QeCJsPPyd7cIeS0TcYfrHFjSDsjBJBtgDPuJQ
 /rXPOA0UUB9b3qYzHTtSsFp7iGDxwNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-L75zOXqgNQa-l17qqYlbYg-1; Wed, 01 Sep 2021 11:54:03 -0400
X-MC-Unique: L75zOXqgNQa-l17qqYlbYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA0E11034B20;
 Wed,  1 Sep 2021 15:54:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 418155D9DC;
 Wed,  1 Sep 2021 15:53:49 +0000 (UTC)
Date: Wed, 1 Sep 2021 16:53:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] gitlab: Escape git-describe match pattern on Windows hosts
Message-ID: <YS+iCgl88cmMepKl@redhat.com>
References: <20210901145229.4132606-1-philmd@redhat.com>
 <YS+UylEr3CJyksxt@redhat.com>
 <CAFEAcA_gyZTfUTAAoKvrA-qyv-8dOvGjLSLmq2uaur8XYS6CuQ@mail.gmail.com>
 <YS+aiZep166VuVcH@redhat.com>
 <0901f6da-de5c-f9e6-5f40-e15f4a7c807d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0901f6da-de5c-f9e6-5f40-e15f4a7c807d@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 05:35:42PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/1/21 5:21 PM, Daniel P. Berrangé wrote:
> > On Wed, Sep 01, 2021 at 04:17:48PM +0100, Peter Maydell wrote:
> >> On Wed, 1 Sept 2021 at 15:59, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >>>
> >>> On Wed, Sep 01, 2021 at 04:52:29PM +0200, Philippe Mathieu-Daudé wrote:
> >>>> Properly escape git-describe 'match' pattern to avoid (MinGW):
> >>>>
> >>>>   $ if grep -q "EXESUF=.exe" config-host.mak; then make installer;
> >>>>     version="$(git describe --match v[0-9]*)";
> >>>>     mv -v qemu-setup*.exe qemu-setup-${version}.exe; fi
> >>>>   fatal: No names found, cannot describe anything.
> >>>>   ERROR: Job failed: exit code 1
> >>>>
> >>>> Reported-by: Cédric Le Goater <clg@kaod.org>
> >>>> Fixes: 8619b5ddb56 ("ci: build & store windows installer")
> >>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/591
> >>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >>>> ---
> >>>>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> >>>> index 10d22dcf6c1..62d33e6661d 100644
> >>>> --- a/.gitlab-ci.d/crossbuild-template.yml
> >>>> +++ b/.gitlab-ci.d/crossbuild-template.yml
> >>>> @@ -14,7 +14,7 @@
> >>>>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
> >>>>      - if grep -q "EXESUF=.exe" config-host.mak;
> >>>>        then make installer;
> >>>> -      version="$(git describe --match v[0-9]*)";
> >>>> +      version="$(git describe --match 'v[0-9]*')";
> >>>
> >>> Do you have a pointer to a pipeline showing this fix works ?
> 
> It worked on my fork but I have some versioned tag:
> https://gitlab.com/philmd_rh/qemu/-/jobs/1553450025

I can reproduce the error msg if I do a shallow clone with no history

$ cd qemu
$ git describe --match v[0-9]*
v6.1.0-171-g5e8c1a0c90

$ cd ..
$ git clone --depth 1 https://gitlab.com/qemu-project/qemu/ qemu.new
$ cd qemu.new/
$ git describe --match v[0-9]*
fatal: No names found, cannot describe anything.

but the odd thing is that I think we should have been hitting the
problem frequently if it was related to git depth. This job passes
fine in current CI pipelines and my own fork.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


