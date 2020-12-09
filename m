Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40252D48D0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:20:23 +0100 (CET)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn44c-0002w7-PB
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1kn3jL-0001yO-HM; Wed, 09 Dec 2020 12:58:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33776
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1kn3jH-0004mz-OM; Wed, 09 Dec 2020 12:58:23 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9HWPZJ050700; Wed, 9 Dec 2020 12:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xhduCs2iMF0wJqHB93zgtCSLekNneR6CpGVSRCOx7OQ=;
 b=etn1K8Or2R1vlH5cnK5rOjpnAmaafPIfMjZwPP9ewoRw9GF0DKpGy/hOEixRwfC1fMQ5
 vIwojZU7fm88BKUMVQF/0kjywXEBZ8ZCXduWqak1wHznkdRSUSRDE7KUS2+D3mDWsaVq
 iMxN1q6MByNUQ3utz5XkU7LvpXbfKvll/fTw/Oc9EU8Q6CjWj/sO9dAuRsViBIg9wOLN
 Km7TRK3pF9BRYidr5j5FkLvzuvlFVmOwXBbb89pDgrlvdz8fd2twFbt3f5LnBesjp1xA
 P2pijU9DeeUBhI2ttFDbR599kIKDMT7mq4YPYSqXkDKinYfiwiSPVT3Vj2ziRsy+SPVM ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35b1045455-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:58:16 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9Htjjp146275;
 Wed, 9 Dec 2020 12:58:15 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35b104544j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:58:15 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9Hv9nE008216;
 Wed, 9 Dec 2020 17:58:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3581fhmvxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:58:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9HwB5x20381974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:58:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EF9811C052;
 Wed,  9 Dec 2020 17:58:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46F3711C04A;
 Wed,  9 Dec 2020 17:58:09 +0000 (GMT)
Received: from [9.160.14.198] (unknown [9.160.14.198])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:58:08 +0000 (GMT)
Subject: Re: [PATCH] target/i386: tracing: format length values as hex
To: qemu-devel@nongnu.org
References: <20201103100745.160409-1-dovmurik@linux.vnet.ibm.com>
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
Message-ID: <15956748-ce3b-1ff8-ba68-66d441b7b981@linux.vnet.ibm.com>
Date: Wed, 9 Dec 2020 19:58:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201103100745.160409-1-dovmurik@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090120
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

Adding CC qemu-trivial.

This already got one R-b:
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg00525.html

-Dov


On 03/11/2020 12:07, Dov Murik wrote:
> Three trace events had a literal "0x" prefix but the 'len' values were
> formatted in decimal base.  Keep the prefix and format the numbers as
> hex, as is usually the case for length of memory regions.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> ---
>   target/i386/trace-events | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/trace-events b/target/i386/trace-events
> index 789c700d4a..65c9b0fdda 100644
> --- a/target/i386/trace-events
> +++ b/target/i386/trace-events
> @@ -8,10 +8,10 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
> 
>   # sev.c
>   kvm_sev_init(void) ""
> -kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zu"
> -kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zu"
> +kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zx"
> +kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zx"
>   kvm_sev_change_state(const char *old, const char *new) "%s -> %s"
>   kvm_sev_launch_start(int policy, void *session, void *pdh) "policy 0x%x session %p pdh %p"
> -kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIu64
> +kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIx64
>   kvm_sev_launch_measurement(const char *value) "data %s"
>   kvm_sev_launch_finish(void) ""
> 

