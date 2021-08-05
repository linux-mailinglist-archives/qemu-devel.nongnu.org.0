Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C6C3E14A1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:22:12 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcO3-0005sJ-Dr
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBcN1-0005C2-04
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:21:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54658
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBcMv-0006Xd-Mq
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:21:06 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175CFUJw040118; Thu, 5 Aug 2021 08:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=m9gwTLmKjJqaMwNNBiJZk3nNMDdY6/3oS0Ug2Zd1h/M=;
 b=MHAbafegJUn07F/EImApkOJFnex24f7vDqIXI4S6RqC45HOUthgMJ619c0K/3h/SXYS4
 x/ALVz/dSXAdbTv9DaLBl+zpAlv77rUp4TwsUWVx8a7GLgEjAJ8R7XIMlLCbNyV/t4Vx
 7RRz7252Xvh3veC7a0zvHnKh1oHQ1Eh0+88jmighWDchqjWzui7FlzIz+CH0nAbB4Uus
 +jJU1q/qTpxr3uB80g3NA5JjGNgY9fSLPRaPi5Ctg5JokgNK3rfObwG/sRrp0R0wLpwK
 eSTAUENauIFj5jLoJ+i1A+uNaGoHWeL4EgMWJbNl50VqY36dptOBspfuOS6thIdPyMH0 ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a88b9uth7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 08:20:58 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175CG6mL041599;
 Thu, 5 Aug 2021 08:20:58 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a88b9uth0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 08:20:58 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175C8Hr9011160;
 Thu, 5 Aug 2021 12:20:57 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3a7anj8b5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 12:20:57 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175CKurB51446096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 12:20:56 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CBE2136060;
 Thu,  5 Aug 2021 12:20:56 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C145013605D;
 Thu,  5 Aug 2021 12:20:53 +0000 (GMT)
Received: from [9.160.123.143] (unknown [9.160.123.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 12:20:53 +0000 (GMT)
Subject: Re: [PATCH v4 04/14] confidential guest support: introduce
 ConfidentialGuestMemoryEncryptionOps for encrypted VMs
To: Ashish Kalra <Ashish.Kalra@amd.com>, qemu-devel@nongnu.org
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <74fce7be9bd219ce902851c0b27192fdefbf9ef1.1628076205.git.ashish.kalra@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <a608f479-1eca-6738-d96b-75145c334b29@linux.ibm.com>
Date: Thu, 5 Aug 2021 15:20:50 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <74fce7be9bd219ce902851c0b27192fdefbf9ef1.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ej4oosB43jTTqiYZuCW1evyoJyIJyvZu
X-Proofpoint-GUID: ZxlmEs70XmYQqDVayNHkoRTGC31aNoLv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_04:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050073
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



On 04/08/2021 14:55, Ashish Kalra wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> When memory encryption is enabled in VM, the guest RAM will be encrypted
> with the guest-specific key, to protect the confidentiality of data while
> in transit we need to platform specific hooks to save or migrate the
> guest RAM.
> 
> Introduce the new ConfidentialGuestMemoryEncryptionOps in this patch
> which will be later used by the encrypted guest for migration.

Do we already have SEV / ConfidentialGuest debug operations? (for
reading SEV guest memory from gdb if debug is allowed in policy)

Are they supposed to be in the same Ops struct? Another?


> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  include/exec/confidential-guest-support.h | 27 +++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
> index ba2dd4b5df..d8b4bd4c42 100644
> --- a/include/exec/confidential-guest-support.h
> +++ b/include/exec/confidential-guest-support.h
> @@ -20,6 +20,7 @@
> 
>  #ifndef CONFIG_USER_ONLY
> 
> +#include <qapi/qapi-types-migration.h>
>  #include "qom/object.h"
> 
>  #define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
> @@ -53,8 +54,34 @@ struct ConfidentialGuestSupport {
>      bool ready;
>  };
> 
> +/**
> + * The functions registers with ConfidentialGuestMemoryEncryptionOps will be
> + * used during the encrypted guest migration.
> + */
> +struct ConfidentialGuestMemoryEncryptionOps {

[style] in QEMU you should add a 'typedef' at the beginning and call the
type ConfidentialGuestMemoryEncryptionOps, and then you don't use the
keyword 'struct' when you refer to it.  See for example the definition
of ConfidentialGuestSupportClass below.


> +    /* Initialize the platform specific state before starting the migration */
> +    int (*save_setup)(MigrationParameters *p);
> +
> +    /* Write the encrypted page and metadata associated with it */
> +    int (*save_outgoing_page)(QEMUFile *f, uint8_t *ptr, uint32_t size,
> +                              uint64_t *bytes_sent);
> +
> +    /* Load the incoming encrypted page into guest memory */
> +    int (*load_incoming_page)(QEMUFile *f, uint8_t *ptr);
> +
> +    /* Check if gfn is in shared/unencrypted region */
> +    bool (*is_gfn_in_unshared_region)(unsigned long gfn);

The comment says "shared/unencrypted", but the function name talks about
"unshared".  I prefer:

    /* Check if gfn is in encrypted region */
    bool (*is_gfn_in_encrypted_region)(unsigned long gfn);

(and then maybe the comment is useless?)


> +
> +    /* Write the shared regions list */
> +    int (*save_outgoing_shared_regions_list)(QEMUFile *f);
> +
> +    /* Load the shared regions list */
> +    int (*load_incoming_shared_regions_list)(QEMUFile *f);
> +};
> +
>  typedef struct ConfidentialGuestSupportClass {
>      ObjectClass parent;
> +    struct ConfidentialGuestMemoryEncryptionOps *memory_encryption_ops;

per above, remove 'struct'.


>  } ConfidentialGuestSupportClass;
> 
>  #endif /* !CONFIG_USER_ONLY */
> 

