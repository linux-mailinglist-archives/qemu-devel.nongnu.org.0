Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ADF48BFE7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:29:57 +0100 (CET)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Z12-00061K-5v
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1n7Yly-0005bZ-8W; Wed, 12 Jan 2022 03:14:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1n7Ylw-0008FK-0l; Wed, 12 Jan 2022 03:14:21 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C78Fne028193; 
 Wed, 12 Jan 2022 08:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=f/W9nlr2Kbq99c4vPKZAUlCcuKpooyQ7FhguTClaer0=;
 b=eR5SZHeofyLzfNs321BSqZpJvJ3tLq/moPgNzjZWs69EovAtGMX/znzpyCPXLvw2NE+F
 YlkIwXJLY5mPVYCFqzXLAlVVGtxjbc8phhDGfP0kGFqCGT8NoISo4din7Pv5AuIVkp50
 83OfYvHhCMHGnxdWgB/ZZzGsA/6Ugtgf40LM4RgdOB3xVwPCXWH4QAhmDPfyma8pOcP6
 7Ctr5Cyn5HvqkdxLJa7DzmL9lByosTrjZ/4xh/xuhiXlz4v2BdrJ6qCkyISid0dHAOVz
 jrKLhd1oE7/LwZst6m+eLj0sGFMfP6JDIBwXZpeoPg/4Z9Ha07E/qMQdTV8BN8jQYs8i qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhqj7uxcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 08:14:05 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20C84itn010547;
 Wed, 12 Jan 2022 08:14:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhqj7uxbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 08:14:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C8C0gC019911;
 Wed, 12 Jan 2022 08:14:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vj70xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 08:14:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20C8E18E43450794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 08:14:01 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E99D7A4066;
 Wed, 12 Jan 2022 08:14:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2405BA405B;
 Wed, 12 Jan 2022 08:14:00 +0000 (GMT)
Received: from [9.145.161.113] (unknown [9.145.161.113])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 08:14:00 +0000 (GMT)
Message-ID: <9236e29a-eb80-f7ec-75a5-ca0c9c1c3783@linux.ibm.com>
Date: Wed, 12 Jan 2022 09:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/1] ppc/pnv: use stack->pci_regs[] in
 pnv_pec_stk_pci_xscom_write()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220111200132.633896-1-danielhb413@gmail.com>
 <20220111200132.633896-2-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220111200132.633896-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q6NxZxN6AgZFxxubxaHBhgd9NvOAKEMI
X-Proofpoint-ORIG-GUID: 9Hn4gSOmDU7eg1v4OIW0d2SIl8D1oncM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120050
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/01/2022 21:01, Daniel Henrique Barboza wrote:
> pnv_pec_stk_pci_xscom_write() is pnv_pec_stk_pci_xscom_ops write
> callback. It writes values into regs in the stack->nest_regs[] array.
> The pnv_pec_stk_pci_xscom_read read callback, on the other hand, returns
> values of the stack->pci_regs[]. In fact, at this moment, the only use
> of stack->pci_regs[] is in pnv_pec_stk_pci_xscom_read(). There's no code
> that is written anything in stack->pci_regs[], which is suspicious.
> 
> Considering that stack->nest_regs[] is widely used by the nested
> MemoryOps pnv_pec_stk_nest_xscom_ops, in both read and write callbacks,
> the conclusion is that we're writing the wrong array in
> pnv_pec_stk_pci_xscom_write(). This function should write stack->pci_regs[]
> instead.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


I guess it shows how much those registers are used with our model :-) 
They are mostly FIR registers...
Looks good to me.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   hw/pci-host/pnv_phb4.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index be29174f13..a7b638831e 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1086,39 +1086,39 @@ static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
>   
>       switch (reg) {
>       case PEC_PCI_STK_PCI_FIR:
> -        stack->nest_regs[reg] = val;
> +        stack->pci_regs[reg] = val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_CLR:
> -        stack->nest_regs[PEC_PCI_STK_PCI_FIR] &= val;
> +        stack->pci_regs[PEC_PCI_STK_PCI_FIR] &= val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_SET:
> -        stack->nest_regs[PEC_PCI_STK_PCI_FIR] |= val;
> +        stack->pci_regs[PEC_PCI_STK_PCI_FIR] |= val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_MSK:
> -        stack->nest_regs[reg] = val;
> +        stack->pci_regs[reg] = val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_MSKC:
> -        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
> +        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_MSKS:
> -        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
> +        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_ACT0:
>       case PEC_PCI_STK_PCI_FIR_ACT1:
> -        stack->nest_regs[reg] = val;
> +        stack->pci_regs[reg] = val;
>           break;
>       case PEC_PCI_STK_PCI_FIR_WOF:
> -        stack->nest_regs[reg] = 0;
> +        stack->pci_regs[reg] = 0;
>           break;
>       case PEC_PCI_STK_ETU_RESET:
> -        stack->nest_regs[reg] = val & 0x8000000000000000ull;
> +        stack->pci_regs[reg] = val & 0x8000000000000000ull;
>           /* TODO: Implement reset */
>           break;
>       case PEC_PCI_STK_PBAIB_ERR_REPORT:
>           break;
>       case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
>       case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
> -        stack->nest_regs[reg] = val;
> +        stack->pci_regs[reg] = val;
>           break;
>       default:
>           qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWADDR_PRIx

