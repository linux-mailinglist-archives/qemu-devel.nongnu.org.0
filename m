Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482E8449B95
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 19:22:23 +0100 (CET)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk9Hh-0002yn-Uk
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 13:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk9GW-0002GM-CC
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 13:21:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mk9GS-0001U3-1k
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 13:21:07 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8GVUvk023424; 
 Mon, 8 Nov 2021 18:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kRV0eplbedUIaxnJk/Fnxw3LGofgwdMhnPI7dbbM69g=;
 b=NVamZR7Nrkh90Q+Uoq1MHf9yoSKMKiNZnFAoGhULumm8n9ejSALrbbPoh49RU2Oh6tYK
 vr1wxXrszHuKBFSTIKea7XEW+ngSbGyvKSPDjuAQ/5+5m/GF/jmkuwPprQX70uMCO9cf
 ZhTMKvpZFQJvqtCmIlDoF8SY2aEItvL4r/21H+8JbjZEpwJ/4P+ZQYReIIU/RhoNBsyE
 OZcpmprWZfmOTVvfi7DeV2rHTpID1LcwChn0XFdsnhLJE6bbdc1GmFEsbv9buhSBNP69
 PgA4ltsUgrd3pBPl82zlOL4f8cL67/n+laCksihstAQyi6QdSP+Uw9TQ+DlVUdIYDasH 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6858dxw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 18:20:56 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8I1M0b020481;
 Mon, 8 Nov 2021 18:20:56 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6858dxvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 18:20:56 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8IDBT0008054;
 Mon, 8 Nov 2021 18:20:55 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3c5hbaj71y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 18:20:55 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8IKr5918285088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 18:20:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4208978068;
 Mon,  8 Nov 2021 18:20:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A478E7806A;
 Mon,  8 Nov 2021 18:20:49 +0000 (GMT)
Received: from [9.160.77.174] (unknown [9.160.77.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 18:20:49 +0000 (GMT)
Message-ID: <32a065bb-ec2e-f2e7-356b-68b41531aab1@linux.ibm.com>
Date: Mon, 8 Nov 2021 20:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/6] qapi/qom,target/i386: sev-guest: Introduce
 kernel-hashes=on|off option
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
 <20211108134840.2757206-2-dovmurik@linux.ibm.com>
 <87h7cmk5n5.fsf@dusky.pond.sub.org>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <87h7cmk5n5.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ha5GR-cC-eQT8_aN9vhcg58lmAQlAEDi
X-Proofpoint-GUID: bi4GmKQ9QrH-21dOcJ2dBHz_Ljohx-q1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_06,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080109
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/11/2021 17:51, Markus Armbruster wrote:
> Dov Murik <dovmurik@linux.ibm.com> writes:
> 
>> Introduce new boolean 'kernel-hashes' option on the sev-guest object.
>> It will be used to to decide whether to add the hashes of
>> kernel/initrd/cmdline to SEV guest memory when booting with -kernel.
>> The default value is 'off'.
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
>>  qapi/qom.json     |  7 ++++++-
>>  target/i386/sev.c | 20 ++++++++++++++++++++
>>  qemu-options.hx   |  6 +++++-
>>  3 files changed, 31 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index ccd1167808..4fd5d1716b 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -769,6 +769,10 @@
>>  # @reduced-phys-bits: number of bits in physical addresses that become
>>  #                     unavailable when SEV is enabled
>>  #
>> +# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
>> +#                 designated guest firmware page for measured boot
>> +#                 with -kernel (default: false)
> 
> Missing: (since 7.0)
> 

I agree the "since" clause is missing, but I think this series (at least
patches 1-4) should be considered a bug fix (because booting with
-kernel will break in 6.2 for older OVMF which doesn't have guest
firmware area for hashes).

I think it should be added for 6.2.

Paolo?


If agreed, the hunk should be:



--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -769,6 +769,10 @@
 # @reduced-phys-bits: number of bits in physical addresses that become
 #                     unavailable when SEV is enabled
 #
+# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
+#                 designated guest firmware page for measured boot
+#                 with -kernel (default: false) (since 6.2)
+#
 # Since: 2.12
 ##
 { 'struct': 'SevGuestProperties',




-Dov


>> +#
>>  # Since: 2.12
>>  ##
>>  { 'struct': 'SevGuestProperties',
>> @@ -778,7 +782,8 @@
>>              '*policy': 'uint32',
>>              '*handle': 'uint32',
>>              '*cbitpos': 'uint32',
>> -            'reduced-phys-bits': 'uint32' } }
>> +            'reduced-phys-bits': 'uint32',
>> +            '*kernel-hashes': 'bool' } }
>>  
>>  ##
>>  # @ObjectType:
> 
> [...]
> 

