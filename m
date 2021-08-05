Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448E3E155A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 15:08:29 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBd6q-0007pY-1u
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 09:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBd55-0005vB-NA
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:06:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19186
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBd53-0000Bw-Lb
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:06:39 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175D4IMq159296; Thu, 5 Aug 2021 09:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jXuOILSG/8fq52mYkCDTKINRyl2ZK0rWP7Fcaz9h/pc=;
 b=LM1x13t0Fty3ZWn+iJtYJZ1azEue0apI/JhF223jDFcQHQ/wajv5cT2NeUkCfQyyDLRk
 fTQPSKVvWu75H66o1q3dxuvrwtzMV24C9a2TEf7NObJZP1zyjTyXxOqe3ZY1xlaL7QFw
 eLSaWdDagbQWF0mGYCuyZGIKh/GzxHU+3qE2xVJbNIj+3rhN8x0Y4PQ/CUp5l/1XIXir
 QqsQ29IY43X0OyYUUeLYHccP9nEgSuDjOUWqEK86PHuCRDv6gCdbcM9Jj/iVzzm8XJdl
 f9rVmutyAd5rqzJLby6yoZhIHQm7M7eBhxgcVkyMf0J1oVE+UdHFD77wGY8tselSOp8X Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a88snmem7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:06:34 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175D4oJE166493;
 Thu, 5 Aug 2021 09:06:34 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a88snmekv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:06:34 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175CwHOr005193;
 Thu, 5 Aug 2021 13:06:33 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3a7anja9av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 13:06:33 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175D6WNB41746896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 13:06:32 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C5BB136060;
 Thu,  5 Aug 2021 13:06:32 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5867013605E;
 Thu,  5 Aug 2021 13:06:29 +0000 (GMT)
Received: from [9.160.123.143] (unknown [9.160.123.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 13:06:28 +0000 (GMT)
Subject: Re: [PATCH v4 05/14] target/i386: sev: provide callback to setup
 outgoing context
To: Ashish Kalra <Ashish.Kalra@amd.com>, qemu-devel@nongnu.org
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <7521883afc073960728f6f0837dac9be1641dcb6.1628076205.git.ashish.kalra@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <d0fd1154-669a-c5af-188e-9e7ba15b989e@linux.ibm.com>
Date: Thu, 5 Aug 2021 16:06:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7521883afc073960728f6f0837dac9be1641dcb6.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Uki2Gx0dGwrZsZgYjvKFN9M0DHT8ZKOv
X-Proofpoint-GUID: jDku2rvrvsnioTNzY3fw5CaWEd6-okwg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_04:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 clxscore=1015 mlxscore=0 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050080
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



On 04/08/2021 14:56, Ashish Kalra wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> The user provides the target machine's Platform Diffie-Hellman key (PDH)
> and certificate chain before starting the SEV guest migration. Cache the
> certificate chain as we need them while creating the outgoing context.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  include/sysemu/sev.h |  2 ++
>  target/i386/sev.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> index 94d821d737..64fc88d3c5 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -14,11 +14,13 @@
>  #ifndef QEMU_SEV_H
>  #define QEMU_SEV_H
> 
> +#include <qapi/qapi-types-migration.h>
>  #include "sysemu/kvm.h"
> 
>  bool sev_enabled(void);
>  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
>  int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
> +int sev_save_setup(MigrationParameters *p);
>  int sev_inject_launch_secret(const char *hdr, const char *secret,
>                               uint64_t gpa, Error **errp);
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 83df8c09f6..5e7c87764c 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -24,6 +24,7 @@
>  #include "qemu/module.h"
>  #include "qemu/uuid.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/sev.h"
>  #include "sev_i386.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
> @@ -68,6 +69,12 @@ struct SevGuestState {
>      int sev_fd;
>      SevState state;
>      gchar *measurement;
> +    guchar *remote_pdh;
> +    size_t remote_pdh_len;
> +    guchar *remote_plat_cert;
> +    size_t remote_plat_cert_len;
> +    guchar *amd_cert;
> +    size_t amd_cert_len;
> 
>      uint32_t reset_cs;
>      uint32_t reset_ip;
> @@ -116,6 +123,12 @@ static const char *const sev_fw_errlist[] = {
> 
>  #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
> 
> +#define SEV_FW_BLOB_MAX_SIZE            0x4000          /* 16KB */
> +
> +static struct ConfidentialGuestMemoryEncryptionOps sev_memory_encryption_ops = {
> +    .save_setup = sev_save_setup,
> +};
> +
>  static int
>  sev_ioctl(int fd, int cmd, void *data, int *error)
>  {
> @@ -772,6 +785,50 @@ sev_vm_state_change(void *opaque, bool running, RunState state)
>      }
>  }
> 
> +static inline bool check_blob_length(size_t value)
> +{
> +    if (value > SEV_FW_BLOB_MAX_SIZE) {
> +        error_report("invalid length max=%d got=%ld",
> +                     SEV_FW_BLOB_MAX_SIZE, value);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +int sev_save_setup(MigrationParameters *p)
> +{
> +    SevGuestState *s = sev_guest;
> +    const char *pdh = p->sev_pdh;
> +    const char *plat_cert = p->sev_plat_cert;
> +    const char *amd_cert = p->sev_amd_cert;
> +
> +    s->remote_pdh = g_base64_decode(pdh, &s->remote_pdh_len);

You should check    if (!s->remote_pdh)   to detect decoding failure
(for all g_base64_decode calls here).

Though I must say, it would be better to check validity of the
user-supplied base64 earlier (when migrate-set-parameters QMP call
occurs), and not later when migration starts.


> +    if (!check_blob_length(s->remote_pdh_len)) {
> +        goto error;
> +    }
> +
> +    s->remote_plat_cert = g_base64_decode(plat_cert,
> +                                          &s->remote_plat_cert_len);
> +    if (!check_blob_length(s->remote_plat_cert_len)) {
> +        goto error;
> +    }
> +
> +    s->amd_cert = g_base64_decode(amd_cert, &s->amd_cert_len);
> +    if (!check_blob_length(s->amd_cert_len)) {
> +        goto error;
> +    }
> +
> +    return 0;
> +
> +error:
> +    g_free(s->remote_pdh);
> +    g_free(s->remote_plat_cert);
> +    g_free(s->amd_cert);
> +
> +    return 1;
> +}
> +
>  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>  {
>      SevGuestState *sev
> @@ -781,6 +838,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>      uint32_t ebx;
>      uint32_t host_cbitpos;
>      struct sev_user_data_status status = {};
> +    ConfidentialGuestSupportClass *cgs_class =
> +        (ConfidentialGuestSupportClass *) object_get_class(OBJECT(cgs));
> 
>      if (!sev) {
>          return 0;
> @@ -870,6 +929,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>      qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
>      qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
> 
> +    cgs_class->memory_encryption_ops = &sev_memory_encryption_ops;
> +
>      cgs->ready = true;
> 
>      return 0;
> 

