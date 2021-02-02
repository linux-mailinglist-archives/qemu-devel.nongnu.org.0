Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8ED30C56D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:23:42 +0100 (CET)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ySm-0006Q7-Dp
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6yIu-0000uo-R5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:13:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6yIr-0001um-A9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612282399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0UFc6mAow30NK+sWC0UDbAcFYr7kPYJVqYzhkSxA2Q=;
 b=IxcRsZrhjEOOmAGg4at3DOZnLUdUHeiDEcgtPy7LCcfQvvRGFX3aRphyagkv7VHtX99urX
 jAllvbpZrpYsYvNvmZpTHM5clB1w7EO0DRLBcxyYl847iaPa2Qb4I1azdppzkbmIUMLN63
 SF+kix38PcnRVOcD4C6r5YBJ+5ZFBUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402--E3xKUWiMWmQA_RvpfqTsg-1; Tue, 02 Feb 2021 11:13:15 -0500
X-MC-Unique: -E3xKUWiMWmQA_RvpfqTsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FB8F193578E;
 Tue,  2 Feb 2021 16:13:14 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 786C419813;
 Tue,  2 Feb 2021 16:13:10 +0000 (UTC)
Subject: iotest failures in head [was: [PATCH v4 00/16] 64bit block-layer:
 part I]
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com>
Date: Tue, 2 Feb 2021 10:13:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 8:56 PM, Eric Blake wrote:

> I had planned to send a pull request for this series today, but ran into
> a snag.  Without this series applied, './check -qcow2' fails 030, 185,
> and 297.

297 appears to be fixed once Kevin's pull request lands (well, that may
be needing a v2).  185 appears to be just a whitespace difference that
missed fixing in 362ef77f9 and similar:

--- /home/eblake/qemu/tests/qemu-iotests/185.out
+++ 185.out.bad
@@ -89,7 +89,7 @@
                       'format': 'IMGFMT',
                       'sync': 'full',
                       'speed': 65536,
-                      'x-perf': { 'max-chunk': 65536 } } }
+                      'x-perf': {'max-chunk': 65536} } }

030 is a bit tougher to figure out.

030   fail       [09:40:32] [09:40:48]   16.9s  (last: 15.4s) failed,
exit status 1
--- /home/eblake/qemu/tests/qemu-iotests/030.out
+++ 030.out.bad
@@ -1,5 +1,45 @@
-...........................
+WARNING:qemu.machine:qemu received signal 11; command:
"/home/eblake/qemu/build/tests/qemu-iotests/../../qemu-system-x86_64
-display none -vga none -chardev
socket,id=mon,path=/tmp/tmpedy9c_uf/qemu-421866-monitor.sock -mon
chardev=mon,mode=control -qtest
unix:path=/tmp/tmpedy9c_uf/qemu-421866-qtest.sock -accel qtest
-nodefaults -display none -accel qtest -drive
if=virtio,id=drive0,file=/home/eblake/qemu/build/tests/qemu-iotests/scratch/img-8.img,format=qcow2,cache=writeback,aio=threads,backing.backing.backing.backing.backing.backing.backing.backing.node-name=node0,backing.backing.backing.backing.backing.backing.backing.node-name=node1,backing.backing.backing.backing.backing.backing.node-name=node2,backing.backing.backing.backing.backing.node-name=node3,backing.backing.backing.backing.node-name=node4,backing.backing.backing.node-name=node5,backing.backing.node-name=node6,backing.node-name=node7,node-name=node8"
+.............EE.............
+======================================================================
+ERROR: test_stream_parallel (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/eblake/qemu/tests/qemu-iotests/030", line 260, in
test_stream_parallel
+    for event in self.vm.get_qmp_events(wait=True):
+  File
"/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/machine.py",
line 585, in get_qmp_events
+    events = self._qmp.get_events(wait=wait)
+  File "/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/qmp.py",
line 328, in get_events
+    self.__get_events(wait)
+  File "/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/qmp.py",
line 197, in __get_events
+    raise QMPConnectError("Error while reading from socket")
+qemu.qmp.QMPConnectError: Error while reading from socket
+
+======================================================================
+ERROR: test_stream_parallel (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File
"/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/machine.py",
line 477, in _do_shutdown
+    self._soft_shutdown(timeout, has_quit)
+  File
"/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/machine.py",
line 457, in _soft_shutdown
+    self._qmp.cmd('quit')
+  File "/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/qmp.py",
line 256, in cmd_obj
+    self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
+BrokenPipeError: [Errno 32] Broken pipe
+
+The above exception was the direct cause of the following exception:
+
+Traceback (most recent call last):
+  File "/home/eblake/qemu/tests/qemu-iotests/030", line 227, in tearDown
+    self.vm.shutdown()
+  File
"/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/machine.py",
line 507, in shutdown
+    self._do_shutdown(timeout, has_quit)
+  File
"/home/eblake/qemu/tests/qemu-iotests/../../python/qemu/machine.py",
line 480, in _do_shutdown
+    raise AbnormalShutdown("Could not perform graceful shutdown") \
+qemu.machine.AbnormalShutdown: Could not perform graceful shutdown
+
 ----------------------------------------------------------------------
 Ran 27 tests

-OK
+FAILED (errors=2)


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


