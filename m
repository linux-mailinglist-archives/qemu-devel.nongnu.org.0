Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F751D82C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 14:47:59 +0200 (CEST)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmxNG-00019N-09
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 08:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nmxFo-0003wF-Np
 for qemu-devel@nongnu.org; Fri, 06 May 2022 08:40:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nmxFm-0000e4-TZ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 08:40:16 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246BMZcP004605;
 Fri, 6 May 2022 12:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sIBRMCCK2vgF7oYoF8yVMV1t1srDSH8Ne/UZFREoqvI=;
 b=extIt6/6yDDgzVQZFUVk38fmJ24wPKXS4u405CW/qMDKKI1KIZ41+QJxfSDZd5y+nj1x
 yUCByEAW3loVQogaNjGOdTo1T0lkVz9SvdhEv33cMTCur6jiCPFsY0RJNEgXH9MhFhs5
 b2eT9i6MqmbPfT6z1wGVPPxXC1SH9yeu1e/OZawBRWPBrhfexITC85LDkDR3v+9g+A+j
 W0kyuPNMmp7kzWtfQnmCecKMT4BNh6sLuCurt7unRC/ZUmsEbfzGQmCHYx2rnL0slvSE
 cx/9WPHKQT3miQE3hkUJ7jqX44YMx7jYIrcexZYT7aTYhWYMcRz+aq4mIDb7cYZByhWm mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw2rbhe65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 12:40:04 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 246CAADh004264;
 Fri, 6 May 2022 12:40:04 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw2rbhe5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 12:40:04 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246Cc8mc000542;
 Fri, 6 May 2022 12:40:03 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3frvrajam6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 12:40:03 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 246Ce2A233358230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 12:40:02 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F5BEBE05B;
 Fri,  6 May 2022 12:40:02 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13876BE056;
 Fri,  6 May 2022 12:40:02 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 12:40:01 +0000 (GMT)
Message-ID: <606aa970-fc6c-8e1e-ffad-a6e5fe845c47@linux.ibm.com>
Date: Fri, 6 May 2022 08:40:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] vfio/common: remove spurious tpm-crb-cmd misalignment
 warning
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, eric.auger@redhat.com,
 Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 stefanb@linux.vnet.ibm.com, f4bug@amsat.org
References: <20220428134945.511829-1-eric.auger@redhat.com>
 <20220428141423.6e2da84c.alex.williamson@redhat.com>
 <019b265a-2489-c595-acd4-b1b5c1772707@redhat.com> <875ymj5d2z.fsf@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <875ymj5d2z.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Uhe3vXJL0YqWbcsNi0cKIKHiXLauueRZ
X-Proofpoint-ORIG-GUID: w5syM7rqZ7fPbckpw2V1IwxAMlmbBgA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205060070
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 5/6/22 03:34, Cornelia Huck wrote:
> On Fri, May 06 2022, Eric Auger <eric.auger@redhat.com> wrote:
> 
>> Hi Alex,
>>
>> On 4/28/22 22:14, Alex Williamson wrote:
>>> On Thu, 28 Apr 2022 15:49:45 +0200
>>> Eric Auger <eric.auger@redhat.com> wrote:
> 
>>>> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>>>> +{
>>>> +    MemoryRegion *mr = section->mr;
>>>> +
>>>> +    if (!TPM_IS_CRB(mr->owner)) {
>>>> +        return false;
>>>> +    }
>>> It looks like this test is going to need to be wrapped in #ifdef
>>> CONFIG_TPM:
>>
>> sorry for the delay. Your message fell though the cracks :-(
>>
>> if I put an '#ifdef CONFIG_TPM' I need to inverse the logic because by
>> default the function shall return false.
>>
>> solution #1
>>
>> #ifdef CONFIG_TPM
>>   if (TPM_IS_CRB(mr->owner)) {
>>
>>      /* this is a known safe misaligned region, just trace for debug purpose */
>>      trace_vfio_known_safe_misalignment(memory_region_name(mr),
>>                                         section->offset_within_address_space,
>>                                         section->offset_within_region,
>>                                         qemu_real_host_page_size());
>>
>>      return true;
>>     }
>>
>> #endif
>> return false;
>>
>> This looks weird to me.
>>
>> +    if (!object_dynamic_cast(mr->owner, TYPE_TPM_CRB)) {
>> +        return false;
>> +    }
>>
>>
>> solution #2
>> replace !object_dynamic_cast(mr->owner, TYPE_TPM_CRB) by
>> !object_dynamic_cast(mr->owner, "tpm-crb")
>> and add a comment saying that we don't use TYPE_TPM_CRB on purpose
>>
>> solution #3
>> Move #define TPM_IS_CRB(chr) and related defined out of
>> #ifdef CONFIG_TPM hoping it does not have other side effects
>>
>> Thoughts?
>> Eric
> 
> solution #4
> 
> #ifndef CONFIG_TPM
> /* needed for an alignment check in non-tpm code */
> static inline Object *TPM_IS_CRB(Object *obj)
> {
>      return NULL;
> }
> #endif
> 
> I think it would be good if we could hide the configuration details in
> the header.
> 

Solution #4 looks good to me...

