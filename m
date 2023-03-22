Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D16C3FC0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 02:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1penJ1-0000i9-1u; Tue, 21 Mar 2023 21:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1penIy-0000hz-Md
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 21:30:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1penIv-0003v7-Ap
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 21:30:20 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32M0Sc7F019576; Wed, 22 Mar 2023 01:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uMcK909sTy5fMLSDvqCVv9Mh9kS2JG2W8+dpakfhHmc=;
 b=l0cTXnZ/EpQBFZZMqFZgCGHlPQFXa5ns2/TgwWn3BR7/A3AnrJYV57ywxgm4+zefwZC2
 fqOCTvJHbWuQ7YlKZbCeRR8TYjDmz52lzDrb4TZXqJVDMABFXqFmUqcj9ldpxSmBBZvw
 2JggDEuYpwvF8uaEw8B0wocST+Heul+VoRwFIXphQFr0evTLyez2EbVqPCBPuG1Ofror
 MT2O63y2cUNz3rkmMvW0Fr/dymO4yPzhvjiFHCynLQNLZi2DUmJNS8eCVXBitQi6Ow/M
 KOO8ErwIxsnWXVhSFK621Dno7IfJa5/zXWAoXuMUIVi0lEvt+XxgEkGWfmiaNVPoErTd 7A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfq5vs0u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 01:30:06 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M11xcg009111;
 Wed, 22 Mar 2023 01:30:05 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x75s80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 01:30:05 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32M1U4KV55575020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Mar 2023 01:30:04 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80E355806B;
 Wed, 22 Mar 2023 01:30:04 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35FD55805D;
 Wed, 22 Mar 2023 01:30:04 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 22 Mar 2023 01:30:04 +0000 (GMT)
Message-ID: <2d32bfa7-0804-c046-bb8c-ca30d400ed4a@linux.ibm.com>
Date: Tue, 21 Mar 2023 21:30:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org
Cc: joel@jms.id.au, andrew@aj.id.au, clg@kaod.org
References: <20230321053001.3886666-1-ninad@linux.ibm.com>
 <20230321053001.3886666-4-ninad@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230321053001.3886666-4-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OR7ZxH0Zk_iWTkJi-QeHp2AAmNOzx_Ir
X-Proofpoint-ORIG-GUID: OR7ZxH0Zk_iWTkJi-QeHp2AAmNOzx_Ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220005
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



On 3/21/23 01:30, Ninad Palsule wrote:
> Qemu already supports devices attached to ISA and sysbus. This drop adds
> support for the I2C bus attached TPM devices. I2C model only supports
> TPM2 protocol.
> 

> +
> +/* Send data to TPM */
> +static inline void tpm_tis_i2c_tpm_send(TPMStateI2C *i2cst)
> +{
> +    if ((i2cst->operation == OP_SEND) && (i2cst->offset > 1)) {
> +        uint16_t tis_reg;
> +        uint32_t data;
> +        int      i;
> +
> +        tis_reg = tpm_tis_i2c_to_tis_reg(i2cst->data[0], &i2cst->size);
> +
> +        /* Index 0 is always a register */
> +        for (i = 1; i < i2cst->offset; i++) {
> +            data = (i2cst->data[i] & 0xff);
> +            tpm_tis_write_data(&i2cst->state, tis_reg, data, 1);
> +        }


I think there should be tpm_tis_set_data_buffer function that you can call rather than transferring the data byte-by-byte.

Thanks for the series!

   Stefan

