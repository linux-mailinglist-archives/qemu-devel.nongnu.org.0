Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81546B82A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:55:56 +0100 (CET)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXCV-00006z-Fj
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXAI-0006zq-2Z; Tue, 07 Dec 2021 04:53:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXAG-0007cC-Hn; Tue, 07 Dec 2021 04:53:37 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79HBdg007799; 
 Tue, 7 Dec 2021 09:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TxdIZjjO0IcyWAq44AGmZi0L+8NKPCuL+hrFsWg+b+Y=;
 b=VfFZAdV1tMhnmHgdsWXEdABaLJutljcwS+F49g7ipIHetVOUC7ZIORBXcA+hZU8JYTi6
 4AFLVSnnzqLKjtpQfRHbvvGrDgr3a9hPzJmAnPVs5mc5PbKRT9GSsmJQxNbmZpyMTdHG
 GW0h2oHtgojvq+C1yzPyyk6nl+C+7l4Vv99Wiah3/ARQ/dSJWRE8TkXrZRJk0wQ3mV6x
 t79PUEJC7T+rTG5d24v8f8oprpEW1EBsMVSjxCOlbt/Qbk5lz735MEAIhRICct2qwdgp
 ENVMxs9iYf8B9TLPq5BNyNGhZ8PUcwtuN9Vr1zsJHryGS1n9LT1v4m/ghWXgBjulgE+F lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4umgkw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:53:27 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79mwOJ004253;
 Tue, 7 Dec 2021 09:53:26 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4umgkvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:53:26 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B79qlOX014175;
 Tue, 7 Dec 2021 09:53:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3cqyy9bufr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:53:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B79rLn322151452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 09:53:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDC5111C04C;
 Tue,  7 Dec 2021 09:53:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C9DF11C058;
 Tue,  7 Dec 2021 09:53:21 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 09:53:21 +0000 (GMT)
Message-ID: <e3c2344f-a4bd-59c6-7dff-428e2d70a120@linux.ibm.com>
Date: Tue, 7 Dec 2021 10:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 06/14] ppc/pnv: Complete user created PHB3 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-7-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-7-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BOSFll02a1h_eiIadbEGnJ6iAmYtRZIE
X-Proofpoint-ORIG-GUID: GQphU73bVYyuklDwo6_7q3VPbhDVtg2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070056
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/12/2021 15:42, Cédric Le Goater wrote:
> PHB3s ared SysBus devices and should be allowed to be dynamically
> created.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

This one is a bit of black magic for me. I don't see an equivalent for 
P9 though. Not needed there? I'll have another comment about P8/P9 later.

   Fred


>   hw/pci-host/pnv_phb3.c | 9 +++++++++
>   hw/ppc/pnv.c           | 2 ++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index e91f658b0060..b61f9c369f64 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1000,6 +1000,9 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   
>       /* User created devices */
>       if (!phb->chip) {
> +        Error *local_err = NULL;
> +        BusState *s;
> +
>           phb->chip = pnv_get_chip(pnv, phb->chip_id);
>           if (!phb->chip) {
>               error_setg(errp, "invalid chip id: %d", phb->chip_id);
> @@ -1011,6 +1014,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>            * correctly the device tree.
>            */
>           pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
> +
> +        s = qdev_get_parent_bus(DEVICE(phb->chip));
> +        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
>       }
>   
>       /* LSI sources */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 9a458655efd9..45d8ecbf2bf7 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1927,6 +1927,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>   
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB3);
>   }
>   
>   static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
> 

