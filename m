Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A13646B861
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:04:16 +0100 (CET)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXKZ-0005ip-Bz
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:04:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXI0-00040d-2j; Tue, 07 Dec 2021 05:01:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53254
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXHy-00026c-AO; Tue, 07 Dec 2021 05:01:35 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79HwCx019747; 
 Tue, 7 Dec 2021 10:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NONC2H0JZd6jC5pRhwLQWrxgELqAuI5PGdU38LzuVVg=;
 b=T+/I4mithbi/vorvtChh1KYtQ8r05CmttEQgngr+waf7YVZppWtJtvZM0dFo3HQqZFJI
 oL67g1K3FDeaVDix7u3uhY+D3Nkq+zETABVd33nbDy0x6Wr21rjogkYh2OD4ncM9GhEI
 kBxqlW2mES8lzdL6GPm5q37sQzvwYgFo27jNIRhxdj6kDF22jxN9JkCdp2RAPSK2DYlQ
 t6KAL5gbgVTcFda66Mh/zbNV4ERtjsce1MF3KxKVUWERyUHajDtyoO9pU7WuuPe5ZVp0
 gaXig5evPlbjU7AVfwGaGEL4IKRaYbFmexnCnM3Ho0kAbKuRasvj1u3CZCeAvTKgSINW iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ct4v10qt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:01:31 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79wnGI004642;
 Tue, 7 Dec 2021 10:01:30 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ct4v10qsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:01:30 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B79q6EW006412;
 Tue, 7 Dec 2021 10:01:29 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3cqyy9bvks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:01:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7A1QRY25231806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 10:01:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 827B011C058;
 Tue,  7 Dec 2021 10:01:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DBC311C075;
 Tue,  7 Dec 2021 10:01:26 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 10:01:26 +0000 (GMT)
Message-ID: <3d301cf4-2130-9422-011f-c4d961539ec6@linux.ibm.com>
Date: Tue, 7 Dec 2021 11:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 08/14] ppc/pnv: Introduce version and device_id class
 atributes for PHB4 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-9-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-9-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QMMIS6w5cIdampd0eHachZcCT921hzh7
X-Proofpoint-ORIG-GUID: -KlKaLqlUvQ62Z8mU_oKoAbdn7ffU--Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
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
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


Empty log message ok in qemu?
But it looks ok to me.
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   include/hw/pci-host/pnv_phb4.h | 2 ++
>   hw/pci-host/pnv_phb4_pec.c     | 2 ++
>   hw/ppc/pnv.c                   | 4 ++--
>   3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 27556ae53425..b2864233641e 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -219,6 +219,8 @@ struct PnvPhb4PecClass {
>       int compat_size;
>       const char *stk_compat;
>       int stk_compat_size;
> +    uint64_t version;
> +    uint64_t device_id;
>   };
>   
>   #endif /* PCI_HOST_PNV_PHB4_H */
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 741ddc90ed8d..9f722729ac50 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -499,6 +499,8 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->compat_size = sizeof(compat);
>       pecc->stk_compat = stk_compat;
>       pecc->stk_compat_size = sizeof(stk_compat);
> +    pecc->version = PNV_PHB4_VERSION;
> +    pecc->device_id = PNV_PHB4_DEVICE_ID;
>   }
>   
>   static const TypeInfo pnv_pec_type_info = {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 185464a1d443..0c65e1e88cf5 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1408,9 +1408,9 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>               object_property_set_int(obj, "index", phb_id, &error_fatal);
>               object_property_set_int(obj, "chip-id", chip->chip_id,
>                                       &error_fatal);
> -            object_property_set_int(obj, "version", PNV_PHB4_VERSION,
> +            object_property_set_int(obj, "version", pecc->version,
>                                       &error_fatal);
> -            object_property_set_int(obj, "device-id", PNV_PHB4_DEVICE_ID,
> +            object_property_set_int(obj, "device-id", pecc->device_id,
>                                       &error_fatal);
>               object_property_set_link(obj, "stack", OBJECT(stack),
>                                        &error_abort);
> 

