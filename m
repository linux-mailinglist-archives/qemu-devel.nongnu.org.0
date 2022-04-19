Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D96F506635
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:46:46 +0200 (CEST)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngiZR-00062x-7j
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ngi6c-0005LP-TW
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:17:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ngi6a-0007c8-2E
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:16:58 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23J67kA4005855
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 07:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=loWJymt+Ux8DKgcfjZdUdTFVrQdLuKDXBFW/5LIJFkk=;
 b=bKLFv88Xffg+djmxb+/qUXbY/bxtB+UV0nnwj58miDzXOpAwUvcqOA6ZIdLB5gaTbEiu
 aToUSomha86ql00b3mFG3sEc9AgLpckPV/30ijZcEnKkdRILX6S716HRdxAWEOeCMHQ/
 zy6SqxlHFqqoRPPwAOMQ4ZKpYgo2NJN/+8dK/hlyiQ02J74/yjeeHJpB4Lek3tIHnxaS
 6/Bg3e2cjGEm6bsM0mIxMMv2+qWE749uiBbMI21ia/oglp5VvHShVyYG98IzsiSRyEdV
 WalM+sZn9h+dU1Z3vaoWNSE143xU28ojh/xWmSwiEXvg3gayRg3MTl3NZpFSAI/L6Wkn 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7reyxnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 07:16:50 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23J7A98t015130
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 07:16:49 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7reyxnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 07:16:49 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23J78vEl030319;
 Tue, 19 Apr 2022 07:16:49 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3ffne9rbvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 07:16:49 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23J7GmIr26280420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 07:16:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 708A928059;
 Tue, 19 Apr 2022 07:16:48 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C0D428058;
 Tue, 19 Apr 2022 07:16:47 +0000 (GMT)
Received: from [9.65.204.58] (unknown [9.65.204.58])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 Apr 2022 07:16:47 +0000 (GMT)
Message-ID: <23254113-840a-1690-4f6d-32fa04bccb8b@linux.ibm.com>
Date: Tue, 19 Apr 2022 10:16:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 01/53] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220419055109.142788-1-pbonzini@redhat.com>
 <20220419055109.142788-2-pbonzini@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <20220419055109.142788-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z3xiYEFvr1tLW9-2zko6KhQg4l04pI8S
X-Proofpoint-ORIG-GUID: 2DpNKK8YPL5SeBipH7_4qAreU7f0Lao5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190038
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Paolo.

On 19/04/2022 8:50, Paolo Bonzini wrote:
> From: Dov Murik <dovmurik@linux.ibm.com>
> 
> Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
> command.  The value of the field is the base64-encoded unique ID of CPU0
> (socket 0), which can be used to retrieve the signed CEK of the CPU from
> AMD's Key Distribution Service (KDS).
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220228093014.882288-1-dovmurik@linux.ibm.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qapi/misc-target.json |  4 ++++
>  target/i386/sev.c     | 42 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 036c5e4a91..bc9355b595 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -144,6 +144,8 @@
>  #
>  # @cert-chain:  PDH certificate chain (base64 encoded)
>  #
> +# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.0)
> +#

Should this be changed to "since 7.1" ?

Paolo, can you modify the patch in your tree, or should I submit a new
version?

-Dov

>  # @cbitpos: C-bit location in page table entry
>  #
>  # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
> @@ -154,6 +156,7 @@
>  { 'struct': 'SevCapability',
>    'data': { 'pdh': 'str',
>              'cert-chain': 'str',
> +            'cpu0-id': 'str',
>              'cbitpos': 'int',
>              'reduced-phys-bits': 'int'},
>    'if': 'TARGET_I386' }
> @@ -172,6 +175,7 @@
>  #
>  # -> { "execute": "query-sev-capabilities" }
>  # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
> +#                  "cpu0-id": "2lvmGwo+...61iEinw==",
>  #                  "cbitpos": 47, "reduced-phys-bits": 5}}
>  #
>  ##
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 025ff7a6f8..32f7dbac4e 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -531,12 +531,46 @@ e_free:
>      return 1;
>  }
>  
> +static int sev_get_cpu0_id(int fd, guchar **id, size_t *id_len, Error **errp)
> +{
> +    guchar *id_data;
> +    struct sev_user_data_get_id2 get_id2 = {};
> +    int err, r;
> +
> +    /* query the ID length */
> +    r = sev_platform_ioctl(fd, SEV_GET_ID2, &get_id2, &err);
> +    if (r < 0 && err != SEV_RET_INVALID_LEN) {
> +        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
> +                   r, err, fw_error_to_str(err));
> +        return 1;
> +    }
> +
> +    id_data = g_new(guchar, get_id2.length);
> +    get_id2.address = (unsigned long)id_data;
> +
> +    r = sev_platform_ioctl(fd, SEV_GET_ID2, &get_id2, &err);
> +    if (r < 0) {
> +        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
> +                   r, err, fw_error_to_str(err));
> +        goto err;
> +    }
> +
> +    *id = id_data;
> +    *id_len = get_id2.length;
> +    return 0;
> +
> +err:
> +    g_free(id_data);
> +    return 1;
> +}
> +
>  static SevCapability *sev_get_capabilities(Error **errp)
>  {
>      SevCapability *cap = NULL;
>      guchar *pdh_data = NULL;
>      guchar *cert_chain_data = NULL;
> -    size_t pdh_len = 0, cert_chain_len = 0;
> +    guchar *cpu0_id_data = NULL;
> +    size_t pdh_len = 0, cert_chain_len = 0, cpu0_id_len = 0;
>      uint32_t ebx;
>      int fd;
>  
> @@ -561,9 +595,14 @@ static SevCapability *sev_get_capabilities(Error **errp)
>          goto out;
>      }
>  
> +    if (sev_get_cpu0_id(fd, &cpu0_id_data, &cpu0_id_len, errp)) {
> +        goto out;
> +    }
> +
>      cap = g_new0(SevCapability, 1);
>      cap->pdh = g_base64_encode(pdh_data, pdh_len);
>      cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
> +    cap->cpu0_id = g_base64_encode(cpu0_id_data, cpu0_id_len);
>  
>      host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
>      cap->cbitpos = ebx & 0x3f;
> @@ -575,6 +614,7 @@ static SevCapability *sev_get_capabilities(Error **errp)
>      cap->reduced_phys_bits = 1;
>  
>  out:
> +    g_free(cpu0_id_data);
>      g_free(pdh_data);
>      g_free(cert_chain_data);
>      close(fd);

