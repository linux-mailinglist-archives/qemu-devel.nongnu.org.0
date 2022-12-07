Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311D76457E5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 11:32:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2riK-0007LK-Rg; Wed, 07 Dec 2022 05:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p2riG-0007He-Rx; Wed, 07 Dec 2022 05:31:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p2riD-0004A9-4c; Wed, 07 Dec 2022 05:31:40 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7AUcds019923; Wed, 7 Dec 2022 10:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Vb52U4D06TYM+NDjhxY6gt4ATFyvAtIKi9rgcTwJ8Ls=;
 b=FzD6BnKNNhttKgxjxY3PsOLMSBYB7ED9s++wbWQHW1v/LB2yq3Uy6eygPiFQzYMurIBV
 NFs7DxPJThEYDomYjGhA7i+lTrUKXkF3KL+mowXNX6k8/sM+5+n0dzsOovHW0cTo1AA9
 D0i20st1ePbKAOrCtlrfcyUR034IS7ncNmnJsmASi93mhCpOQ9VOVMw4yMna6080BiEx
 L1n21gDQbNMw8T3D+9dOTjNihqwlgETbEUZmWpdkJxh6q03WnWrOqdaq8kC5Qowb8CvZ
 aQKb/puC/Ltm2BgOOI/YpdErlkopEq6/eUDrVx0TyiwkUZjnAZ7Il6nCD2gkYAkc2SbF ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mas5300dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 10:31:30 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B7AVT7a021625;
 Wed, 7 Dec 2022 10:31:29 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mas5300ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 10:31:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6LRcq5010322;
 Wed, 7 Dec 2022 10:31:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3m9ks42srn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 10:31:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B7AVOpr39125482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Dec 2022 10:31:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CB9E2004B;
 Wed,  7 Dec 2022 10:31:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFA3020040;
 Wed,  7 Dec 2022 10:31:23 +0000 (GMT)
Received: from [9.179.1.254] (unknown [9.179.1.254])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  7 Dec 2022 10:31:23 +0000 (GMT)
Message-ID: <a917bcb9-a430-3754-8752-d4df09bce710@linux.ibm.com>
Date: Wed, 7 Dec 2022 11:31:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] tests/stream-under-throttle: New test
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20221114095226.20917-1-hreitz@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20221114095226.20917-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IxkEqbpuKZnW-CQYBVLBBDWPV7SC37y6
X-Proofpoint-ORIG-GUID: 4DWJWjamq-Q99nJ_MmOLNCOgQ6qnpEUK
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212070089
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 14.11.22 um 10:52 schrieb Hanna Reitz:
> Test streaming a base image into the top image underneath two throttle
> nodes.  This was reported to make qemu 7.1 hang
> (https://gitlab.com/qemu-project/qemu/-/issues/1215), so this serves as
> a regression test.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> Based-on: <20221107151321.211175-1-hreitz@redhat.com>
> 
> v1: https://lists.nongnu.org/archive/html/qemu-block/2022-11/msg00368.html
> 
> v2:
> - Replace `asyncio.exceptions.TimeoutError` by `asyncio.TimeoutError`:
>    Stefan reported that the CI does not recognize the former:
>    https://lists.nongnu.org/archive/html/qemu-block/2022-11/msg00424.html
> 
>    As far as I understand, the latter was basically moved to become the
>    former in Python 3.11, and an alias remains, so both are basically
>    equivalent.  I only have 3.10, though, where the documentation says
>    that both are different, even though using either seems to work fine
>    (i.e. both catch the timeout there).  Not sure about previous
>    versions, but the CI seems pretty certain about not knowing
>    `asyncio.exceptions.TimeoutError`, so use `asyncio.TimeoutError`
>    instead.  (Even though that is deprecated in 3.11, but this is not the
>    first place in the tree to use it, so it should not be too bad.)
> ---
>   .../qemu-iotests/tests/stream-under-throttle  | 121 ++++++++++++++++++
>   .../tests/stream-under-throttle.out           |   5 +
>   2 files changed, 126 insertions(+)
>   create mode 100755 tests/qemu-iotests/tests/stream-under-throttle
>   create mode 100644 tests/qemu-iotests/tests/stream-under-throttle.out

As a heads up, I do get the following on s390. I have not yet looked into that:

+EE
+======================================================================
+ERROR: test_stream (__main__.TestStreamWithThrottle)
+Do a simple stream beneath the two throttle nodes.  Should complete
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "qemu/tests/qemu-iotests/tests/stream-under-throttle", line 110, in test_stream
+    self.vm.run_job('stream')
+  File "qemu/tests/qemu-iotests/iotests.py", line 986, in run_job
+    result = self.qmp('query-jobs')
+  File "qemu/python/qemu/machine/machine.py", line 646, in qmp
+    ret = self._qmp.cmd(cmd, args=qmp_args)
+  File "qemu/python/qemu/qmp/legacy.py", line 204, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "qemu/python/qemu/qmp/legacy.py", line 184, in cmd_obj
+    self._qmp._raw(qmp_cmd, assign_id=False),
+  File "qemu/python/qemu/qmp/protocol.py", line 154, in _wrapper
+    raise StateError(emsg, proto.runstate, required_state)
+qemu.qmp.protocol.StateError: QMPClient is disconnecting. Call disconnect() to return to IDLE state.
+
+======================================================================
+ERROR: test_stream (__main__.TestStreamWithThrottle)
+Do a simple stream beneath the two throttle nodes.  Should complete
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "qemu/python/qemu/machine/machine.py", line 533, in _soft_shutdown
+    self.qmp('quit')
+  File "qemu/python/qemu/machine/machine.py", line 646, in qmp
+    ret = self._qmp.cmd(cmd, args=qmp_args)
+  File "qemu/python/qemu/qmp/legacy.py", line 204, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "qemu/python/qemu/qmp/legacy.py", line 184, in cmd_obj
+    self._qmp._raw(qmp_cmd, assign_id=False),
+  File "qemu/python/qemu/qmp/protocol.py", line 154, in _wrapper
+    raise StateError(emsg, proto.runstate, required_state)
+qemu.qmp.protocol.StateError: QMPClient is disconnecting. Call disconnect() to return to IDLE state.
+
+During handling of the above exception, another exception occurred:
+
+Traceback (most recent call last):
+  File "qemu/python/qemu/machine/machine.py", line 554, in _do_shutdown
+    self._soft_shutdown(timeout)
+  File "qemu/python/qemu/machine/machine.py", line 536, in _soft_shutdown
+    self._close_qmp_connection()
+  File "qemu/python/qemu/machine/machine.py", line 476, in _close_qmp_connection
+    self._qmp.close()
+  File "qemu/python/qemu/qmp/legacy.py", line 277, in close
+    self._sync(
+  File "qemu/python/qemu/qmp/legacy.py", line 94, in _sync
+    return self._aloop.run_until_complete(
+  File "/usr/lib64/python3.10/asyncio/base_events.py", line 649, in run_until_complete
+    return future.result()
+  File "/usr/lib64/python3.10/asyncio/tasks.py", line 408, in wait_for
+    return await fut
+  File "qemu/python/qemu/qmp/protocol.py", line 398, in disconnect
+    await self._wait_disconnect()
+  File "qemu/python/qemu/qmp/protocol.py", line 710, in _wait_disconnect
+    await all_defined_tasks  # Raise Exceptions from the bottom half.
+  File "qemu/python/qemu/qmp/protocol.py", line 861, in _bh_loop_forever
+    await async_fn()
+  File "qemu/python/qemu/qmp/protocol.py", line 899, in _bh_recv_message
+    msg = await self._recv()
+  File "qemu/python/qemu/qmp/protocol.py", line 1000, in _recv
+    message = await self._do_recv()
+  File "qemu/python/qemu/qmp/qmp_client.py", line 402, in _do_recv
+    msg_bytes = await self._readline()
+  File "qemu/python/qemu/qmp/protocol.py", line 968, in _readline
+    raise EOFError
+EOFError
+
+The above exception was the direct cause of the following exception:
+
+Traceback (most recent call last):
+  File "qemu/tests/qemu-iotests/tests/stream-under-throttle", line 94, in tearDown
+    self.vm.shutdown()
+  File "qemu/python/qemu/machine/machine.py", line 583, in shutdown
+    self._do_shutdown(timeout)
+  File "qemu/python/qemu/machine/machine.py", line 557, in _do_shutdown
+    raise AbnormalShutdown("Could not perform graceful shutdown") \
+qemu.machine.machine.AbnormalShutdown: Could not perform graceful shutdown
+
  ----------------------------------------------------------------------
  Ran 1 tests

