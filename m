Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC8E649ADE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:15:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4etQ-0005Cj-FZ; Mon, 12 Dec 2022 04:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4etB-0005Ae-5b; Mon, 12 Dec 2022 04:14:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4et9-0003Uo-7v; Mon, 12 Dec 2022 04:14:20 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BC8aObn011919; Mon, 12 Dec 2022 09:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=V+9NWyHp0YR7Vft4N598qp4U5k4jJ2MbDcKXiy+CeIA=;
 b=rYJzUj+8aRxmZ+vHfSQ3cDD6xUuAKcBRsozmxJTriRFwXseL48I4iYUpCmGo7O4N3nY3
 pWKU7GMVCfea4mnx8ElJ4lYCWDzDXSXZyW2QRu+nb95ZduicBgqAj8oDNdNUnVZ5BU4B
 Gp5ls2OHSl480wCUI7o7Ub64IkQvu0wIysVDXh8gj04i10k79F0wf9OpmAT/8iRrbIMS
 ek51JWjTCfhSsF5y1OU68E9QV8c5lOv5+KpIulIkmDU6i5QdqQvWJyuwstaHyGuNn7by
 VTgouOS8zmzvySfZbn4Njduv+e8SGAqqUrYeWnRnjKlUjjQxDErETvbmTcSm64gsVGaD sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3vcc7u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 09:14:09 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BC8i30F010721;
 Mon, 12 Dec 2022 09:14:08 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3vcc7t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 09:14:08 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BBA1mcA018218;
 Mon, 12 Dec 2022 09:14:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3mchr61q79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 09:14:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BC9E2O844958092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 09:14:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 478E920040;
 Mon, 12 Dec 2022 09:14:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE3D32004B;
 Mon, 12 Dec 2022 09:14:00 +0000 (GMT)
Received: from [9.171.10.222] (unknown [9.171.10.222])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 09:14:00 +0000 (GMT)
Message-ID: <68f2cc41-49d8-495c-f738-6bf87290eedb@linux.ibm.com>
Date: Mon, 12 Dec 2022 10:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v13 4/7] s390x/cpu_topology: CPU topology migration
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <20221208094432.9732-5-pmorel@linux.ibm.com>
 <69575e36-224a-c611-d446-fc7133586505@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <69575e36-224a-c611-d446-fc7133586505@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rw48KHsmZGGidP36HahiUML_LAp1SNtO
X-Proofpoint-ORIG-GUID: dVPBnUERJUD8ReyYUj6ez5nrLZ-UVMoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=866 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 12/9/22 15:56, Cédric Le Goater wrote:
> On 12/8/22 10:44, Pierre Morel wrote:
>> The migration can only take place if both source and destination
>> of the migration both use or both do not use the CPU topology
>> facility.
>>
>> We indicate a change in topology during migration postload for the
>> case the topology changed between source and destination.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>


>> +
>> +const VMStateDescription vmstate_cpu_topology = {
>> +    .name = "cpu_topology",
>> +    .version_id = 1,
>> +    .post_load = cpu_topology_postload,
> 
> Please use 'cpu_topology_post_load', it is easier to catch with a grep.
> 

OK

Regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

