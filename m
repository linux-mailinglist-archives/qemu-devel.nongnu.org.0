Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0F346789
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:26:30 +0100 (CET)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOljZ-0006vW-AJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOkSW-0005rY-Mp
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:04:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOkSU-0000fg-4D
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616519084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Npv1RqdAqtBRdzCPF2t0l7ekSfLciuVCwreXIKSP5OU=;
 b=EksSr9Bn8fN53We1MK32+gNOYMXHj413s+fsCuSzxWak9qWc3I49SxeJY4uA4kyaxjTBuB
 TQcr+FoX8flz3eLXfwE4sh/U3+0tIAYrmYAe/FPoXdC3KAHxMhRCJd1kjI17qnnVD8BpXi
 8LwCuZqrr7GGiDx7xbKqfB2q++4Ip54=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-jjNn5g_RMMGAQ4P1M70ohQ-1; Tue, 23 Mar 2021 13:04:42 -0400
X-MC-Unique: jjNn5g_RMMGAQ4P1M70ohQ-1
Received: by mail-wm1-f71.google.com with SMTP id w10so1347796wmk.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 10:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Npv1RqdAqtBRdzCPF2t0l7ekSfLciuVCwreXIKSP5OU=;
 b=Ixgsad2tVkJYs3ROf8t1JHfH0lxCNUtqtT57ffmaJl8Dd4cfuDzKMJN8ihwOBXdYYe
 RK5pKR50PPdjEw/Ytfo6zAz3l3CYeIvwpUwSXOxIZBCBsZ01HWbTh272dHiE2ozO2Brc
 h+o0LNKVdKvntv5On7gHyHeqfiBgziutusiRsIerbMBwngsIXAog/sRf/s36nWGCBS8+
 iYRFH8aAHanU641okAFsGPF5dNUnEUL0zJvpgV8d3HOpUcK5Hu71HsK0tc1wJRZuLb5O
 8Gq9AX4PqUxeCD8VbLbbyFpjeapTrFC9WFxMIYcxgmnmmQAivAm8ZD6JtmmjcCYompMc
 nX7g==
X-Gm-Message-State: AOAM533a6f9shgz03iQnJI9LfK8XtI3zUCMiSaGNHuqUiMzLP7/oVD+8
 pIBTYLFJVL7PuU0xU4hJgmCPJLFzkIKZk7rzsdM5WZkKvM3uNgcM+acDE8r/6UzkEs+Id2V7RHo
 wtAFZqM/8HfppJkk=
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr4244381wmq.141.1616519081217; 
 Tue, 23 Mar 2021 10:04:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX98q4xZMevF+QLCyUhnVfG76sloGiBlsmiCm5+PlzZn4/bJlZP7UA7Ii99mhMMHnOxV5R9A==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr4244346wmq.141.1616519080904; 
 Tue, 23 Mar 2021 10:04:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h10sm24532214wrp.22.2021.03.23.10.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:04:40 -0700 (PDT)
Subject: Re: [PATCH 1/4] qemu-iotests: allow passing unittest.main arguments
 to the test scripts
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210323130614.146399-1-pbonzini@redhat.com>
 <20210323130614.146399-2-pbonzini@redhat.com>
 <f2d648c7-1b80-bec6-f17c-78d36cf998b1@virtuozzo.com>
 <97e7aa7e-dcf0-17d0-3a4b-2d293e9c89ed@redhat.com>
 <a51c2d8d-cc9f-705f-2527-857a791e54de@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <04724b6a-3be2-54ff-c769-35fed34e9135@redhat.com>
Date: Tue, 23 Mar 2021 18:04:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a51c2d8d-cc9f-705f-2527-857a791e54de@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eesposit@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/21 17:56, Vladimir Sementsov-Ogievskiy wrote:
> hmm, just use a separate call of unittest.main, or honestly define a 
> varaible as Union[] or just Any ?

All the ugliness goes away if the implementation is done properly. :)

> For me normal try-finally is a lot more clean than calling atexit() in a 
> class method. It's just a strange interface. Prior to the patch user can 
> call execute_unittest several times and expect that output will be 
> printed during the call. After the patch outputs of all calls to 
> execute_unittest() will be printed at program exit..

Yeah, I agree.  I didn't like the finally, but I really didn't like it
because of the *behavior* of buffering the whole output.  I have changed
it to drop the buffering altogether, that's much better code and more usable:

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 90d0b62523..a74f4f9488 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -32,7 +32,7 @@
  import sys
  import time
  from typing import (Any, Callable, Dict, Iterable,
-                    List, Optional, Sequence, Tuple, TypeVar)
+                    List, Optional, Sequence, Tuple, Type, TypeVar)
  import unittest
  
  from contextlib import contextmanager
@@ -1271,37 +1271,49 @@ def func_wrapper(*args, **kwargs):
              return func(*args, **kwargs)
      return func_wrapper
  
+# We need to filter out the time taken from the output so that
+# qemu-iotest can reliably diff the results against master output,
+# and hide skipped tests from the reference output.
+
+class ReproducibleTestResult(unittest.TextTestResult):
+    def addSkip(self, test, reason):
+        # Same as TextTestResult, but print dot instead of "s"
+        unittest.TestResult.addSkip(self, test, reason)
+        if self.showAll:
+            self.stream.writeln("skipped {0!r}".format(reason))
+        elif self.dots:
+            self.stream.write(".")
+            self.stream.flush()
+
+class ReproducibleStreamWrapper(object):
+    def __init__(self, stream):
+        self.stream = stream
+
+    def __getattr__(self, attr):
+        if attr in ('stream', '__getstate__'):
+            raise AttributeError(attr)
+        return getattr(self.stream,attr)
+
+    def write(self, arg=None):
+        arg = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', arg)
+        arg = re.sub(r' \(skipped=\d+\)', r'', arg)
+        self.stream.write(arg)
+
+class ReproducibleTestRunner(unittest.TextTestRunner):
+    def __init__(self, stream: Optional[io.TextIOBase] = None,
+                 resultclass: Type = ReproducibleTestResult, *args, **kwargs):
+        rstream = ReproducibleStreamWrapper(stream or sys.stdout)
+        super().__init__(stream=rstream,           # type: ignore
+                         descriptions=True,
+                         resultclass=resultclass,
+                         *args, **kwargs)
+
  def execute_unittest(debug=False):
      """Executes unittests within the calling module."""
  
      verbosity = 2 if debug else 1
-
-    if debug:
-        output = sys.stdout
-    else:
-        # We need to filter out the time taken from the output so that
-        # qemu-iotest can reliably diff the results against master output.
-        output = io.StringIO()
-
-    runner = unittest.TextTestRunner(stream=output, descriptions=True,
-                                     verbosity=verbosity)
-    try:
-        # unittest.main() will use sys.exit(); so expect a SystemExit
-        # exception
-        unittest.main(testRunner=runner)
-    finally:
-        # We need to filter out the time taken from the output so that
-        # qemu-iotest can reliably diff the results against master output.
-        if not debug:
-            out = output.getvalue()
-            out = re.sub(r'Ran (\d+) tests? in [\d.]+s', r'Ran \1 tests', out)
-
-            # Hide skipped tests from the reference output
-            out = re.sub(r'OK \(skipped=\d+\)', 'OK', out)
-            out_first_line, out_rest = out.split('\n', 1)
-            out = out_first_line.replace('s', '.') + '\n' + out_rest
-
-            sys.stderr.write(out)
+    runner = unittest.ReproducibleTestRunner(verbosity=verbosity)
+    unittest.main(testRunner=ReproducibleTestRunner)
  
  def execute_setup_common(supported_fmts: Sequence[str] = (),
                           supported_platforms: Sequence[str] = (),


