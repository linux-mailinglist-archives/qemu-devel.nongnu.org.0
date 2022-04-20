Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F45090ED
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:58:11 +0200 (CEST)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGSl-0004uJ-Jl
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nhFfL-0003cj-Pl
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:07:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35816
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nhFfJ-0001fn-WB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:07:03 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KHqbbU012933
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 19:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=70VJPEwOTbX8Y9VOyVk+E2JinvWBwZf5X1ZRPBidZY0=;
 b=LoywnYRDnCHyUjbcUZUTjotflzrHz/hQFJRze0a1kBzGrx9wq7ex5lkjHEA05Mq5W+u8
 pxU0J7LHmRj5xiL8yy20kfkQU5cIjYbEndgLEgYLIk62oxTDAvfBrNLRV74wXydZGh5p
 zz6aUSHMJa1adnZat5vPpjJLIwTHaI4TVoAYCJTjE8b3lBXGUaxjd8BDlGk3KMiXuAPb
 ZyiywRYU39Gtws19b/O6LlV5/9L5DcBwOZU2f5woAKeGyTLSnQJnZfB3UMOyZEmw7zXA
 Csion6WbX0JJJ1zmB2z8r47PkQV9N1DjvQduaBmP2KfO+PJ6qFM49iPpsoyv9uxM36+C xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fjjhf89na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 19:07:00 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23KIqtIs014697
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 19:07:00 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fjjhf89n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 19:07:00 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23KIx8dS026474;
 Wed, 20 Apr 2022 19:06:59 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3ffneadyuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 19:06:59 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23KJ6wvH55640320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 19:06:58 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFEAE28058;
 Wed, 20 Apr 2022 19:06:58 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 039862805A;
 Wed, 20 Apr 2022 19:06:58 +0000 (GMT)
Received: from [9.65.204.58] (unknown [9.65.204.58])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Apr 2022 19:06:57 +0000 (GMT)
Message-ID: <8830ca52-1ecd-2acc-dea7-9af58b5c48b3@linux.ibm.com>
Date: Wed, 20 Apr 2022 22:06:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 01/53] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220419055109.142788-1-pbonzini@redhat.com>
 <20220419055109.142788-2-pbonzini@redhat.com>
 <23254113-840a-1690-4f6d-32fa04bccb8b@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <23254113-840a-1690-4f6d-32fa04bccb8b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ijr_k4bU7G0lxEno7Hb8uD42heIAJYDZ
X-Proofpoint-GUID: gl5qV2TOitJhTWDNtaHNnNZpZakEY86U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_05,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204200113
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/04/2022 10:16, Dov Murik wrote:
> Thanks Paolo.
> 
> On 19/04/2022 8:50, Paolo Bonzini wrote:
>> From: Dov Murik <dovmurik@linux.ibm.com>
>>
>> Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
>> command.  The value of the field is the base64-encoded unique ID of CPU0
>> (socket 0), which can be used to retrieve the signed CEK of the CPU from
>> AMD's Key Distribution Service (KDS).
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Message-Id: <20220228093014.882288-1-dovmurik@linux.ibm.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  qapi/misc-target.json |  4 ++++
>>  target/i386/sev.c     | 42 +++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 45 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 036c5e4a91..bc9355b595 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -144,6 +144,8 @@
>>  #
>>  # @cert-chain:  PDH certificate chain (base64 encoded)
>>  #
>> +# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.0)
>> +#
> 
> Should this be changed to "since 7.1" ?
> 
> Paolo, can you modify the patch in your tree, or should I submit a new
> version?


I see the original is already merged to master, so I sent another fix-up patch:

Subject: [PATCH] qapi: Fix version of cpu0-id field
Message-ID: 20220420190129.3532623-1-dovmurik@linux.ibm.com

-Dov


> 
> -Dov
> 
>>  # @cbitpos: C-bit location in page table entry
>>  #
>>  # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
>> @@ -154,6 +156,7 @@
>>  { 'struct': 'SevCapability',
>>    'data': { 'pdh': 'str',
>>              'cert-chain': 'str',
>> +            'cpu0-id': 'str',
>>              'cbitpos': 'int',
>>              'reduced-phys-bits': 'int'},
>>    'if': 'TARGET_I386' }
>> @@ -172,6 +175,7 @@
>>  #
>>  # -> { "execute": "query-sev-capabilities" }
>>  # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
>> +#                  "cpu0-id": "2lvmGwo+...61iEinw==",
>>  #                  "cbitpos": 47, "reduced-phys-bits": 5}}
>>  #
>>  ##
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index 025ff7a6f8..32f7dbac4e 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -531,12 +531,46 @@ e_free:
>>      return 1;
>>  }
>>  
>> +static int sev_get_cpu0_id(int fd, guchar **id, size_t *id_len, Error **errp)
>> +{
>> +    guchar *id_data;
>> +    struct sev_user_data_get_id2 get_id2 = {};
>> +    int err, r;
>> +
>> +    /* query the ID length */
>> +    r = sev_platform_ioctl(fd, SEV_GET_ID2, &get_id2, &err);
>> +    if (r < 0 && err != SEV_RET_INVALID_LEN) {
>> +        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
>> +                   r, err, fw_error_to_str(err));
>> +        return 1;
>> +    }
>> +
>> +    id_data = g_new(guchar, get_id2.length);
>> +    get_id2.address = (unsigned long)id_data;
>> +
>> +    r = sev_platform_ioctl(fd, SEV_GET_ID2, &get_id2, &err);
>> +    if (r < 0) {
>> +        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
>> +                   r, err, fw_error_to_str(err));
>> +        goto err;
>> +    }
>> +
>> +    *id = id_data;
>> +    *id_len = get_id2.length;
>> +    return 0;
>> +
>> +err:
>> +    g_free(id_data);
>> +    return 1;
>> +}
>> +
>>  static SevCapability *sev_get_capabilities(Error **errp)
>>  {
>>      SevCapability *cap = NULL;
>>      guchar *pdh_data = NULL;
>>      guchar *cert_chain_data = NULL;
>> -    size_t pdh_len = 0, cert_chain_len = 0;
>> +    guchar *cpu0_id_data = NULL;
>> +    size_t pdh_len = 0, cert_chain_len = 0, cpu0_id_len = 0;
>>      uint32_t ebx;
>>      int fd;
>>  
>> @@ -561,9 +595,14 @@ static SevCapability *sev_get_capabilities(Error **errp)
>>          goto out;
>>      }
>>  
>> +    if (sev_get_cpu0_id(fd, &cpu0_id_data, &cpu0_id_len, errp)) {
>> +        goto out;
>> +    }
>> +
>>      cap = g_new0(SevCapability, 1);
>>      cap->pdh = g_base64_encode(pdh_data, pdh_len);
>>      cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
>> +    cap->cpu0_id = g_base64_encode(cpu0_id_data, cpu0_id_len);
>>  
>>      host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
>>      cap->cbitpos = ebx & 0x3f;
>> @@ -575,6 +614,7 @@ static SevCapability *sev_get_capabilities(Error **errp)
>>      cap->reduced_phys_bits = 1;
>>  
>>  out:
>> +    g_free(cpu0_id_data);
>>      g_free(pdh_data);
>>      g_free(cert_chain_data);
>>      close(fd);

