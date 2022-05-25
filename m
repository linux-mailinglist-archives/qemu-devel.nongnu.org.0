Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E7533856
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 10:25:01 +0200 (CEST)
Received: from localhost ([::1]:39862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntmKC-0001XF-Gp
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 04:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ntmBE-0003NK-Vj; Wed, 25 May 2022 04:15:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ntmBC-0003wZ-6n; Wed, 25 May 2022 04:15:44 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P80jav015869;
 Wed, 25 May 2022 08:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=28lpOEVXPV1S2NGnOThf/TvXrrn/XBMbPESyoW2Pd4s=;
 b=qKzN+MtKPDYD8IPLOwSoYRCLfMEwkFuqpQEf16f1FBThgBU8CeZzss/XLnSZYck4jlpi
 y5X5saSkyAeDPEqOa5I5q22OLLqPYg1xm+ZDDXm+rXnfaDECqGXaRBH3mnGTeWNr040R
 GSZS2t20YtzUdLKWAqentbCkqOc90tlLIz1V561kQpjdpiKTkCfQ35ICn2VL/Xa7/gXJ
 YUjzlxotPgCddZPglma7Uls6B1P5wXMXdpRN0u2KxHR1xbrfZJvsJEqSW7wW2OpSTi4A
 jqpSIjrEpxw+3IQLGe4VzZwfYPXY2kdIET1t7O0bVWr200WM07Kugikb8brNw66zuN+S RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9gjsgacf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 08:15:39 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24P8EuRe017271;
 Wed, 25 May 2022 08:15:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9gjsgabn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 08:15:38 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24P88HOV024776;
 Wed, 25 May 2022 08:15:36 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3g93uw8sp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 08:15:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24P8FXj816843238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 08:15:33 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F34ACA4053;
 Wed, 25 May 2022 08:15:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EB7CA4040;
 Wed, 25 May 2022 08:15:32 +0000 (GMT)
Received: from [9.171.31.97] (unknown [9.171.31.97])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 08:15:32 +0000 (GMT)
Message-ID: <2f30e75a-5a5c-719c-a910-67a0ab3cc1c7@linux.ibm.com>
Date: Wed, 25 May 2022 10:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 08/13] s390x: topology: Adding drawers to STSI
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, philmd@redhat.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-9-pmorel@linux.ibm.com>
 <8110c080-b439-4ed8-ffc8-13323ba3790c@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <8110c080-b439-4ed8-ffc8-13323ba3790c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QaE8r5uSt0mpziprjfI-lkDIXFt7EsIZ
X-Proofpoint-ORIG-GUID: YeTtotKulT5or-W2aWOnVEhM2EoOBBcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_02,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250037
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/24/22 13:10, Thomas Huth wrote:
> On 20/04/2022 13.57, Pierre Morel wrote:
>> Let's add STSI support for the container level 4, drawers,
>> and provide the information back to the guest.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> ...
>> @@ -470,6 +520,69 @@ static const TypeInfo drawer_info = {
>>           { }
>>       }
>>   };
>> +
>> +/* --- NODE Definitions --- */
>> +
>> +/*
>> + * Nodes are the first level of CPU topology we support
>> + * only one NODE for the moment.
>> + */
>> +static char *node_bus_get_dev_path(DeviceState *dev)
>> +{
>> +    return g_strdup_printf("00");
>> +}
> g_strdup("00") please.

Yes, thanks, will change it

Regards,
Pierre

> 
>   Thomas
> 

-- 
Pierre Morel
IBM Lab Boeblingen

