Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B73A25EA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 09:55:32 +0200 (CEST)
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFXH-0001Xa-Gc
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 03:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lrFW5-0000Zw-K6; Thu, 10 Jun 2021 03:54:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lrFW3-0002Iz-3b; Thu, 10 Jun 2021 03:54:17 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15A7o55X097280; Thu, 10 Jun 2021 03:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=S+z0Dzu2K+UZwtbJPSdy7/inKaw7aB53A9Tkwif1w5g=;
 b=cPPRNmCcxl4ub7I8MSNzgLDkGnsfmeeDhWZcoW8Y4l49Q4E79bEj6idUCeZKuU1OomfY
 Wdin8ABwISIqlfTSG5JLC6+xTocgR44rTGlT9jI3RWR/LaJhfOAUA8YZy+6TdoKaHBsH
 N+eXgwgKk2d2x3azyHbwy6qystL0YvsPfBLmT5nsZz4ZmDHrWoTUD9DPp0CwNCPOUJo7
 IbhEnOK4RumCBrBFGwE1RVVrCb2u2JUaDy7MMM/P1gqX7lTFJiRHSEktMDo6PXIxMEJY
 0o2JSxYK8XXPQQWI077mSDtycvNgPNXzivYLqMv035Io4/ABruBKjpSiBWY9oHkBrojU Rg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393eps83fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 03:54:09 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15A7pkVt021640;
 Thu, 10 Jun 2021 07:54:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3900hhtn5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 07:54:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15A7rFsS18022738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 07:53:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E5224C05E;
 Thu, 10 Jun 2021 07:54:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33FCF4C058;
 Thu, 10 Jun 2021 07:54:05 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.13.5])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jun 2021 07:54:05 +0000 (GMT)
To: qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: qemu io test: spurious failures of 030
Message-ID: <e40bf8ee-8a20-1251-911e-ceba6f1cee05@de.ibm.com>
Date: Thu, 10 Jun 2021 09:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zBVTi7-rwT9aHzH5bexF3pRsvsrKxIMt
X-Proofpoint-ORIG-GUID: zBVTi7-rwT9aHzH5bexF3pRsvsrKxIMt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_03:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 impostorscore=0 mlxlogscore=952 bulkscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106100048
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Folks,

I have CI on s390 on qemu/master for each commit. And from time to time I do get spurious failures of 030. (always 030 and nothing else).
I have a hard time reproducing this manually so I cannot debug this at the moment. Has anyone seen this as well?


     030                             ...        [09:34:06]              ...                  030                             fail       [09:34:06] [09:34:09]   3.2s                 failed, exit status 1
     --- tests/qemu-iotests/030.out
     +++ 030.out.bad
     @@ -1,5 +1,45 @@
     -...........................
     +.............WARNING:qemu.machine.machine:qemu received signal 11; command: "build/tests/qemu-iotests/../../qemu-system-s390x -display none -vga none -chardev socket,id=mon,path=/tmp/tmpt3vg8hqd/qemu-2816608-monitor.sock -mon chardev=mon,mode=control -qtest unix:path=/tmp/tmpt3vg8hqd/qemu-2816608-qtest.sock -accel qtest -nodefaults -display none -accel qtest -drive if=virtio,id=drive0,file=/tmp/devel-iotests-9771/img-8.img,format=qcow2,cache=writeback,aio=threads,backing.backing.backing.backing.backing.backing.backing.backing.node-name=node0,backing.backing.backing.backing.backing.backing.backing.node-name=node1,backing.backing.backing.backing.backing.backing.node-name=node2,backing.backing.backing.backing.backing.node-name=node3,backing.backing.backing.backing.node-name=node4,backing.backing.backing.node-name=node5,backing.backing.node-name=node6,backing.node-name=node7,node-name=node8"
     +EE.............
     +======================================================================
     +ERROR: test_stream_parallel (__main__.TestParallelOps)
     +----------------------------------------------------------------------
     +Traceback (most recent call last):
     +  File "tests/qemu-iotests/030", line 260, in test_stream_parallel
     +    for event in self.vm.get_qmp_events(wait=True):
     +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 597, in get_qmp_events
     +    events = self._qmp.get_events(wait=wait)
     +  File "tests/qemu-iotests/../../python/qemu/qmp/__init__.py", line 338, in get_events
     +    self.__get_events(wait)
     +  File "tests/qemu-iotests/../../python/qemu/qmp/__init__.py", line 207, in __get_events
     +    raise QMPConnectError("Error while reading from socket")
     +qemu.qmp.QMPConnectError: Error while reading from socket
     +
     +======================================================================
     +ERROR: test_stream_parallel (__main__.TestParallelOps)
     +----------------------------------------------------------------------
     +Traceback (most recent call last):
     +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 489, in _do_shutdown
     +    self._soft_shutdown(timeout, has_quit)
     +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 469, in _soft_shutdown
     +    self._qmp.cmd('quit')
     +  File "tests/qemu-iotests/../../python/qemu/qmp/__init__.py", line 288, in cmd
     +    return self.cmd_obj(qmp_cmd)
     +  File "tests/qemu-iotests/../../python/qemu/qmp/__init__.py", line 266, in cmd_obj
     +    self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
     +BrokenPipeError: [Errno 32] Broken pipe
     +
     +The above exception was the direct cause of the following exception:
     +
     +Traceback (most recent call last):
     +  File "tests/qemu-iotests/030", line 227, in tearDown
     +    self.vm.shutdown()
     +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 519, in shutdown
     +    self._do_shutdown(timeout, has_quit)
     +  File "tests/qemu-iotests/../../python/qemu/machine/machine.py", line 492, in _do_shutdown
     +    raise AbnormalShutdown("Could not perform graceful shutdown") \
     +qemu.machine.machine.AbnormalShutdown: Could not perform graceful shutdown
     +
      ----------------------------------------------------------------------
      Ran 27 tests
     
     -OK
     +FAILED (errors=2)

