Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E543DABD9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:32:25 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9BlW-0002Ma-1h
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1m9Bkc-0001g0-HT
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:31:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1m9BkY-0005Jv-K3
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:31:26 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16TJJKY2161353; Thu, 29 Jul 2021 15:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1BTOysQcN2ecBMaGCkte3SDyPKGLavPFdDLtBbyuRkM=;
 b=VMegyYb/gmnwoPfTrFlViLKVyuD2q4eozBkzhikH5two2Bf+7PeBkoOwbwG5Ec6pRhKM
 2FeGhuTBXNiMqfOj8curHexPz4wJoaE546ds7D3tZ3nRaHgxT5HD3GTparJebtdnYDtJ
 kxzPHnFx6wP/Q2sL8H2lCgn6DRUCKLq44JUqLGr9G/s0hytK6NUNg1tYeuX/OUXMEtnS
 Uo+omx4uL1TAdm0i++wFOcp7ci7EGJvUYNDt242SiVGHKMrQ8Wo69rqoEVQvj4rwxMte
 0TX/2Gnih8+LP8n/ZiwJEOIZ0uDmy/J0dzTSGGlkUvsIQua0FTZSk2cz+V3fGViLiR5c pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a42bs09tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 15:31:12 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16TJJU2D164060;
 Thu, 29 Jul 2021 15:31:11 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a42bs09sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 15:31:11 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16TJ8lGm003916;
 Thu, 29 Jul 2021 19:31:10 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3a23655b91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jul 2021 19:31:10 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16TJV81E35258808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 19:31:08 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76EE66A063;
 Thu, 29 Jul 2021 19:31:08 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71E216A054;
 Thu, 29 Jul 2021 19:31:04 +0000 (GMT)
Received: from [9.160.123.143] (unknown [9.160.123.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Jul 2021 19:31:04 +0000 (GMT)
Subject: Re: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
To: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
 <2dc6c60e-48f8-7c6f-6131-0bc1020e106f@redhat.com>
 <fbf2dd1f-150e-beb5-bf17-fc5dc787ab0d@redhat.com>
 <05d0ae90-a45f-157b-d37c-942bc0442449@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <203b655c-809b-b418-f61c-982e587fa9f2@linux.ibm.com>
Date: Thu, 29 Jul 2021 22:31:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <05d0ae90-a45f-157b-d37c-942bc0442449@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o8VwFxk4YcREyPoPmvnU8PqBvywRXhd9
X-Proofpoint-ORIG-GUID: N65U6FIBl92a6ziuWZXwYlqglB2Cpy8n
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-29_16:2021-07-29,
 2021-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2107290117
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo, Phil, Connor,

On 08/07/2021 20:16, Connor Kuehl wrote:
> On 7/8/21 10:03 AM, Philippe Mathieu-Daudé wrote:
>> On 7/8/21 6:41 PM, Connor Kuehl wrote:
>>> Hi Paolo,
>>>
>>> Please consider this series[1] for inclusion into your next pull request.
>>>
>>> Just a note that this series has a companion series that is getting
>>> upstreamed into OVMF[2]
>>
>> Shouldn't we get the OVMF part merged first?

The OVMF companion series has been reviewed by the new OVMF maintainer
and merged to edk2 master branch as of edk2 commit 514b3aa08ece [1].

[1] https://github.com/tianocore/edk2/commit/514b3aa08ece


Thanks,
Dov


> 
> The approach taken in the OVMF series doesn't seem very controversial,
> so I don't anticipate any breaking changes with the current state of
> those patches as far as QEMU is concerned.
> 
> However, I'm fine with erring on the side of caution.
> 
> Connor
> 

