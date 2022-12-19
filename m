Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B0650CDC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:52:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GYW-00048k-B9; Mon, 19 Dec 2022 08:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p7GYT-00048N-V2
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:51:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p7GYQ-0001GC-3w
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:51:44 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJDfYKX002192
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Fnm4T/AonYS6UHngLenoOebFLdTYhrFoajJctaNtTzY=;
 b=io00SELvxmnTRl09wA+enA+bgIAJd3gVy851h79ol2YgbDgo36iXiWwmiryIhmH0xckI
 zde5S/IGCaC+aroBB9z4gRBGSPr4uAFKf2p/ru9Yj5bbKttHDrgLg4j0e4OLTq3Qj8kW
 Y0VQ/gaAYCWjIYNUPwv+AxOhOCvqk79516rEiVplShjXY/GUg0jIMU9VM+0w3j97Zd2m
 1k/SmLIJ9IsLReoDUxw5qlWFzpG2X9VTAYw7v6xeeNAhmc1zr77JNW7FqGhNwulZN1KU
 +708tvdo6cPsA6ucT9dg4vk14dtjgVg64heIOJ/qDkUELjt9+HzqhwdY0hsk5JIuP9y4 Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjs2h89wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:51:39 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJDh3Yt008431
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:51:39 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjs2h89w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:51:39 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJC9Fsa007558;
 Mon, 19 Dec 2022 13:51:38 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mh6yxdpgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:51:38 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJDpbGG60948750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:51:37 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 062C958061;
 Mon, 19 Dec 2022 13:51:37 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6337158058;
 Mon, 19 Dec 2022 13:51:36 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 13:51:36 +0000 (GMT)
Message-ID: <08142e4d-0210-627d-98ea-6f094979ebcc@linux.ibm.com>
Date: Mon, 19 Dec 2022 08:51:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/2] tpm: add mssim backend
Content-Language: en-US
To: James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221219131344.18909-1-jejb@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20221219131344.18909-1-jejb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LVywK1W1yqdeqWwKVq8DIio6-YRyrm7f
X-Proofpoint-GUID: Dr9SPoUsfH5_Cw5JyC-TbyHRcKqvH4Z_
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190120
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/19/22 08:13, James Bottomley wrote:
> From: James Bottomley <James.Bottomley@HansenPartnership.com>
> 
> The requested feedback was to convert the tpmdev handler to being json
> based, which requires rethreading all the backends.  The good news is
> this reduced quite a bit of code (especially as I converted it to
> error_fatal handling as well, which removes the return status
> threading).  The bad news is I can't test any of the conversions.
> swtpm still isn't building on opensuse and, apparently, passthrough

The package seems to be available: https://software.opensuse.org/package/swtpm


I'll get to looking at this in more depth once I am back in office.

    Stefan


> doesn't like my native TPM because it doesn't allow cancellation.
> 
> v3 pulls out more unneeded code in the visitor conversion, makes
> migration work on external state preservation of the simulator and
> adds documentation
> 
> James
> 
> ---
> 
> James Bottomley (2):
>    tpm: convert tpmdev options processing to new visitor format
>    tpm: add backend for mssim
> 
>   MAINTAINERS                    |   6 +
>   backends/tpm/Kconfig           |   5 +
>   backends/tpm/meson.build       |   1 +
>   backends/tpm/tpm_emulator.c    |  35 ++---
>   backends/tpm/tpm_mssim.c       | 264 +++++++++++++++++++++++++++++++++
>   backends/tpm/tpm_mssim.h       |  43 ++++++
>   backends/tpm/tpm_passthrough.c |  37 ++---
>   docs/specs/tpm.rst             |  35 +++++
>   include/sysemu/tpm.h           |   4 +-
>   include/sysemu/tpm_backend.h   |   2 +-
>   monitor/hmp-cmds.c             |  11 +-
>   qapi/tpm.json                  |  37 ++---
>   softmmu/tpm.c                  |  90 +++++------
>   softmmu/vl.c                   |  19 +--
>   14 files changed, 449 insertions(+), 140 deletions(-)
>   create mode 100644 backends/tpm/tpm_mssim.c
>   create mode 100644 backends/tpm/tpm_mssim.h
> 

