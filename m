Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444FB53AE64
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 22:57:47 +0200 (CEST)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwVPV-0005ey-U1
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 16:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nwVNa-0004qN-CE
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 16:55:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nwVNY-000095-FT
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 16:55:46 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251KrUIu026156;
 Wed, 1 Jun 2022 20:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0iTWoSE51/PREZi/t5d0dG+sJedHS5Cv4kidrRNYJFw=;
 b=LYDIxGkrf33zxCBdNpZ9H5nTeXocDNJWPEjv0IQJl3nBtGn+YS0zoPmhRUk790qs5NLw
 Ird76LCQ7IACuilKZPnb6DbSZg3u+eJ/S32oSalDO/rt9nPwM7/Q9ZFFRaj5UHzbAgX7
 +NiHHplzoezLUy7FrKT0A4BoOsVdxNRKyMpOIhjVD95SB7FvCjP7y6nT/bHqTXLHdBGL
 8IPUGzh02RSEdYmNWnfn90cV6UHY4HuvyraQc7JzZDXpqaADd5WT86ed8XpunaHmZnh0
 9d1MUu4+wzIRBIcju12bUliE6XBMDmJ7+igCDByo4hnhnVD/uRQ0m59UdpdqmvzoTGRV yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gefhx80r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jun 2022 20:55:39 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 251KsQ72032340;
 Wed, 1 Jun 2022 20:55:39 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gefhx80qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jun 2022 20:55:39 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 251Ka1k0029821;
 Wed, 1 Jun 2022 20:55:38 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3gbc92x43n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jun 2022 20:55:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 251Ktbch13042120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jun 2022 20:55:37 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49CA3BE054;
 Wed,  1 Jun 2022 20:55:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E349ABE051;
 Wed,  1 Jun 2022 20:55:36 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jun 2022 20:55:36 +0000 (GMT)
Message-ID: <db22a238-0b10-20d2-616d-53094098a465@linux.ibm.com>
Date: Wed, 1 Jun 2022 16:55:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] tpm_crb: mark command buffer as dirty on request
 completion
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220411144749.47185-1-anthony.perard@citrix.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220411144749.47185-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CnBbxQEOwaB_NstD46GeyY6BoUw9SUnU
X-Proofpoint-ORIG-GUID: pc6qf_S-dnjUULUgrDx8TUn40sdTEK5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_08,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010083
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
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



On 4/11/22 10:47, Anthony PERARD via wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> At the moment, there doesn't seems to be any way to know that QEMU
> made modification to the command buffer. This is potentially an issue
> on Xen while migrating a guest, as modification to the buffer after
> the migration as started could be ignored and not transfered to the
> destination.
> 
> Mark the memory region of the command buffer as dirty once a request
> is completed.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>



> ---
> 
> I have only read code to find out whether the tpm-crb device was fine
> with regards to migration, and I don't think there's anything that
> could mark the memory region as dirty once a request is completed.
> 
> There is one call to memory_region_get_ram_ptr(), but nothing seems to
> be done with the pointer is regards to ram migration. Am I wrong?
> 
> Thanks.
> ---
>   hw/tpm/tpm_crb.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index aa9c00aad3..67db594c48 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -197,6 +197,7 @@ static void tpm_crb_request_completed(TPMIf *ti, int ret)
>           ARRAY_FIELD_DP32(s->regs, CRB_CTRL_STS,
>                            tpmSts, 1); /* fatal error */
>       }
> +    memory_region_set_dirty(&s->cmdmem, 0, CRB_CTRL_CMD_SIZE);
>   }
> 
>   static enum TPMVersion tpm_crb_get_version(TPMIf *ti)

