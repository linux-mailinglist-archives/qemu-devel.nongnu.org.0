Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952A9698F6F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:13:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaIs-0003SH-4p; Thu, 16 Feb 2023 04:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSaIl-0003Rj-7p
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:11:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1pSaIi-0000oh-SK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:11:38 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31G8hhq9029960; Thu, 16 Feb 2023 09:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=I0jT3lFZGX//hvhirlzVN6WmAz6vy4zuNqe7+kdRVrI=;
 b=mlUVeJptl5Mc/0lrhdleyGeqfLKvAU0HrtOVNxVXL6x8EoEWYTxAGoBoYScjMjDuei31
 dp7pWzQt2h8Yf+EjkGffZ+t7V9KRcQheV58AMkvOM/UnZmKL1wl5gdon4MTRxvWySFr0
 1UQMZWaaYbWwEFVchq0ZvxvOJsdViWtXi+0QmaWbjbPdw4gbBtf9TXjeOuMS+itjX53X
 XhRPlvTeVLUg0Cjlt4xo1otAoIkLyLhLOHphYd7m9KFqsNMsu1/SUdJxanYYualU9osP
 5p1Icz7CptEA3SOvWH8G2JOvpe5FYxzqwGrMfugS+VL721yT0ukDh47nHP/h5McL/PaK yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsce47aps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 09:11:31 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31G8aj3f019519;
 Thu, 16 Feb 2023 09:11:30 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nsce47apb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 09:11:30 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31G7FXkN001021;
 Thu, 16 Feb 2023 09:11:29 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3np2n7r2b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 09:11:29 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31G9BRs132375286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Feb 2023 09:11:27 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 712915805D;
 Thu, 16 Feb 2023 09:11:27 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 877885805B;
 Thu, 16 Feb 2023 09:11:23 +0000 (GMT)
Received: from [9.77.150.161] (unknown [9.77.150.161])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Feb 2023 09:11:23 +0000 (GMT)
Message-ID: <5bf6f310-8fd8-b7a6-2d99-b974ec1f8c57@linux.ibm.com>
Date: Thu, 16 Feb 2023 11:11:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH v2 0/2] i386/sev: Support measured direct kernel boot
 on SNP
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Mario Smarduch
 <mario.smarduch@amd.com>, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Dov Murik <dovmurik@linux.ibm.com>
References: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <20230216084913.2148508-1-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0X-j1M4tfjZZEHw9yAR9loPZTbmWf6r5
X-Proofpoint-GUID: t8w09uFMdEMlsHPW8BVV56OC3r8Cw0yz
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_06,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=699 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160075
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257, SPF_HELO_NONE=0.001,
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



On 16/02/2023 10:49, Dov Murik wrote:
> This RFC patch series is based on AMD's RFC upmv10-snpv3 tree [1].
> 

Note that in order to test this you must use '-machine pc-q35-7.1'
to circumvent the SETUP_RNG_SEED bug [1] that interferes with the
measured kernel.

[1] https://lore.kernel.org/qemu-devel/20230208211212.41951-1-mst@redhat.com/


-Dov


> 
> In order to enable measured direct kernel boot on SNP, QEMU needs to
> fill the hashes page when kernel-hashes=on.  This relies on several
> changes to the SNP metadata published by OVMF (See [2] for proposed
> OVMF patches).
> 
> Patch 1 pulls the 'kernel-hashes' property from the SEV guest settings
> to the common settings to make it available for both SEV and SNP.
> 
> Patch 2 adds the hashes table for SNP guests (or validates the page as a
> zero page if kernel-hashes=off).
> 
> This patch series is also available at [3].
> 
> 
> [1] https://github.com/mdroth/qemu/commits/upmv10-snpv3
> [2] https://edk2.groups.io/g/devel/message/100286
> [3] https://github.com/confidential-containers-demo/qemu/tree/snp-kernel-hashes-v2
> 
> v2 changes:
> * Rebase on top of upmv10-snpv3 which includes kernel-hashes.
> 
> v1: https://lore.kernel.org/qemu-devel/20220329064038.96006-1-dovmurik%40linux.ibm.com/
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Michael Roth <michael.roth@amd.com>
> Cc: Ashish Kalra <ashish.kalra@amd.com>
> Cc: Mario Smarduch <mario.smarduch@amd.com>
> Cc: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
> 
> Dov Murik (2):
>   qapi, i386: Move kernel-hashes to SevCommonProperties
>   i386/sev: Allow measured direct kernel boot on SNP
> 
>  qapi/qom.json     | 12 +++---
>  target/i386/sev.c | 95 +++++++++++++++++++++++++++++------------------
>  2 files changed, 65 insertions(+), 42 deletions(-)
> 

