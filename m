Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC66456FB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 10:59:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2rCd-0001vC-94; Wed, 07 Dec 2022 04:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p2rCa-0001ux-8m; Wed, 07 Dec 2022 04:58:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p2rCY-0001mk-Ah; Wed, 07 Dec 2022 04:58:56 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B79iheZ017852; Wed, 7 Dec 2022 09:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BGBaykQVB/uwBkqKwg64T19xso7hF2ac2PHju+72fxU=;
 b=AtzCtXeTHnSQMX/gv412IMxHd8W4LvV1xkNEtZaCbsUjdKwbfwujSatvjPoL6y8MKSFn
 nt4KhQKhIS4hnqg1NdHbKz9hYAirEWgvQCT34IvbCwdHPVnc+pQjBLQU1+KAOeZXiOFR
 1CZ4G8mq3gPpH15c6H25lNxRzWXyaT6ZRFDlbHjHWA4Rx+gdpA+n0h/4CsIUS4QEuJHv
 sIaMWHSiavYP4L4ukDDn6nVa5cxySccW8NJPb/zNCNjQSR07j8ANVz75ggrey62QHORa
 /iEfUB0vkAWi8to+/81HDrEe0FEq8ic/FKBvr4IXayKR+wdlglfYih2pOMmbxEzTnd5F Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3marfj0a5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 09:58:41 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B79jOmA020092;
 Wed, 7 Dec 2022 09:58:41 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3marfj0a4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 09:58:40 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B79YrML008229;
 Wed, 7 Dec 2022 09:58:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3m9ktqj07v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 09:58:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B79wX5c6095258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Dec 2022 09:58:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 144DF20043;
 Wed,  7 Dec 2022 09:58:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 034D120049;
 Wed,  7 Dec 2022 09:58:32 +0000 (GMT)
Received: from [9.171.6.120] (unknown [9.171.6.120])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  7 Dec 2022 09:58:31 +0000 (GMT)
Message-ID: <43ca70fb-2b67-2075-3bc7-e7dbda64531e@linux.ibm.com>
Date: Wed, 7 Dec 2022 10:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v12 2/7] s390x/cpu topology: reporting the CPU topology to
 the guest
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-3-pmorel@linux.ibm.com>
 <697092bd-9920-a73e-7652-07b8ecc8daff@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <697092bd-9920-a73e-7652-07b8ecc8daff@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LJ3DqmVHNLc1hXZNvvJHCHMHCT6H16hk
X-Proofpoint-GUID: r1VuQp3Kexjvzpi0DXOoEJsSUvDjdcnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 12/7/22 10:12, Cédric Le Goater wrote:
> On 11/29/22 18:42, Pierre Morel wrote:
>> The guest uses the STSI instruction to get information on the
>> CPU topology.
>>
>> Let us implement the STSI instruction for the basis CPU topology
>> level, level 2.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---

...snip...

>> +
>> +#define S390_TOPOLOGY_MAX_MNEST 2
>> +
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>> +{
>> +    union {
>> +        char place_holder[S390_TOPOLOGY_SYSIB_SIZE];
>> +        SysIB_151x sysib;
>> +    } buffer QEMU_ALIGNED(8);
>> +    int len;
>> +
>> +    if (s390_is_pv() || !s390_has_topology() ||
>> +        sel2 < 2 || sel2 > S390_TOPOLOGY_MAX_MNEST) {
>> +        setcc(cpu, 3);
>> +        return;
>> +    }
>>
>> +    s390_prepare_topology(S390_CCW_MACHINE(cpu->machine_data));
>> +
>> +    len = setup_stsi(cpu, &buffer.sysib, sel2);
> 
> 
> The S390_CPU_TOPOLOGY object is created by the machine at init time
> and the two above routines are the only users of this object.

This is right at this moment but the object will be used in the next 
patches for implementing reset, patch 3, and migration, patch 4.


> 
> The first loops on all possible CPUs to populate the bitmask array
> 'socket' under S390_CPU_TOPOLOGY and the second uses the result to
> populate the buffer returned to the guest OS.
> 
> I don't understand why the S390_CPU_TOPOLOGY object is needed at all.
> AFAICT, this is just adding extra complexity.

I used an object because I thought it could be cleaner for the 
implementation of reset and migration.

> Is the pachset preparing
> ground for some more features ? 

Yes it is, I removed the books and drawers topology containers from this 
patch series in the version 10 of the patch series to postpone their 
implementation.

The next series on topology implementation will also add, beside the 
implementation of drawers and books, the possibility to modify the 
topology during the life of a guest.

These, book, drawer and the topology modification will need to be migrated.

Is there a good alternative to facilitate the implementation of the 
migration ?

Of course we can put all together inside the CcwMachineState but 
wouldn't the use of a dedicated object make it all cleaner?

Regards,
Pierre

If so, it should be explained in the
> commit log.
> 
> As for now, I see no good justification for S390_CPU_TOPOLOGY and we
> could add support with a simple routine called from insert_stsi_15_1_x().
> 
> Thanks,
> 
> C.

-- 
Pierre Morel
IBM Lab Boeblingen

