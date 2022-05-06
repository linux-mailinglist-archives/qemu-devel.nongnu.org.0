Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A219A51D999
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:50:27 +0200 (CEST)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyLh-0005Fy-Vz
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nmyJM-0003lb-0c
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:48:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8238
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nmyJK-0005ho-8i
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:47:59 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246Dl7Hg007340;
 Fri, 6 May 2022 13:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BflMXvsEQ7dpzNL0Hg5xBWsQ+hMUVUkmOIfC0CxQ++Y=;
 b=ZdvZS9QaDcWr2B07BZqswqfPJkw3HSlKe0EKMBKY0Xtm1AtJGefaJeAOQSnKJZJpH744
 4wHDvjcIkZQEvcPwEY6l2MqBzQQbje88+qSNbBnRzf3X4Z/2lc4idz2wez8seuZtHqpS
 pDCcq6Xe+SwXz5OTrcFjpMu8UiRZwi9fezEiHI4p5lEsatVcG4AyY7jQSxzy+f/ZVANY
 ivjboXwFkYGM6v3BsPKH8oxTX4u/cidUea4IDfNGUgc0MukVGHCZ1ubUj2Mcblct9h8o
 20iDI2P+PhhTYGz1YZHDlL8UY80h6TErVzpWIgOTz/Q8F1TZMmdpH7Ehj3ym6tIotlto tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw4v600kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 13:47:55 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 246DlFYm007636;
 Fri, 6 May 2022 13:47:55 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw4v600kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 13:47:55 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246DSRPN011816;
 Fri, 6 May 2022 13:47:54 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3frvraaqa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 13:47:54 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 246DlrIm22807010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 13:47:53 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53AE2BE051;
 Fri,  6 May 2022 13:47:53 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF75FBE04F;
 Fri,  6 May 2022 13:47:52 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 13:47:52 +0000 (GMT)
Message-ID: <96940f79-a6e0-d14f-5d74-abe280846f26@linux.ibm.com>
Date: Fri, 6 May 2022 09:47:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com
Cc: stefanb@linux.vnet.ibm.com, cohuck@redhat.com, f4bug@amsat.org
References: <20220506132510.1847942-1-eric.auger@redhat.com>
 <20220506132510.1847942-2-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220506132510.1847942-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r0UeiIXhmPICaYwqJR5IcJhBwR3daYnN
X-Proofpoint-GUID: p_iIA4RmKu4VaqTFTL0rtgzA-lzL7bC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060076
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
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



On 5/6/22 09:25, Eric Auger wrote:
> In a subsequent patch, VFIO will need to recognize if
> a memory region owner is a TPM CRB device. Hence VFIO
> needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
> let's add a stub function.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linnux.ibm.com>

> ---
>   include/sysemu/tpm.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index 68b2206463c..fb40e30ff60 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
>   #define tpm_init()  (0)
>   #define tpm_cleanup()
> 
> +/* needed for an alignment check in non-tpm code */
> +static inline Object *TPM_IS_CRB(Object *obj)
> +{
> +     return NULL;
> +}
> +
>   #endif /* CONFIG_TPM */
> 
>   #endif /* QEMU_TPM_H */

