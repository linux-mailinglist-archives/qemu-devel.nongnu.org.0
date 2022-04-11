Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DCA4FC271
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:32:38 +0200 (CEST)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndwxx-000514-HP
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ndwwb-0004G3-Qz
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:31:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ndwwZ-0000BL-Jg
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:31:13 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BF2vKh004195; 
 Mon, 11 Apr 2022 16:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=u5DYKQ5ZW+tnHjUVbHeGgkXf9pntIG+XKcG9ofTrFZ0=;
 b=GEHgwi8I2Xac49Z707YRaHN6R8TM6zRO9h4tJ6E/E2GRF+pYsv9jaUaZUOQW6V0AP8hf
 dLvQYpM+GG/SYa/rzJk/6RVNzIqWqulL5ZinlQD04ltXMWANSqpMq+xGO3iuQM8zQHrU
 hrv3LSjFj20bWivhEbi0uQZ2w9c6du4JYXEcdNJxFvQ0Np/6PTxLd8X+IQSvVaHKZhJH
 ZR4qvkIdaaQDQ82p7zoEZzQzaX+U0JtAuz9HGxEBa0fm7Co3bAdAr2AcWgGEPJvijc54
 RhldBrR6sMiK4EZ0zeqBxwcOID7obV3kSCruMulV7WRPmpnBD3Gt1lWwhMDv12qSUK5e 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcpmghv08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:31:06 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BGETab026530;
 Mon, 11 Apr 2022 16:31:06 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcpmghuyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:31:06 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BGRqt3021178;
 Mon, 11 Apr 2022 16:31:03 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3fb1s9n7hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:31:03 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23BGV2Gp31785290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 16:31:02 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DE2C6A057;
 Mon, 11 Apr 2022 16:31:02 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 465B76A051;
 Mon, 11 Apr 2022 16:31:02 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Apr 2022 16:31:02 +0000 (GMT)
Message-ID: <1610a1ff-435e-e286-6bd7-a820630b865d@linux.ibm.com>
Date: Mon, 11 Apr 2022 12:31:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] tpm_crb: mark command buffer as dirty on request
 completion
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20220411144749.47185-1-anthony.perard@citrix.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220411144749.47185-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FmdWrNwIGOWgMJFzUp6RluQXpSY724nT
X-Proofpoint-GUID: vO_5xC1E_fKPcbZsDRFMDI9hg4kcPgao
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_06,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110091
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/11/22 10:47, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> At the moment, there doesn't seems to be any way to know that QEMU
> made modification to the command buffer. This is potentially an issue
> on Xen while migrating a guest, as modification to the buffer after
> the migration as started could be ignored and not transfered to the
> destination. >
> Mark the memory region of the command buffer as dirty once a request
> is completed.

Not sure about the CRB...

The TIS at least carries the buffer as part of the state and stores it 
when the interface is saved:

https://github.com/qemu/qemu/blob/v6.2.0/hw/tpm/tpm_tis_isa.c#L56
https://github.com/qemu/qemu/blob/v6.2.0/hw/tpm/tpm_tis_sysbus.c#L56

With the CRB the memory is registered using these functions.

     memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
         "tpm-crb-mmio", sizeof(s->regs));
     memory_region_init_ram(&s->cmdmem, OBJECT(s),
         "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);

     memory_region_add_subregion(get_system_memory(),
         TPM_CRB_ADDR_BASE, &s->mmio);
     memory_region_add_subregion(get_system_memory(),
         TPM_CRB_ADDR_BASE + sizeof(s->regs), &s->cmdmem);


The state of the registers is saved using this here:

static const VMStateDescription vmstate_tpm_crb = {
     .name = "tpm-crb",
     .pre_save = tpm_crb_pre_save,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, CRBState, TPM_CRB_R_MAX),
         VMSTATE_END_OF_LIST(),
     }
};

The buffer with the commands is not part of this. So likely it needs to 
be marked dirty but then I am not sure whether that is going to work if 
the response to a command on the CRB is only received when 
tpm_crb_pre_save() is called.. Maybe this buffer would have to be save 
explicitly in a .save function or also as part of vmstate_tpm_crb... ?


   Stefan




> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
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

