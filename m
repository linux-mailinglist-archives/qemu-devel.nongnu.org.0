Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539A6CBEFD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:27:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8PY-00079m-K2; Tue, 28 Mar 2023 08:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph8PU-000782-OO
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:26:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ph8PS-0004gS-7v
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:26:44 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SCAeYl005783; Tue, 28 Mar 2023 12:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QW8CB1npbENLUHCfW3LOzFZHDRtIN8+HoNg201aHiJc=;
 b=Z/nbVzICubLHWyxBmBHwpfO4hp6un3Udk38T35TwregzdL6De+6OUR8AdEaZwB6IyWZK
 SPJlQHR11Nk+cXoYlYx/4HP3Dh9CIxRu0EgOscisZTTO+1aklQK/n7QgRptZTSTBYbtv
 R6hFDGS31MjX1YeBn4YJBHel1nphiHuZVhq+i8Syi7WEHPPnfsq9PJxA4zATcOjzFBdj
 3/kBRWBMI/cmwLRxaU/oAEta6VUItIw8ipiGFBtIalMe0+Cf/UNC3FPl7UVnzU/ln2rJ
 GbEu8Rg2yksyLdi4DV6m8TzBOAPGy+fGDKYtfUMxNvk9dWirB7aTvoKRQju27MNhdBTn 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pky9f197r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 12:26:27 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SCBXFN007996;
 Tue, 28 Mar 2023 12:26:26 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pky9f194m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 12:26:26 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32S9HAUc030780;
 Tue, 28 Mar 2023 12:26:18 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3phrk7gkfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 12:26:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32SCQHP415270648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 12:26:17 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8783458059;
 Tue, 28 Mar 2023 12:26:17 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA2675804B;
 Tue, 28 Mar 2023 12:26:16 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Mar 2023 12:26:16 +0000 (GMT)
Message-ID: <ac889ea5-b335-ba77-46b6-6b91966e4da6@linux.ibm.com>
Date: Tue, 28 Mar 2023 08:26:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] qtest: Add functions for accessing devices on Aspeed
 I2C controller
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, ninad@linux.ibm.com, joel@jms.id.au,
 andrew@aj.id.au
References: <20230327202416.3617162-1-stefanb@linux.ibm.com>
 <20230327202416.3617162-2-stefanb@linux.ibm.com>
 <0368d6a6-5f66-9758-6977-818128d928b5@kaod.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <0368d6a6-5f66-9758-6977-818128d928b5@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0wrdbLYkbWjEkdcN0-2s1g8_XOYVUfND
X-Proofpoint-GUID: AU2GXeM0OnLh2PlICGZMtkI2OTR7vBby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 3/28/23 02:39, Cédric Le Goater wrote:
> On 3/27/23 22:24, Stefan Berger wrote:
>> Add read and write functions for accessing registers of I2C devices
>> connected to the Aspeed I2C controller.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> [... ]
> 
>> +#ifndef QTEST_ASPEED_H
>> +#define QTEST_ASPEED_H
>> +
>> +#include <stdint.h>
>> +
>> +#define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
>> +
>> +static inline uint32_t ast2600_aspeed_i2c_calc_dev_addr(uint8_t bus_num)
> 
> I think you could simplify the name ast2600_aspeed_i2c_calc_dev_addr()
> to aspeed_i2c_calc_bus_addr() and add a comment saying it implements only
> the AST2600 I2C controller. I don't think we will need the others.


What are 'the others'?

> 
>> +{
>> +    return AST2600_ASPEED_I2C_BASE_ADDR + 0x80 + bus_num * 0x80;
>> +}
> 
> The formula is :
> 
>     return soc_base + (soc_i2c_offset + bus_num) * soc_i2c_reg_size;

That's what I thought:

return soc_base + soc_i2c_offset + (bus_num * soc_i2c_reg_size);

I will keep it as it is, though.

     Stefan

> 
> May be turn it that way in case you respin. This is minor.
> 
> Thanks,
> 
> C.
> 

