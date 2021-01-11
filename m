Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0C2F0FB1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:08:49 +0100 (CET)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyu80-0000C5-K3
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kyu6T-0007sl-1t; Mon, 11 Jan 2021 05:07:13 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kyu6R-000159-21; Mon, 11 Jan 2021 05:07:12 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BA2Qn7147954; Mon, 11 Jan 2021 05:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=E3MS8czFYe/3mwAwIxpa2VYBSzm/0iEA9DvDdJcWklk=;
 b=ds+kjwwM/e41IZ4hkRtc1Y5gasJnUHNUIrvF2gdb80q8ZFYOccCpRxy34jwPX6zz8Mg0
 9ikQ3kZN+547A7Ony2DHH8BmhoTRlica6SymnmR2AzpkPyuowUCou6K5LAunEUSs2oy4
 POFHYvqL3u6a4To/oVICUJuGsrN7GW29StrZeG8h5SSkkMWvg96nV1Ns84rJml1ZSVFC
 SLbN00NmJcM6SSJvwfEBP3r5ZDJl8s3u1xMkYkQIvPGeNGMfjM9ZpJVMYZVygJcM1RYS
 jGBXyWGVOFtHdxOvJzybAISzUYvW9xAbayw6ehAIpOZrDT41N6Xzho/I+eIAbl01ND7R eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360mg408tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 05:07:09 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10BA2gR6149235;
 Mon, 11 Jan 2021 05:07:08 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360mg408sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 05:07:08 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BA26Hj031878;
 Mon, 11 Jan 2021 10:07:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 35y448a5e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 10:07:06 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BA74ZU38142376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 10:07:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AB58AE057;
 Mon, 11 Jan 2021 10:07:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A505DAE059;
 Mon, 11 Jan 2021 10:07:03 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.58.41])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 10:07:03 +0000 (GMT)
Subject: Re: [PATCH] vhost-user-fs: add the "bootindex" property
To: Laszlo Ersek <lersek@redhat.com>, qemu devel list <qemu-devel@nongnu.org>
References: <20210104132401.5100-1-lersek@redhat.com>
 <f296274e-3c4b-bb90-ca4a-273c3bd97f7f@de.ibm.com>
 <d9f913fa-9d1b-8d52-d98b-ae558e4406ca@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <656f8775-aeb4-3feb-0373-5f9024c6c7aa@de.ibm.com>
Date: Mon, 11 Jan 2021 11:07:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <d9f913fa-9d1b-8d52-d98b-ae558e4406ca@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-09_13:2021-01-07,
 2021-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=759 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110059
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.012,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11.01.21 11:05, Laszlo Ersek wrote:
> On 01/11/21 10:46, Christian Borntraeger wrote:
>>
>>
>> On 04.01.21 14:24, Laszlo Ersek wrote:
>>> virtio-fs qualifies as a bootable device minimally under OVMF, but
>>> currently the necessary "bootindex" property is missing (fw_cfg kernel
>>> boot notwithstanding).
>>>
>>> Add the property. For completeness, add it to the CCW device as well;
>>> other virtio-ccw devices seem to have "bootindex" properties too.
>>
>> Currently we do not have boot support for virtiofs on s390x (ccw)
>> Not sure if it is better if we should add the property now or whenever
>> boot support is implemented. 
>> As of today we do have bootindex for block and net. Maybe it is better
>> to defer bootindex for virtio-fs-ccw until we can boot from it? In
>> that way management software can detect if this is bootable or not?
> 
> Sure, I can drop the "vhost-user-fs-ccw.c hunk".
> 
> (I guess I could even lift the property itself (replacing the alias) to
> "vhost-user-fs-pci.c", for now -- what's everyone's take on that?)

Keep it as is. This would simplify a later addition to ccw.

