Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6A82FF2FD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:14:53 +0100 (CET)
Received: from localhost ([::1]:46486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eTs-0003MT-Id
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2eSW-0002XI-8n
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:13:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2eST-0007SF-UQ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611252803;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGR/HwgSpth8u2SaS3ABmabUr/igE/D7iwBGSHDexdo=;
 b=PymFPWKMkcsZbfxZPFe9yyn03sWQ6DPV/6N91vXdvfE4s6ZRXp+dqNOAGvUF5jo7jZ0yHo
 EWvts2echD+M034qwGlaBob9gZ4pJxsbFYh0UiHodYYSeapErVqr19FVQ5NeKGvXwpo1vz
 6pLzQsrz/jiY0wQIJJyzcax6CARLNzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-lEJBUQX0O7K-2NDum3I_fw-1; Thu, 21 Jan 2021 13:13:13 -0500
X-MC-Unique: lEJBUQX0O7K-2NDum3I_fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13051806662;
 Thu, 21 Jan 2021 18:13:12 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8440360BF3;
 Thu, 21 Jan 2021 18:13:06 +0000 (UTC)
Date: Thu, 21 Jan 2021 18:13:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
Message-ID: <20210121181303.GR3125227@redhat.com>
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <eb4976bc-133d-7d77-cae3-899028751a85@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eb4976bc-133d-7d77-cae3-899028751a85@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wataru Ashihara <wataash@wataash.com>, qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 03:05:43PM -0300, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 1/21/21 7:08 AM, Thomas Huth wrote:
> > On 10/01/2021 17.27, Philippe Mathieu-Daudé wrote:
> > > Split the current GCC build-tci job in 2, and use Clang
> > > compiler in the new job.
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > ---
> > > RFC in case someone have better idea to optimize can respin this patch.
> > > 
> > >   .gitlab-ci.yml | 22 ++++++++++++++++++++--
> > >   1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > I'm not quite sure whether we should go down this road ... if we wanted
> > to have full test coverage for clang, we'd need to duplicate *all* jobs
> > to run them once with gcc and once with clang. And that would be just
> > overkill.
> 
> I agree with Thomas.
> 
> > 
> > 
> > I think we already catch most clang-related problems with the clang jobs
> > that we already have in our CI, so problems like the ones that you've
> > tried to address here should be very, very rare. So I'd rather vote for
> > not splitting the job here.
> 
> We got only one clang job on GitLab CI...
> 
>   build-clang:
>     <<: *native_build_job_definition
>     variables:
>       IMAGE: fedora
>       CONFIGURE_ARGS: --cc=clang --cxx=clang++
>       TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
>         ppc-softmmu s390x-softmmu arm-linux-user
>       MAKE_CHECK_ARGS: check
> 
> ... and others on Travis:
> 
>   "Clang (user)"
> 
>   "Clang (main-softmmu)"
> 
>   "Clang (other-softmmu)"

I guess these three overlap partially with the build-clang job.

>   "[s390x] Clang (disable-tcg)"

Don't forget the  Cirrus CI jobs for freebsd and macOS will
be using  CLang too.

> 
> So I've some questions:
> 
>  * Can we move those first three Travis jobs to Gitlab CI? (I can work on
> that)

Yeah, if we move those three travis jobs they can replace the existing
build-clang job. We don't neccesssarily need to keep them as three
separate jobs - that split was just due to the Travis time limits.
If a different split works better on GitLab we can do that.

>  * Do you think they cover the most common problems with clang?

Should do I think, especially in addition to the Cirrus CI jobs.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


