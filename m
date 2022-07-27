Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C1B5831C7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:16:57 +0200 (CEST)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlaa-0006U3-FF
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl9g-0001UO-QR; Wed, 27 Jul 2022 13:49:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl9e-0001cI-Tz; Wed, 27 Jul 2022 13:49:08 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHfw8a031402;
 Wed, 27 Jul 2022 17:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xnPkk6g4UHdFfgx7epqcyeZdQ+Z1FF9JnDgQwxfi51M=;
 b=jg/vcn+AjjfONSU4av8sBjGAimFSaV/XKMCls8+e8GUE61L6Xah5Pf9oWVp6CEGK/gJ1
 WvcIwgSuJWEuh45XnGA45VME4/n2Mp+/uM21gcIGSy7E6qPF06FS7uLhE5cArkAvFhX0
 BC9zjdYzm8kgqgexXOQyikC4AbWD+sPtSO55KYykfyzCTfzTzNlVjTJ5jrooBhCAbm2o
 8HcW7PlYNuTedJ1DpzJTmXYtNl0tlzepbVJ4UtI04OMgPPWn9CqAQmYJmckcaWl5KPmj
 PSG1MuPsnjUWIQlj9zmsINi1u9HJYtOkGQcke04d0MPIw0um5fAK8UIDEfPo5a+BgiZ0 qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka0387nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:49:02 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHhQIu037742;
 Wed, 27 Jul 2022 17:49:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka0387mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:49:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHZfsI032719;
 Wed, 27 Jul 2022 17:43:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3hg946dcug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26RHftij22348140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:41:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE9FC11C050;
 Wed, 27 Jul 2022 17:43:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9710511C04C;
 Wed, 27 Jul 2022 17:43:56 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:43:56 +0000 (GMT)
Message-ID: <a5a29a50-7877-9e7a-74dd-723acfaa77b9@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 10/12] ppc/pnv: remove pecc->rp_model
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-11-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-11-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bXv2QaPOlSkoUGFlWderRQ5lfqtjCewL
X-Proofpoint-GUID: BInsMoqN3TzZv1XDcwx3teGq9rISf1l8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270074
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



On 24/06/2022 10:49, Daniel Henrique Barboza wrote:
> The attribute is unused.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb4_pec.c     | 2 --
>   include/hw/pci-host/pnv_phb4.h | 1 -
>   2 files changed, 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 0ef66b9a9b..8dc363d69c 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -260,7 +260,6 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
>       pecc->version = PNV_PHB4_VERSION;
>       pecc->phb_type = TYPE_PNV_PHB4;
>       pecc->num_phbs = pnv_pec_num_phbs;
> -    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
>   }
>   
>   static const TypeInfo pnv_pec_type_info = {
> @@ -313,7 +312,6 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
>       pecc->version = PNV_PHB5_VERSION;
>       pecc->phb_type = TYPE_PNV_PHB5;
>       pecc->num_phbs = pnv_phb5_pec_num_stacks;
> -    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
>   }
>   
>   static const TypeInfo pnv_phb5_pec_type_info = {
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 29c49ac79c..61a0cb9989 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -200,7 +200,6 @@ struct PnvPhb4PecClass {
>       uint64_t version;
>       const char *phb_type;
>       const uint32_t *num_phbs;
> -    const char *rp_model;
>   };
>   
>   /*

