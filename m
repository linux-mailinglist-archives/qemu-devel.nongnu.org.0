Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21583E1710
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:37:58 +0200 (CEST)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeVR-0004XQ-OJ
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBeTg-0002PN-8n
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:36:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23122
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mBeTb-0002QT-Bq
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:36:08 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175EWhcV106364; Thu, 5 Aug 2021 10:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=E998k2t7Vrkvcs1PBj9HBL9q/9MYSSEOADC9zJzkz8U=;
 b=RyEi68N0xHfsNIj0pwIgCI0ZphJtjQqtl2na/1Dqg1VHbZY/Q9/PZH5aNRDW8f6k3skA
 iCY6tqZp+XAAXLtgXqG2uSWglcBTQGT+ge0hffVShIl1Odmb5QMenLHUguIkhQpBlR2X
 fJwRd4q51uCi39LKrAE67MFd/fLtWaLvg0Sx9BCmsizha+LnyXlNNrREnBCE9hqqq93S
 EkqsAlWvukwNn7d7gOyTJzAsTzLU9a9a8ccW4moaxLm4lFoVksXWeNdvZycnxJtdL92h
 8gg+/G4FmQ6t/DzsChK5QEH0YiLish+AbGcMcA3+DbxwADAZGLYI/Lt5RWNS+aSZkjs2 eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a859d3y4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 10:35:57 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175EX162107937;
 Thu, 5 Aug 2021 10:35:56 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a859d3y3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 10:35:56 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175EXGPC001906;
 Thu, 5 Aug 2021 14:35:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3a7vva9yqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 14:35:55 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175EZs8r45351220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 14:35:54 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A06F136060;
 Thu,  5 Aug 2021 14:35:54 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9838A136065;
 Thu,  5 Aug 2021 14:35:51 +0000 (GMT)
Received: from [9.160.123.143] (unknown [9.160.123.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 14:35:51 +0000 (GMT)
Subject: Re: [PATCH v4 07/14] target/i386: sev: add support to encrypt the
 outgoing page
To: Ashish Kalra <Ashish.Kalra@amd.com>, qemu-devel@nongnu.org
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <5187c6f86bd3e253be565f3773f85e92879c5391.1628076205.git.ashish.kalra@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <8703eba0-58f8-0408-43cd-c12455297072@linux.ibm.com>
Date: Thu, 5 Aug 2021 17:35:49 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5187c6f86bd3e253be565f3773f85e92879c5391.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VoHhR-mBzExZ64bHA9es0V72GTBZmVSr
X-Proofpoint-ORIG-GUID: wIs8P7G4X2gj9aWu3YgZe7mLEKSq1W5P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_05:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050088
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, tobin@ibm.com, dgilbert@redhat.com,
 dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


General comment: In this series you add a lot of migration-related
functionality to sev.c.   Consider moving these functions to
sev-migration.c . (cc: Phil, who attempted some reorg around SEV code.)



On 04/08/2021 14:56, Ashish Kalra wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> The sev_save_outgoing_page() provide the implementation to encrypt the
> guest private pages during the transit. The routines uses the SEND_START
> command to create the outgoing encryption context on the first call then
> uses the SEND_UPDATE_DATA command to encrypt the data before writing it
> to the socket. While encrypting the data SEND_UPDATE_DATA produces some
> metadata (e.g MAC, IV). The metadata is also sent to the target machine.
> After migration is completed, we issue the SEND_FINISH command to transition
> the SEV guest state from sending to unrunnable state.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  include/sysemu/sev.h     |   2 +
>  target/i386/sev.c        | 221 +++++++++++++++++++++++++++++++++++++++
>  target/i386/trace-events |   3 +
>  3 files changed, 226 insertions(+)
> 
> diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
> index 64fc88d3c5..aa6b91a53e 100644
> --- a/include/sysemu/sev.h
> +++ b/include/sysemu/sev.h
> @@ -21,6 +21,8 @@ bool sev_enabled(void);
>  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
>  int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
>  int sev_save_setup(MigrationParameters *p);
> +int sev_save_outgoing_page(QEMUFile *f, uint8_t *ptr,
> +                           uint32_t size, uint64_t *bytes_sent);

This function is added to the sev_memory_encryption_ops struct; why do
you need to export it here?


>  int sev_inject_launch_secret(const char *hdr, const char *secret,
>                               uint64_t gpa, Error **errp);
> 
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 10038d3880..411bd657e8 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -30,6 +30,8 @@
>  #include "sysemu/runstate.h"
>  #include "trace.h"
>  #include "migration/blocker.h"
> +#include "migration/qemu-file.h"
> +#include "migration/misc.h"
>  #include "qom/object.h"
>  #include "monitor/monitor.h"
>  #include "exec/confidential-guest-support.h"
> @@ -75,6 +77,8 @@ struct SevGuestState {
>      size_t remote_plat_cert_len;
>      guchar *amd_cert;
>      size_t amd_cert_len;
> +    gchar *send_packet_hdr;
> +    size_t send_packet_hdr_len;
> 
>      uint32_t reset_cs;
>      uint32_t reset_ip;
> @@ -127,6 +131,7 @@ static const char *const sev_fw_errlist[] = {
> 
>  static struct ConfidentialGuestMemoryEncryptionOps sev_memory_encryption_ops = {
>      .save_setup = sev_save_setup,
> +    .save_outgoing_page = sev_save_outgoing_page,
>  };
> 
>  static int
> @@ -829,6 +834,40 @@ error:
>      return 1;
>  }
> 
> +static void
> +sev_send_finish(void)
> +{
> +    int ret, error;
> +
> +    trace_kvm_sev_send_finish();
> +    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_SEND_FINISH, 0, &error);
> +    if (ret) {
> +        error_report("%s: SEND_FINISH ret=%d fw_error=%d '%s'",
> +                     __func__, ret, error, fw_error_to_str(error));
> +    }
> +
> +    g_free(sev_guest->send_packet_hdr);
> +    sev_set_guest_state(sev_guest, SEV_STATE_RUNNING);
> +}
> +
> +static void
> +sev_migration_state_notifier(Notifier *notifier, void *data)
> +{
> +    MigrationState *s = data;
> +
> +    if (migration_has_finished(s) ||
> +        migration_in_postcopy_after_devices(s) ||
> +        migration_has_failed(s)) {
> +        if (sev_check_state(sev_guest, SEV_STATE_SEND_UPDATE)) {
> +            sev_send_finish();
> +        }
> +    }
> +}
> +
> +static Notifier sev_migration_state_notify = {
> +    .notify = sev_migration_state_notifier,
> +};
> +
>  int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>  {
>      SevGuestState *sev
> @@ -933,6 +972,7 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>      ram_block_notifier_add(&sev_ram_notifier);
>      qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
>      qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
> +    add_migration_state_change_notifier(&sev_migration_state_notify);
> 
>      cgs_class->memory_encryption_ops = &sev_memory_encryption_ops;
> 
> @@ -1143,6 +1183,187 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
>      return 0;
>  }
> 
> +static int
> +sev_get_send_session_length(void)
> +{
> +    int ret, fw_err = 0;
> +    struct kvm_sev_send_start start = {};
> +
> +    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_SEND_START, &start, &fw_err);
> +    if (fw_err != SEV_RET_INVALID_LEN) {
> +        ret = -1;
> +        error_report("%s: failed to get session length ret=%d fw_error=%d '%s'",
> +                     __func__, ret, fw_err, fw_error_to_str(fw_err));
> +        goto err;

Simply return -1 and eliminate the ret variable?

> +    }
> +
> +    ret = start.session_len;
> +err:
> +    return ret;
> +}
> +
> +static int
> +sev_send_start(SevGuestState *s, QEMUFile *f, uint64_t *bytes_sent)
> +{
> +    gsize pdh_len = 0, plat_cert_len;
> +    int session_len, ret, fw_error;
> +    struct kvm_sev_send_start start = { };
> +    guchar *pdh = NULL, *plat_cert = NULL, *session = NULL;
> +    Error *local_err = NULL;
> +
> +    if (!s->remote_pdh || !s->remote_plat_cert || !s->amd_cert_len) {
> +        error_report("%s: missing remote PDH or PLAT_CERT", __func__);
> +        return 1;
> +    }
> +
> +   start.pdh_cert_uaddr = (uintptr_t) s->remote_pdh;
> +   start.pdh_cert_len = s->remote_pdh_len;
> +
> +   start.plat_certs_uaddr = (uintptr_t)s->remote_plat_cert;
> +   start.plat_certs_len = s->remote_plat_cert_len;
> +
> +   start.amd_certs_uaddr = (uintptr_t)s->amd_cert;
> +   start.amd_certs_len = s->amd_cert_len;
> +
> +    /* get the session length */
> +   session_len = sev_get_send_session_length();
> +   if (session_len < 0) {
> +       ret = 1;
> +       goto err;
> +   }
> +
> +   session = g_new0(guchar, session_len);
> +   start.session_uaddr = (unsigned long)session;
> +   start.session_len = session_len;
> +
> +   /* Get our PDH certificate */
> +   ret = sev_get_pdh_info(s->sev_fd, &pdh, &pdh_len,
> +                          &plat_cert, &plat_cert_len, &local_err);
> +   if (ret) {
> +       error_report("Failed to get our PDH cert");

Add __func__ like other error_report calls here.

> +       goto err;
> +   }
> +
> +   trace_kvm_sev_send_start(start.pdh_cert_uaddr, start.pdh_cert_len,
> +                            start.plat_certs_uaddr, start.plat_certs_len,
> +                            start.amd_certs_uaddr, start.amd_certs_len);
> +
> +   ret = sev_ioctl(s->sev_fd, KVM_SEV_SEND_START, &start, &fw_error);
> +   if (ret < 0) {
> +       error_report("%s: SEND_START ret=%d fw_error=%d '%s'",
> +               __func__, ret, fw_error, fw_error_to_str(fw_error));
> +       goto err;
> +   }
> +
> +   qemu_put_be32(f, start.policy);
> +   qemu_put_be32(f, pdh_len);
> +   qemu_put_buffer(f, (uint8_t *)pdh, pdh_len);
> +   qemu_put_be32(f, start.session_len);
> +   qemu_put_buffer(f, (uint8_t *)start.session_uaddr, start.session_len);
> +   *bytes_sent = 12 + pdh_len + start.session_len;

I prefer updating *bytes_sent in steps, like you do below in
sev_send_update_data.

> +
> +   sev_set_guest_state(s, SEV_STATE_SEND_UPDATE);
> +
> +err:
> +   g_free(pdh);
> +   g_free(plat_cert);
> +   return ret;
> +}
> +
> +static int
> +sev_send_get_packet_len(int *fw_err)
> +{
> +    int ret;
> +    struct kvm_sev_send_update_data update = {};
> +
> +    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_SEND_UPDATE_DATA,
> +                    &update, fw_err);
> +    if (*fw_err != SEV_RET_INVALID_LEN) {
> +        ret = -1;
> +        error_report("%s: failed to get session length ret=%d fw_error=%d '%s'",
> +                    __func__, ret, *fw_err, fw_error_to_str(*fw_err));
> +        goto err;

Simply return -1, remove ret variable?

> +    }
> +
> +    ret = update.hdr_len;
> +
> +err:
> +    return ret;
> +}
> +
> +static int
> +sev_send_update_data(SevGuestState *s, QEMUFile *f, uint8_t *ptr, uint32_t size,
> +                     uint64_t *bytes_sent)
> +{
> +    int ret, fw_error;
> +    guchar *trans;
> +    struct kvm_sev_send_update_data update = { };
> +
> +    /*
> +     * If this is first call then query the packet header bytes and allocate
> +     * the packet buffer.
> +     */
> +    if (!s->send_packet_hdr) {
> +        s->send_packet_hdr_len = sev_send_get_packet_len(&fw_error);
> +        if (s->send_packet_hdr_len < 1) {
> +            error_report("%s: SEND_UPDATE fw_error=%d '%s'",
> +                         __func__, fw_error, fw_error_to_str(fw_error));
> +            return 1;
> +        }
> +
> +        s->send_packet_hdr = g_new(gchar, s->send_packet_hdr_len);
> +    }
> +
> +    /* allocate transport buffer */
> +    trans = g_new(guchar, size);

Is it OK to allocate and free this buffer (4 KB, I assume) for every page?

If that's the purpose, use g_autofree, and replace "goto err" with return.


-Dov

> +
> +    update.hdr_uaddr = (uintptr_t)s->send_packet_hdr;
> +    update.hdr_len = s->send_packet_hdr_len;
> +    update.guest_uaddr = (uintptr_t)ptr;
> +    update.guest_len = size;
> +    update.trans_uaddr = (uintptr_t)trans;
> +    update.trans_len = size;
> +
> +    trace_kvm_sev_send_update_data(ptr, trans, size);
> +
> +    ret = sev_ioctl(s->sev_fd, KVM_SEV_SEND_UPDATE_DATA, &update, &fw_error);
> +    if (ret) {
> +        error_report("%s: SEND_UPDATE_DATA ret=%d fw_error=%d '%s'",
> +                     __func__, ret, fw_error, fw_error_to_str(fw_error));
> +        goto err;
> +    }
> +
> +    qemu_put_be32(f, update.hdr_len);
> +    qemu_put_buffer(f, (uint8_t *)update.hdr_uaddr, update.hdr_len);
> +    *bytes_sent = 4 + update.hdr_len;
> +
> +    qemu_put_be32(f, update.trans_len);
> +    qemu_put_buffer(f, (uint8_t *)update.trans_uaddr, update.trans_len);
> +    *bytes_sent += (4 + update.trans_len);
> +
> +err:
> +    g_free(trans);
> +    return ret;
> +}
> +
> +int sev_save_outgoing_page(QEMUFile *f, uint8_t *ptr,
> +                           uint32_t sz, uint64_t *bytes_sent)
> +{
> +    SevGuestState *s = sev_guest;
> +
> +    /*
> +     * If this is a first buffer then create outgoing encryption context
> +     * and write our PDH, policy and session data.
> +     */
> +    if (!sev_check_state(s, SEV_STATE_SEND_UPDATE) &&
> +        sev_send_start(s, f, bytes_sent)) {
> +        error_report("Failed to create outgoing context");
> +        return 1;
> +    }
> +
> +    return sev_send_update_data(s, f, ptr, sz, bytes_sent);
> +}
> +
>  static void
>  sev_register_types(void)
>  {
> diff --git a/target/i386/trace-events b/target/i386/trace-events
> index 2cd8726eeb..e8d4aec125 100644
> --- a/target/i386/trace-events
> +++ b/target/i386/trace-events
> @@ -11,3 +11,6 @@ kvm_sev_launch_measurement(const char *value) "data %s"
>  kvm_sev_launch_finish(void) ""
>  kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
>  kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data %s"
> +kvm_sev_send_start(uint64_t pdh, int l1, uint64_t plat, int l2, uint64_t amd, int l3) "pdh 0x%" PRIx64 " len %d plat 0x%" PRIx64 " len %d amd 0x%" PRIx64 " len %d"
> +kvm_sev_send_update_data(void *src, void *dst, int len) "guest %p trans %p len %d"
> +kvm_sev_send_finish(void) ""
> 

