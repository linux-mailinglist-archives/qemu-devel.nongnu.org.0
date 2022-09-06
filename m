Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1DD5AED69
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:35:25 +0200 (CEST)
Received: from localhost ([::1]:43276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZfg-000298-S5
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVZHV-0007zp-MD
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVZHM-0007y5-CW
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662473415;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/gk65jBGgemAR8CrOhZaUcb4fv0oPh8/xlVODwwO80s=;
 b=RNTmwNNuGgbWAiNzIUNlm6b+zaG2dp1//YVJF9ju2a9kn/JLXGwz9SeFaM4cV3fWDTSZjr
 3bpQJrQn8Eij3htdAqxxdPnYxXBkKWBqDodJJ9Lo+lTrjJHc+hQpkyUBOyEHbeQzD99D+o
 phTj6Rou7P/TSvj8xbIFdQWPSkhsN80=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-cvxrUlkRNze9_wkckZQrGw-1; Tue, 06 Sep 2022 10:10:11 -0400
X-MC-Unique: cvxrUlkRNze9_wkckZQrGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C82D8039AE;
 Tue,  6 Sep 2022 14:10:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C9A1415137;
 Tue,  6 Sep 2022 14:10:08 +0000 (UTC)
Date: Tue, 6 Sep 2022 15:10:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 qemu-devel@nongnu.org, thuth@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
Message-ID: <YxdUvTmfrU0DSdkU@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
 <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
 <YxdH/c9jx+3oVs9m@redhat.com>
 <20220906095824-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906095824-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

On Tue, Sep 06, 2022 at 10:03:55AM -0400, Michael S. Tsirkin wrote:
> On Tue, Sep 06, 2022 at 02:15:41PM +0100, Daniel P. Berrangé wrote:
> > On Thu, Jul 14, 2022 at 02:24:18PM +0100, Peter Maydell wrote:
> > > On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > > > > Changelog:
> > > > > v2:
> > > > >  - a new class of python based tests introduced that is separate from avocado
> > > > >    tests or qtests. Can be run by using "make check-pytest".
> > > > >  - acpi biosbits tests are the first tests to use pytest environment.
> > > > >  - bios bits tests now download the bits binary archives from a remote
> > > > >    repository if they are not found locally. The test skips if download
> > > > >    fails.
> > > > >  - A new environment variable is introduced that can be passed by the tester
> > > > >    to specify the location of the bits archives locally. test skips if the
> > > > >    bits binaries are not found in that location.
> > > > >  - if pip install of python module fails for whatever reaoson, the test skips.
> > > > >  - misc code fixes including spell check of the README doc. README has been
> > > > >    updated as well.
> > > > >  - addition of SPDX license headers to bits test files.
> > > > >  - update MAINTAINERS to reflect the new pytest test class.
> > > > >
> > > > > For biosbits repo:
> > > > >  - added Dockerfile and build script. Made bios bits build on gcc 11.
> > > > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> > > > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> > > > >    The build script generates the zip archive and tarball used by the test.
> > > >
> > > > So far so good, I think it's ok for a start. It's probably a good idea
> > > > to host the source on qemu.org. Peter - any objection to this?
> > > 
> > > Dan was looking at v1 from the point of view of how we handle the
> > > guest binary blobs for these tests -- I'd rather defer to him rather
> > > than taking the time to get up to speed on the issue myself.
> > 
> > Storing the *source* git repo for biosbits on gitlab.com/qemu-project
> > is sensible, as that's what we've done for other 3rd party bits that
> > we bundle/depend on git repo access for.
> > 
> > The above git repo, however, has extra branches that also store the
> > binary builds, and I'm not convinced that is a good idea.
> > 
> > I feel like the source git repo should have a .gitlab-ci.yml file
> > that builds the binary and publishes it as an CI artifact. This
> > lets us keep the binary outside of GIT, have a CI job that periodically
> > refreshes the binary (eg so when the Ubuntu version that Dockerfile
> > uses goes EOL we can use something else). The test can access the CI
> > artifact directly.
> > 
> > 
> > With regards,
> > Daniel
> 
> CI is for biosbits developers, bits that everyone uses
> is production. I don't think our CI is yet robust enough -
> I think when it comes to pushing bits that all
> other developers are going to use, it is wise to have them
> pushed manually. Random CI failures are not unheard of,
> and if these cause a corrupted binary to be downloaded
> to all developers, it's going to be bad.

The artifacts would only be published if the CI job succeeds. If it fails
the artifacts from the previous successful job remain available.

Second, we don't need to run the CI continuously. It could be done once
a month, or could be triggered manually on demand. Or it could run
frequently, but we only publish artifacts from a manual invokation.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


