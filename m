Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659592D2C0D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:33:01 +0100 (CET)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmd6y-0001c9-9H
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kmd4C-0000P5-8l; Tue, 08 Dec 2020 08:30:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kmd4A-0003oN-4J; Tue, 08 Dec 2020 08:30:07 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8D2R04000953; Tue, 8 Dec 2020 08:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gY4P3MA99igFyjeznby+PF0AJrprYGI9uz4W0ghA2Qg=;
 b=FbKkANi83N1I1yS35GtvPF8CRp7Ez+/OIFr3tMY6eidY0Z981UyZsowx79SQZ2Wjhf3t
 jPY9WL5LMuzQ673vnL/TSi0ah3hYrprIJOtU7y5WLBr2QJkkEr5A8BIEOCCQjnSyJwI7
 WK90MNhSRRcCOVJEQZafSTGKhpbfDwFZC5h2dF+O/WEofG0R5IpKJe/sXblHcPj4TUY9
 mspEXbIHlWIRc3FDNS5NpFoEhxVo19zJk30TKxF6lN/l0LK03FpAzvS8ALWD1KSzE76x
 hw01DLWvkTuJiT3AWJnDxkiRLkCIfpI6lJu+TksMhYe3Gw2BEU7mhdKQT7+cICQgsfo+ Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359wwdjfp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 08:30:02 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8D2VQu001073;
 Tue, 8 Dec 2020 08:30:02 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359wwdjfmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 08:30:02 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8DQv49031457;
 Tue, 8 Dec 2020 13:30:00 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3581fhkkuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 13:30:00 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8DTvOQ9568826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 13:29:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBD21A405B;
 Tue,  8 Dec 2020 13:29:57 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 756D4A4054;
 Tue,  8 Dec 2020 13:29:57 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.37.89])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 13:29:57 +0000 (GMT)
Subject: Re: [PATCH] s390x: pv: Fence additional unavailable SCLP facilities
 for PV guests
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201204083655.27946-1-frankja@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <1c42abcc-b28e-4b6a-d363-ff6daf7b7883@de.ibm.com>
Date: Tue, 8 Dec 2020 14:29:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201204083655.27946-1-frankja@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080079
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
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



On 04.12.20 09:36, Janosch Frank wrote:
> There's no VSIE support for a protected guest, so let's better not
> advertise it and its support facilities.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Looks sane. Assuming that all features that depend on SIE are named S390_FEAT_SIE_*
this should take care of everything. (i compared to gen-facilities.c)

> ---
> CI:
> https://gitlab.com/frankja/qemu/-/pipelines/224881703
> ---
>  target/s390x/cpu_features.c | 38 ++++++++++++++++++++++++++++++++++++-
>  target/s390x/cpu_models.c   | 24 +++++++++++++++++++++--
>  2 files changed, 59 insertions(+), 3 deletions(-)
> 
> diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
> index 42fe0bf4ca..7d7ea8e3b8 100644
> --- a/target/s390x/cpu_features.c
> +++ b/target/s390x/cpu_features.c
> @@ -107,8 +107,44 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
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
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_KSS)->bit, data);
> +        clear_be_bit(s390_feat_def(S390_FEAT_SIE_GSLS)->bit, data);
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
> index b5abff8bef..51feb71546 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -239,8 +239,28 @@ bool s390_has_feat(S390Feat feat)
>          }
>          return 0;
>      }
> -    if (feat == S390_FEAT_DIAG_318 && s390_is_pv()) {
> -        return false;
> +
> +    if (s390_is_pv()) {
> +        switch (feat) {
> +        case S390_FEAT_DIAG_318:
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

