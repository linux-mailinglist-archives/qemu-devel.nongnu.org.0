Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3D454552
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 12:02:54 +0100 (CET)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIiL-0003Ur-Ih
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 06:02:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnIfB-0001DN-7P
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnIf6-0005aA-5I
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637146771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrEC70xCT9t/G3RYjcZRs0iEg+ZNjyGOc82QIYFXMpw=;
 b=RWW5iuFaxXqBtcPlBWVcTBQUbxLyjy9B2PRk6kPjTg2iatK2sMUxNcPsdEaPfVApgav8PS
 rPgU1ABfQaRZowqcgEzznu2WRwhnZWb7l36QOOCv8QpFFT/6FNHuLnawKHCG+FhoLpAXvI
 HSYQwi7b5B9OwNA1vSJzEQD/Lr7yBAA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-_JBK-ta1Ny2fklXHx9oQuw-1; Wed, 17 Nov 2021 05:59:25 -0500
X-MC-Unique: _JBK-ta1Ny2fklXHx9oQuw-1
Received: by mail-wm1-f71.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so901653wmg.9
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 02:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IrEC70xCT9t/G3RYjcZRs0iEg+ZNjyGOc82QIYFXMpw=;
 b=6wWYwx1hdVS1NYT+eCmvVbYDG95VTyi+bTBwtqcPHHp6POdHm0UPaWm7nPeC8VvMiN
 mQavXq9bCGWvRuNBhKJAdy09FTxaXRGp7D0VvAE3wHflxmGYpaX3wmYvBoAmmz9Mzo4x
 SNJ6DlmL92BudJhorVESmTrnSX6KXNOgTXY6qC4hWSQgebjpqb6I1XkzYu2tCSq7qdsI
 w6GSDHZqKJG48JrFrDIb/aEMfdSL0TmMm/OCg0peVLoh4ensSNGYtyrlPonc3DVQlc+2
 HwrpMS1Yn0ICeUuKVuhflkAGeJEIKSRwjrGfXE/UZfYSEW0eWIUkixwX42H0xxkH0xzm
 SBGQ==
X-Gm-Message-State: AOAM5309jq2RiThgtaaeljsgREoNj2lSZJurmuCUvEbndJ22E44G1S0Z
 a8k0tdBWPCXQQe8nxl3GlQj6qK8UQ3/Kb8icmGp2CwQICQSfoKXJAVJxEoUMn3dnH9d2xqDp832
 EkQqUkoW66UAyqAk=
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr17864363wrm.259.1637146763864; 
 Wed, 17 Nov 2021 02:59:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlVZPOm6BzovpgJNdkoPEmviQim+NIFZPm9Sl+VLZv3JqWgrt2GPbrNfMY0YY4D/yklbI72g==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr17864291wrm.259.1637146763350; 
 Wed, 17 Nov 2021 02:59:23 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id h27sm5449694wmc.43.2021.11.17.02.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 02:59:23 -0800 (PST)
Message-ID: <fabb0f91-48d4-47f7-562e-395f0acf4b81@redhat.com>
Date: Wed, 17 Nov 2021 11:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Failing QEMU iotests
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
References: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.11.21 11:07, Thomas Huth wrote:
>
>  Hi!
>
> I think it has been working fine for me a couple of weeks ago,
> but when I now run:
>
>  make check SPEED=slow
>
> I'm getting a couple of failing iotests... not sure whether
> these are known issues already, so I thought I'd summarize them
> here:

Thanks!

> *** First one is 045 in raw mode: ***
>
>  TEST   iotest-raw: 045 [fail]
> QEMU          -- 
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-system-x86_64" 
> -nodefaults -display none -accel qtest
> QEMU_IMG      -- 
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       -- 
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-io" --cache 
> writeback --aio threads -f raw
> QEMU_NBD      -- 
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- raw
> IMGPROTO      -- file
> PLATFORM      -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x86_64
> TEST_DIR      -- /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmphlexdrlt
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
>
> --- /home/thuth/devel/qemu/tests/qemu-iotests/045.out
> +++ 045.out.bad
> @@ -1,5 +1,77 @@
> -...........
> +......EE.EE
> +======================================================================
> +ERROR: test_add_fd (__main__.TestSCMFd)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 148, in 
> test_add_fd
> +    self._send_fd_by_SCM()
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in 
> _send_fd_by_SCM
> +    ret = self.vm.send_fd_scm(file_path=image0)
> +  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 
> 229, in send_fd_scm
> +    self._qmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, 
> in send_fd_scm
> +    self._aqmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 
> 149, in _wrapper
> +    return func(proto, *args, **kwargs)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 
> 644, in send_fd_scm
> +    sock = sock._sock  # pylint: disable=protected-access
> +AttributeError: 'socket' object has no attribute '_sock'
> +
> +======================================================================
> +ERROR: test_closefd (__main__.TestSCMFd)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 165, in 
> test_closefd
> +    self._send_fd_by_SCM()
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in 
> _send_fd_by_SCM
> +    ret = self.vm.send_fd_scm(file_path=image0)
> +  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 
> 229, in send_fd_scm
> +    self._qmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, 
> in send_fd_scm
> +    self._aqmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 
> 149, in _wrapper
> +    return func(proto, *args, **kwargs)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 
> 644, in send_fd_scm
> +    sock = sock._sock  # pylint: disable=protected-access
> +AttributeError: 'socket' object has no attribute '_sock'
> +
> +======================================================================
> +ERROR: test_getfd (__main__.TestSCMFd)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 153, in 
> test_getfd
> +    self._send_fd_by_SCM()
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in 
> _send_fd_by_SCM
> +    ret = self.vm.send_fd_scm(file_path=image0)
> +  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 
> 229, in send_fd_scm
> +    self._qmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, 
> in send_fd_scm
> +    self._aqmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 
> 149, in _wrapper
> +    return func(proto, *args, **kwargs)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 
> 644, in send_fd_scm
> +    sock = sock._sock  # pylint: disable=protected-access
> +AttributeError: 'socket' object has no attribute '_sock'
> +
> +======================================================================
> +ERROR: test_getfd_invalid_fdname (__main__.TestSCMFd)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 158, in 
> test_getfd_invalid_fdname
> +    self._send_fd_by_SCM()
> +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in 
> _send_fd_by_SCM
> +    ret = self.vm.send_fd_scm(file_path=image0)
> +  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 
> 229, in send_fd_scm
> +    self._qmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, 
> in send_fd_scm
> +    self._aqmp.send_fd_scm(fd)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 
> 149, in _wrapper
> +    return func(proto, *args, **kwargs)
> +  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 
> 644, in send_fd_scm
> +    sock = sock._sock  # pylint: disable=protected-access
> +AttributeError: 'socket' object has no attribute '_sock'
> +
>  ----------------------------------------------------------------------
>  Ran 11 tests
>
> -OK
> +FAILED (errors=4)

Sounds like something for John. O:)

>
> *** Second failure is in 206 in qcow2 mode: ***
>
>   TEST   iotest-qcow2: 206 [fail]
> QEMU          -- 
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-system-x86_64" 
> -nodefaults -display none -accel qtest
> QEMU_IMG      -- 
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       -- 
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-io" --cache 
> writeback --aio threads -f qcow2
> QEMU_NBD      -- 
> "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x86_64
> TEST_DIR      -- /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmpqg73ug_s
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
>
> --- /home/thuth/devel/qemu/tests/qemu-iotests/206.out
> +++ 206.out.bad
> @@ -99,55 +99,19 @@
>
>  {"execute": "blockdev-create", "arguments": {"job-id": "job0", 
> "options": {"driver": "qcow2", "encrypt": {"cipher-alg": 
> "twofish-128", "cipher-mode": "ctr", "format": "luks", "hash-alg": 
> "sha1", "iter-time": 10, "ivgen-alg": "plain64", "ivgen-hash-alg": 
> "md5", "key-secret": "keysec0"}, "file": {"driver": "file", 
> "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
>  {"return": {}}
> +Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
>  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
>  {"return": {}}
>
>  image: TEST_IMG
>  file format: IMGFMT
>  virtual size: 32 MiB (33554432 bytes)
> -encrypted: yes
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
>      compression type: zlib
>      lazy refcounts: false
>      refcount bits: 16
> -    encrypt:
> -        ivgen alg: plain64
> -        hash alg: sha1
> -        cipher alg: twofish-128
> -        uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
> -        format: luks
> -        cipher mode: ctr
> -        slots:
> -            [0]:
> -                active: true
> -                iters: XXX
> -                key offset: 4096
> -                stripes: 4000
> -            [1]:
> -                active: false
> -                key offset: 69632
> -            [2]:
> -                active: false
> -                key offset: 135168
> -            [3]:
> -                active: false
> -                key offset: 200704
> -            [4]:
> -                active: false
> -                key offset: 266240
> -            [5]:
> -                active: false
> -                key offset: 331776
> -            [6]:
> -                active: false
> -                key offset: 397312
> -            [7]:
> -                active: false
> -                key offset: 462848
> -        payload offset: 528384
> -        master key iters: XXX
>      corrupt: false
>      extended l2: false

I doubt this worked a couple of weeks ago, but it’s definitely one that 
we should just get around to fixing. :/

>
> *** Third one is in 297, both raw and qcow2 mode: ***
>
> --- /home/thuth/devel/qemu/tests/qemu-iotests/297.out
> +++ 297.out.bad
> @@ -1,2 +1,21 @@
>  === pylint ===
> +************* Module image-fleecing
> +tests/image-fleecing:34:24: C0326: Exactly one space required after 
> comma
> +patterns = [('0x5d', '0',         '64k'),
> +                        ^ (bad-whitespace)
> +tests/image-fleecing:35:25: C0326: Exactly one space required after 
> comma
> +            ('0xd5', '1M',        '64k'),
> +                         ^ (bad-whitespace)
> +tests/image-fleecing:36:26: C0326: Exactly one space required after 
> comma
> +            ('0xdc', '32M',       '64k'),
> +                          ^ (bad-whitespace)
> +tests/image-fleecing:39:25: C0326: Exactly one space required after 
> comma
> +overwrite = [('0xab', '0',         '64k'), # Full overwrite
> +                         ^ (bad-whitespace)
> +tests/image-fleecing:48:32: C0326: Exactly one space required after 
> comma
> +remainder = [('0xd5', '0x108000',  '32k'), # Right-end of 
> partial-left [1]
> +                                ^ (bad-whitespace)
> +tests/image-fleecing:49:27: C0326: Exactly one space required after 
> comma
> +             ('0xdc', '32M',       '32k'), # Left-end of 
> partial-right [2]
> +                           ^ (bad-whitespace)

This could be because your pylint is too old.  At least for the python/ 
tests we at least require 2.8.0 
(https://lists.nongnu.org/archive/html/qemu-block/2021-10/msg00768.html) 
and bad-whitespace was removed in 2.6.

Hanna


