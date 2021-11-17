Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B796C454F64
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 22:35:04 +0100 (CET)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnSa7-0003Io-Eo
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 16:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnSYN-0002Ph-Gg
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 16:33:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnSYJ-00067L-RW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 16:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637184790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDCUn0MJ0j9U6KydDlMY7AWqQC+DK0ZZltVM0XMReLo=;
 b=GsBIVErn873gBqllyDieEwN9MoCCtYmyJ7tfkP84vNjfgiTbAY/JjdtWnC1rJK2fyc5CXM
 iNeRUAtR/oDEdlyL8g+gM3xXZItpoQmmjU+yJ4ziYzLsTvHUFEvbEVQRFTtK7lLaqq8EaK
 ykr08N4OIv5B650vq/fRM4dIZIqG33Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-24-VX5D_q94PVKNWBv7BQ-dTA-1; Wed, 17 Nov 2021 16:33:04 -0500
X-MC-Unique: VX5D_q94PVKNWBv7BQ-dTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B87EB87D542;
 Wed, 17 Nov 2021 21:33:03 +0000 (UTC)
Received: from [10.39.195.37] (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43E4560657;
 Wed, 17 Nov 2021 21:32:52 +0000 (UTC)
Message-ID: <527e8991-60e8-75cb-ba2e-2dffc0191be1@redhat.com>
Date: Wed, 17 Nov 2021 22:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Failing QEMU iotests
To: John Snow <jsnow@redhat.com>
References: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
 <CAFn=p-akTO0Q3jct_PHYyc=yH6q1XwRWwv3EYBc49yKqT9YCeg@mail.gmail.com>
 <f9015aa2-e513-b760-6579-5457fff0e969@redhat.com>
 <CAFn=p-YSYuQeMhiipjSFmWEuCTS3hbAwHg0SK87jfx7qLZoXdg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFn=p-YSYuQeMhiipjSFmWEuCTS3hbAwHg0SK87jfx7qLZoXdg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2021 20.59, John Snow wrote:
> 
> 
> On Wed, Nov 17, 2021 at 2:45 PM Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> wrote:
> 
>     On 17/11/2021 19.13, John Snow wrote:
>      >
>      >
>      > On Wed, Nov 17, 2021 at 5:07 AM Thomas Huth <thuth@redhat.com
>     <mailto:thuth@redhat.com>
>      > <mailto:thuth@redhat.com <mailto:thuth@redhat.com>>> wrote:
>      >
>      >
>      >        Hi!
>      >
>      >     I think it has been working fine for me a couple of weeks ago,
>      >     but when I now run:
>      >
>      >        make check SPEED=slow
>      >
>      >     I'm getting a couple of failing iotests... not sure whether
>      >     these are known issues already, so I thought I'd summarize them
>      >     here:
>      >
>      >     *** First one is 045 in raw mode: ***
>      >
>      >        TEST   iotest-raw: 045 [fail]
>      >     QEMU          --
>      >   
>       "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-system-x86_64"
>      >     -nodefaults -display none -accel qtest
>      >     QEMU_IMG      --
>      >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-img"
>      >     QEMU_IO       --
>      >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-io" --cache
>      >     writeback --aio threads -f raw
>      >     QEMU_NBD      --
>      >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-nbd"
>      >     IMGFMT        -- raw
>      >     IMGPROTO      -- file
>      >     PLATFORM      -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x86_64
>      >     TEST_DIR      --
>     /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch
>      >     SOCK_DIR      -- /tmp/tmphlexdrlt
>      >     GDB_OPTIONS   --
>      >     VALGRIND_QEMU --
>      >     PRINT_QEMU_OUTPUT --
>      >
>      >     --- /home/thuth/devel/qemu/tests/qemu-iotests/045.out
>      >     +++ 045.out.bad
>      >     @@ -1,5 +1,77 @@
>      >     -...........
>      >     +......EE.EE <http://EE.EE> <http://EE.EE <http://EE.EE>>
>      >   
>       +======================================================================
>      >     +ERROR: test_add_fd (__main__.TestSCMFd)
>      >   
>       +----------------------------------------------------------------------
>      >     +Traceback (most recent call last):
>      >     +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 148, in
>      >     test_add_fd
>      >     +    self._send_fd_by_SCM()
>      >     +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in
>      >     _send_fd_by_SCM
>      >     +    ret = self.vm.send_fd_scm(file_path=image0)
>      >     +  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line
>      >     229, in send_fd_scm
>      >     +    self._qmp.send_fd_scm(fd)
>      >     +  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line
>     138,
>      >     in send_fd_scm
>      >     +    self._aqmp.send_fd_scm(fd)
>      >     +  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py",
>     line 149,
>      >     in _wrapper
>      >     +    return func(proto, *args, **kwargs)
>      >     +  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line
>      >     644, in send_fd_scm
>      >     +    sock = sock._sock  # pylint: disable=protected-access
>      >     +AttributeError: 'socket' object has no attribute '_sock'
>      >
>      >
>      > Well, that's not good.
>      >
>      > Can you tell me some details about what system produced this failure?
>      > The python version used to run the test would be good, as well as distro
>      > release, kernel version, etc.
>      >
>      > If you can reproduce it, I might want to give you a test branch of the
>      > python code to produce some extra debugging information to help me
>      > understand what's gone wrong here. Get in touch on IRC when you have
>     some
>      > spare time if you'd like to interactively debug it.
> 
>     As you likely saw in Hanna's mail a little bit later, the problem was the
>     old version of pylint. I did still have version 2.2 installed - after
>     upgrading, the problem went away.
> 
> 
> upgrading pylint made *this* problem in *045* go away and not just the 
> failure in *297*, are you positive?

Ah, no, of course not, I just mixed them up :-/

(For the records, as already discussed on IRC: It's Python 2.6.8 from RHEL8 
where the problem occurred)

  Thomas


