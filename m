Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8324042C401
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:51:42 +0200 (CEST)
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mafbZ-0000yi-M2
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mafZa-0007ui-Ut
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mafZY-0000kB-GL
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634136575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugW/q/vX2UUYFmpHaMMNiwj+HEdbaT2wE2n6q900eec=;
 b=B5BMBcIa5JbYfsLjLCFUv+JQJ30J2Ve36nMqd8xnOlJD5y4V38KV3WQRKpwZDMb8+Ppw+m
 UiUni8Se13G039J3WuTLNVGmYV/IysG6v5PY1bYT9KMzzIvBnO6LiQlDgJ+o/tqABcdLkp
 6sy2RF0eh42C7+VYuHDjA6FN/E8dS48=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-4Sum-BVCNVS3tNj_zhMMpQ-1; Wed, 13 Oct 2021 10:49:32 -0400
X-MC-Unique: 4Sum-BVCNVS3tNj_zhMMpQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso2170960wra.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 07:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ugW/q/vX2UUYFmpHaMMNiwj+HEdbaT2wE2n6q900eec=;
 b=QOXgOwJiCioatQWd46EmBP8Fu8M27pq3Run6fAX3dmMcuh4Bo6Nc6/m4smGOEatA+W
 yE3XXQBAxkg5Y1/qD1Ue8jP8RD+V1hkITL023VpqzN1PnN2CafAUK0GrP5S+g86vHR13
 kMB7494gSv8F7loMyLWy4kq0AaOF3EhFuB+ibxeEyPOGxJZwZLTATglpx8qePwtc1Xfn
 1kpjBwlmGLa7bpL1PL6EvH2k1CC4VL/5L9ZoZ1V9SbsN9Q2y31XzrUGQFPWQoIAaB2uQ
 dVV/Y2HhljvGfDOPI+WyZVq//fX/yz75qkkQwsInXhSVRYz0GYPCRoApNVAhnZxXo8uU
 aCuw==
X-Gm-Message-State: AOAM532tfk4dtE3+eG2aCcKmCrHnVemVhkUYUpoy8x/Ln+/BVbz6I6gC
 z5H3/NxTq3p6a57iHfu1j1XJ+DrMLKrHrqrEGy/0ZAWFmZ7Wl6Psr4McPyFaYKvyTQIxNydKSwx
 LQVsbD+tbwaeinIo=
X-Received: by 2002:a5d:508a:: with SMTP id a10mr22209813wrt.126.1634136571307; 
 Wed, 13 Oct 2021 07:49:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Ov6MPjbF3QW9VVQOehwxWtkaootySTZF1uEGD6RA8SmbLItVLkWmt2K9JKW+ZJANQumTYg==
X-Received: by 2002:a5d:508a:: with SMTP id a10mr22209784wrt.126.1634136571033; 
 Wed, 13 Oct 2021 07:49:31 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id g70sm5708168wme.29.2021.10.13.07.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 07:49:30 -0700 (PDT)
Message-ID: <3d23738f-6b9f-2b90-c005-827708d5dae4@redhat.com>
Date: Wed, 13 Oct 2021 16:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 0/7] Switch iotests to using Async QMP
To: John Snow <jsnow@redhat.com>
References: <20211012223445.1051101-1-jsnow@redhat.com>
 <5041f802-0b42-f130-ee68-56cd7464b75d@redhat.com>
 <CAFn=p-aJdGpCzkMHmMO9WO+rYn55OznyZ7K5BJz+Rv0GkRDhOA@mail.gmail.com>
 <CAFn=p-bdg3T0kt_QHDeeJCKbpugmSbzfjO+ZVDMk3TLP4fBoHg@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-bdg3T0kt_QHDeeJCKbpugmSbzfjO+ZVDMk3TLP4fBoHg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 16:00, John Snow wrote:
>
>
> On Wed, Oct 13, 2021 at 8:51 AM John Snow <jsnow@redhat.com> wrote:
>
>
>
>     On Wed, Oct 13, 2021 at 4:45 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>         On 13.10.21 00:34, John Snow wrote:
>         > Based-on: <20211012214152.802483-1-jsnow@redhat.com>
>         >            [PULL 00/10] Python patches
>         > GitLab:
>         https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
>         > CI: https://gitlab.com/jsnow/qemu/-/pipelines/387210591
>         >
>         > Hiya,
>         >
>         > This series continues where the last two AQMP series left
>         off and adds a
>         > synchronous 'legacy' wrapper around the new AQMP interface,
>         then drops
>         > it straight into iotests to prove that AQMP is functional
>         and totally
>         > cool and fine. The disruption and churn to iotests is pretty
>         minimal.
>         >
>         > In the event that a regression happens and I am not
>         physically proximate
>         > to inflict damage upon, one may set the
>         QEMU_PYTHON_LEGACY_QMP variable
>         > to any non-empty string as it pleases you to engage the QMP
>         machinery
>         > you are used to.
>         >
>         > I'd like to try and get this committed early in the 6.2
>         development
>         > cycle to give ample time to smooth over any possible
>         regressions. I've
>         > tested it locally and via gitlab CI, across Python versions
>         3.6 through
>         > 3.10, and "worksforme". If something bad happens, we can
>         revert the
>         > actual switch-flip very trivially.
>
>         So running iotests locally, I got one failure:
>
>         $ TEST_DIR=/tmp/vdi-tests ./check -c writethrough -vdi 300
>         [...]
>         300                             fail       [10:28:06] [10:28:11]
>         5.1s                 output mismatch (see 300.out.bad)
>         --- /home/maxx/projects/qemu/tests/qemu-iotests/300.out
>         +++ 300.out.bad
>         @@ -1,4 +1,5 @@
>         -.......................................
>         +..............ERROR:qemu.aqmp.qmp_client.qemu-b-222963:Task.Reader:
>
>         ConnectionResetError: [Errno 104] Connection reset by peer
>         +.........................
>           ----------------------------------------------------------------------
>           Ran 39 tests
>         [...]
>
>
>     Oh, unfortunate.
>
>
>         I’m afraid I can’t really give a reproducer or anything.  It
>         feels like
>
>
>     Thank you for the report!
>
>         just some random spurious timing-related error. Although then
>         again,
>         300 does have an `except machine.AbnormalShutdown` clause at one
>         point...  So perhaps that’s the culprit, and we need to
>         disable logging
>         there.
>
>
>     I'll investigate!
>
>
> Unfortunately, even in a loop some 150 times I couldn't reproduce this 
> one. As you point out, it appears to be just a failure caused by 
> logging. The test logic itself completes as expected.
>
> Still, I would expect, on a "clean" shutdown of the destination host 
> (where the destination process fails to load the migration stream and 
> voluntarily exits with an error code) to end with a FIN/ACK for TCP or 
> ... uh, whatever happens for a UNIX socket. Where's the Connection 
> Reset coming from? Did the destination VM process *crash*?
>
> I'm not so sure that I *should* silence this error, but I also can't 
> reproduce it at all to answer these questions, so uh. uhhh. I guess I 
> will just hammer it on a loop a few hundred times more and see if I 
> get lucky.

I could reproduce it, by running 20 instances concurrently.  (Needs a 
change to testrunner.py, so that the reference outputs don’t collide:

diff --git a/tests/qemu-iotests/testrunner.py 
b/tests/qemu-iotests/testrunner.py
index a56b6da396..fd0a3a1eeb 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -221,7 +221,7 @@ def find_reference(self, test: str) -> str:

      def do_run_test(self, test: str) -> TestResult:
          f_test = Path(test)
-        f_bad = Path(f_test.name + '.out.bad')
+        f_bad = Path(f'{os.getpid()}-{f_test.name}.out.bad')
          f_notrun = Path(f_test.name + '.notrun')
          f_casenotrun = Path(f_test.name + '.casenotrun')
          f_reference = Path(self.find_reference(test))

)

And then:

$ while TEST_DIR=/tmp/vdi-$$ ./check -vdi 300; do; done

Which pretty quickly shows the error in at least one of those loops 
(under a minute).

As far as I can tell, changing the log level in 300 does indeed fix it:

diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 10f9f2a8da..096f5dabf0 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -27,6 +27,7 @@ from typing import Dict, List, Optional
  from qemu.machine import machine

  import iotests
+from iotests import change_log_level


  BlockBitmapMapping = List[Dict[str, object]]
@@ -464,7 +465,8 @@ class 
TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
          # Expect abnormal shutdown of the destination VM because of
          # the failed migration
          try:
-            self.vm_b.shutdown()
+            with change_log_level('qemu.aqmp'):
+                self.vm_b.shutdown()
          except machine.AbnormalShutdown:
              pass


