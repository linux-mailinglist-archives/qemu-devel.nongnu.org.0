Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7241C1D4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:42:51 +0200 (CEST)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVW70-0002qA-Ko
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVW46-0000Mf-0K
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:39:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVW43-0006Jo-Iy
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:39:49 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T9Ts4r032613; 
 Wed, 29 Sep 2021 05:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ThG3fcNJr4G+fljrCkT0yE8ARERNZcdKMt0Fna9dDjA=;
 b=LBi3l/DlPB7iEbx8uXQ0Z30rndGDj35lANjSh7Ny5FMYq2wLM31VLY/wjSPhgeU31KIl
 bJG85C+dTW70wNDLJKCZgq2MDn1yW04F4ULxzTkK1ooZkuM9gFrdOOjA9KvOfqXEHvf3
 dfiphCDY5uAg5To/PsCMFqi+zDqzjexpbaYw2zl8rnwgqudpZgd91JMK1uvz/Wu3nQGk
 dNs8LxW/e2a+MuPZys4V4TPNA6SzfGaAwXKK9bNUy01hLZSiD7yxxAqTHrMMNhqtcGDP
 kxCJ1jnOcbfR4UTXG2vyacuTB/wgMWxLv+VRCNHD2iCuu9QSNSzlOcpQJvDYY6wX1O7Z 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcnjj86wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 05:39:41 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18T9V1b1005594;
 Wed, 29 Sep 2021 05:39:41 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcnjj86w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 05:39:41 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18T9XQtv030289;
 Wed, 29 Sep 2021 09:39:40 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3b9udbp7ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 09:39:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18T9dc7h39059926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 09:39:38 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12E7FC6055;
 Wed, 29 Sep 2021 09:39:38 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66127C6066;
 Wed, 29 Sep 2021 09:39:34 +0000 (GMT)
Received: from [9.148.12.91] (unknown [9.148.12.91])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Sep 2021 09:39:34 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210825073538.959525-1-dovmurik@linux.ibm.com>
 <20210825073538.959525-2-dovmurik@linux.ibm.com>
 <YVH4nLO+tuzNIDsC@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <8840b347-bcb4-9f22-1349-f45e4112ec1b@linux.ibm.com>
Date: Wed, 29 Sep 2021 12:39:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVH4nLO+tuzNIDsC@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nDucWIMTlpkz1ScMNCUHb7tP49fisfkr
X-Proofpoint-ORIG-GUID: pEOFNyKrPhdtJb2PnYpGzpcxpz68eolg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290057
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Jim Cadden <jcadden@ibm.com>, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 27/09/2021 20:00, Daniel P. Berrangé wrote:
> On Wed, Aug 25, 2021 at 07:35:37AM +0000, Dov Murik wrote:
>> Add the sev_add_kernel_loader_hashes function to calculate the hashes of
>> the kernel/initrd/cmdline and fill a designated OVMF encrypted hash
>> table area.  For this to work, OVMF must support an encrypted area to
>> place the data which is advertised via a special GUID in the OVMF reset
>> table.
>>
>> The hashes of each of the files is calculated (or the string in the case
>> of the cmdline with trailing '\0' included).  Each entry in the hashes
>> table is GUID identified and since they're passed through the
>> sev_encrypt_flash interface, the hashes will be accumulated by the PSP
>> measurement (SEV_LAUNCH_MEASURE).
>>
>> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
>> ---
>>  target/i386/sev_i386.h |  12 ++++
>>  target/i386/sev-stub.c |   5 ++
>>  target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 154 insertions(+)
>>
>> diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
>> index ae6d840478..deb3eec409 100644
>> --- a/target/i386/sev_i386.h
>> +++ b/target/i386/sev_i386.h
>> @@ -28,6 +28,17 @@
>>  #define SEV_POLICY_DOMAIN       0x10
>>  #define SEV_POLICY_SEV          0x20
>>  
>> +typedef struct KernelLoaderContext {
>> +    char *setup_data;
>> +    size_t setup_size;
>> +    char *kernel_data;
>> +    size_t kernel_size;
>> +    char *initrd_data;
>> +    size_t initrd_size;
>> +    char *cmdline_data;
>> +    size_t cmdline_size;
>> +} KernelLoaderContext;
> 
> I'd expect the struct to have 'Sev' as its name prefix, in common
> with everything else SEV related that's exported here. 

Yes, you're right.  I'll fix that.

-Dov

> 
>> +
>>  extern bool sev_es_enabled(void);
>>  extern uint64_t sev_get_me_mask(void);
>>  extern SevInfo *sev_get_info(void);
>> @@ -37,5 +48,6 @@ extern char *sev_get_launch_measurement(void);
>>  extern SevCapability *sev_get_capabilities(Error **errp);
>>  extern SevAttestationReport *
>>  sev_get_attestation_report(const char *mnonce, Error **errp);
>> +extern bool sev_add_kernel_loader_hashes(KernelLoaderContext *ctx, Error **errp);
> 
> Regards,
> Daniel
> 

