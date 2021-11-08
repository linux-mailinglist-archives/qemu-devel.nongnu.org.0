Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A846E44795C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:27:49 +0100 (CET)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjwG4-0004Oc-Rs
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1mjwBU-0007LS-JI; Sun, 07 Nov 2021 23:23:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aneesh.kumar@linux.ibm.com>)
 id 1mjwBS-0007pp-0V; Sun, 07 Nov 2021 23:23:04 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A84E4Re025159; 
 Mon, 8 Nov 2021 04:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=FFlG/BfOSmKXsuX59MK3dJEeDkir4OblqM2nDlOF9J4=;
 b=GMqnWnWwvx9fNVhsfCWooqe7z8oxcCu6WmxKtKHcBIJfgraWEkcvQTHHjx/AID5GkysC
 Jx0s8VfeNsrZCrZdQv7kDEJxa4f8mR8VX4VCmWBkdfxlM2k609NhfHcb9aaXYNqcA2zl
 2s9Au5xyP+VjGG5n8Ru3w9dCPqqwtL3drCVlRvzDwrs5ZbLsTLQAwq2Abfw2pPx7j0+H
 ntIgTn2R+30dhHl7L6MMoxCXgOYSWM4CNAypaM115nu1jCAe3w7SPoYNPb2yzWD69Bxo
 SdG4A4q0dcQcrbo55d/mMqkgQf0TWKcDN6rj5yBGA1lPakTaZKS1G9/EDaDlEuZ9ui1p BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6jpp1m4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 04:22:55 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A84IOol022596;
 Mon, 8 Nov 2021 04:22:53 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6jpp1m48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 04:22:52 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A84IW3U008236;
 Mon, 8 Nov 2021 04:22:51 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3c5hbah2y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 04:22:51 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A84MoXV32047468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 04:22:50 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EDF0C605A;
 Mon,  8 Nov 2021 04:22:50 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31262C605D;
 Mon,  8 Nov 2021 04:22:48 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.107.132])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 04:22:47 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH] spapr_numa.c: FORM2 table handle nodes with no distance
 info
In-Reply-To: <555804ca-e59e-6dfb-c133-0087b7c0ffd0@gmail.com>
References: <20211105135137.1584840-1-npiggin@gmail.com>
 <555804ca-e59e-6dfb-c133-0087b7c0ffd0@gmail.com>
Date: Mon, 08 Nov 2021 09:52:45 +0530
Message-ID: <87bl2v1dka.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OtaRcLy_klkXsazdVkeoPvM7nUe7Tuix
X-Proofpoint-ORIG-GUID: VoSJDZ16VgxzCo1XkXmh9iOOZfIu6TqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111080026
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=aneesh.kumar@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 11/5/21 10:51, Nicholas Piggin wrote:
>> A configuration that specifies multiple nodes without distance info
>> results in the non-local points in the FORM2 matrix having a distance of
>> 0. This causes Linux to complain "Invalid distance value range" because
>> a node distance is smaller than the local distance.
>> 
>> Fix this by building a simple local / remote fallback for points where
>> distance information is missing.
>
> Thanks for looking this up. I checked the output of this same scenario with
> a FORM1 guest and 4 distance-less NUMA nodes. This is what I got:
>
> [root@localhost ~]# numactl -H
> available: 4 nodes (0-3)
> (...)
> node distances:
> node   0   1   2   3
>    0:  10  160  160  160
>    1:  160  10  160  160
>    2:  160  160  10  160
>    3:  160  160  160  10
> [root@localhost ~]#
>
>
> With this patch we're getting '20' instead of '160' because you're using
> NUMA_DISTANCE_DEFAULT, while FORM1 will default this case to the maximum
> NUMA distance the kernel allows for that affinity (160).

where is that enforced? Do we know why FORM1 picked 160? 

>
> I do not have strong feelings about changing this behavior between FORM1 and
> FORM2. I tested the same scenario with a x86_64 guest and they also uses '20'
> in this case as well, so far as QEMU goes using NUMA_DISTANCE_DEFAULT is
> consistent.
>

for FORM2 I would suggest 20 is the right value and it is also
consistent with other architectures. 

> Aneesh is already in CC, so I believe he'll let us know if there's something
> we're missing and we need to preserve the '160' distance in FORM2 for this
> case as well.
>
> For now:
>
>
>> 
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>
>
>
>>   hw/ppc/spapr_numa.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>> 
>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>> index 5822938448..56ab2a5fb6 100644
>> --- a/hw/ppc/spapr_numa.c
>> +++ b/hw/ppc/spapr_numa.c
>> @@ -546,12 +546,24 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>                * NUMA nodes, but QEMU adds the default NUMA node without
>>                * adding the numa_info to retrieve distance info from.
>>                */
>> -            if (src == dst) {
>> -                distance_table[i++] = NUMA_DISTANCE_MIN;
>> -                continue;

We always initialized the local distance to be NUMA_DISTANCE_MIN
irrespective of what is specified via Qemu command line before? If so
then the above change will break that? 

>> +            distance_table[i] = numa_info[src].distance[dst];
>> +            if (distance_table[i] == 0) {

we know distance_table[i] is == 0 here and ..

>> +                /*
>> +                 * In case QEMU adds a default NUMA single node when the user
>> +                 * did not add any, or where the user did not supply distances,
>> +                 * the value will be 0 here. Populate the table with a fallback
>> +                 * simple local / remote distance.
>> +                 */
>> +                if (src == dst) {
>> +                    distance_table[i] = NUMA_DISTANCE_MIN;
>> +                } else {
>> +                    distance_table[i] = numa_info[src].distance[dst];
>> +                    if (distance_table[i] < NUMA_DISTANCE_MIN) {


considering we reached here after checking distance_table[i] == 0 do we
need to do the above two lines?

>> +                        distance_table[i] = NUMA_DISTANCE_DEFAULT;
>> +                    }
>> +                }
>>               }
>> -
>> -            distance_table[i++] = numa_info[src].distance[dst];
>> +            i++;
>>           }
>>       }



