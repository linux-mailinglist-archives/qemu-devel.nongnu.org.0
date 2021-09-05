Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021D400ECF
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:20:57 +0200 (CEST)
Received: from localhost ([::1]:50788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMoKd-0002CS-M3
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mMoJK-0000k6-W0
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:19:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mMoJH-0000V4-Jv
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:19:34 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18593pFP180902; Sun, 5 Sep 2021 05:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VaUagRGfYuln6OHi9F3vBTK9Q7yGorQLxz93AWK9BJI=;
 b=S87JFTC5RTYB4+y+nbym3ftD708/KaJ72rwjT+gy8CmLwQgDr+rxX2hcutZPvulup6j0
 vKyEiWaHvf1T0NyyG6oyGk/Aya2qtwYg48Qou1ak2oPsqaD/J+wYqZ4Ablfz/aDo31bU
 VKPyOW4cqwSXlbATkAJ80+64ggFCYWugGLa50UhN5s+ajQ9ZqTxvTbltve2wgka7V1be
 jXCIVo9cNmgjyt8aUTFylT97irn7Tyx/0iIcuKnw44KEG6Bvq/Wb5I7XBiaZ9PJwoWOK
 R+meRQqFvTW/2fACwR1H7JrpS2wnIJOt8KNuZSbe75oKcjqnzjWAsFvHoaAdxQ3PAAjP lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3avpau42vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Sep 2021 05:19:22 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1859DJJX014260;
 Sun, 5 Sep 2021 05:19:22 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3avpau42v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Sep 2021 05:19:22 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1859I6Uh015384;
 Sun, 5 Sep 2021 09:19:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3av0e8xhkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 Sep 2021 09:19:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1859JJx828705110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 5 Sep 2021 09:19:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BE98C6059;
 Sun,  5 Sep 2021 09:19:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE0FAC605B;
 Sun,  5 Sep 2021 09:19:13 +0000 (GMT)
Received: from [9.65.84.185] (unknown [9.65.84.185])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun,  5 Sep 2021 09:19:13 +0000 (GMT)
Subject: Re: [RFC PATCH v2 04/12] i386/sev: initialize SNP context
To: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <20210826222627.3556-1-michael.roth@amd.com>
 <20210826222627.3556-5-michael.roth@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <7a35c637-eecc-7897-048d-994aeb128549@linux.ibm.com>
Date: Sun, 5 Sep 2021 12:19:11 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826222627.3556-5-michael.roth@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e7FhgxIcvwWbkFp0eedsckz3h230O-Ru
X-Proofpoint-ORIG-GUID: -2F54nlfcKiIIXyrQBRXDAdcictT2KWl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-04_09:2021-09-03,
 2021-09-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109050063
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 27/08/2021 1:26, Michael Roth wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> When SEV-SNP is enabled, the KVM_SNP_INIT command is used to initialize
> the platform. The command checks whether SNP is enabled in the KVM, if
> enabled then it allocates a new ASID from the SNP pool and calls the
> firmware to initialize the all the resources.
> 


From the KVM code ("[PATCH Part2 v5 24/45] KVM: SVM: Add
KVM_SEV_SNP_LAUNCH_START command") it seems that KVM_SNP_INIT does *not*
allocate the ASID; actually this is done in KVM_SEV_SNP_LAUNCH_START.

If that is indeed the case, I suggest removing this sentence here and
adding it in the appropriate QEMU step (patch 5?).

-Dov



> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  target/i386/sev-stub.c |  6 ++++++
>  target/i386/sev.c      | 27 ++++++++++++++++++++++++---
>  target/i386/sev_i386.h |  1 +
>  3 files changed, 31 insertions(+), 3 deletions(-)
> 

[...]

