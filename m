Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F258A9F6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 13:11:27 +0200 (CEST)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJvEk-00081t-GJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 07:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oJv7E-0001VB-FL
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:03:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oJv71-0006vs-VR
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 07:03:40 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275AleX9026478;
 Fri, 5 Aug 2022 11:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nbiv7Lt+3vtYV5Ig2/A3JgJQyDXZ79jD4K+QFuNqbC0=;
 b=OKbJHn2zV3BeCR2Qz5EnvV9JoZRfkFg+eivvXs2T3w4ODuR9JSy9EGxarYUBfbUSz158
 SG5XO8oIzXu5tz6hze9NIZdGhCFxIs9oB7+gvNfbhEgunhpJ4hwfv1CEyCvx2WHh4ZZc
 8MD11tdtkwi+o97xufQEGLWBKo/V9lZu5VmMQEi4FDZZJq/8I5DtTHWS8KfovsxOId9T
 wGkZ7steJygLWXZhL6PLhRfQAt310g/HyQ6juppPbrI8NaNSE80z8ksoPG/OqE3xbTbl
 D9lOFztyjI0DAoj4SI9ER8UjN42N8UCHZ+inSa656dhxZbZnE+47HfdVjN1RsXAkV+iS 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs1rk8c86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 11:03:13 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275AraXl013435;
 Fri, 5 Aug 2022 11:03:13 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs1rk8c6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 11:03:13 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275ApeG3001631;
 Fri, 5 Aug 2022 11:03:10 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3hrf2191tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 11:03:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275B38Fd22610240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 11:03:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 573F7A404D;
 Fri,  5 Aug 2022 11:03:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9352A4040;
 Fri,  5 Aug 2022 11:03:07 +0000 (GMT)
Received: from [9.171.39.100] (unknown [9.171.39.100])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 11:03:07 +0000 (GMT)
Message-ID: <ef56a98c-6261-2342-84e4-46796b69cdbb@linux.ibm.com>
Date: Fri, 5 Aug 2022 13:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v2 09/20] hw/ppc: set machine->fdt in pnv_reset()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-10-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220805093948.82561-10-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sTClrSoXhkKGdE9805wkq9iCfNFgJ-_Z
X-Proofpoint-GUID: XLwhZZVBmMe1xGnuJkiA3EvyOSfGRFGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=859
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050054
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05/08/2022 11:39, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
> all powernv machines.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/pnv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d3f77c8367..f5162f8b7b 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -608,7 +608,11 @@ static void pnv_reset(MachineState *machine)
>       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>       cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
>   
> -    g_free(fdt);
> +    /*
> +     * Update the machine->fdt pointer to enable support for
> +     * 'dumpdtb' and 'info fdt' commands.
> +     */
> +    machine->fdt = fdt;


Can pnv_reset() be called several times in the same instance of the qemu 
process, in which case we leak memory?

   Fred


>   }
>   
>   static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)

