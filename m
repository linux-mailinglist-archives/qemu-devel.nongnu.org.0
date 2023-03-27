Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1C6CAD17
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 20:35:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgrgo-00023T-Oi; Mon, 27 Mar 2023 14:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgrgT-0001rD-Lf
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:35:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pgrgQ-000116-Si
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 14:35:08 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RIHqo6022544; Mon, 27 Mar 2023 18:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=k0YOM6mLA1+UodMCOSyTP9dbQ4iYAn4VDUj1/qJChB0=;
 b=dX3miz8xzMhTjkij38Yx+/mikg0KlaUF3NLz9LgfNfJWmoKuaLSjVDROeIWhagHtuaCE
 bwJI3cyg7UlJaTn9m/n6i8FcC8kLQB3tjmCTx4uzEJOSoNcHxG7juxG2f2hUrInrJoMh
 PuSohp3djV41twutNrwyIOsr0lWZwfNditTMoIEl+FQd4HqPXRvAV1OnaZTZZYRFthvh
 cugURT2XufgeIj3atgwnZEas+byrQy7qDJ9YGTCCS7eu7CVsbIanSB1jLPc3XwiVnB8o
 i44yz/8/w4FGuhG0joPrnjgYXLVOjfNdK2yz26ONMMthu2f191suWTaVbIXWZViYJSBe RQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkga38a6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 18:34:58 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RH5Tjh005806;
 Mon, 27 Mar 2023 18:34:56 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3phrk6vky4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 18:34:56 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RIYtfI2621986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 18:34:55 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67E6A58064;
 Mon, 27 Mar 2023 18:34:55 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAE835805C;
 Mon, 27 Mar 2023 18:34:54 +0000 (GMT)
Received: from [9.211.158.228] (unknown [9.211.158.228])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 18:34:54 +0000 (GMT)
Message-ID: <2dd320f1-d3f3-5ea1-ee72-c90716c64ee6@linux.vnet.ibm.com>
Date: Mon, 27 Mar 2023 13:34:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v9 3/3] tpm: Add support for TPM device over I2C bus
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230327181241.4046253-1-ninad@linux.ibm.com>
 <20230327181241.4046253-4-ninad@linux.ibm.com>
 <f648077b-8ca5-d93a-64ee-c9d4a63cbe17@linux.ibm.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <f648077b-8ca5-d93a-64ee-c9d4a63cbe17@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cSZx7okHDeEsHaP3pLLu3LJEusgRuzib
X-Proofpoint-ORIG-GUID: cSZx7okHDeEsHaP3pLLu3LJEusgRuzib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270152
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Stefan,

On 3/27/23 1:26 PM, Stefan Berger wrote:
>
>
> On 3/27/23 14:12, Ninad Palsule wrote:
>
>> diff --git a/hw/tpm/tpm_tis_i2c.c b/hw/tpm/tpm_tis_i2c.c
>> new file mode 100644
>> index 0000000000..551b89dac8
>> --- /dev/null
>> +++ b/hw/tpm/tpm_tis_i2c.c
>> @@ -0,0 +1,527 @@
>> +/*
>> + * Aspeed i2c bus interface for reading from and writing to i2c 
>> device registers
>
> This was my suggestion for the format but this is not the correct line.
>
> With this line reverted to  tpm_tis_i2c.c - QEMU's TPM TIS I2C Device

Sorry about that. Fixed.

Thanks for the review.

Ninad

>
>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Tested-by: Stefan Berger <stefanb@linux.ibm.com>

