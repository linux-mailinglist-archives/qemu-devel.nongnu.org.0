Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665014941F3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 21:43:26 +0100 (CET)
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAHnh-0004Wa-96
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 15:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nAHlS-0002Nh-FF
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 15:41:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40342
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nAHlQ-0002vC-Hm
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 15:41:05 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JKT1Ob019516; 
 Wed, 19 Jan 2022 20:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=efH1EuCk7sc7ZrV/edrn9n8fmMdFrhjugzu6nW9KRR4=;
 b=P2YxTzBUcY81320LUavN8vvRrR+Vb0AbS9JzWHUnG5aU1wXCkAjeQAYYwEpeEICk+7W9
 QoaAA8bwWZg64Y7IabmzM36WEuY3vRoSBLy3BA+Jnmk6FZ9mDPtpshT4Xhkk79r36Doq
 K+o71HdBJnPNv0jKRACoUTW93FCogkKtCvuWivLIOIe7uDLEpSMLndQenSz7XWxNMY4Q
 hCvSgouRnS1jtfJOH6GtKna9tItZ33oTq2s08QjjRvSqtzPqe19413l/ootFf7g02se/
 fNTgZKmOtyXFIHYkTyquFbIn+lax3AT3476tUCZunEaT+brvto7aETS48CsE2rfucgz9 KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dprvrhht2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 20:40:59 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20JKT3oN022115;
 Wed, 19 Jan 2022 20:40:59 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dprvrhhsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 20:40:59 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20JKdxij022103;
 Wed, 19 Jan 2022 20:40:58 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3dknwbgsqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 20:40:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20JKevH613566314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 20:40:57 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0C54BE056;
 Wed, 19 Jan 2022 20:40:57 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB244BE04F;
 Wed, 19 Jan 2022 20:40:56 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jan 2022 20:40:56 +0000 (GMT)
Message-ID: <1ae39366-74af-c1f3-ae0d-4cb48ab9a7ea@linux.ibm.com>
Date: Wed, 19 Jan 2022 15:40:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/2] TPM-CRB: Remove spurious error report when used
 with VFIO
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
References: <20220118153306.282681-1-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220118153306.282681-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N7-nNcqZapBJByfcauMp5pKW6Uh96_LC
X-Proofpoint-GUID: 9zdMATYh967AooHZiJOpfefoaJ7HjexJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_11,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190113
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/18/22 10:33, Eric Auger wrote:
> This series aims at removing a spurious error message we get when
> launching a guest with a TPM-CRB device and VFIO-PCI devices.
>
> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This series proposes to use a ram-device
> region instead which helps in better assessing the dma map error
> failure on VFIO side.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/tpm-crb-ram-device-v2
>
> History:
> v1 -> v2:
> - added tpm_crb_unrealize (dared to keep Stefan's T-b though)
>
> Eric Auger (2):
>    tpm: CRB: Use ram_device for "tpm-crb-cmd" region
>    hw/vfio/common: Silence ram device offset alignment error traces
>
>   hw/tpm/meson.build   |  2 +-
>   hw/tpm/tpm_crb.c     | 22 ++++++++++++++++++++--
>   hw/vfio/common.c     | 15 ++++++++++++++-
>   hw/vfio/trace-events |  1 +
>   4 files changed, 36 insertions(+), 4 deletions(-)
>
Acked-by: Stefan Berger <stefanb@linux.ibm.com>

