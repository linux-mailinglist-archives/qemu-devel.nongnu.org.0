Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A00A3CCF32
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 10:07:52 +0200 (CEST)
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5OJb-0002Os-69
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 04:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5OHy-0001YW-Oa
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5OHw-00044N-JK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626681966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+/fiK/2XxpxOfLFyigdktqLT3ydpfsJtUKats0Q90SM=;
 b=O4x1+8Zw06zd9OQl6xt/tYSM0PxUshxAfsBWKgHY1zpe5ncj/Pv05cXStIRRnpEj0RQbhz
 7Sz2Zw1XBvO30COY47pklXHyjs24lYYFfeldAaw8Qn/usN5KI6hl27FWLnFLuxl53FaSQR
 cXk1wT8RHcznEPw9aYt1aszxtyKf3GI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-KewqUGY4N7echVTFRdIFOw-1; Mon, 19 Jul 2021 04:06:05 -0400
X-MC-Unique: KewqUGY4N7echVTFRdIFOw-1
Received: by mail-wr1-f72.google.com with SMTP id
 a4-20020a0560001884b02901401e436a18so8453517wri.21
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 01:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=+/fiK/2XxpxOfLFyigdktqLT3ydpfsJtUKats0Q90SM=;
 b=h+QLE5Kz+gjflnoDmvaQaSpeCFC9KAzY/jwk9As3GVQ9VVnnRSEvEn6aGFdS3D4yep
 C9Y/bGPqZoMqU7JRGExW/m03CpTWo3kjMUAnUTRgTfv5igDM52wxtTHRroUPccZvg6lK
 9+ci2GpieBUh9WR+A1aQ/gulMq1THgqPUuVmDkQDmCcxLY/YvSA9M6zHRO0DyjWKpvgi
 voVR8nXUSWyJUKqpkz9P+v7IV/NB+2imNAu2gTKgedQd7SGN61eoTWfatT0ZIkYrhl8M
 mrBgIk6JbDavd1XadlGaLvrOjH0B55yUxiy03LMZhuAgNYsuWj+tuWmbvnZ511HyPAsz
 minQ==
X-Gm-Message-State: AOAM5337gYXniD8NW+/+r+Y0DvBcSLaQ3nY8NvymAgGlQVm6XuPr/XTE
 Mz0H5YdLDJwOpJLWlp2ywrG2ed0NsFjDk/+n4NxDIvsZQVs4bQ3laoDwW8DHEf0gkjsOjBBQJBR
 xciB/86unsxcBVxU=
X-Received: by 2002:a05:6000:1042:: with SMTP id
 c2mr7379976wrx.355.1626681964158; 
 Mon, 19 Jul 2021 01:06:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy5+mjjuEt+WnwYykm/lLJ0z6rHEt+l2dpVN+wZ5tQGTBIR3jS9kNXBULRz7KQWJyLyU+nAA==
X-Received: by 2002:a05:6000:1042:: with SMTP id
 c2mr7379945wrx.355.1626681963802; 
 Mon, 19 Jul 2021 01:06:03 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83073.dip0.t-ipconnect.de.
 [217.232.48.115])
 by smtp.gmail.com with ESMTPSA id g15sm15700247wmh.44.2021.07.19.01.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 01:06:03 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Failing iotest 206
Message-ID: <87d526f8-53bc-c196-6d5c-72b78a49518b@redhat.com>
Date: Mon, 19 Jul 2021 10:06:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

iotest 206 fails for me with:

$ ./check -qcow2 206
QEMU          -- ".../tests/qemu-iotests/../../qemu-system-x86_64" 
-nodefaults -display none -accel qtest
QEMU_IMG      -- ".../tests/qemu-iotests/../../qemu-img"
QEMU_IO       -- ".../tests/qemu-iotests/../../qemu-io" --cache writeback 
--aio threads -f qcow2
QEMU_NBD      -- ".../tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- Linux/x86_64 thuth.remote.csb 4.18.0-305.3.1.el8_4.x86_64
TEST_DIR      -- .../tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmpx4hiqpkd
SOCKET_SCM_HELPER -- .../tests/qemu-iotests/socket_scm_helper

206   fail       [10:00:50] [10:00:54]   3.4s   (last: 6.2s)  output 
mismatch (see 206.out.bad)
--- 206.out
+++ 206.out.bad
@@ -99,55 +99,19 @@

  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": 
{"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", "cipher-mode": 
"ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg": 
"plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file": 
{"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
  {"return": {}}
+Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
  {"return": {}}

  image: TEST_IMG
  file format: IMGFMT
  virtual size: 32 MiB (33554432 bytes)
-encrypted: yes
  cluster_size: 65536
  Format specific information:
      compat: 1.1
      compression type: zlib
      lazy refcounts: false
      refcount bits: 16
-    encrypt:
-        ivgen alg: plain64
-        hash alg: sha1
-        cipher alg: twofish-128
-        uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
-        format: luks
-        cipher mode: ctr
-        slots:
-            [0]:
-                active: true
-                iters: XXX
-                key offset: 4096
-                stripes: 4000
-            [1]:
-                active: false
-                key offset: 69632
-            [2]:
-                active: false
-                key offset: 135168
-            [3]:
-                active: false
-                key offset: 200704
-            [4]:
-                active: false
-                key offset: 266240
-            [5]:
-                active: false
-                key offset: 331776
-            [6]:
-                active: false
-                key offset: 397312
-            [7]:
-                active: false
-                key offset: 462848
-        payload offset: 528384
-        master key iters: XXX
      corrupt: false
      extended l2: false

Looks like it is missing a check for the availability of the corresponding 
crypto stuff? Does anybody got a clue how to fix this?

  Thomas


