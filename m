Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6B2FECE3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 15:30:56 +0100 (CET)
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2az9-0003nJ-B2
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 09:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2axY-0003Lf-Fp
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2axV-000545-Qp
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611239352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HV1+Z/zWVPcxRE3h4yAzOwQrxEqh6tKL9e7J7FV8btk=;
 b=H8FsN77bSvsPiWHwQW/fWBc4dfDjpNiSm3pzQmCPZkmhtYeCH5vEtbH3yFw80fet44l77N
 W+Bi5OEWjXNNsE7xh240g+T0tGx1mMscRJe8FthYeGxv3xHklsdvVL09G8+KEywJesI47z
 T40aL8HII9PyCtUzXJhndvyrl3NlQhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-7xGd_ZSJPTGnhs-VDLQ0Mw-1; Thu, 21 Jan 2021 09:29:09 -0500
X-MC-Unique: 7xGd_ZSJPTGnhs-VDLQ0Mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39F49107ACE4;
 Thu, 21 Jan 2021 14:29:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 233691F06B;
 Thu, 21 Jan 2021 14:29:04 +0000 (UTC)
Subject: Re: changing tests/qtest/meson.build causes unnecessary rebuilding
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8mBK9932CLZ9uFtEa0rSycK6Sp9UDjSJnbJpg2hx8idg@mail.gmail.com>
 <17698af4-537b-3e8e-67c8-4ed45a922def@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7faca1b9-afa8-493d-e07a-8856832bc051@redhat.com>
Date: Thu, 21 Jan 2021 15:29:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <17698af4-537b-3e8e-67c8-4ed45a922def@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2021 14.12, Paolo Bonzini wrote:
> On 21/01/21 12:56, Peter Maydell wrote:
>> $ make -C build/arm-clang/ -j8
>> make: Entering directory
>> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
>> [1/23] Generating qemu-version.h with a meson_exe.py custom command
>> make: Leaving directory
>> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
>> $ touch tests/qtest/meson.build
>> $ make -C build/arm-clang/ -j8
>> make: Entering directory
>> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
>> /usr/bin/ninja  build.ninja && touch build.ninja.stamp
>> [0/1] Regenerating build files.
>> The Meson build system
>> [...]
>>
>> It then goes on to rebuild hundreds or thousands of files, most of
>> which are not even in tests/. (Oddly, the exact set of files recompiled
>> seems to vary from run to run.)
>>
>> Forcing a full rebuild of all of QEMU seems rather excessive when
>> the change was likely "add a new test case"...
> 
> This is "avoid build.ninja changes due to order of hash table iteration" 
> (https://github.com/mesonbuild/meson/pull/7900/).  I think Meson 0.57 (with 
> the fix) should be out soon, hopefully before 6.0.
> 
> Alternatively you can try to bug your distro to include the patches, they 
> are pretty safe.

Not sure if it is related, but I noticed that we are also rebuilding a lot 
of files in the gitlab-CI that we did not before the meson conversion, 
especially in the check-system-* jobs, e.g:

https://gitlab.com/qemu-project/qemu/-/jobs/977344949#L366

The check-system-* jobs should normally take the artifacts from the 
build-system-* jobs and thus hardly recompile anything at all.

A part of the problem seems to be that we check out the submodules again, I 
can get rid of the superfluous reconfiguration step by adding something like:

diff -u a/.gitlab-ci.yml b/.gitlab-ci.yml
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -39,6 +39,8 @@ include:
    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
    script:
      - cd build
+    - touch *
+    - make git-submodule-update
      - find . -type f -exec touch {} +
      - make $MAKE_CHECK_ARGS

... but still, the jobs then recompile almost all files afterwards... could 
that be related to that meson problem, too?

  Thomas


