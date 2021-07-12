Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CA33C6275
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 20:11:40 +0200 (CEST)
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m30P5-00078y-CY
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 14:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m30Ns-0006Od-Ll
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:10:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m30Nq-0001oe-RE
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:10:24 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CI7uaZ041697
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=a5GVaOV6X85eTq7Z3hj7UtKop6YcXkLW/Hx4hD6bjo0=;
 b=SCsz376OwnLcoV+nsxuYYOWvs6IbTU60nXjpzhlDWwF8/tiIBonwHcyfL2XOmMOZF/e7
 iryQPmC/Cyh8Ipv3HsdpbUBpD4V6zNTYGsXcVahfzObtyY9r3uNCnRyK90lsi2UH/mKB
 56yJma+3sO8UYVwe8H7+GU7QrXxAfZdD/luDjZFyrx568gmO41dzM/j4KDciWIrFpP2h
 QCqimewhLaLwUrUTBUQyXexC9kOl3xUcxzNJ63UglHCD1pRf/WcQvZxxoS8j7hNTKRZv
 isvZaD1Rbl+cGjU8O6JvFenb2RrRzmQqU68/GO2CMPuXVekmkD/rJo+a46RiZe1CZRZj uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmc26dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:10:19 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16CI8DXB042626
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:10:19 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmc26cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 14:10:19 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16CI8LtM008315;
 Mon, 12 Jul 2021 18:10:17 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 39q36abr6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 18:10:17 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16CIAH0e38797590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 18:10:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 142022806A;
 Mon, 12 Jul 2021 18:10:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF51A28060;
 Mon, 12 Jul 2021 18:10:16 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 18:10:16 +0000 (GMT)
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
 <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
 <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
 <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <b18e33e6-b30d-1ffa-70c7-9f313a494486@linux.ibm.com>
Date: Mon, 12 Jul 2021 14:10:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WPv85Db2wkBY3b_RSdVeI9TIXW_HSaB7
X-Proofpoint-GUID: Uxe-ScnISB4-WlkXzVUUw0yotQyVnrEI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_10:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120129
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.479,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/12/21 12:26 PM, Philippe Mathieu-Daudé wrote:
> +Markus
>
> On 7/12/21 5:47 PM, Stefan Berger wrote:
>> On 7/12/21 11:29 AM, Philippe Mathieu-Daudé wrote:
>>> Hi Stefan,
>>>
>>> On 7/12/21 5:09 PM, Stefan Berger wrote:
>>>> This series of patches adds test case for TPM 1.2 ACPI tables.
>>>>
>>>>     Stefan
>>>>
>>>> v3:
>>>>     - Define enum TPMVersion for when CONFIG_TPM is not defined
>>>>       affected patches 2 and 6
>>> I think in 11fb99e6f48..e542b71805d we missed an extra patch
>>> for qtests. Probably (untested):
>> Shouldn't we have seen test compilation errors already?
>>
>> I didn't go down this route for the build system (as you show below)
>> because in this series we are testing ACPI tables and I introduce the
>> reference to enum TPMVersion here, which wasn't needed before. The
>> alternative may be to go into 8/9 and eliminate all TPM code if
>> CONFIG_TPM is not set. The introduction of the enum now passes the tests
>> with --enable-tpm and --disable-tpm.
>>
>> Otherwise the BIOS test are skipped due to this here:
>>
>>
>> static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>>                                uint64_t base, enum TPMVersion tpm_version)
>> {
>> #ifdef CONFIG_TPM
>> [...]
>>
>> #else
>>      g_test_skip("TPM disabled");
>> #endif
>> }
>>
>> So I didn't want to clutter this code with more #ifdef CONFIG_TPM but
>> maybe that would be the right solution.
> IMO the "right" solution is to check via QMP if TMP is supported
> or not. This is now doable since commit caff255a546 ("tpm: Return
> QMP error when TPM is disabled in build").

That above g_test_skip() could be moved to the top of the function and 
be preceded by a QMP check for whether TPM is supported.



