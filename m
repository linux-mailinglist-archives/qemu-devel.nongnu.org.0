Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B86F5709
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 13:18:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puAUQ-0006K9-4V; Wed, 03 May 2023 07:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1puAUN-0006Jw-Sf; Wed, 03 May 2023 07:17:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1puAUK-0004F3-1P; Wed, 03 May 2023 07:17:39 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343BDt2i011354; Wed, 3 May 2023 11:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aXkHVa6As4X9f6m9PVmgGyZEIT6rMhNjH2YmPbQ8FJ4=;
 b=ZjxR8BF+F0gSwIXGawDZGc3mxC5jQHY6KEbh/qLVxATo/yJvVkEal56o6eFta7d+GktZ
 ufKfyNvV0KOaLUIvxFHUEulE1mdcPShvmgEpizzoCQ6zxy6Iw2Gfmgg5PrKixCGmwIqT
 jetoROJG/lhPJZr6AGn9aFtXYzsj9aZFtp/hQYi5csRJcBP5WBs+TsNJewpcf6ik7jLr
 1o/Plyak5zbH5VGeplXskpIZdz4dGmNvO2OdkcfxUoyH5+eX5fFXjJIUWtpYu8WHZURC
 ESfAlWzEKsfWHFe4kfRnO6PCccpbclZ/H/IIK9fcP0va3FJfWjvvHZ0FxDUbhywDPiV+ qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbpbr8dbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 11:17:26 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 343BFbT9021008;
 Wed, 3 May 2023 11:17:26 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbpbr8d9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 11:17:25 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34347xTT025994;
 Wed, 3 May 2023 11:17:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3q8tv6st19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 11:17:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 343BHGp722217316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 May 2023 11:17:17 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDA412004D;
 Wed,  3 May 2023 11:17:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20EA420040;
 Wed,  3 May 2023 11:17:16 +0000 (GMT)
Received: from [9.152.222.242] (unknown [9.152.222.242])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  3 May 2023 11:17:16 +0000 (GMT)
Message-ID: <2f45e9ed-6800-f616-be14-5893fbf71f03@linux.ibm.com>
Date: Wed, 3 May 2023 13:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v20 01/21] s390x/cpu topology: add s390 specifics to CPU
 topology
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-2-pmorel@linux.ibm.com>
 <45e09800-6a47-0372-5244-16e2dc72370d@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <45e09800-6a47-0372-5244-16e2dc72370d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CmC2Wn5yGyroiTDrAqH6kjexJcoqhIJ_
X-Proofpoint-ORIG-GUID: nN8ZmyK-16hDxrGUD-9YrsAklBxbCbUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_06,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305030093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 4/27/23 10:04, Thomas Huth wrote:
> On 25/04/2023 18.14, Pierre Morel wrote:
>> S390 adds two new SMP levels, drawers and books to the CPU
>> topology.
>> The S390 CPU have specific topology features like dedication
>> and entitlement to give to the guest indications on the host
>> vCPUs scheduling and help the guest take the best decisions
>> on the scheduling of threads on the vCPUs.
>>
>> Let us provide the SMP properties with books and drawers levels
>> and S390 CPU with dedication and entitlement,
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> ...> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>> index 2e267fa458..42a6a40333 100644
>> --- a/qapi/machine-target.json
>> +++ b/qapi/machine-target.json
>> @@ -342,3 +342,15 @@
>>                      'TARGET_S390X',
>>                      'TARGET_MIPS',
>>                      'TARGET_LOONGARCH64' ] } }
>> +
>> +##
>> +# @CpuS390Polarization:
>> +#
>> +# An enumeration of cpu polarization that can be assumed by a virtual
>> +# S390 CPU
>> +#
>> +# Since: 8.1
>> +##
>> +{ 'enum': 'CpuS390Polarization',
>> +  'prefix': 'S390_CPU_POLARIZATION',
>> +  'data': [ 'horizontal', 'vertical' ] }
>
> It seems like you don't need this here yet ... I think you likely 
> could also introduce it in a later patch instead (patch 11 seems the 
> first one that needs this?)

patch 6 on PTF interception in fact but yes you are right and I will 
shift it there.


>
> Also, would a " 'if': 'TARGET_S390X' " be possible here, too?


yes.

Regards,

Pierre



