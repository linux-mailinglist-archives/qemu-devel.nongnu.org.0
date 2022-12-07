Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F6645C10
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 15:08:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2v4x-0005l2-GV; Wed, 07 Dec 2022 09:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p2v4v-0005kO-5w; Wed, 07 Dec 2022 09:07:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p2v4t-0002o5-9V; Wed, 07 Dec 2022 09:07:16 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7DBurZ030553; Wed, 7 Dec 2022 14:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+lA56HIAZILyId+dpIpeaxeSlsNK5+o81dq7PNTW4OY=;
 b=atmcyHiW8J6Da1RcYWvuQv/XBo3pw+sjEmVdqtodbTagMVDyi31yBDq/+HVKUziX41k4
 kUToahEfHSpDPAdxuPp2sDKDd3gOJqVNMfVaiEV6FMglzqOl+QurGALiCPKJHN09VFsQ
 EoCm3ei94+ELBMVRkMH7b67vaLB01km7kaRhnhfzjLWoowMSnUw104x0ORlbQqZT0juv
 r5C8/ziPxS+uktAP2cpzzePdlPtaG7Ae6RP1PerEP+R3zh84fMLBNYezrADzf00MGcYx
 +AjX4t/tWVYgJADCpXt47mWDSgOPmfgfLYmys048EvNhHkf+KvlxJDsKflwu0qMwLT83 uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3maugk1g2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 14:07:11 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B7DoIFB010878;
 Wed, 7 Dec 2022 14:07:10 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3maugk1g05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 14:07:10 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B78fO9C016442;
 Wed, 7 Dec 2022 14:07:06 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3m9m6y27xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 14:07:05 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B7E737d19661120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Dec 2022 14:07:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 619392004D;
 Wed,  7 Dec 2022 14:07:03 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1FA920049;
 Wed,  7 Dec 2022 14:07:02 +0000 (GMT)
Received: from [9.179.1.254] (unknown [9.179.1.254])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  7 Dec 2022 14:07:02 +0000 (GMT)
Message-ID: <1e54a59d-caab-ad2c-fd3e-20348e650873@linux.ibm.com>
Date: Wed, 7 Dec 2022 15:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/1] qemu-iotests/stream-under-throttle: do not shutdown
 QEMU
To: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 hreitz@redhat.com
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, kwolf@redhat.com,
 qemu-block@nongnu.org
References: <20221207131452.8455-1-borntraeger@linux.ibm.com>
 <aeee1b23-e273-1baa-c1a5-2131736b9c5f@redhat.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <aeee1b23-e273-1baa-c1a5-2131736b9c5f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: koH7w90Ov0rJnguCzbeTotX_leeKUpq1
X-Proofpoint-ORIG-GUID: nByTJxlCoo6YuK5wQnkf7BlmWbAkvlSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_05,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=851 malwarescore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070122
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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



Am 07.12.22 um 14:23 schrieb Thomas Huth:
> On 07/12/2022 14.14, Christian Borntraeger wrote:
>> Without a kernel or boot disk a QEMU on s390 will exit (usually with a
>> disabled wait state). This breaks the stream-under-throttle test case.
>> Do not exit qemu if on s390.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
>> ---
>>   tests/qemu-iotests/tests/stream-under-throttle | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/tests/stream-under-throttle b/tests/qemu-iotests/tests/stream-under-throttle
>> index 8d2d9e16840d..c24dfbcaa2f2 100755
>> --- a/tests/qemu-iotests/tests/stream-under-throttle
>> +++ b/tests/qemu-iotests/tests/stream-under-throttle
>> @@ -88,6 +88,8 @@ class TestStreamWithThrottle(iotests.QMPTestCase):
>>                              'x-iops-total=10000,x-bps-total=104857600')
>>           self.vm.add_blockdev(self.vm.qmp_to_opts(blockdev))
>>           self.vm.add_device('virtio-blk,iothread=iothr0,drive=throttled-node')
>> +        if iotests.qemu_default_machine == 's390-ccw-virtio':
>> +            self.vm.add_args('-no-shutdown')
>>           self.vm.launch()
> 
> I guess you could even add that unconditionally for all architectures?

maybe. It might even fix other architecture with the same problem. But I dont know if thats the case.
So we can start with this fix and then remove the if at a later point in time if necessary/useful.

> Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

