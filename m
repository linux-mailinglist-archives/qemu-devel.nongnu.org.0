Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F800432E01
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:19:16 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mciSx-0002Qx-Ko
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mciS7-0001gH-Lc
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:18:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mciS4-00089h-B4
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:18:23 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J3Gl8f031168; 
 Tue, 19 Oct 2021 02:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qy6r5AUPNcS0KFF7wWfNEjR0EEFf2eJU1nH5UstibCg=;
 b=LDvoJJJqD1XazFDs2PQI4Nwh4xuyUJecoVc+YNrwwd6OctUkj8jytFKmCf7ywKwIrvYT
 mn3ONiKljYskhq1mE9JfOO2k4TBCR9LHlHlA4C6fKnHMflTdYdlKgCSoS7zPufYNeIlN
 4vNX+T8Vzy4buONbYoxraIiYkdkcqr2EVxXce0Fu6zyAA8/z7NmmlxriKi69Bns0TszW
 DM/e7ch5U9SoySlwJ+IlC1E5G5ePYfziQMCIbn7tCfbFcD32u/VrBqJA2vMXT1rlsdk1
 Zij0RQHaz6F0uzvVBt3ozbpjwlrl2zgUzf79tQ7R3x0fy+yYweBEpVsFG3BMXhjhhIop NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bsnyq2qmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 02:18:16 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19J60uGw017562;
 Tue, 19 Oct 2021 02:18:15 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bsnyq2qm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 02:18:15 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19J6DKdW023361;
 Tue, 19 Oct 2021 06:18:14 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3bqpcasab6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 06:18:14 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19J6IBxi24838588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 06:18:11 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28E6D6A047;
 Tue, 19 Oct 2021 06:18:11 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB7616A05A;
 Tue, 19 Oct 2021 06:18:06 +0000 (GMT)
Received: from [9.160.127.81] (unknown [9.160.127.81])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Oct 2021 06:18:06 +0000 (GMT)
Message-ID: <9474f5d8-68c5-606b-a123-419556afe5d4@linux.ibm.com>
Date: Tue, 19 Oct 2021 09:18:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
 <20210930054915.13252-2-dovmurik@linux.ibm.com>
 <3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dfRhsmV_3xjVKFggI7qoEAI7Md06ZOp2
X-Proofpoint-GUID: YxfXdWRbsJ44ja-9h3uG7rxO7WmQ_gAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190036
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18/10/2021 21:02, Tom Lendacky wrote:
> On 9/30/21 12:49 AM, Dov Murik wrote:
> 
> ...
> 
>> +/*
>> + * Add the hashes of the linux kernel/initrd/cmdline to an encrypted
>> guest page
>> + * which is included in SEV's initial memory measurement.
>> + */
>> +bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error
>> **errp)
>> +{
>> +    uint8_t *data;
>> +    SevHashTableDescriptor *area;
>> +    SevHashTable *ht;
>> +    uint8_t cmdline_hash[HASH_SIZE];
>> +    uint8_t initrd_hash[HASH_SIZE];
>> +    uint8_t kernel_hash[HASH_SIZE];
>> +    uint8_t *hashp;
>> +    size_t hash_len = HASH_SIZE;
>> +    int aligned_len;
>> +
>> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data,
>> NULL)) {
>> +        error_setg(errp, "SEV: kernel specified but OVMF has no hash
>> table guid");
>> +        return false;
>> +    }
> 
> This breaks backwards compatibility with an older OVMF image. Any older
> OVMF image with SEV support that doesn't have the hash table GUID will
> now fail to boot using -kernel/-initrd/-append, where it used to be able
> to boot before.
> 


Thanks Tom for noticing this.

Just so we're on the same page: this patch is already merged.


We're dealing with a scenario of launching a guest with SEV enabled and
with -kernel.  The behaviours are:


A. With current QEMU:

A1. New AmdSev OVMF build: OVMF will verify the hashes and boot correctly.
A2. New Generic OvmfPkgX64 build: No verification but will boot correctly.

A3. Old AmdSev OVMF build: QEMU aborts the launch because there's no
hash table GUID.
A4. Old Generic OvmfPkgX64 build: QEMU aborts the launch because there's
no hash table GUID.


B. With older QEMU (before this patch was merged):

B1. New AmdSev OVMF build: OVMF will try to verify the hashes but they
are not populated; boot aborted.
B2. New Generic OvmfPkgX64 build: No verification but will boot correctly.

B3. Old AmdSev OVMF build: OVMF aborts the launch because -kernel is not
supported at all.
B4. Old Generic OvmfPkgX64 build: No verification but will boot correctly.


So the problem you are raising is scenario A4 (as opposed to previous
behaviour B4).



> Is that anything we need to be concerned about?
> 

Possible solutions:

1. Do nothing. For users that encounter this: tell them to upgrade OVMF.
2. Modify the code: remove the line: error_setg(errp, "SEV: kernel
specified but OVMF has no hash table guid")

I think that option 2 will not degrade security *if* the Guest Owner
verifies the measurement (which is mandatory anyway; otherwise the
untrusted host can replace OVMF with a "malicious" version that doesn't
verify the hashes). Skipping silently might make debugging a bit harder.
Maybe we can print a warning and return, and then the guest launch will
continue?

Other ideas?


-Dov


