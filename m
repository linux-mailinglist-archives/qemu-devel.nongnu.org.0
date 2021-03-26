Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0734ACD3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 17:49:07 +0100 (CET)
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPpdy-0004ZU-OC
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 12:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPpch-00040b-C6; Fri, 26 Mar 2021 12:47:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPpce-0002MJ-FJ; Fri, 26 Mar 2021 12:47:47 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QGYRRH103078; Fri, 26 Mar 2021 12:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=C8lPfLzbtONMUqTtkxIAJY/hW/S9FphwlxjGvg02yeg=;
 b=I2iRw2EirDupVu6WxtsQSAK0Vq7YfGE73FwyVBK+DhHgf5mZZYO1POnWZlqi9kwCbYf2
 hI8i9lGwLHEU8im3MX0Xh76U6AFK2qmE/8+VxiILPl7CB7WracvYrdVR75DUHuEx7Q4O
 jgMyDGoC+mOfgZ1mv4qN2JBifuHNwXqc4ecTcK5DJN1c0LkQV+3KO7nU06AQvTe1YBG0
 hs+IftHHAzumnhZZ3T7jLO8+d8ogo5VQMOViv2KyjgHwvt+Dct8DoSt4EtbeAdJr+fcb
 uqGngWLChokbsgs9VD2P3Ek5agZF+c92jci0JrhX0mvS2ho9cQEDuJSoBnRdDqbjwMAS ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hhsyk6u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 12:47:33 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QGdd0c122810;
 Fri, 26 Mar 2021 12:47:33 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hhsyk6tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 12:47:32 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QGhdBb029571;
 Fri, 26 Mar 2021 16:47:32 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 37h150g76y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 16:47:32 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QGlUfL31523248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 16:47:31 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E19FEBE053;
 Fri, 26 Mar 2021 16:47:30 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B02A8BE04F;
 Fri, 26 Mar 2021 16:47:28 +0000 (GMT)
Received: from [9.85.195.191] (unknown [9.85.195.191])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 16:47:28 +0000 (GMT)
Subject: Re: [PATCH 2/3] aspeed: Add Scater-Gather support for HACE Hash
To: Joel Stanley <joel@jms.id.au>
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
 <20210324223846.17407-3-klaus@linux.vnet.ibm.com>
 <CACPK8XcZDyip9s+xN+HP5_Z7S_v8zY6tGRVbD83uaCT=kfprWw@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <f3342a43-2c2f-5ecc-7519-8225ca203185@linux.vnet.ibm.com>
Date: Fri, 26 Mar 2021 13:47:26 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XcZDyip9s+xN+HP5_Z7S_v8zY6tGRVbD83uaCT=kfprWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gjqBa7LeE1e5qycj8ElYpo32Ewec7wJT
X-Proofpoint-ORIG-GUID: 8SIYf7mPcxq-6WNp5ZDPchXjhjrnWnPR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_06:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2103250000 definitions=main-2103260124
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

On 3/25/2021 12:40 AM, Joel Stanley wrote:
> On Wed, 24 Mar 2021 at 22:39, Klaus Heinrich Kiwi
> <klaus@linux.vnet.ibm.com> wrote:
>>
>> Complement the Aspeed HACE support with Scatter-Gather hash support for
>> sha256 and sha512. Scatter-Gather is only supported on AST2600-series.
> 
> Please update the documentation at docs/system/arm/aspeed.rst too.
>
I've removed the 'no scatter-gather' from the doc.

>> +                                                                   false,
>> +                                                 MEMTXATTRS_UNSPECIFIED);
> 
> In the direct access code, we use address_space_map to save copying
> the memory contents that is to be hashed. That's not the case for the
> scatter gather list.
> 
> Instead of creating mappings to read the sg list, you could load the
> addr, len pairs using address_space_ldl_le. This would give you the
> pointer to create mappings for.

I've reworked the code to use address_space_ldl_le, also removed the redundant
isLast variable.

  
>> +    /*
>> +     * Set status bits to indicate completion. Testing shows hardware sets
>> +     * these irrespective of HASH_IRQ_EN.
> 
> This is the same comment from the direct method. Have you confirmed
> this is true on hardware?
> 
Yes, I was able to confirm that on real hardware (AST2600-A1)

>> -        do_hash_operation(s, algo);
>> +        if (data & HASH_SG_EN) {
>> +            s->regs[(R_HASH_SRC >> 2)] &= 0x7FFFFFF8;
> 
> This is setting (0x20 / 4) >> 2 == 2, which is Crypto Data
> Destination. I suspect you wanted R_HASH_SRC, so you can omit the
> right shift.
> 
> However I suggest you check that hardware masks the register when the
> write occurs, and if it does, implement that in the write callback for
> R_HASH_SRC. That way a guest code doing a read-write will see the
> correct thing.

I was able to check on real hardware that, even when requesting a
HASH_SG_EN operation, the masking on the src address register is only
0x7fffffff, so I removed the masking specific to HASH_SG_EN.


>>   };
>>
>> +#define ASPEED_HACE_MAX_SG      256
>> +struct aspeed_sg_list {
>> +        uint32_t len;
>> +        uint32_t phy_addr;
> 
> Does "phy" mean physical? If so, we could call it phys_addr to avoid
> confusion with the addresses of PHYs.
> 
> Alternatively, call it 'addr'.

Since I'm not using address_map_ldl_le to access these, I decided to
do so based on #defines offsets, so I no longer need a Struct here.


Will send a V2 soon.

Thanks,

  -Klaus
-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

