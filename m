Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553C145FC89
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 05:16:56 +0100 (CET)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqp8w-0007ZQ-UR
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 23:16:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mqp7r-0006oW-Dk
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 23:15:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29142
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mqp7p-00068r-Pv
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 23:15:47 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AR41wPL025279
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 04:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zK1za/pu1aXG6PRSHlsaw72vsYJtbpVGcdDg1lbNp8M=;
 b=bcMinZjbG3c2z8t5YIBbbIpb+YdhHlaYsLeiEIjA5lmnH3i30hWZ61a8gWjlO2OaovwX
 8lfho3ivjZsXfF1WJ65YM1LzZ3evlicveEibf7OHsftt5RhfaykVmNprf2a00a2HE9Xe
 6L437RUz2yKJqz/WAFeCExz/4MybnL9PMjN+yz/HAXzFkDV79jMkL45uKX2wQ+4pKc5l
 SH8GdMkyDxrdFnOBsaU3eKkDk5IohVz9n/lA4H95G9eEvklwazP2IEHuTe1l81PNhjO7
 zpaZp48DGz56YgLcB6pHDPxWiVRNkW4HaBjmz0g3ewT5fFMP4to0XmLcvi+aubODjynA gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ckd9v854k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 04:15:42 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AR48Um6014181
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 04:15:41 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ckd9v854e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Nov 2021 04:15:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AR4DGj9023222;
 Sat, 27 Nov 2021 04:15:41 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 3ckca9gm3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 27 Nov 2021 04:15:41 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AR4Fe9556361424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 27 Nov 2021 04:15:40 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 831512805C;
 Sat, 27 Nov 2021 04:15:40 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 652282805A;
 Sat, 27 Nov 2021 04:15:40 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 27 Nov 2021 04:15:40 +0000 (GMT)
Message-ID: <f100e9ad-d55d-0d8b-83b2-3420beb5e892@linux.ibm.com>
Date: Fri, 26 Nov 2021 23:15:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/3] tpm: Add missing ACPI device identification objects
Content-Language: en-US
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20211110133559.3370990-1-stefanb@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20211110133559.3370990-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CD38hUSdUKcpFM1BWEMRmd0vwOL82L-z
X-Proofpoint-ORIG-GUID: Vhd3_TLPtt6ivUhpk6I7x9int9CVBoxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-27_01,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111270021
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is this series now acceptable for 'after 6.2'?


On 11/10/21 08:35, Stefan Berger wrote:
> This series of patches adds missing ACPI device identification objects _STR
> and _UID to TPM 1.2 and TPM 2 ACPI tables.
>
>     Stefan
>
> v3:
>   - Dropped replacement of ACPI tables with empty files in 1/3.
>   - Reduced ignored files
>
> Stefan Berger (3):
>    tests: acpi: prepare for updated TPM related tables
>    acpi: tpm: Add missing device identification objects
>    tests: acpi: Add updated TPM related tables
>
>   hw/arm/virt-acpi-build.c           |   1 +
>   hw/i386/acpi-build.c               |   8 ++++++++
>   tests/data/acpi/q35/DSDT.tis.tpm12 | Bin 8894 -> 8900 bytes
>   tests/data/acpi/q35/DSDT.tis.tpm2  | Bin 8894 -> 8921 bytes
>   4 files changed, 9 insertions(+)
>

