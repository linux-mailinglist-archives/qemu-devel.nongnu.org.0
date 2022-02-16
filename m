Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE84B853D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:10:47 +0100 (CET)
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHGo-00037L-Fd
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKH0B-00054A-H2
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:53:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKH09-0006di-Cg
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645005212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIYrEsEqtQlaUjFeO1I5gSjxcf3Mn5eh6E9O91JohnE=;
 b=B7J3210OaurCawknzO1juBLxvKYeTV86ylkoI2vRLRcB4ChPeokJ1Oah7XbvtHeYwUf3cU
 FmC48mL1uIOl45ypW2kOnDW99srPGGxVNrEUf403sAGNjYjXotqKQcVv5I/ugUjulYFn4I
 0pghw4ZcVnDouZOx+3I5u8BiML0k7Cg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-H2YAM01oN0uIGY7uJSceCw-1; Wed, 16 Feb 2022 04:53:31 -0500
X-MC-Unique: H2YAM01oN0uIGY7uJSceCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay41-20020a05600c1e2900b0037c5168b3c4so2694918wmb.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=EIYrEsEqtQlaUjFeO1I5gSjxcf3Mn5eh6E9O91JohnE=;
 b=O+BlvS6l8vQhdSLGbaUHs8g/yfmEdIsGZ4J8IZx0xes0lcQL99rsDDEzl6Z5zriGBs
 z18zwz9wl0fCp9/EE5Diy1Ss7XAE6Nz7vVXhLPO4ZgmX2GRUhwl66GvSltGuqiV+VKox
 y9ztSdq8FjZ6bnKHylVNZNhageQHixDVCL5hmNJCD53Dh2JPq5YcpZwGFs8uVKYwiE1K
 usj6FDPfvxW1KKGIm3uNyBr4bfGKxjjN2a7xXkfPdgXAD1dYbSgpn6/2vsFGV+YH/muA
 CRgpeIFgtHJql1kSowtp8cR4B/n5HZk/jX4fqJuSIhs/5LMbDDOQw0fFgnRxgw2zazL+
 vvbQ==
X-Gm-Message-State: AOAM532gYvMoeZC9Kz83tWhbw34NVGIR10dGRXeb0dFHMuz1VAOYPZE0
 RzSsEqWGy7RkIAB+ONCYrjtJv3NkshM0f819BbALnwDWHtpricauxAOY5Y50wZ5LhzzNYvO762j
 4kMPERih4YxEtKQw=
X-Received: by 2002:adf:e705:0:b0:1e3:14aa:db8d with SMTP id
 c5-20020adfe705000000b001e314aadb8dmr1628318wrm.398.1645005210178; 
 Wed, 16 Feb 2022 01:53:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYl7DGDqXPgkNo/xlsHu4GrGOOeX18EZLYW+wRjOgxO0T8pPAU5okjTrDpaM4La7JYrbtxLw==
X-Received: by 2002:adf:e705:0:b0:1e3:14aa:db8d with SMTP id
 c5-20020adfe705000000b001e314aadb8dmr1628303wrm.398.1645005209950; 
 Wed, 16 Feb 2022 01:53:29 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id o13sm17760648wmq.45.2022.02.16.01.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:53:29 -0800 (PST)
Message-ID: <27d96cc5-5816-b719-22f7-2b60bb5f9400@redhat.com>
Date: Wed, 16 Feb 2022 10:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Thomas Huth <thuth@redhat.com>, David Miller <dmiller423@gmail.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
 <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
 <79af3435-0cbc-9c27-f29e-8aa2d5175c65@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
In-Reply-To: <79af3435-0cbc-9c27-f29e-8aa2d5175c65@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 10:43, Thomas Huth wrote:
> On 16/02/2022 10.17, David Hildenbrand wrote:
>> On 15.02.22 21:27, David Miller wrote:
> ...
>>> diff --git a/tests/tcg/s390x/Makefile.target
>>> b/tests/tcg/s390x/Makefile.target
>>> index 1a7238b4eb..16b9d45307 100644
>>> --- a/tests/tcg/s390x/Makefile.target
>>> +++ b/tests/tcg/s390x/Makefile.target
>>> @@ -1,6 +1,6 @@
>>>    S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>>    VPATH+=$(S390X_SRC)
>>> -CFLAGS+=-march=zEC12 -m64
>>> +CFLAGS+=-march=z15 -m64
>>
>> Unfortunately, this makes our docker builds unhappy -- fail. I assume the
>> compiler in the container is outdated.
>>
>> $ make run-tcg-tests-s390x-linux-user
>> changing dir to build for make "run-tcg-tests-s390x-linux-user"...
>> make[1]: Entering directory '/home/dhildenb/git/qemu/build'
>>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
>>    BUILD   debian10
>>    BUILD   debian-s390x-cross
>>    BUILD   TCG tests for s390x-linux-user
>>    CHECK   debian10
>>    CHECK   debian-s390x-cross
>>    BUILD   s390x-linux-user guest-tests with docker qemu/debian-s390x-cross
>> s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=z15'
>> s390x-linux-gnu-gcc: note: valid arguments to '-march=' are: arch10 arch11 arch12 arch3 arch5 arch6 arch7 arch8 arch9 g5 g6 native z10 z13 z14 z196 z9-109 z9-ec z900 z990 zEC12; did you mean 'z10'?
>>
>> Maybe debian11 could, work.
>>
>> @Thomas do you have any idea if we could get this to work with
>> '-march=z15' or should we work around that by manually encoding
>> the relevant instructions instead?
> 
> I'm not an expert when it comes to containers, but I think you could try to 
> update to debian11 in tests/docker/dockerfiles/debian-s390x-cross.docker and 
> in ./.gitlab-ci.d/container-cross.yml ... if that does not work, it's maybe 
> better to manually encode the instructions.

debian11 won't work for general cross builds.

But, it should work with the tests:


From 8108b075e4f74fa4c590f3acf932e221e166889c Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Wed, 16 Feb 2022 10:45:21 +0100
Subject: [PATCH] tests/tcg/s390x: Build tests with debian11

We need a newer compiler to build with -march=z15, to be used soon.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tests/docker/Makefile.include                       |  2 ++
 .../dockerfiles/debian-s390x-test-cross.docker      | 13 +++++++++++++
 tests/tcg/configure.sh                              |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 tests/docker/dockerfiles/debian-s390x-test-cross.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f1a0c5db7a..e77e5a2f40 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -210,6 +210,7 @@ docker-image-debian-arm64-test-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
+docker-image-debian-s390x-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
@@ -219,6 +220,7 @@ DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
+DOCKER_PARTIAL_IMAGES += debian-s390x-test-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-s390x-test-cross.docker b/tests/docker/dockerfiles/debian-s390x-test-cross.docker
new file mode 100644
index 0000000000..26435287b6
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-s390x-test-cross.docker
@@ -0,0 +1,13 @@
+#
+# Docker s390x cross-compiler target (tests only)
+#
+# This docker target builds on the debian Bullseye base image.
+#
+FROM qemu/debian11
+
+# Add the foreign architecture we want and install dependencies
+RUN dpkg --add-architecture s390x
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+        apt install -y --no-install-recommends \
+        crossbuild-essential-s390x gcc-10-s390x-linux-gnu
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 763e9b6ad8..3f00f9307f 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -185,7 +185,7 @@ for target in $target_list; do
       ;;
     s390x-*)
       container_hosts=x86_64
-      container_image=debian-s390x-cross
+      container_image=debian-s390x-test-cross
       container_cross_cc=s390x-linux-gnu-gcc
       ;;
     sh4-*)
-- 
2.34.1

-- 
Thanks,

David / dhildenb


