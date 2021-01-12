Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB42F2995
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:59:52 +0100 (CET)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEal-00027U-Ss
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kzEYJ-0000Pn-Jo; Tue, 12 Jan 2021 02:57:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kzEYH-0005Jx-OI; Tue, 12 Jan 2021 02:57:19 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10C7gPFe154953; Tue, 12 Jan 2021 02:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SEOB9Qhvq1iCXBxaz4aEhUoxh8MtQygds2qy/445Ho0=;
 b=Q2uZKpYoYdm90meAYX4X4NroYGZj5rKoqyviQ47cmwM9Pjt514JkfTQtcX1FWZ6aIyYq
 k7TGb1fnuR28uB+AdYFSub6JglCjg0UyuDGfQKEfDgpG9k5zGALTVB640WnaqmTWw2ur
 e1edTi883w81PcXe8lYJ3xOQwCtPwBVPF7DRIVgntI/tiSQl6n4mAnxgo66++wccsSuv
 zsW9wANWS1Tc/4UD1jBfDUTumZM8yl6L8wkkEZj/TAYwvg9T3xyqqURszu6SLCLc6L1z
 Mpv8ADd4mJVo1gOi8LzpXoGOAGIsPRDPp9JzCnUhof4F2SWTgWF+feqaN8LWZoF655SZ Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3617m089yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 02:57:00 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10C7hs2k158115;
 Tue, 12 Jan 2021 02:57:00 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3617m089xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 02:57:00 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10C7mA3o012498;
 Tue, 12 Jan 2021 07:56:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 35y448hp3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 07:56:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10C7utD926083724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 07:56:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 241454C04A;
 Tue, 12 Jan 2021 07:56:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 240AA4C040;
 Tue, 12 Jan 2021 07:56:54 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.50.44])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jan 2021 07:56:54 +0000 (GMT)
Subject: Re: [PATCH v6 10/13] spapr: Add PEF based confidential guest support
To: David Gibson <david@gibson.dropbear.id.au>, pasic@linux.ibm.com,
 brijesh.singh@amd.com, pair@us.ibm.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-11-david@gibson.dropbear.id.au>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <7d8775df-b3fb-deff-44f2-2e41c83a67ca@de.ibm.com>
Date: Tue, 12 Jan 2021 08:56:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210112044508.427338-11-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_03:2021-01-11,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120037
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 frankja@linux.ibm.com, kvm@vger.kernel.org, david@redhat.com,
 jun.nakajima@intel.com, mst@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 mdroth@linux.vnet.ibm.com, pragyansri.pathi@intel.com, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, andi.kleen@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12.01.21 05:45, David Gibson wrote:
[...]
> diff --git a/include/hw/ppc/pef.h b/include/hw/ppc/pef.h
> new file mode 100644
> index 0000000000..7c92391177
> --- /dev/null
> +++ b/include/hw/ppc/pef.h
> @@ -0,0 +1,26 @@
> +/*
> + * PEF (Protected Execution Facility) for POWER support
> + *
> + * Copyright David Gibson, Redhat Inc. 2020
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef HW_PPC_PEF_H
> +#define HW_PPC_PEF_H
> +
> +int pef_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> +
> +#ifdef CONFIG_KVM
> +void kvmppc_svm_off(Error **errp);
> +#else
> +static inline void kvmppc_svm_off(Error **errp)
> +{
> +}
> +#endif
> +
> +
> +#endif /* HW_PPC_PEF_H */
> +

In case you do a respin, 

git am says
Applying: confidential guest support: Update documentation
Applying: spapr: Add PEF based confidential guest support
.git/rebase-apply/patch:254: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: spapr: PEF: prevent migration



