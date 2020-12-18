Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF542DE07B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:39:31 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCEU-00066U-8G
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1kqCCq-000543-N3; Fri, 18 Dec 2020 04:37:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1kqCCo-0007kq-Jr; Fri, 18 Dec 2020 04:37:48 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BI9UwmL107224; Fri, 18 Dec 2020 04:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/1MRTEf9PVYiAIM+rwxpWMqTfEJdBqZcqN1D/ViBmaY=;
 b=HhyWmtziDzYTZRM9kITAISOd0PXhxNFj1GKLCPw2OXiATEoh4+XjxWqAugOL+wrZdG0h
 6JqFl7iFG60c4PrhbcXNW9Iwut9iQR6CW9QzWFRQDoCNLUpaYuo877zo+UrmdZx2c5v5
 mHNhVLHZNGx6/eqUiANTmU8oJuwCv7X9UKJMWbOjZqNng4fr85bylsrIcVc6rsSH6SsM
 bBkwHKZzDPGTPrXo5sTyC1cDIg44oOKEEdSMEpphPgAc4qZVkYo8HnZqdiCsqcLzxKh0
 rJt4yZek7Dng9O8i2Rcm9wRJ50wtixK1ckABoEbxqWN+AxUL2i9/5nopJi89gmExgdpu vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35grpra7cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 04:37:44 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BI9WeqS111666;
 Fri, 18 Dec 2020 04:37:44 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35grpra7cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 04:37:43 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BI9WueH006298;
 Fri, 18 Dec 2020 09:37:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 35d310ay1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 09:37:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BI9bdD529032868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 09:37:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C5C211C058;
 Fri, 18 Dec 2020 09:37:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CDFF11C04A;
 Fri, 18 Dec 2020 09:37:38 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.46.39])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Dec 2020 09:37:38 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] s390x/pci: Fix memory_region_access_valid call
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com,
 thuth@redhat.com
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
 <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <72f4e03f-7208-6af0-4cd2-9715d9f9ec77@linux.ibm.com>
Date: Fri, 18 Dec 2020 10:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_05:2020-12-18,
 2020-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180065
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: david@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/17/20 11:16 PM, Matthew Rosato wrote:
> In pcistb_service_handler, a call is made to validate that the memory
> region can be accessed.  However, the call is made using the entire length
> of the pcistb operation, which can be larger than the allowed memory
> access size (8).  Since we already know that the provided buffer is a
> multiple of 8, fix the call to memory_region_access_valid to iterate
> over the memory region in the same way as the subsequent call to
> memory_region_dispatch_write.
> 
> Fixes: 863f6f52b7 ("s390: implement pci instructions")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-inst.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index e230293..76b08a3 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -821,10 +821,12 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>       mr = s390_get_subregion(mr, offset, len);
>       offset -= mr->addr;
>   
> -    if (!memory_region_access_valid(mr, offset, len, true,
> -                                    MEMTXATTRS_UNSPECIFIED)) {
> -        s390_program_interrupt(env, PGM_OPERAND, ra);
> -        return 0;
> +    for (i = 0; i < len; i += 8) {
> +        if (!memory_region_access_valid(mr, offset + i, 8, true,
> +                                        MEMTXATTRS_UNSPECIFIED)) {
> +            s390_program_interrupt(env, PGM_OPERAND, ra);
> +            return 0;
> +        }
>       }
>   
>       if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
> 

wouldn't it be made automatically by defining the io_region 
max_access_size when reading the bars in clp_service_call?

-- 
Pierre Morel
IBM Lab Boeblingen

