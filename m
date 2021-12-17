Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2F7479296
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 18:14:45 +0100 (CET)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGod-0005tV-M4
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 12:14:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1myGmv-0005Aj-LV; Fri, 17 Dec 2021 12:12:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1myGmp-0005Ag-3i; Fri, 17 Dec 2021 12:12:57 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHEqgUf025209; 
 Fri, 17 Dec 2021 17:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SdGCRocUc7LYVuGZXW+rcUnZUCp9dY5PzU9eRkbT/7Q=;
 b=IHSPjjQj8FVOlMPd3trqHrCtqUGboWnVXferK2bSNkl7GzqlIPkDFCAH2ZKMv8kvBUlz
 Ye2iOpCsxvs0O0JD5jTmXH+/CivTkFR16R3YIBv1GP784xqNJouwptTeUy9wQwBwPAwZ
 pyGOTnWB5lq9KxWd2ZJzFGqXYqgE0FI590eT1gQlYGobq2BHTmdPKV9ENtkxkE6xsL0/
 nt6Xtuy0/LqEXSMYRCYcr2ZajOC1UNWoV04cVXJSLtReZgEpIjkO6D4kyACdTLYskmd8
 QpX/4BR7ym0Qk/OZzWrRJXqesOZ7UcSJopSrZBzfTp1TysFAZIxFzOtP8D5pmaeH1Yek /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cypc7trvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 17:12:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BHGpw93000712;
 Fri, 17 Dec 2021 17:12:47 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cypc7trur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 17:12:47 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BHGf3uE023185;
 Fri, 17 Dec 2021 17:12:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3cy7k3td8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 17:12:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BHHCgF646924046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 17:12:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D15A11C04A;
 Fri, 17 Dec 2021 17:12:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C534511C04C;
 Fri, 17 Dec 2021 17:12:41 +0000 (GMT)
Received: from [9.171.25.249] (unknown [9.171.25.249])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Dec 2021 17:12:41 +0000 (GMT)
Message-ID: <7143886b-ffa2-e5f7-e7fe-b06212522824@linux.ibm.com>
Date: Fri, 17 Dec 2021 18:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH qemu] s390x/css: fix PMCW invalid mask
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>, Nico Boehr <nrb@linux.ibm.com>
References: <20211216131657.1057978-1-nrb@linux.ibm.com>
 <20211217145811.71dd0a70.pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211217145811.71dd0a70.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oJainPnTDSpz5LUcq847V4ZjGRnyHWbd
X-Proofpoint-GUID: r3DQAOCR23dqnomp9bc8Z-E1OOiHlbZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_06,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/17/21 14:58, Halil Pasic wrote:
> On Thu, 16 Dec 2021 14:16:57 +0100
> Nico Boehr <nrb@linux.ibm.com> wrote:
> 
>> Previously, we required bits 5, 6 and 7 to be zero (0x07 == 0b111). But,
>> as per the principles of operation, bit 5 is ignored in MSCH and bits 0,
>> 1, 6 and 7 need to be zero.
> 
> On a second thought, don't we have to make sure then that bit 5 is
> ignored?
> 
> static void copy_pmcw_from_guest(PMCW *dest, const PMCW *src)
> {
>      int i;
> 
>      dest->intparm = be32_to_cpu(src->intparm);
>      dest->flags = be16_to_cpu(src->flags);
>      dest->devno = be16_to_cpu(src->devno);
> 
> Here we seem to grab flags as a whole, but actually we would have to
> mask of bit 5.

Why?
If this bit is ignored by the machine shouldn't we just ignore it?
Forcing it to 0 or to 1 is purely arbitrary no?

> 
> I can spin a patch myself, provided we agree on that this needs to be
> fixed, but, it would probably be better to have the two changes in one
> patch.
> 
> Regards,
> Halil
> 
> 
>>
>> As both PMCW_FLAGS_MASK_INVALID and ioinst_schib_valid() are only used
>> by ioinst_handle_msch(), adjust the mask accordingly.
>>
>> Fixes: db1c8f53bfb1 ("s390: Channel I/O basic definitions.")
>> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
>> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
>> Reviewed-by: Halil Pasic <pasic@linux.ibm.com>
>> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>

-- 
Pierre Morel
IBM Lab Boeblingen

