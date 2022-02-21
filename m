Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3C4BE0CF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:52:28 +0100 (CET)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCrL-00070h-SM
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:52:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMCof-0004Zy-Hx
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:49:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMCod-0003VT-7J
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:49:41 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LHIWZL014987; 
 Mon, 21 Feb 2022 17:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7yXm13PRIpF2LawBB/6/JM3i1isr2UXNxN/LmcpuZtU=;
 b=djNOUeBBMJ2g57qHDB1T5F+HdqoQI1I0d9GkzVQnSo0YHnvkAIxVa+naq0g30iSsXbRS
 bS7B56fcReCBWx/cgkTXYoGSCzvoWLyF2ex2v9a0RJTYeaFuoGD0ibeSoC3CJIyvlkF5
 9DtiRr9PdC+9rIy2/kSNSafvkb7snHMNqHTRFYUf2OnTWYpnB/YIoZxmaMJ1dK1QFeBg
 QhIkjxWJTOs8kSSihVmezBU+dkFAmc4cTpjusR9UTtCQ9FWrzNgEqtCzUiv8Q6P9YR+0
 80HzdoIdxs2WDvVQ2z2A9htzN7yIG0xsr5uu+AK/CBmb38obY3d4VwXwTh9AzUw3dcpY Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ecctvm65e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 17:49:34 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21LHnXHF028032;
 Mon, 21 Feb 2022 17:49:33 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ecctvm651-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 17:49:33 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LHh5Du027610;
 Mon, 21 Feb 2022 17:49:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3ear69trp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 17:49:32 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21LHnU7419595596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 17:49:30 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49FEF6A051;
 Mon, 21 Feb 2022 17:49:30 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01F146A054;
 Mon, 21 Feb 2022 17:49:27 +0000 (GMT)
Received: from [9.160.8.241] (unknown [9.160.8.241])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 21 Feb 2022 17:49:26 +0000 (GMT)
Message-ID: <2ecfdf39-4569-f7d1-9de8-dc780aafac0c@linux.ibm.com>
Date: Mon, 21 Feb 2022 19:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] qapi, target/i386/sev: Add cpu0-id to
 query-sev-capabilities
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220221160850.1484364-1-dovmurik@linux.ibm.com>
 <YhO8o7V2CnI3gAut@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YhO8o7V2CnI3gAut@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o1xzg9qxohFrImheIjccolzUo3tqg_j5
X-Proofpoint-ORIG-GUID: HPpuOVcsvqiO93L_zZG_Y5E2WPF6Vil4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_08,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210103
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

Thanks Daniel for reviewing.


On 21/02/2022 18:24, Daniel P. Berrangé wrote:
> On Mon, Feb 21, 2022 at 04:08:50PM +0000, Dov Murik wrote:
>> Add a new field 'cpu0-id' to the response of query-sev-capabilities
>> QMP command.  The value of the field is the hex-encoded 64-byte unique
>> ID of the CPU0 (socket 0), which can be used to retrieve the signed CEK
>> of the CPU from AMD's Key Distribution Service (KDS).
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
>>  qapi/misc-target.json |  4 ++++
>>  target/i386/sev.c     | 43 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 4bc45d2474..d9b4991c86 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -177,6 +177,8 @@
>>  #
>>  # @cert-chain:  PDH certificate chain (base64 encoded)
>>  #
>> +# @cpu0-id: 64-byte unique ID of CPU0 (hex encoded) (since 7.0)
> 
> For binary data in QAPI we've pretty much standardized on using
> base64 encoding. I think we should stick with that encoding.
> 

OK, I'll change that to base64.

I thought about the cpu0-id as some kind of "address string", like mac
addresses or IPv6 addresses which are usually represented as hex strings
and not as base64-encoded.  But I guess that the AMD CPU unique ID
doesn't have the same legacy (and accepted notation) as mac addresses or
IPv6 addresses, so we might as well treat it as "regular" binary data.

Going with base64 also saves some code because QEMU doesn't have a
ready-made hex_encode() function (I copied mine from a static function
in crypto/hash.c).

-Dov


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
>> +#                  "cpu0-id": "5ea2e1...90ea39",
>>  #                  "cbitpos": 47, "reduced-phys-bits": 5}}
>>  #
>>  ##
> 
> Regards,
> Daniel

