Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA023CD43C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:58:22 +0200 (CEST)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Rug-00086A-20
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1m5RZ1-0005vR-6Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:35:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1m5RYz-0002sC-JT
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:35:58 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JBZf7n031116; Mon, 19 Jul 2021 07:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zkxwCRqlJCStSrqFy2KfmPwNYzFYes6pCW6qan7Nht8=;
 b=Vz7nEhbvmF7dRJLDVAVxFSKEZ2bpv/ehi9EtCzyIU8G+YEauaUZ0dPiIeKmPVkm4Kkft
 oDDxA6LYrNffvR/wPIvxKM7mydfHjiIvTgwfyh/K3Kkax6SV4W3wClDwoInKb4vXEG+Y
 CYx7SUyEPrOjD3Eb7LelsOq3PGetVsnOPHSizFtwwYwPEsxJIgfkNLfNb8mxPWopVykn
 ylNe361Zh9kxIZAzNDpi8gjLIft7RPIdEMAhFNdhfrCieRl/xspFhMHZjrGgYn+HwBau
 1EP/K9IaDEKFU+sGF1IyjGxdLktvy+3V+Fz1f3gWvPP9gc2d4SjBIzV7ru7OiZ8bhs3y YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39w7yksn1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 07:35:50 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JBZnL4031875;
 Mon, 19 Jul 2021 07:35:49 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39w7yksmqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 07:35:49 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JBStUW032161;
 Mon, 19 Jul 2021 11:35:27 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 39upua404s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 11:35:27 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JBZQH234406868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 11:35:26 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9897E124080;
 Mon, 19 Jul 2021 11:35:26 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF762124085;
 Mon, 19 Jul 2021 11:35:23 +0000 (GMT)
Received: from [9.65.195.237] (unknown [9.65.195.237])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 11:35:23 +0000 (GMT)
Subject: Re: [RFC PATCH 1/6] linux-header: add the SNP specific command
To: Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
References: <20210709215550.32496-1-brijesh.singh@amd.com>
 <20210709215550.32496-2-brijesh.singh@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <cb98088a-a347-d921-0f1d-d271d740c649@linux.ibm.com>
Date: Mon, 19 Jul 2021 14:35:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210709215550.32496-2-brijesh.singh@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6L3N1rfCnGKkxc3gRfZwqJiyBth-lb6d
X-Proofpoint-ORIG-GUID: usHTDc4mIz38WHl1Ou2wypMNZjB5nlJw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-16,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190065
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Michael Roth <michael.roth@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Brijesh,

On 10/07/2021 0:55, Brijesh Singh wrote:
> Sync the kvm.h with the kernel to include the SNP specific commands.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  linux-headers/linux/kvm.h | 47 +++++++++++++++++++++++++++++++++++++++


What about psp-sev.h ? I see that kernel patch "[PATCH Part2 RFC v4
11/40] crypto:ccp: Define the SEV-SNP commands" adds some new PSP return
codes.

The QEMU user-friendly string list sev_fw_errlist (in sev.c) should be
updated accordingly.

-Dov


