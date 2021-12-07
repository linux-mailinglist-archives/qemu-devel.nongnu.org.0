Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88346B868
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:05:02 +0100 (CET)
Received: from localhost ([::1]:38940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXLI-0007TU-Si
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:05:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXIU-0004i4-Qj; Tue, 07 Dec 2021 05:02:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20860
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXIT-0002DM-Av; Tue, 07 Dec 2021 05:02:06 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79I2j6020406; 
 Tue, 7 Dec 2021 10:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dLZdSV91/87OHeq2Ttn3gDz0tspMhpUMvRREGcw6ugU=;
 b=RJNT/MfVD1OdKDMiRzbQmppocCMiHdXlwCLTFQAi0TXW8YMwpQy8dQ6wRknRchSakA/9
 sFsnM3N3BImlmRu95ci/zGFx6qYXrm5SC5h1FTGk2LzSopQuRCzLZ9FCwmSBiAYoRMe6
 CFYJ4qjGoXv6lVwDeSqL5x+MI1y5ukisH4S+yVYC48OphxzWmQMfoxl5q77vMhZx0Z5K
 H4QPob5pcPefTSvYdTuNaGM+YC8H1BwKLJLgLE0zZucPC/+PdQVMPhUULsRQFceWt3sp
 N/b/uwd7iPQ+a/GtGkHLorOJ2YNlnF1YqTNm1cQ7bEqnj4ZweN7J2DdlDLHXdRluy0JJ /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ct4v10r5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:02:02 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B7A1SBc012573;
 Tue, 7 Dec 2021 10:02:02 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ct4v10r58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:02:02 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7A1oKK026653;
 Tue, 7 Dec 2021 10:02:00 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3cqyy9vwwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:02:00 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7A1wBi25559478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 10:01:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2527411C064;
 Tue,  7 Dec 2021 10:01:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCB1811C05C;
 Tue,  7 Dec 2021 10:01:57 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 10:01:57 +0000 (GMT)
Message-ID: <ce2e810c-a27f-9dc9-d935-65172bbc6624@linux.ibm.com>
Date: Tue, 7 Dec 2021 11:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 09/14] ppc/pnv: Introduce a "chip" property under the PHB4
 model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-10-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-10-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OXbLn22x3hMKfHbGFGwYjtpnmuVzNkRQ
X-Proofpoint-ORIG-GUID: fEzDJxq3uuoILxlgAtXuhltPRIYX_mZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 mlxlogscore=846 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070060
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/12/2021 15:42, Cédric Le Goater wrote:
> Next changes will make use of it.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   include/hw/pci-host/pnv_phb4.h | 2 ++
>   hw/pci-host/pnv_phb4_pec.c     | 2 ++
>   hw/ppc/pnv.c                   | 2 ++
>   3 files changed, 6 insertions(+)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index b2864233641e..8a585c9a42f7 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -205,6 +205,8 @@ struct PnvPhb4PecState {
>       #define PHB4_PEC_MAX_STACKS     3
>       uint32_t num_stacks;
>       PnvPhb4PecStack stacks[PHB4_PEC_MAX_STACKS];
> +
> +    PnvChip *chip;
>   };
>   
>   
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 9f722729ac50..e9750c41c595 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -462,6 +462,8 @@ static Property pnv_pec_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
>           DEFINE_PROP_UINT32("num-stacks", PnvPhb4PecState, num_stacks, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
> +        DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
> +                         PnvChip *),
>           DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory,
>                        TYPE_MEMORY_REGION, MemoryRegion *),
>           DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 0c65e1e88cf5..76b2f5468b38 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1389,6 +1389,8 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>                                   &error_fatal);
>           object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
>                                   &error_fatal);
> +        object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
> +                                 &error_fatal);
>           object_property_set_link(OBJECT(pec), "system-memory",
>                                    OBJECT(get_system_memory()), &error_abort);
>           if (!qdev_realize(DEVICE(pec), NULL, errp)) {
> 

