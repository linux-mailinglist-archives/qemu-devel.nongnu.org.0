Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B2E59FB60
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 15:28:30 +0200 (CEST)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQqQm-0004K7-SG
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 09:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oQpbj-0004vv-9w
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 08:35:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oQpbg-0007Y9-Lf
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 08:35:43 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27OCO4v4009737;
 Wed, 24 Aug 2022 12:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LZMgcCIaW26jdnFQ6vTHAAAEuOT9dz+EojOAaAC5ywo=;
 b=gUVJa7iHb3sQYgRTc0jt6f+xf6iG/9hbyO2HjEPueyj8aUZaHOSE/SvNsOUyxsMUqcBF
 DTLb3riblUpNGaoxWx48KwvqT6CcSrHoKlm26VjLpLTwCpldT5Hi4gFIwrtIGpL1sr/j
 Sa65K80Q0tJKv1fOypoU3/t/edJZWb4QN80z9C3Rrni7dOAozlawgmnnyI0vrbDYomoO
 qnse0OGp6J53Xq1A9HE8FyfL40piRhSgTNc1dTn77RNywZ3J1wigof4dKwLKMLqTa4A8
 Mdi3WnBnPKtD4LBr/jHKUewz0WRmt4A/b4ilRFLC6H0xq+xuF6ZbQ+bRPPtlWQrYyHu0 dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5ky8gc1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 12:35:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27OCOk3I014656;
 Wed, 24 Aug 2022 12:35:37 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5ky8gc0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 12:35:37 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27OCNb6O016395;
 Wed, 24 Aug 2022 12:35:35 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3j2q89h7ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 12:35:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27OCZZCC62587288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Aug 2022 12:35:35 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CDC1AC05F;
 Wed, 24 Aug 2022 12:35:35 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45B37AC05E;
 Wed, 24 Aug 2022 12:35:35 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 24 Aug 2022 12:35:35 +0000 (GMT)
Message-ID: <dc3c5917-e0bf-93a1-0538-563a720dcfc7@linux.ibm.com>
Date: Wed, 24 Aug 2022 08:35:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 14/51] backends/tpm: Exclude headers and macros that don't
 exist on win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-15-bmeng.cn@gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220824094029.1634519-15-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tes_UR8KswFzvAux_MDIKUXB-pQUXJtj
X-Proofpoint-ORIG-GUID: NvpYMsH_liZEV8-xsbp9qlMT4vGcMAxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_06,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240047
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



On 8/24/22 05:39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> These headers and macros do not exist on Windows. Exclude them.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   backends/tpm/tpm_ioctl.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
> index bd6c12cb86..d67bf0283b 100644
> --- a/backends/tpm/tpm_ioctl.h
> +++ b/backends/tpm/tpm_ioctl.h
> @@ -9,8 +9,10 @@
>   #ifndef TPM_IOCTL_H
>   #define TPM_IOCTL_H
> 
> +#ifndef _WIN32
>   #include <sys/uio.h>
>   #include <sys/ioctl.h>
> +#endif
> 
>   #ifdef HAVE_SYS_IOCCOM_H
>   #include <sys/ioccom.h>
> @@ -222,6 +224,7 @@ typedef struct ptm_setbuffersize ptm_setbuffersize;
>   #define PTM_CAP_SET_DATAFD         (1 << 12)
>   #define PTM_CAP_SET_BUFFERSIZE     (1 << 13)
> 
> +#ifndef _WIN32
>   enum {
>       PTM_GET_CAPABILITY     = _IOR('P', 0, ptm_cap),
>       PTM_INIT               = _IOWR('P', 1, ptm_init),
> @@ -241,6 +244,7 @@ enum {
>       PTM_SET_DATAFD         = _IOR('P', 15, ptm_res),
>       PTM_SET_BUFFERSIZE     = _IOWR('P', 16, ptm_setbuffersize),
>   };
> +#endif
> 
>   /*
>    * Commands used by the non-CUSE TPMs

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

