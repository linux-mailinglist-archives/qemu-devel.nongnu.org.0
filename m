Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A977340A14
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:23:49 +0100 (CET)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvR6-00034t-An
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lMvFU-0000Qj-N2; Thu, 18 Mar 2021 12:11:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26060
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lMvFE-0006KO-IJ; Thu, 18 Mar 2021 12:11:42 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12IG3HqB126979; Thu, 18 Mar 2021 12:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=x8mO45sBuf3SGLntq8LVNrOFokfpFaqAvCfiMcIWLeQ=;
 b=cqWBGYqFdtKeSX/nycYubqc58qFkqiNycIC14Hk4RjEAlPK3oXj0hdqY6ePrM/KcdNs2
 IPAxTIy85T7fxF0pNQY2QQ1Jk+HzG/+/08iM3iL8gJ3YWBx9c/YoD8hK1F+VhGWNwnxW
 e0OaXNcTAmzdnOH4Mfb85UdENsGhOjyaaL2s2HJQJOURLQgtHYc7SdZMidBXS6YV/dXg
 B9sHcjRGQA533tULpdtUm4mv86oCe0Obpay6vXv6Me3J4aiIP9QxtizbO2Cuom9V6sO/
 FhjxoW/TV37ae9tCZdpsVVKAO7RfG3Kt9jLUVyW5Dp7xu2opwzMYCX7E62019w1tbMRm lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37c10fsjh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 12:11:30 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12IG3Jim127288;
 Thu, 18 Mar 2021 12:11:30 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37c10fsjg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 12:11:30 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12IG9WZQ019514;
 Thu, 18 Mar 2021 16:11:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 37b6xjgv3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 16:11:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12IGBPbY23724528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:11:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC5B511C064;
 Thu, 18 Mar 2021 16:11:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87FAA11C050;
 Thu, 18 Mar 2021 16:11:25 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.66.184])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Mar 2021 16:11:25 +0000 (GMT)
Subject: Re: [PATCH] intc/i8259: avoid (false positive) gcc warning
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20210318154738.27094-1-borntraeger@de.ibm.com>
 <69bb59c7-1f97-ba07-5150-d94d03210920@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <bb7ec2df-db8e-2d3e-e392-1d2e16ce81e6@de.ibm.com>
Date: Thu, 18 Mar 2021 17:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <69bb59c7-1f97-ba07-5150-d94d03210920@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_09:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180112
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18.03.21 17:03, Paolo Bonzini wrote:
> On 18/03/21 16:47, Christian Borntraeger wrote:
>> some copiler versions are smart enough to detect a potentially
>> uninitialized variable, but are not smart enough to detect that this
>> cannot happen due to the code flow:
>>
>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>     203 |         irq = irq2 + 8;
>>         |         ~~~~^~~~~~~~~~
>>
>> Let us initialize irq2 to -1 to avoid this warning as the most simple
>> solution.
> 
> What about:

This also works, but if you want to go down that path then it would be good if you
could do this patch as I do not have the testing infrastructure to do proper x86
changes.
> 
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 344fd04db1..bf28c179de 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -189,20 +189,18 @@ int pic_read_irq(DeviceState *d)
>                   irq2 = 7;
>               }
>               intno = slave_pic->irq_base + irq2;
> +            irq = irq2 + 8;
> +            pic_intack(s, 2);
>           } else {
>               intno = s->irq_base + irq;
> +            pic_intack(s, irq);
>           }
> -        pic_intack(s, irq);
>       } else {
>           /* spurious IRQ on host controller */
>           irq = 7;
>           intno = s->irq_base + irq;
>       }
> 
> -    if (irq == 2) {
> -        irq = irq2 + 8;
> -    }
> -
>   #ifdef DEBUG_IRQ_LATENCY
>       printf("IRQ%d latency=%0.3fus\n",
>              irq,
> 
> 
> ?
> 
> Paolo
> 

