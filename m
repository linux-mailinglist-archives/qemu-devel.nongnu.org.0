Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6483B16D6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:29:51 +0200 (CEST)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzCg-0005e9-Cy
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvzBd-0004mu-Iy
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:28:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvzBb-0004dK-5x
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:28:45 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N93a4v185047; Wed, 23 Jun 2021 05:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oqCL372a+F5IYpM9w0Udj4ImYZXhm9sknJQfj5HV9K4=;
 b=Ttkjt9LAwyjJ9lX5C8GODkktjGoqvuWcd3iV8BxgmT0Z2RgdN01YSzXMzOFQs8v2GlNE
 wLpBxm9yY6slUEbPqeYWjZLYvo0BnPwuHdWU8Dhv2ZiJelvhrK1WPdowemO141wu6FaL
 /GcM+4KTALy5y47WD0MF2Ugqh+t4nWM61SEoJGLy0xZ1B28BBNzHmNnGaDy5+5aekL83
 paSor3ooSgfrVbIwT5nw3Ozo0A1AxfAHjQYeo/b5VkwC7F3pNkQmNom4FRntE/lmYiMK
 2ppEIOVp3u/mBHFvf5TrnJUQX6lHnH3yEz78WNjD35FX74vb0XNDoFc3MaZiuFsrkr1n 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39c0ey411g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 05:28:39 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15N93xxK186660;
 Wed, 23 Jun 2021 05:28:38 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39c0ey410b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 05:28:38 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15N9FD2F019379;
 Wed, 23 Jun 2021 09:28:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 39987891rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 09:28:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15N9SW3Y24773028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 09:28:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1F4452050;
 Wed, 23 Jun 2021 09:28:32 +0000 (GMT)
Received: from [9.148.12.78] (unknown [9.148.12.78])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 996EF5204E;
 Wed, 23 Jun 2021 09:28:31 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
 <de9d8cd5-fcc3-10d2-6dda-003e4ad5524d@redhat.com>
 <36ff1adc-79c5-5526-2212-0aa28283fd75@linux.ibm.com>
 <YNL1hazUg/shU7nU@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <4f50f4ef-b270-3985-30a7-ea5f0998d551@linux.ibm.com>
Date: Wed, 23 Jun 2021 12:28:31 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNL1hazUg/shU7nU@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uELEnrlME4k-gfMxudgYG_raUVQuk8XM
X-Proofpoint-ORIG-GUID: iNJ29yZ2SWMscIMP18pQSqWwGS-eLn5d
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_03:2021-06-22,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106230054
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.ibm.com,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23/06/2021 11:49, Daniel P. Berrangé wrote:
> On Wed, Jun 23, 2021 at 11:41:56AM +0300, Dov Murik wrote:

...

>>
>> Related: I wondered if I could replace HASH_SIZE in:
>>
>>
>>   /* hard code sha256 digest size */
>>   #define HASH_SIZE 32
>>
>>   typedef struct QEMU_PACKED SevHashTableEntry {
>>       QemuUUID guid;
>>       uint16_t len;
>>       uint8_t hash[HASH_SIZE];
>>   } SevHashTableEntry;
>>
>>
>> with some SHA256-related constant from crypto/hash.h, but I only found
>> the qcrypto_hash_digest_len(QCRYPTO_HASH_ALG_SHA256) function which
>> doesn't work for setting sizes of arrays at compile-time.
>>
>> Daniel: do you know what would be the proper way?
> 
> We don't have any public constants right now - they're just hardcoded
> in hash.c struct. We could define public constants, and use those in
> the struct instead, as well as in other callers.
> 

Thanks Daniel.

I see the exact same pattern in block/quorom.c (see HASH_LENGTH there).
I'll leave this change for a separate series.

-Dov

