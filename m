Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E385B00E5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:51:40 +0200 (CEST)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrid-0003oI-Jr
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oVqvL-0006YR-DY; Wed, 07 Sep 2022 05:00:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oVqvI-0004Yu-IR; Wed, 07 Sep 2022 05:00:43 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2878imGO020665;
 Wed, 7 Sep 2022 09:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xHAo9EiwdCI0aG3HRVuX6EWJBdZd62P22NIE8925ReM=;
 b=VJjDwO3jbFgz4BZLb63UoAhMVj1pBSJyUTehv02DHsEa1K578+LfB+ak6FLyHxAsGdLu
 zm50YA3o5LVqxD0E8cFzXotpKooQnyzyaqkAZIP2ThFirCdQX3+HWi4SBNANxfvlk/ZH
 1La6pZly8+zcY/AhLdQNK3/jnXZiHDxCrxJbBbkIVsVIV9a9d3kmsiqSTnQDTwyPxfST
 Q6Sa0e89+Dka6s/UeAVIvTFOu4/n51Yo9kMIbjYNAaRRe5u0/8kDPp8CQtyWvkrptJ1q
 Ajl2kDJcq9gzr8nalNlDr4hj6wmDyDlBRuk+25X+AS1dHUgFRj2GjczTSsmZDQlr5Wzd hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jer2d0cmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 09:00:27 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2878u4Yb031143;
 Wed, 7 Sep 2022 09:00:27 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jer2d0ck2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 09:00:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2878o4aZ021120;
 Wed, 7 Sep 2022 09:00:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3jbx6hmwqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 09:00:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2878uqtk43385098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Sep 2022 08:56:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F97511C052;
 Wed,  7 Sep 2022 09:00:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7DE711C04C;
 Wed,  7 Sep 2022 09:00:21 +0000 (GMT)
Received: from [9.171.75.33] (unknown [9.171.75.33])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Sep 2022 09:00:21 +0000 (GMT)
Message-ID: <e0a57a98-5de3-11aa-c8e5-9103ce933711@linux.ibm.com>
Date: Wed, 7 Sep 2022 11:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 09/14] hw/ppc: set machine->fdt in pnv_reset()
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220904233456.209027-1-danielhb413@gmail.com>
 <20220904233456.209027-10-danielhb413@gmail.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220904233456.209027-10-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JAGxi2k9zuz5pkULzgOGM3c3R5XPlj7d
X-Proofpoint-GUID: xeJcD9BBw5tPOixxgbLRLA8Icz4fepmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_04,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=931 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070035
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.752,
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



On 05/09/2022 01:34, Daniel Henrique Barboza wrote:
> This will enable support for the 'dumpdtb' QMP/HMP command for
> all powernv machines.
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


LGTM
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/ppc/pnv.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 354aa289d1..6a20c4811f 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -678,7 +678,13 @@ static void pnv_reset(MachineState *machine)
>       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>       cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
>   
> -    g_free(fdt);
> +    /*
> +     * Set machine->fdt for 'dumpdtb' QMP/HMP command. Free
> +     * the existing machine->fdt to avoid leaking it during
> +     * a reset.
> +     */
> +    g_free(machine->fdt);
> +    machine->fdt = fdt;
>   }
>   
>   static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)

