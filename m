Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1315B373DE0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:45:37 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leImO-0007cu-51
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1leIl7-0006eV-Uj; Wed, 05 May 2021 10:44:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahesh@linux.ibm.com>)
 id 1leIl6-0007Ki-2I; Wed, 05 May 2021 10:44:17 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145EYaIq095827; Wed, 5 May 2021 10:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DFX02VsaysSob/aP2QXJP9KC0BssESNB7wV2TeN+iL4=;
 b=GFfXd4fmkZtju6dQTu0QM0Gu1+J9lXNXVOJT7WWHKxq5KfHRF3DyPomMeVksWSAYyBlL
 r/RgekxPjK2UHPtVWJgG5lWgE+9mHKMedgfNUM4O4GMI71aFeToxPOWCntYSsJo20eNk
 SPcw8j4Zbsa2DVClcmtnlI/iFjOgDUyCaLPAdaMroD3SPdiIbH6pvTxuUGTLOyItnnQO
 ikWTxjfmUzQ0g4h0elV7hZUCU7OziyfI9FQ9toJ7MzM1kNz63dBJp0yR98BlPstxtHX2
 mAc3OLzoDdnenhCdWbmHcIREdiZES2fPOHQPXL93uvErLwdGgIsdG7/ciNDmP+ynsrCY Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bubnvcgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 10:44:13 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 145EaaZK106537;
 Wed, 5 May 2021 10:44:12 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bubnvcfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 10:44:12 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145Ed9Jk011993;
 Wed, 5 May 2021 14:44:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 38beebg6n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 14:44:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 145EhgmV35586552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 14:43:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24AC55204F;
 Wed,  5 May 2021 14:44:08 +0000 (GMT)
Received: from [9.85.84.185] (unknown [9.85.84.185])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 391535204E;
 Wed,  5 May 2021 14:44:07 +0000 (GMT)
Subject: Re: [PATCH v2] spapr: Fix EEH capability issue on KVM guest for PCI
 passthru
From: Mahesh Jagannath Salgaonkar <mahesh@linux.ibm.com>
To: Qemu-devel <qemu-devel@nongnu.org>
References: <162022202916.114061.13956430525175811972.stgit@jupiter>
Message-ID: <4973b0e0-1d3e-75a8-1f9b-febc0306721c@linux.ibm.com>
Date: Wed, 5 May 2021 20:14:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162022202916.114061.13956430525175811972.stgit@jupiter>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lGDfba8wBN1pOx6vLzbX9-LGN7Xc-gJq
X-Proofpoint-GUID: HwBcBBMnrhH0NuhdHX8tL6iUwFYt0_zY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_07:2021-05-05,
 2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105050102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=mahesh@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Qemu-ppc <qemu-ppc@nongnu.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 7:10 PM, Mahesh Salgaonkar wrote:
> With upstream kernel, especially after commit 98ba956f6a389
> ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
> guest isn't able to enable EEH option for PCI pass-through devices anymore.

Please ignore this patch.

Thanks,
-Mahesh.

