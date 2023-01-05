Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC0C65F101
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:21:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDSzB-0001dw-Mj; Thu, 05 Jan 2023 11:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDSz1-0001dd-N5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:20:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDSyz-0004OK-6p
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:20:47 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305EojVT021257
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 16:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KHpq+wQW7Hvod/2jLoMD5ezKmm/7u34msjeeHJnajRA=;
 b=TSIARdWqlxl/RNq3oHLauconspUlfbSqhaCOFBnpURqiMJQfTmSZtph+sFFQyt62Ht2u
 Bg8YeDTb5Ln9nsYVI/pz5oPIIBpH7FCTkHKCMVGB8cddWiQ/hNdQv4jPepHan/VkvARq
 7YfoYEW9eM51DD2DAlVA7bxNoW1yV95dRLdocawee1xDyp5wARQkM02LXLnnYfLJpwms
 2Vp1aj2oqHUbpCKr4etSZpaSTGTBiUgiPqZZOc1xJlf749Hi3Bjmu9of7wvJb+W63qas
 7I//cHPRyJWaOQnnnqdVvcQBph+OJU6L0QWhpBAfo1X7i+1O3wuFcm2el251dSLToMIl pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx0p12d6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 16:20:43 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305Eom9h021433
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 16:20:43 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx0p12d6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 16:20:43 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305Ev1fJ025847;
 Thu, 5 Jan 2023 16:20:42 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mtcq7xaee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 16:20:42 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305GKfLW27394318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 16:20:41 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F118858061;
 Thu,  5 Jan 2023 16:20:40 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A917358060;
 Thu,  5 Jan 2023 16:20:40 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  5 Jan 2023 16:20:40 +0000 (GMT)
Message-ID: <789bd0bd-05ed-c413-272e-0204472f3e3b@linux.ibm.com>
Date: Thu, 5 Jan 2023 11:20:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/2] tpm: add backend for mssim
Content-Language: en-US
To: James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230105130020.17755-1-jejb@linux.ibm.com>
 <20230105130020.17755-3-jejb@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230105130020.17755-3-jejb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bbqrmMs_opYg63lE7YUiB79Nzo463_xJ
X-Proofpoint-ORIG-GUID: P-XPGUjgeV2z3o6QmsJrvKQfyqSOFeGp
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_06,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=955 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050126
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939, SPF_HELO_NONE=0.001,
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



On 1/5/23 08:00, James Bottomley wrote:
> From: James Bottomley <James.Bottomley@HansenPartnership.com>
> 
> The Microsoft Simulator (mssim) is the reference emulation platform
> for the TCG TPM 2.0 specification.
> 
> https://github.com/Microsoft/ms-tpm-20-ref.git
> 
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 535912a92b..1398735956 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -270,6 +270,38 @@ available as a module (assuming a TPM 2 is passed through):
>     /sys/devices/LNXSYSTEM:00/LNXSYBUS:00/MSFT0101:00/tpm/tpm0/pcr-sha256/9
>     ...
>   
> +The QEMU TPM Microsoft Simulator Device
> +---------------------------------------
> +
> +The TCG provides a reference implementation for TPM 2.0 written by
> +Microsoft (See `ms-tpm-20-ref`_ on github).  The reference implementation
> +starts a network server and listens for TPM commands on port 2321 and
> +TPM Platform control commands on port 2322, although these can be
> +altered.  The QEMU mssim TPM backend talks to this implementation.  By
> +default it connects to the default ports on localhost:
> +
> +.. code-block:: console
> +
> +  qemu-system-x86_64 <qemu-options> \
> +    -tpmdev mssim,id=tpm0 \
> +    -device tpm-crb,tpmdev=tpm0
> +
> +
> +Although it can also communicate with a remote host, which must be
> +specified as a SocketAddress via json on the command line for each of
> +the command and control ports:
> +
> +.. code-block:: console
> +
> +  qemu-system-x86_64 <qemu-options> \
> +    -tpmdev "{'type':'mssim','id':'tpm0','command':{'type':'inet','host':'remote','port':'2321'},'control':{'type':'inet','host':'remote','port':'2322'}}" \
> +    -device tpm-crb,tpmdev=tpm0
> +
> +
> +The mssim backend supports snapshotting and migration, but the state
> +of the Microsoft Simulator server must be preserved (or the server
> +kept running) outside of QEMU for restore to be successful.

My comments to v3 still apply here.

I also just tried migration and on the -incoming side it did not work anymore. Did you test this?

    Stefan

