Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB934AD0A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 18:02:10 +0100 (CET)
Received: from localhost ([::1]:57628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPpqb-000122-Dv
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 13:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPpor-00009q-EG; Fri, 26 Mar 2021 13:00:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPpop-0001vP-Be; Fri, 26 Mar 2021 13:00:21 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QGWemh084524; Fri, 26 Mar 2021 13:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uPX26kLVchb0HXZd1yrzBfwCjBfcqERnXmpSGdkf6Hk=;
 b=IBDCvhEt0K/Uxg2Qw4t4CTVvseb0SyUs4M2UurIo8n1nIFt7Rza3pg1ISHnz2LA9cP5Z
 x7Lch+++vgEI7HAJaWDuqKaprPViz57gcAqm8JBkysikNBb2UdlYznRb/OoMJFO7XAo0
 kK1ETgW2L4eaJkPuzT/Iv7cvkjt/P3HKJdF15ybCCSlJ0X6kVdbQfZmro4IY0BUggwXw
 KWi6yNJD4428sOST1FpIrpDEJ/dgk+KS1ZD2vFNbW7kUZx9cUSkOyq+zrLhGBjkD3279
 Jcymv0Ke/GBnTC1B6TZ4m9uA6QsOx1b41bda8lSzhoeOs7TuiFcSAl5j+HnyARbr6he+ AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h767vd5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 13:00:09 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QGWr4p085064;
 Fri, 26 Mar 2021 13:00:09 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h767vd4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 13:00:08 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QGibQG026897;
 Fri, 26 Mar 2021 17:00:07 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 37h14wpn19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 17:00:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QH064s15860108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 17:00:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95603BE058;
 Fri, 26 Mar 2021 17:00:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 719F4BE054;
 Fri, 26 Mar 2021 17:00:04 +0000 (GMT)
Received: from [9.85.195.191] (unknown [9.85.195.191])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 17:00:04 +0000 (GMT)
Subject: Re: [PATCH 3/3] tests: Aspeed HACE Scatter-Gather tests
To: Joel Stanley <joel@jms.id.au>
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
 <20210324223846.17407-4-klaus@linux.vnet.ibm.com>
 <CACPK8XfHw06+o6LJsPY4X3=V69L2uT+2cZurCNxd623WT0Em+A@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <099f53c6-abbe-b70b-94fc-cc71e1094051@linux.vnet.ibm.com>
Date: Fri, 26 Mar 2021 14:00:02 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XfHw06+o6LJsPY4X3=V69L2uT+2cZurCNxd623WT0Em+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iTVwWQ4dhd2Z30Su71m0sAD5x9wpwCOI
X-Proofpoint-GUID: DUyWJoGKXq6lhbD-LD-3hOEohEq_9wbk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_06:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260124
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joel,


On 3/24/2021 11:18 PM, Joel Stanley wrote:

>> +    const uint32_t src_addr_1 = src_addr + 0x1000000;
>> +    const uint32_t src_addr_2 = src_addr + 0x2000000;
>> +    const uint32_t src_addr_3 = src_addr + 0x3000000;
>> +    const uint32_t digest_addr = src_addr + 0x4000000;
>> +    uint8_t digest[32] = {0};
>> +    struct aspeed_sg_list array[] = {
>> +            { sizeof(test_vector_sg1),              src_addr_1},
>> +            { sizeof(test_vector_sg2),              src_addr_2},
>> +            { sizeof(test_vector_sg3) | 1u << 31,   src_addr_3},
> 
> These sizeofs are always going to be 3.

I was trying to not hard-code 3 here and perhaps allow for more clarity and
extensibility, in case we ever decide to use larger vectors?

  
> I assume 1 << 31 is to indicate the final entry? Perhaps add a define for it.
ack

> 
>> +        };
>> +
>> +    /* Check engine is idle, no busy or irq bits set */
>> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
>> +
>> +    /* Write test vector into memory */
>> +    qtest_memwrite(s, src_addr_1, test_vector_sg1, sizeof(test_vector_sg1));
>> +    qtest_memwrite(s, src_addr_2, test_vector_sg2, sizeof(test_vector_sg2));
>> +    qtest_memwrite(s, src_addr_3, test_vector_sg3, sizeof(test_vector_sg3));
> 
> It would simplify your test case if you wrote the test vector to the
> one memory location.

I guess I like that each vector is significantly displaced from each other, as this
is supported by the hardware.

> 
>>   struct masks {
>> -    uint32_t src;
>> +    uint32_t src_direct;
> 
> You could leave this one the same.
> 
>> +    uint32_t src_sg;
> 
> You add this, but haven't written a new test to use it.

Turns out there's nothing special about src/dst/len masking
when using HASH_SG_EN, so I'll remove those.

Thanks,

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

