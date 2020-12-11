Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1B2D74B6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 12:32:50 +0100 (CET)
Received: from localhost ([::1]:49446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kngfJ-0005CR-Ev
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 06:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kngdu-0004DL-Fr; Fri, 11 Dec 2020 06:31:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kngds-0006JI-6K; Fri, 11 Dec 2020 06:31:22 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BBB7TA9010459; Fri, 11 Dec 2020 06:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=p5aKe5Wi31XBwMxwJEBkHQ1+JK3yzyEDbGMoaVpWrNE=;
 b=A7msgmnfRd0pBs2I/qwKxyMPcdBJZ0C4FDhKH8KdIEDmPrPneS8eybmII3nlpeOrr6Hc
 Sp6c0/WC9pNAPLMIR9JO0SU5FweM/TJIu9C7I5zMYNIFYwskw6n7kpQKnm3JojLbKp7O
 sOb1PY+v2pnbJU6dYYJkSMB5AvBjpg/lFS8v90yr8AVSof5cgXCTi2dsr3g9R/vJ9mrn
 bxJC5dBNjopBbKHEFBkGmABv8QlukMJi3LOZRFRMYfjiddV5S2ZhycFuaoIOoyJFpHhK
 ZcxDY/eOIeSnEAJjQQlXhFitYDisfM7k8GIuKmRmD/H7AldmgdI5JtlSdh3bKEFd2fk4 zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35c7bwgxg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 06:31:16 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BBB8sE2014218;
 Fri, 11 Dec 2020 06:31:15 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35c7bwgxfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 06:31:15 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BBBQmgO016030;
 Fri, 11 Dec 2020 11:31:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8t8af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 11:31:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BBBSeVB29295080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 11:28:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB1B811C054;
 Fri, 11 Dec 2020 11:28:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DC7311C04C;
 Fri, 11 Dec 2020 11:28:40 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.47.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Dec 2020 11:28:40 +0000 (GMT)
Subject: Re: [PATCH v2] s390x: pv: Fence additional unavailable SCLP
 facilities for PV guests
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201211105109.2913-1-frankja@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <2dba50e5-64e6-cade-6e3a-ebca5eb9d540@de.ibm.com>
Date: Fri, 11 Dec 2020 12:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201211105109.2913-1-frankja@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_01:2020-12-09,
 2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110066
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11.12.20 11:51, Janosch Frank wrote:
> There's no VSIE support for a protected guest, so let's better not
> advertise it and its support facilities.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

shall we add 
Fixes: 0f73c5b30b8b ("s390x: protvirt: SCLP interpretation")
or
Fixes: c3347ed0d2ee ("s390x: protvirt: Support unpack facility")

?
> ---
> v2: added hpma2
> ---
>  target/s390x/cpu_features.c | 39 ++++++++++++++++++++++++++++++++++++-
>  target/s390x/cpu_models.c   | 25 ++++++++++++++++++++++--
>  2 files changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
> index 42fe0bf4ca..5528acd082 100644
> --- a/target/s390x/cpu_features.c
> +++ b/target/s390x/cpu_features.c
> @@ -107,8 +107,45 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
>          feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
>      }
>  
> -    if (type == S390_FEAT_TYPE_SCLP_FAC134 && s390_is_pv()) {
> +    if (!s390_is_pv()) {
> +        return;
> +    }
> +
> +    /*
> +     * Some facilities are not available for CPUs in protected mode:
> +     * - All SIE facilities because SIE is not available
> +     * - DIAG318
> +     *
> +     * As VMs can move in and out of protected mode the CPU model
> +     * doesn't protect us from that problem because it is only
> +     * validated at the start of the VM.
> +     */
> +    switch (type) {
> +    case S390_FEAT_TYPE_SCLP_CPU:
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_F2)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SKEY)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GPERE)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIIF)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_SIGPIF)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IB)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CEI)->bit, data);
> +        break;
> +    case S390_FEAT_TYPE_SCLP_CONF_CHAR:
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GSLS)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_HPMA2)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_KSS)->bit, data);
> +        break;
> +    case S390_FEAT_TYPE_SCLP_CONF_CHAR_EXT:
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_64BSCAO)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_CMMA)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_PFMFI)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_IBS)->bit, data);
> +        break;
> +    case S390_FEAT_TYPE_SCLP_FAC134:
>          clear_be_bit(s390_feat_def(S390_FEAT_DIAG_318)->bit, data);
> +        break;
> +    default:
> +        return;
>      }
>  }
>  
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index b5abff8bef..93d8744d29 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -239,8 +239,29 @@ bool s390_has_feat(S390Feat feat)
>          }
>          return 0;
>      }
> -    if (feat == S390_FEAT_DIAG_318 && s390_is_pv()) {
> -        return false;
> +
> +    if (s390_is_pv()) {
> +        switch (feat) {
> +        case S390_FEAT_DIAG_318:
> +        case S390_FEAT_HPMA2:
> +        case S390_FEAT_SIE_F2:
> +        case S390_FEAT_SIE_SKEY:
> +        case S390_FEAT_SIE_GPERE:
> +        case S390_FEAT_SIE_SIIF:
> +        case S390_FEAT_SIE_SIGPIF:
> +        case S390_FEAT_SIE_IB:
> +        case S390_FEAT_SIE_CEI:
> +        case S390_FEAT_SIE_KSS:
> +        case S390_FEAT_SIE_GSLS:
> +        case S390_FEAT_SIE_64BSCAO:
> +        case S390_FEAT_SIE_CMMA:
> +        case S390_FEAT_SIE_PFMFI:
> +        case S390_FEAT_SIE_IBS:
> +            return false;
> +            break;
> +        default:
> +            break;
> +        }
>      }
>      return test_bit(feat, cpu->model->features);
>  }
> 

