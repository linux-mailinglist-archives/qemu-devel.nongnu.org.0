Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74A30236D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:58:43 +0100 (CET)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3yds-0004pK-RJ
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l3ycQ-00040E-Uh
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l3ycN-0007oo-LO
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611568625;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Sf5rH0lUaeDUZhTkMCpzA/aqtBa8u19O8apW0ze0n18=;
 b=QphLQAexckvFaHyxg1lpvrVRz1ioLmnssMALmJJ36LWKsD3IH60Vh+qxWBu9r/Irk/Bc4F
 ZrQlZnnjd2CoVA7Ntc8ItzLxUjxVhP0xF+KwLJhhy1xiNPBSuS6u0bPqIp+HHZ+Yzua14R
 oLm7MDvkF/7rz2N+y0nXm3GDXITfXXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-CzuySmWSOtqMb-NsqiPk4A-1; Mon, 25 Jan 2021 04:57:03 -0500
X-MC-Unique: CzuySmWSOtqMb-NsqiPk4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8106B180A094
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 09:57:02 +0000 (UTC)
Received: from redhat.com (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 049BF1F047;
 Mon, 25 Jan 2021 09:56:57 +0000 (UTC)
Date: Mon, 25 Jan 2021 09:56:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v1] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
Message-ID: <20210125095655.GD3527172@redhat.com>
References: <20210125090339.134019-1-thuth@redhat.com>
 <e8699ffe-3260-3033-cc13-ae9c3f86cbf1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e8699ffe-3260-3033-cc13-ae9c3f86cbf1@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 10:51:04AM +0100, Paolo Bonzini wrote:
> On 25/01/21 10:03, Thomas Huth wrote:
> > Currently, our check-system-* jobs are recompiling the whole sources
> > again. This happens due to the fact that the jobs are checking out
> > the whole source tree and required submodules again, and only try
> > to use the "build" directory with the binaries and object files
> > as an artifact from the previous stage - which simply does not work
> > anymore (with the current version of meson). Due to some changed
> > time stamps, meson is always trying to rebuild the whole tree.
> > 
> > To fix this problem, we can use "meson test --no-rebuild" instead of
> > make check" to avoid rebuilding all binaries every time. However, the
> > iotests ("make check-block") are not run by "meson test", so we have
> > to execute these manually now. But instead of adding them to the same
> > job as "meson test", it's better to put them into a separate new job
> > instead, to keep things nicely running in parallel in the CI.
> > This saves ca. 15 - 20 minutes of precious CI cycles in each run.
> 
> The reason why we're not using "meson test" is that the reporting is (still)
> inferior to what you get from "make check", especially with respect to which
> tests are failing.  This is being tracked at
> https://github.com/mesonbuild/meson/issues/7830 and the last missing bits
> are at https://github.com/mesonbuild/meson/issues/8200 (after which we'll
> change the "meson test" command line to also include "meson test
> --verbose").
> 
> However, for CI this is a minor issue because we can let GitLab parse the
> XML testing logs.  Can you add something like this to the test jobs for v2?
> 
> +  artifacts:
> +    when: always
> +    paths:
> +      - build/meson-logs/
> +    reports:
> +      junit: build/meson-logs/testlog.junit.xml
> 
> Another possibility could be to use "make check NINJA=:".  I am not sure if
> that works, but if it does it would be the smallest possible workaround.

When I suggested use of --no-rebuild, I was actally thinking that
we would change the Makefile(s) to enable to pass the --no-rebuild
arg to meson. eg

  make check MESON_ARGS=--no-rebuild

is that, or something similar possible ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


