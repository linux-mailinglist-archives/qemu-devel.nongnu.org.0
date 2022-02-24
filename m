Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2554C2962
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:29:56 +0100 (CET)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBNj-0001kq-KB
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:29:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nNBMH-00013I-CD
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:28:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nNBLt-000254-Qd
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:28:06 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O96P4N028872; 
 Thu, 24 Feb 2022 10:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ud4+zg20lU0iqKdhqC4XFPDVB1zF+TWwD2DRLN/85SY=;
 b=RU/xqIIyEzoyahQ37kKQTu2Tj+3K4u5uyEeJmSmYy0C3mVjcP/nVVL9qxu4CJ1H2Y5XT
 qXAFW8pkSmyIKJ+jnvoZi4k7zuzIu1WsebgB6YgYoWkcgJTGO20qM5+RisApJctTphGc
 mWwAZK//Tg2/efiqh1hvPy+dMBvqVX/UjPIwfCbU98t84543RyF60ZbbSZQftuno7+Fk
 Hh+IpgkkWwjSjHKzkPYx0kUp6Ay7t7krkmMyBgLqo+9hNrcVvf0P9e+pf70fC4Vwa4Uf
 EizmQe6ghSBgxxDt1ut2v6kOj5AI/ZRFsviVLsKDp7tkqz6Law6Z4HtIHcxkXx72T54G +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eds79jf70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 10:27:57 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21O9xhKH028762;
 Thu, 24 Feb 2022 10:27:56 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eds79jf6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 10:27:56 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21OAIEol001795;
 Thu, 24 Feb 2022 10:27:55 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3ear6asx9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 10:27:55 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21OARq4131719752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 10:27:52 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A44C812405E;
 Thu, 24 Feb 2022 10:27:52 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BAA3124053;
 Thu, 24 Feb 2022 10:27:49 +0000 (GMT)
Received: from [9.160.8.241] (unknown [9.160.8.241])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 10:27:48 +0000 (GMT)
Message-ID: <0e1d4cf7-225f-c5ef-bc67-1fe811530ce4@linux.ibm.com>
Date: Thu, 24 Feb 2022 12:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220224061405.1959756-1-dovmurik@linux.ibm.com>
 <YhdI6iRAFSvaL7wr@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YhdI6iRAFSvaL7wr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1sNKBUjX3Xhn2FBAy0IYltXvlCrXCuo-
X-Proofpoint-ORIG-GUID: yinBGtpprZeD31EhgD9aK7rJxC5O3g91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_01,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240060
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/02/2022 10:59, Daniel P. Berrangé wrote:
> On Thu, Feb 24, 2022 at 06:14:05AM +0000, Dov Murik wrote:
>> Add a new field 'cpu0-id' to the response of query-sev-capabilities QMP
>> command.  The value of the field is the base64-encoded 64-byte unique ID
>> of the CPU0 (socket 0), which can be used to retrieve the signed CEK of
>> the CPU from AMD's Key Distribution Service (KDS).
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>
>> ---
>>
>> v2:
>> - change encoding to Base64 (thanks Daniel)
>> - rename constant to SEV_CPU_UNIQUE_ID_LEN
>> ---
>>  qapi/misc-target.json |  4 ++++
>>  target/i386/sev.c     | 27 +++++++++++++++++++++++++++
>>  2 files changed, 31 insertions(+)
>>
>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 4bc45d2474..c6d9ad69e1 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -177,6 +177,8 @@
>>  #
>>  # @cert-chain:  PDH certificate chain (base64 encoded)
>>  #
>> +# @cpu0-id: 64-byte unique ID of CPU0 (base64 encoded) (since 7.0)
>> +#
>>  # @cbitpos: C-bit location in page table entry
>>  #
>>  # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
>> @@ -187,6 +189,7 @@
>>  { 'struct': 'SevCapability',
>>    'data': { 'pdh': 'str',
>>              'cert-chain': 'str',
>> +            'cpu0-id': 'str',
>>              'cbitpos': 'int',
>>              'reduced-phys-bits': 'int'},
>>    'if': 'TARGET_I386' }
>> @@ -205,6 +208,7 @@
>>  #
>>  # -> { "execute": "query-sev-capabilities" }
>>  # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
>> +#                  "cpu0-id": "2lvmGwo+...61iEinw==",
>>  #                  "cbitpos": 47, "reduced-phys-bits": 5}}
>>  #
>>  ##
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index 025ff7a6f8..d3d2680e16 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -82,6 +82,8 @@ struct SevGuestState {
>>  #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
>>  #define DEFAULT_SEV_DEVICE      "/dev/sev"
>>  
>> +#define SEV_CPU_UNIQUE_ID_LEN   64
> 
> Is this fixed size actually guaranteed by AMD ?  In reading the spec
> for "GET_ID" it feels like they're intentionally not specifying a
> fixed length, pushing towards querying once and then re-trying with
> the reported buffer size:
> 
>    "If the value of the ID_LEN field is too small, an 
>     INVALID_LENGTH error is returned and the minimum 
>     required length is written to the field"
> 
> I didn't find where it says 64 bytes exactly.
> 

OK.

I'll change it to dynamically allocate the ID buffer based on the length
returned by the first query, similar to sev_get_pdh_info().

I'll remove the explicit lengths from the qapi description and the
commit message.

-Dov


>> +
>>  #define SEV_INFO_BLOCK_GUID     "00f771de-1a7e-4fcb-890e-68c77e2fb44e"
>>  typedef struct __attribute__((__packed__)) SevInfoBlock {
>>      /* SEV-ES Reset Vector Address */
>> @@ -531,11 +533,31 @@ e_free:
>>      return 1;
>>  }
>>  
>> +static int
>> +sev_get_id(int fd, guchar *id_buf, size_t id_buf_len, Error **errp)
>> +{
>> +    struct sev_user_data_get_id2 id = {
>> +        .address = (unsigned long)id_buf,
>> +        .length = id_buf_len
>> +    };
>> +    int err, r;
>> +
>> +    r = sev_platform_ioctl(fd, SEV_GET_ID2, &id, &err);
>> +    if (r < 0) {
>> +        error_setg(errp, "SEV: Failed to get ID ret=%d fw_err=%d (%s)",
>> +                   r, err, fw_error_to_str(err));
>> +        return 1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  static SevCapability *sev_get_capabilities(Error **errp)
>>  {
>>      SevCapability *cap = NULL;
>>      guchar *pdh_data = NULL;
>>      guchar *cert_chain_data = NULL;
>> +    guchar cpu0_id[SEV_CPU_UNIQUE_ID_LEN];
>>      size_t pdh_len = 0, cert_chain_len = 0;
>>      uint32_t ebx;
>>      int fd;
>> @@ -561,9 +583,14 @@ static SevCapability *sev_get_capabilities(Error **errp)
>>          goto out;
>>      }
>>  
>> +    if (sev_get_id(fd, cpu0_id, sizeof(cpu0_id), errp)) {
>> +        goto out;
>> +    }
>> +
>>      cap = g_new0(SevCapability, 1);
>>      cap->pdh = g_base64_encode(pdh_data, pdh_len);
>>      cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
>> +    cap->cpu0_id = g_base64_encode(cpu0_id, sizeof(cpu0_id));
>>  
>>      host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
>>      cap->cbitpos = ebx & 0x3f;
>> -- 
>> 2.25.1
>>
> 
> Regards,
> Daniel

