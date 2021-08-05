Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95973E0E75
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 08:36:04 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBWz5-0007t6-DJ
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 02:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBWxz-0006RO-1L
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 02:34:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15640
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBWxx-0006wb-7z
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 02:34:54 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1756YB6v193235; Thu, 5 Aug 2021 02:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EupvH0Z52rmi296cyxW51NyIU/Y8ErAFgaWMcgpKpHM=;
 b=b1fs0ZrVwAjvrZixnijb0mpHZ6Cma1YCXR6zXKjikrI/hbS7DuEGzs2B1wh9KlBZdbbg
 Yvhrq225vK3XaoU1m4Fvtz+vvSFrUz2QMw+Ma+Ed69uE/ETjhL80LVTlveSOqDU8lWxo
 zetIc2lttFimiwEO2Gd3o8JKQ8iZtWgLqYWxRw+43ipK6GequUq63IEF9uLXnCaC5MUt
 zAXd/rfpvYwb0wbJL6DqRoWZllbUEbSlkS/TBj7JSuQO5OGWgz8RgQ/xf19bt+9YXLVw
 QoNIXGiaR9a1NlsHVlod3kM/sWY1CSo1lcQfNTg0mZS3/3YPJ3a3tKbHYmkBo5mtuQxe bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a89pqhk6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 02:34:50 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1756Ynnj195167;
 Thu, 5 Aug 2021 02:34:49 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a89pqhk6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 02:34:49 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1756YGni010309;
 Thu, 5 Aug 2021 06:34:49 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3a6j2h4weq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 06:34:49 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1756Ylk646268924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 06:34:47 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C87B6A066;
 Thu,  5 Aug 2021 06:34:47 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E2B36A05A;
 Thu,  5 Aug 2021 06:34:44 +0000 (GMT)
Received: from [9.160.123.143] (unknown [9.160.123.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 06:34:44 +0000 (GMT)
Subject: Re: [PATCH v4 02/14] doc: update AMD SEV to include Live migration
 flow
To: Ashish Kalra <Ashish.Kalra@amd.com>, qemu-devel@nongnu.org
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <0e2b3d80e3d61b121ff4b508e5299e3c23f7b090.1628076205.git.ashish.kalra@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <e1eacdaf-3ccb-9e17-af78-5c33a05316e5@linux.ibm.com>
Date: Thu, 5 Aug 2021 09:34:42 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <0e2b3d80e3d61b121ff4b508e5299e3c23f7b090.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7nVygw8P6weL94yTFf9HIK13PdMfp30J
X-Proofpoint-ORIG-GUID: fOuZQ5vLhvNbpBx1onX6nXNJ3t4CSWZj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050037
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132, SPF_HELO_NONE=0.001,
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, tobin@ibm.com, dgilbert@redhat.com,
 dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/08/2021 14:53, Ashish Kalra wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  docs/amd-memory-encryption.txt | 46 +++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index 12ca25180e..0d9184532a 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -126,7 +126,51 @@ TODO
> 
>  Live Migration
>  ----------------
> -TODO
> +AMD SEV encrypts the memory of VMs and because a different key is used
> +in each VM, the hypervisor will be unable to simply copy the
> +ciphertext from one VM to another to migrate the VM. Instead the AMD SEV Key
> +Management API provides sets of function which the hypervisor can use
> +to package a guest page for migration, while maintaining the confidentiality
> +provided by AMD SEV.
> +
> +SEV guest VMs have the concept of private and shared memory. The private
> +memory is encrypted with the guest-specific key, while shared memory may
> +be encrypted with the hypervisor key. The migration APIs provided by the
> +SEV API spec should be used for migrating the private pages.
> +
> +The KVM_HC_MAP_GPA_RANGE hypercall is used by the SEV guest to notify a
> +change in the page encryption status to the hypervisor. The hypercall
> +is invoked when the encryption attribute is changed from encrypted -> decrypted
> +and vice versa. By default all guest pages are considered encrypted.
> +
> +This hypercall exits to qemu via KVM_EXIT_HYPERCALL to manage the guest
> +shared regions and integrate with the qemu's migration code. The shared
> +region list can be used to check if the given guest page is private or shared.
> +
> +Before initiating the migration, we need to know the targets machine's public

s/targets/target/

> +Diffie-Hellman key (PDH) and certificate chain. It can be retrieved
> +with the 'query-sev-capabilities' QMP command or using the sev-tool. The
> +migrate-set-parameter can be used to pass the target machine's PDH and
> +certificate chain.

It's better to clarify that you use query-sev-capabilities QMP command
on the *target* VM (to get its PDF and cert) when it's ready, and then
use migrate-set-parameter QMP command on the *source* so it can prepare
the migration for that specific target.


> +
> +During the migration flow, the SEND_START is called on the source hypervisor
> +to create an outgoing encryption context. The SEV guest policy dictates whether
> +the certificate passed through the migrate-sev-set-info command will be

Here you say migrate-sev-set-info but above you said
migrate-set-parameter.  Which one is it?


-Dov

> +validated. SEND_UPDATE_DATA is called to encrypt the guest private pages.
> +After migration is completed, SEND_FINISH is called to destroy the encryption
> +context and make the VM non-runnable to protect it against cloning.
> +
> +On the target machine, RECEIVE_START is called first to create an
> +incoming encryption context. The RECEIVE_UPDATE_DATA is called to copy
> +the received encrypted page into guest memory. After migration has
> +completed, RECEIVE_FINISH is called to make the VM runnable.
> +
> +For more information about the migration see SEV API Appendix A
> +Usage flow (Live migration section).
> +
> +NOTE:
> +To protect against the memory clone SEV APIs are designed to make the VM
> +unrunnable in case of the migration failure.
> 
>  References
>  -----------------
> 

