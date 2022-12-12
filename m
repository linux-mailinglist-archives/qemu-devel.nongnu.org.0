Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EDE649BC9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4foM-0004Me-SR; Mon, 12 Dec 2022 05:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p4foK-0004KI-W3; Mon, 12 Dec 2022 05:13:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p4foJ-0006LZ-Ha; Mon, 12 Dec 2022 05:13:24 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCA5ZTU013855; Mon, 12 Dec 2022 10:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=B7kHVGakzrwD5e6BuKSq+fumcEhPStGBdHn9Z8OBnIY=;
 b=lgw6ktL45CeE9WrLHlNiJxzxiY95MzAJXd9tje5/RUGQhar6OGYy6hk4MfuCQRZQGMKi
 BwgkusZGZ+sHLYpINOtooCxOm+dxhpAQLb/5Gjk4aQlkJWpkF+SlPAsleokB3noap6gO
 vSjjtvYhS3KYBhylOeMZkjNu/r4R4kEI0HUwJfSKgqRt7nZdKS4wk0kGyzkYs3QGDIEx
 HMzT9TJSr3hPUinxiXND3pfDDFIOBTOMnlMkU5GFCseOSdG0SpIS7mtxArK4uKgYGTIk
 VdjZyvA9vmeC1Ht8vbOj0B3zTUSfu06izBEKOtYmDY1fhSDZHnrcb9IiDdtXUutWNYT3 Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3y7d5k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 10:13:19 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BC9t8mV007177;
 Mon, 12 Dec 2022 10:13:19 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3y7d5jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 10:13:19 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BBNUpMa028342;
 Mon, 12 Dec 2022 10:13:17 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3mchr62ehg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 10:13:17 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCADE3U21561980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 10:13:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 983B72006E;
 Mon, 12 Dec 2022 10:13:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F00CE2006A;
 Mon, 12 Dec 2022 10:13:13 +0000 (GMT)
Received: from [9.179.6.2] (unknown [9.179.6.2])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 10:13:13 +0000 (GMT)
Message-ID: <3701fed1-b57a-185b-d848-65605cb09ddb@linux.ibm.com>
Date: Mon, 12 Dec 2022 11:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/1] qemu-iotests/stream-under-throttle: do not shutdown
 QEMU
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: qemu-devel <qemu-devel@nongnu.org>, hreitz@redhat.com
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, kwolf@redhat.com,
 qemu-block@nongnu.org
References: <20221207131452.8455-1-borntraeger@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20221207131452.8455-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LvIQDKR8PQE1XmMewmBFJlJINYFyITnq
X-Proofpoint-ORIG-GUID: z_AuDU99y7n5ffCrSPwgRidPpNe5FIQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=960 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212120093
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



Am 07.12.22 um 14:14 schrieb Christian Borntraeger:
> Without a kernel or boot disk a QEMU on s390 will exit (usually with a
> disabled wait state). This breaks the stream-under-throttle test case.
> Do not exit qemu if on s390.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>   tests/qemu-iotests/tests/stream-under-throttle | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qemu-iotests/tests/stream-under-throttle b/tests/qemu-iotests/tests/stream-under-throttle
> index 8d2d9e16840d..c24dfbcaa2f2 100755
> --- a/tests/qemu-iotests/tests/stream-under-throttle
> +++ b/tests/qemu-iotests/tests/stream-under-throttle
> @@ -88,6 +88,8 @@ class TestStreamWithThrottle(iotests.QMPTestCase):
>                              'x-iops-total=10000,x-bps-total=104857600')
>           self.vm.add_blockdev(self.vm.qmp_to_opts(blockdev))
>           self.vm.add_device('virtio-blk,iothread=iothr0,drive=throttled-node')
> +        if iotests.qemu_default_machine == 's390-ccw-virtio':
> +            self.vm.add_args('-no-shutdown')
>           self.vm.launch()
>   
>       def tearDown(self) -> None:


ping. I guess, this will come after the release?

