Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6062BB95
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 12:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovGWV-0000hf-8i; Wed, 16 Nov 2022 06:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ovGWS-0000h9-K2; Wed, 16 Nov 2022 06:24:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ovGWQ-0000DR-UB; Wed, 16 Nov 2022 06:24:04 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGAW0uE017420; Wed, 16 Nov 2022 11:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=T5M+15OKwUm+9cbGfSZ5nRj9c/N1k87ckHXYxc7tRIY=;
 b=WD0g4nnibtQIZs8XD+VDOX0mLzptefic9hcvMeqlQQpyfxzeW0wN0P0Qpk4nBbZjPOaE
 TtyIZGyJCSgbQsjwimLfKkPcgl3eB5beECLrPTA247YenZZ6BBpHNtmfJCAXE6/EYE+c
 UvwhZGJ5hIxd1RU5WZA6nUlFoont/fltyEWYXXFwxr50hKxPghgZlZvx0s643uImdoER
 sbbceYcj/5AN7ilQ81ERu+zgEdzVy1ymfJUCbF4bEKuJHD3Wv31FlgiaK9D0Njow3kPI
 1zAkPcY/c1s7iH4L1yAjt6XyOB4+P/KaNFcmbLUm4ePCCG43xDa7wew46uaX3e6atFgL yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvx6q1eqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 11:23:53 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGAtTQc003210;
 Wed, 16 Nov 2022 11:23:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvx6q1eqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 11:23:53 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGBKjPE016572;
 Wed, 16 Nov 2022 11:23:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjdtn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 11:23:51 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AGBORur35782992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Nov 2022 11:24:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B9B05204F;
 Wed, 16 Nov 2022 11:23:48 +0000 (GMT)
Received: from [9.152.222.245] (unknown [9.152.222.245])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8D76A5204E;
 Wed, 16 Nov 2022 11:23:47 +0000 (GMT)
Message-ID: <df78c89f-fb3a-2777-fd5c-c3fdbd84317c@linux.ibm.com>
Date: Wed, 16 Nov 2022 12:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v11 08/11] s390x/cpu topology: add topology_capable QEMU
 capability
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
 <20221103170150.20789-9-pmorel@linux.ibm.com>
 <2dbe5902-7391-1151-dd0d-266c866cf7b9@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <2dbe5902-7391-1151-dd0d-266c866cf7b9@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yRZg8ScxlALbgG-Bi7MZ-t-IXndNiljc
X-Proofpoint-ORIG-GUID: giEnMnoiOGsJFM5KCiAG5owTpZSJCXYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_02,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=938 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 11/15/22 14:27, Cédric Le Goater wrote:
> On 11/3/22 18:01, Pierre Morel wrote:
>> S390 CPU topology is only allowed for s390-virtio-ccw-7.2 and
>> newer S390 machines.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks,
> 
> C.

Thanks,

Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

