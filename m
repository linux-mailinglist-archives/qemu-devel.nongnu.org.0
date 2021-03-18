Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A757340ACA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:00:06 +0100 (CET)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMw0C-0001Nh-SP
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lMvbm-0007Ie-FK
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:34:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lMvbj-0001TW-76
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:34:50 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12IGYVqm049276; Thu, 18 Mar 2021 12:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jF6L5urQ5HHZgqlBtfH0jxFx78Oumts1N7vHA2f4eV8=;
 b=DNRTFRZRx/AUYFdTedihyzEl+tN0q8XFz/FIHuMlgnyWL09cWAtKFVFGpCtDhSlVuOSW
 Y2fLIHARhfH2S7MHGorqYxU61W0AANcaDIiApq2Zclvblclbkyz01h/AAI32ATDNHYiG
 2s/+8LoSM7RrUQEbylT/vdspWerYlKOsmD+7NKG8U0BWCaHuopGm9BX5GIZU45tdKuxC
 fQVNQe+79ZfXg/85MkvMOvT5vc61M+7EW+Z4PpAhsdwd/6251Ng66X9D6f8YkupLcV8r
 7lJzKoQrP7CCuaAQ1x7deEH0EHgQWy8cDc/rUkoQId5xqUgoRycVgqcrl5OcW7yfJPsx dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37bnrdm7f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 12:34:37 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12IGYabo049781;
 Thu, 18 Mar 2021 12:34:36 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37bnrdm72y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 12:34:35 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12IGUEuV005729;
 Thu, 18 Mar 2021 16:34:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 378n18ampm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 16:34:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12IGYHeG45220330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:34:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8DAE11C054;
 Thu, 18 Mar 2021 16:34:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99CDD11C058;
 Thu, 18 Mar 2021 16:34:16 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.66.184])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Mar 2021 16:34:16 +0000 (GMT)
Subject: Re: [PATCH for 6.0 v3] hw/intc/i8259: Refactor pic_read_irq() to
 avoid uninitialized variable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210318163059.3686596-1-philmd@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <e48ce6e7-74bf-f105-4962-b124974712e5@de.ibm.com>
Date: Thu, 18 Mar 2021 17:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318163059.3686596-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_09:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103180117
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18.03.21 17:30, Philippe Mathieu-Daudé wrote:
> Some compiler versions are smart enough to detect a potentially
> uninitialized variable, but are not smart enough to detect that this
> cannot happen due to the code flow:
> 
> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>     203 |         irq = irq2 + 8;
>         |         ~~~~^~~~~~~~~~
> 
> Restrict irq2 variable use to the inner statement.
> 
> Fixes: 78ef2b6989f ("i8259: Reorder intack in pic_read_irq")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
  Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
> Since v2:
> - Remove pic_intack() call (Zoltan)
> ---
>   hw/intc/i8259.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 344fd04db14..cc4e21ffec0 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -176,10 +176,12 @@ static void pic_intack(PICCommonState *s, int irq)
>   int pic_read_irq(DeviceState *d)
>   {
>       PICCommonState *s = PIC_COMMON(d);
> -    int irq, irq2, intno;
> +    int irq, intno;
>   
>       irq = pic_get_irq(s);
>       if (irq >= 0) {
> +        int irq2;
> +
>           if (irq == 2) {
>               irq2 = pic_get_irq(slave_pic);
>               if (irq2 >= 0) {
> @@ -189,20 +191,18 @@ int pic_read_irq(DeviceState *d)
>                   irq2 = 7;
>               }
>               intno = slave_pic->irq_base + irq2;
> +            pic_intack(s, irq);
> +            irq = irq2 + 8;
>           } else {
>               intno = s->irq_base + irq;
> +            pic_intack(s, irq);
>           }
> -        pic_intack(s, irq);
>       } else {
>           /* spurious IRQ on host controller */
>           irq = 7;
>           intno = s->irq_base + irq;
>       }
>   
> -    if (irq == 2) {
> -        irq = irq2 + 8;
> -    }
> -
>   #ifdef DEBUG_IRQ_LATENCY
>       printf("IRQ%d latency=%0.3fus\n",
>              irq,
> 

