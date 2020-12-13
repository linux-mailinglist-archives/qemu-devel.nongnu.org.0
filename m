Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D563C2D9098
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:34:29 +0100 (CET)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY4a-0006WJ-UE
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1koXym-0007Dd-93
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:28:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19308
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1koXyk-0007uT-3a
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:28:28 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BDK2YpV102378; Sun, 13 Dec 2020 15:28:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bX4isr+E7Yocj9Mhjqlq3LwmHtS3TAvkGpYsfZ2ata0=;
 b=P7z8Ok3uiIYyi2jCHVpYq3ask3qTCLS47aN4BpZceLLiFOMZ+K4IcBvnxptvyzYHRbb8
 9f4e7uBq3W03nXQ30k0hkZUw8GsevvDaS4T4Qcl0iDQVlrozA0hA1OAnXEDCU765j7gK
 sYU1lwPQVxQRBgQl6DbhaXmZxvvYsVvQkBHxp6dZlE3LOUicfRrFxPf7OI6KAsk4W+AK
 9cISeqlRIrrTn+yMSGJrLCi8nKcLUvgicCbcpsFWKslZIgldUj2N5eMiUg6ryBDtnDRF
 GTbXCUo4GZsVAs5J3kO2rCrZj9HxqZ7E0CP4CQO4dM3as3T7CjfM08LM1eDbAhvCbSu6 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35dgjm0f0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Dec 2020 15:28:22 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BDK4UC6107846;
 Sun, 13 Dec 2020 15:28:22 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35dgjm0eyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Dec 2020 15:28:22 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BDKLrZn001938;
 Sun, 13 Dec 2020 20:28:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 35d3108f8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Dec 2020 20:28:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BDKSIsE34668954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Dec 2020 20:28:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC5514204C;
 Sun, 13 Dec 2020 20:28:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7102442047;
 Sun, 13 Dec 2020 20:28:15 +0000 (GMT)
Received: from [9.160.14.198] (unknown [9.160.14.198])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 13 Dec 2020 20:28:15 +0000 (GMT)
Subject: Re: [PATCH] target/i386/sev: add the support to query the attestation
 report
To: Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
References: <20201204213101.14552-1-brijesh.singh@amd.com>
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
Message-ID: <39673b0e-06c0-619d-3929-e6627d566b7f@linux.vnet.ibm.com>
Date: Sun, 13 Dec 2020 22:28:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201204213101.14552-1-brijesh.singh@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-13_06:2020-12-11,
 2020-12-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012130154
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
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/12/2020 23:31, Brijesh Singh wrote:
> The SEV FW >= 0.23 added a new command that can be used to query the
> attestation report containing the SHA-256 digest of the guest memory
> and VMSA encrypted with the LAUNCH_UPDATE and sign it with the PEK.
> 
> Note, we already have a command (LAUNCH_MEASURE) that can be used to
> query the SHA-256 digest of the guest memory encrypted through the
> LAUNCH_UPDATE. The main difference between previous and this command
> is that the report is signed with the PEK and unlike the LAUNCH_MEASURE
> command the ATTESATION_REPORT command can be called while the guest
> is running.
> 
> Add a QMP interface "query-sev-attestation-report" that can be used
> to get the report encoded in base64.
> 
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Tom Lendacky <Thomas.Lendacky@amd.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: kvm@vger.kernel.org
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>   linux-headers/linux/kvm.h |  8 ++++++
>   qapi/misc-target.json     | 38 +++++++++++++++++++++++++++
>   target/i386/monitor.c     |  6 +++++
>   target/i386/sev-stub.c    |  7 +++++
>   target/i386/sev.c         | 54 +++++++++++++++++++++++++++++++++++++++
>   target/i386/sev_i386.h    |  2 ++
>   6 files changed, 115 insertions(+)
> 
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 56ce14ad20..6d0f8101ba 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1585,6 +1585,8 @@ enum sev_cmd_id {
>   	KVM_SEV_DBG_ENCRYPT,
>   	/* Guest certificates commands */
>   	KVM_SEV_CERT_EXPORT,
> +	/* Attestation report */
> +	KVM_SEV_GET_ATTESTATION_REPORT,
> 
>   	KVM_SEV_NR_MAX,
>   };
> @@ -1637,6 +1639,12 @@ struct kvm_sev_dbg {
>   	__u32 len;
>   };
> 
> +struct kvm_sev_attestation_report {
> +	__u8 mnonce[16];
> +	__u64 uaddr;
> +	__u32 len;
> +};
> +
>   #define KVM_DEV_ASSIGN_ENABLE_IOMMU	(1 << 0)
>   #define KVM_DEV_ASSIGN_PCI_2_3		(1 << 1)
>   #define KVM_DEV_ASSIGN_MASK_INTX	(1 << 2)
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 1e561fa97b..ec6565e6ef 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -267,3 +267,41 @@
>   ##
>   { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'],
>     'if': 'defined(TARGET_ARM)' }
> +
> +
> +##
> +# @SevAttestationReport:
> +#
> +# The struct describes attestation report for a Secure Encrypted Virtualization
> +# feature.
> +#
> +# @data:  guest attestation report (base64 encoded)
> +#
> +#
> +# Since: 5.2
> +##
> +{ 'struct': 'SevAttestationReport',
> +  'data': { 'data': 'str'},
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @query-sev-attestation-report:
> +#
> +# This command is used to get the SEV attestation report, and is supported on AMD
> +# X86 platforms only.
> +#
> +# @mnonce: a random 16 bytes of data (it will be included in report)
> +#
> +# Returns: SevAttestationReport objects.
> +#
> +# Since: 5.2
> +#
> +# Example:
> +#
> +# -> { "execute" : "query-sev-attestation-report", "arguments": { "mnonce": "aaaaaaa" } }
> +# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
> +#
> +##
> +{ 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
> +  'returns': 'SevAttestationReport',
> +  'if': 'defined(TARGET_I386)' }
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 9f9e1c42f4..a4b65f330c 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -729,3 +729,9 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
>   {
>       return sev_get_capabilities(errp);
>   }
> +
> +SevAttestationReport *
> +qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
> +{
> +    return sev_get_attestation_report(mnonce, errp);
> +}
> diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
> index 88e3f39a1e..66d16f53d8 100644
> --- a/target/i386/sev-stub.c
> +++ b/target/i386/sev-stub.c
> @@ -49,3 +49,10 @@ SevCapability *sev_get_capabilities(Error **errp)
>       error_setg(errp, "SEV is not available in this QEMU");
>       return NULL;
>   }
> +
> +SevAttestationReport *
> +sev_get_attestation_report(const char *mnonce, Error **errp)
> +{
> +    error_setg(errp, "SEV is not available in this QEMU");
> +    return NULL;
> +}
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 93c4d60b82..28958fb71b 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -68,6 +68,7 @@ struct SevGuestState {
> 
>   #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
>   #define DEFAULT_SEV_DEVICE      "/dev/sev"
> +#define DEFAULT_ATTESATION_REPORT_BUF_SIZE      4096

This is unused.


> 
>   static SevGuestState *sev_guest;
>   static Error *sev_mig_blocker;
> @@ -490,6 +491,59 @@ out:
>       return cap;
>   }
> 
> +SevAttestationReport *
> +sev_get_attestation_report(const char *mnonce, Error **errp)
> +{
> +    struct kvm_sev_attestation_report input = {};
> +    SevGuestState *sev = sev_guest;
> +    SevAttestationReport *report;
> +    guchar *data;
> +    int err = 0, ret;
> +
> +    if (!sev_enabled()) {
> +        error_setg(errp, "SEV is not enabled");
> +        return NULL;
> +    }
> +
> +    /* Verify that user provided random data length */
> +    if (strlen(mnonce) != sizeof(input.mnonce)) {
> +        error_setg(errp, "Expected mnonce data len %ld got %ld",
> +                sizeof(input.mnonce), strlen(mnonce));
> +        return NULL;
> +    }
> +
> +    /* Query the report length */
> +    ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
> +            &input, &err);
> +    if (ret < 0) {
> +        if (err != SEV_RET_INVALID_LEN) {
> +            error_setg(errp, "failed to query the attestation report length "
> +                    "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> +            return NULL;
> +        }
> +    }
> +
> +    data = g_malloc(input.len);
> +    input.uaddr = (unsigned long)data;
> +    memcpy(input.mnonce, mnonce, sizeof(input.mnonce));
> +
> +    /* Query the report */
> +    ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
> +            &input, &err);
> +    if (ret) {
> +        error_setg_errno(errp, errno, "Failed to get attestation report"
> +                " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
> +        goto e_free_data;

James already noted the missing `report = NULL` here. Another option is 
to avoid the goto entirely and use qemu's g_autofree attribute for 
'report'; then you can simply `return NULL` here.  I guess it's a matter 
of style (elsewhere in sev.c there are `goto err`, so maybe it's best to 
keep the same style).



> +    }
> +
> +    report = g_new0(SevAttestationReport, 1);
> +    report->data = g_base64_encode(data, input.len);

In most other SEV commands in sev.c there's a trace-event with the 
details of the command (for example, in sev_launch_get_measure it just 
prints the result).  I think adding such a trace here with the nonce and 
the report->data would be helpful for debugging.

-Dov


> +
> +e_free_data:
> +    g_free(data);
> +    return report;
> +}
> +
>   static int
>   sev_read_file_base64(const char *filename, guchar **data, gsize *len)
>   {
> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
> index 4db6960f60..e2d0774708 100644
> --- a/target/i386/sev_i386.h
> +++ b/target/i386/sev_i386.h
> @@ -35,5 +35,7 @@ extern uint32_t sev_get_cbit_position(void);
>   extern uint32_t sev_get_reduced_phys_bits(void);
>   extern char *sev_get_launch_measurement(void);
>   extern SevCapability *sev_get_capabilities(Error **errp);
> +extern SevAttestationReport *
> +sev_get_attestation_report(const char *mnonce, Error **errp);
> 
>   #endif
> 


