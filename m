Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0073E2FC3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 21:27:22 +0200 (CEST)
Received: from localhost ([::1]:48322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC5V2-0002JO-QT
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 15:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mC5Tr-0001D9-EA; Fri, 06 Aug 2021 15:26:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mC5Tp-00065q-Ji; Fri, 06 Aug 2021 15:26:07 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176J3HGi013017; Fri, 6 Aug 2021 15:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=StX4mdllfkoSJ1GQF2bCTWJJ6oAOTPY6G64yTmkDgpo=;
 b=BprZiUN9ItUosZf/hW9EyXJF1a7wD10J8k616NnJUC7N1NZcBi2RYpBKu3KWuEbwuep8
 tSJb26lmjmPctvDBXA4EjQOu5MKenSqUT2W1xZWMPrQe14YQDSEq5CNGPiKSPKkakm5y
 FuXkGU4uW8rsgxH/u2iHnvLMGPDZWWilYWT3rs6I5K+d0yQvd/NRD86RM+Z1EKbLYF/Q
 cATtGnatPrU9gGzExzsZ4iJkcPiNveITGrkRDu+ZOKGTWm/s7hB6UGKoufeSFw/TfX61
 RU1gTN4autpuQSTjfuyb4vsAg41Go+CgGoufES8LGYB4rgSv0nqPvuRBQ0wlcBvjuAFZ qA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a9am7rwa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 15:25:59 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 176JHQqe028164;
 Fri, 6 Aug 2021 19:25:57 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3a77h67749-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 19:25:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 176JPuCe19464494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 19:25:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A301FBE053;
 Fri,  6 Aug 2021 19:25:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16669BE05F;
 Fri,  6 Aug 2021 19:25:55 +0000 (GMT)
Received: from localhost (unknown [9.211.46.8])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Aug 2021 19:25:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v0 1/2] spapr: Add H_REG_SNS hcall
In-Reply-To: <20210805073228.502292-2-bharata@linux.ibm.com>
References: <20210805073228.502292-1-bharata@linux.ibm.com>
 <20210805073228.502292-2-bharata@linux.ibm.com>
Date: Fri, 06 Aug 2021 16:25:53 -0300
Message-ID: <878s1etlxa.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FSf4r9hdRmQoFBxPgfjmYiJYL3yR5bat
X-Proofpoint-GUID: FSf4r9hdRmQoFBxPgfjmYiJYL3yR5bat
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_06:2021-08-06,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=871 mlxscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108060129
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: aneesh.kumar@linux.ibm.com, david@gibson.dropbear.id.au,
 qemu-ppc@nongnu.org, Bharata B Rao <bharata@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bharata B Rao <bharata@linux.ibm.com> writes:

> Add support for H_REG_SNS hcall so that asynchronous page
> fault mechanism can be supported on PowerKVM guests.
>
> This hcall essentially issues KVM_PPC_SET_SNS to let the
> host map and pin the memory containing the Subvention
> Notification Structure. It also claims SPAPR_IRQ_SNS to
> be used as subvention notification interrupt.
>
> Note: Updates to linux-headers/linux/kvm.h are temporary
> pending headers update.
>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

...

> +static target_ulong h_reg_sns(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                              target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong addr = args[0];
> +    target_ulong len = args[1];
> +
> +    if (addr == -1) {
> +        return deregister_sns(cpu, spapr);
> +    }
> +
> +    /*
> +     * If SNS area is already registered, can't register again before
> +     * deregistering it first.
> +     */
> +    if (spapr->sns_addr == -1) {
> +        return H_PARAMETER;
> +    }

Don't you mean (spapr->sns_addr != -1) ?

> +
> +    if (!QEMU_IS_ALIGNED(addr, 4096)) {
> +        return H_PARAMETER;
> +    }
> +
> +    if (len < 256) {
> +        return H_P2;
> +    }
> +
> +    /* TODO: SNS area is not allowed to cross a page boundary */
> +
> +    /* KVM_PPC_SET_SNS ioctl */
> +    if (kvmppc_set_sns_reg(addr, len)) {
> +        return H_PARAMETER;
> +    }
> +
> +    /* Record SNS addr and len */
> +    spapr->sns_addr = addr;
> +    spapr->sns_len = len;
> +
> +    /* Register irq source for sending ESN notification */
> +    spapr_irq_claim(spapr, SPAPR_IRQ_SNS, false, &error_fatal);
> +    args[1] = SPAPR_IRQ_SNS; /* irq no in R5 */
> +
> +    return H_SUCCESS;
> +}

