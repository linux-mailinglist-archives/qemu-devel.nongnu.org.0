Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE53294BCD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 13:30:31 +0200 (CEST)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVCK5-0003vS-SO
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 07:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVCIz-00034y-Jy
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 07:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVCIw-0005K0-K5
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 07:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603279755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvx1iOKxfkty+O5Zfakb7slRY/MGqt39y1CRLLzpu4U=;
 b=Owl3TqCIqsv7szhc5mzaH2vtczvYCDaP6MAIu71pzCrQVJ4vEUkg1qGhyf+jLbzGQLzP6I
 Nmk/PRwmBbhdzbhJqLG2I5Dg2pXxDfqQqMRlFj0b/KnmQPnOcjVSoZVRP/XScA5xXwV79m
 n/V+asWB5CBBRW55YCy3OtFBNOIaiDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-HH4HkQ2jOlOt0UekSS4YZw-1; Wed, 21 Oct 2020 07:29:13 -0400
X-MC-Unique: HH4HkQ2jOlOt0UekSS4YZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9701264084;
 Wed, 21 Oct 2020 11:29:12 +0000 (UTC)
Received: from thuth.remote.csb (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4648D5C1BB;
 Wed, 21 Oct 2020 11:29:11 +0000 (UTC)
Subject: Re: [PATCH] tests/docker/dockerfiles/centos: Use SDL2 instead of SDL1
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201021072308.9224-1-thuth@redhat.com>
 <e7ac0344-24d1-d53f-7e7f-798be452adcb@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4ea997ee-a0c9-34da-8ad6-048ed4904fb3@redhat.com>
Date: Wed, 21 Oct 2020 13:29:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e7ac0344-24d1-d53f-7e7f-798be452adcb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/2020 11.38, Philippe Mathieu-Daudé wrote:
> On 10/21/20 9:23 AM, Thomas Huth wrote:
>> We do not support SDL1 in QEMU anymore. Use SDL2 instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/docker/dockerfiles/centos7.docker | 2 +-
>>   tests/docker/dockerfiles/centos8.docker | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/docker/dockerfiles/centos7.docker
>> b/tests/docker/dockerfiles/centos7.docker
>> index 8b273725ee..6f11af1989 100644
>> --- a/tests/docker/dockerfiles/centos7.docker
>> +++ b/tests/docker/dockerfiles/centos7.docker
>> @@ -31,7 +31,7 @@ ENV PACKAGES \
>>       perl-Test-Harness \
>>       pixman-devel \
>>       python3 \
>> -    SDL-devel \
>> +    SDL2-devel \
>>       spice-glib-devel \
>>       spice-server-devel \
>>       tar \
>> diff --git a/tests/docker/dockerfiles/centos8.docker
>> b/tests/docker/dockerfiles/centos8.docker
>> index 585dfad9be..f86931f955 100644
>> --- a/tests/docker/dockerfiles/centos8.docker
>> +++ b/tests/docker/dockerfiles/centos8.docker
>> @@ -2,7 +2,7 @@ FROM centos:8.1.1911
>>     RUN dnf -y update
>>   ENV PACKAGES \
>> -    SDL-devel \
>> +    SDL2-devel \
>>       bzip2 \
>>       bzip2-devel \
>>       dbus-daemon \
> 
> I wonder if we are having docker image caching issues...
> 
> build-system-centos job passed but then in check-system-centos:
> 
> FAILED: libcommon.fa.p/ui_sdl2-input.c.o
> ui/sdl2.h:7:10: fatal error: SDL.h: No such file or directory
>  #include
>           ^~~~~~~
> 
> And then in acceptance-system-centos:
> 
> ./qemu-system-x86_64: error while loading shared libraries:
> libSDL2-2.0.so.0: cannot open shared object file: No such file or directory

Uh, weird, now I've got that one, too ... sorry, I only waited for the build
phase to complete before sending out the patch, I did not expect any trouble
in the testing stage...

The check-system-xxx jobs are apparently recompiling lots of files now ...
not sure yet why that happens... seems to be related to Paolo's PR from last
weekend?

The previous CI run still looks okayish:

 https://gitlab.com/qemu-project/qemu/-/jobs/796502985

then the one from Paolo suddenly recompiled pretty much everything:

 https://gitlab.com/qemu-project/qemu/-/jobs/796767669

Does anybody got a clue what happened here?

 Thomas



