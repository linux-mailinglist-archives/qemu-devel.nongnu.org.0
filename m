Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA41E34ACE1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 17:53:15 +0100 (CET)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPphz-0005uC-1e
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 12:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPpge-0005L0-Kj; Fri, 26 Mar 2021 12:51:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16770
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPpgc-00051b-ND; Fri, 26 Mar 2021 12:51:52 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QGY7BC094667; Fri, 26 Mar 2021 12:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vZScrVm6+sVdrF6sRgM0w+7HW3H9uv8cCfQcC36nlxo=;
 b=d4f9JIB4dpOJkeEfZSziwZHbkaxLOHnUNBsOO4r+FURhCq5UPRksGwOj+Ier9phMoi9Y
 i8SvLcpzElx7ENLonp+v1YT9Nl2Itqsc2ffp38vOwFD4JcVmP977cucfbwqwIy1DpnnV
 K0GtN0UDLq+YXsUqztS7VRSWP80bl4oI/0xQXAdpobGSODHEz4oqh5TOoXht7TuOLRUn
 5pJQf8qP++0taxuiD6Y/qnUFh5W4gklTKMEii/sgmskLlBHK9Gz8oSRnuWMgOwjVWjJg
 0g4VrQgF4w7sh4rRsTUsDNNwI7GAWFSXz1BpjeJA9bO3NegI7AVn3+osUg3SwuDwDaIE aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37hfysevba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 12:51:39 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QGY8BS094799;
 Fri, 26 Mar 2021 12:51:39 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37hfysevb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 12:51:39 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QGilBJ017907;
 Fri, 26 Mar 2021 16:51:38 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 37h14h88q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 16:51:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QGpbCS34930968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 16:51:37 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 585A1BE054;
 Fri, 26 Mar 2021 16:51:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C743BE051;
 Fri, 26 Mar 2021 16:51:35 +0000 (GMT)
Received: from [9.85.195.191] (unknown [9.85.195.191])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 16:51:35 +0000 (GMT)
Subject: Re: [PATCH 2/3] aspeed: Add Scater-Gather support for HACE Hash
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
 <20210324223846.17407-3-klaus@linux.vnet.ibm.com>
 <329648d7-9f30-2a58-be89-d157c446e927@kaod.org>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <069b1ad4-1b4b-99f6-9719-308e24674bc5@linux.vnet.ibm.com>
Date: Fri, 26 Mar 2021 13:51:33 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <329648d7-9f30-2a58-be89-d157c446e927@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: n78OFDzKXZSLbyBesLG3hgAtGOUWc8OL
X-Proofpoint-GUID: 2EMuvpTq0kQnjPLwE_QHtp0FpvhpkgIn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_06:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260124
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/2021 4:55 AM, Cédric Le Goater wrote:
> On 3/24/21 11:38 PM, Klaus Heinrich Kiwi wrote:
>> Complement the Aspeed HACE support with Scatter-Gather hash support for
>> sha256 and sha512. Scatter-Gather is only supported on AST2600-series.
>>
>> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> 
> this looks good. A few extra comments,
> 
>
>> @@ -129,6 +133,117 @@ static int do_hash_operation(AspeedHACEState *s, int algo)
>>       return 0;
>>   }
>>   
>> +static int do_hash_sg_operation(AspeedHACEState *s, int algo)
> 
> Do we really care about the return value ?

I'm keeping it consistent with do_hash_operation() above it. Maybe the underlying
Qemu layers could use it?

  
>> +        sgList = (struct aspeed_sg_list *) address_space_map(&s->dram_as,
>> +                                                                     src,
>> +                                                         (hwaddr *) &len,
>> +                                                                   false,
>> +                                                 MEMTXATTRS_UNSPECIFIED);
> 
> This should be doing LE loads.

ack. I'm using address_space_ldl_le() now.

  
>> -        do_hash_operation(s, algo);
>> +        if (data & HASH_SG_EN) {
>> +            s->regs[(R_HASH_SRC >> 2)] &= 0x7FFFFFF8;
> 
> I think Joel introduced a class mask for this value.

Turns out that the hardware doesn't do any additional masking on the src
register for the HASH_SG_EN operation, so I'll just remove it.

  
>>   
>> +#define ASPEED_HACE_MAX_SG      256
>> +struct aspeed_sg_list {
>> +        uint32_t len;
>> +        uint32_t phy_addr;
>> +} __attribute__ ((__packed__));
>> +> 
> May be keep the definition in the .c file

I actually opted to use #define offsets now that I'm using ldl_le

Thanks,

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

