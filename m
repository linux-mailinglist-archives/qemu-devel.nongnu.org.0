Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EECF5897F6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 08:58:56 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJUop-00029v-Ed
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 02:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oJUmc-0000Q3-3f; Thu, 04 Aug 2022 02:56:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oJUmT-0006sg-GX; Thu, 04 Aug 2022 02:56:37 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2746qoNZ000415;
 Thu, 4 Aug 2022 06:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=T5HfQsfkiaE9vpbUr69VqoORz6B+jOALAc3hK/MGyxk=;
 b=IYCC6eqigmo7lBKqZbSlUVvJmEumMidM5sCvyi4d9MRu4A/4nxInELiwT767d0MaB/K3
 nx59Cbi1xvMdnk0m97P1SJ/YMPIwxUrO6qQI70nVxAXPv8PlISxm9fwY8I5XuaOi3gvy
 YhHxfH/b0k0Yu0OW83TvzZyTluU5nQcIb+GzhHsapCiarHvPRTF36OzJDb+Fw4ZaUpSK
 Bf3C9ncLJeWudGLggDSRf43TBvQdK9B+ONI+kNzhDesSuLCGY5YC+T9ThQiA8EJpkTEA
 yO13FLOPrkCz9w0VE3y6subjS+W8OleSE1LPri8gJiRMIXdbfXASF3MU0UcVgnSJ33gf ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hr98002wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 06:56:25 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2746raxn003275;
 Thu, 4 Aug 2022 06:56:25 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hr98002w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 06:56:25 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2746pfO8029932;
 Thu, 4 Aug 2022 06:56:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3hmv994aqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 06:56:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2746uK2V27066652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Aug 2022 06:56:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 319FA11C04C;
 Thu,  4 Aug 2022 06:56:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF92111C04A;
 Thu,  4 Aug 2022 06:56:19 +0000 (GMT)
Received: from [9.171.87.73] (unknown [9.171.87.73])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Aug 2022 06:56:19 +0000 (GMT)
Message-ID: <bbd57148-6d6d-f1c3-73f8-73e2512a8012@linux.ibm.com>
Date: Thu, 4 Aug 2022 08:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: freude@linux.ibm.com, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Holger Dengler <dengler@linux.ibm.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
 <20220802190011.458871-3-Jason@zx2c4.com>
 <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
 <YupmwgYFShLfP8Xd@zx2c4.com> <0ff11adb819138cfed16dfb489b66f6f@linux.ibm.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <0ff11adb819138cfed16dfb489b66f6f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jwqU5xVDAtVPrCq48CTdy0F_cR6TOcvr
X-Proofpoint-ORIG-GUID: R196zDD7DE0CTsC0Az25dqKpP8slTPSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_01,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040026
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 04.08.22 um 08:51 schrieb Harald Freudenberger:
> On 2022-08-03 14:14, Jason A. Donenfeld wrote:
>> Hi David,
>>
>> On Wed, Aug 03, 2022 at 01:55:21PM +0200, David Hildenbrand wrote:
>>> On 02.08.22 21:00, Jason A. Donenfeld wrote:
>>> > In order to fully support MSA_EXT_5, we have to also support the SHA-512
>>> > special instructions. So implement those.
>>> >
>>> > The implementation began as something TweetNacl-like, and then was
>>> > adjusted to be useful here. It's not very beautiful, but it is quite
>>> > short and compact, which is what we're going for.
>>> >
>>>
>>> Do we have to worry about copyright/authorship of the original code or
>>> did you write that from scratch?
>>
>> I actually don't really remember how much of that is leftover from
>> tweetnacl and how much I've rewritten - I've had some variant of this
>> code or another kicking around in various projects and repos for a long
>> time. But the tweetnacl stuff is public domain to begin with, so all
>> good.
>>
>>> Are we properly handling the length register (r2 + 1) in the
>>> 24-bit/31-bit addressing mode?
>>> Similarly, are we properly handling updates to the message register (r2)
>>> depending on the addressing mode?
>>
>> Ugh, probably not... I didn't do any of the deposit_64 stuff. I guess
>> I'll look into that.
>>
>>> It's worth noting that we might want to implement (also for PRNO-TRNG):
>>>
>>> "The operation is ended when all
>>> source bytes in the second operand have been pro-
>>> cessed (called normal completion), or when a CPU-
>>> determined number of blocks that is less than the
>>> length of the second operand have been processed
>>> (called partial completion). The CPU-determined
>>> number of blocks depends on the model, and may be
>>> a different number each time the instruction is exe-
>>> cuted. The CPU-determined number of blocks is usu-
>>> ally nonzero. In certain unusual situations, this
>>> number may be zero, and condition code 3 may be
>>> set with no progress."
>>>
>>> Otherwise, a large length can make us loop quite a while in QEMU,
>>> without the chance to deliver any other interrupts.
>>
>> Hmm, okay. Looking at the Linux code, I see:
>>
>>         s.even = (unsigned long)src;
>>         s.odd  = (unsigned long)src_len;
>>         asm volatile(
>>                 "       lgr     0,%[fc]\n"
>>                 "       lgr     1,%[pba]\n"
>>                 "0:     .insn   rre,%[opc] << 16,0,%[src]\n"
>>                 "       brc     1,0b\n" /* handle partial completion */
>>                 : [src] "+&d" (s.pair)
>>                 : [fc] "d" (func), [pba] "d" ((unsigned long)(param)),
>>                   [opc] "i" (CPACF_KIMD)
>>                 : "cc", "memory", "0", "1");
>>
>> So I guess that means it'll just loop until it's done? Or do I need to
>> return "1" from HELPER(msa)?
>>
>> Jason
> 
> Hm, you don't really want to implement some kind of particial complete.
> Qemu is an emulation and you would have to implement some kind of
> fragmenting this based on machine generation. For my feeling this is
> way too overengineered. Btw. as there came the request to handle
> the 24-bit/31-bit addressing correctly. Is Qemu 32 bit supported ?

We do not support the esa390 mode, but the 24/31 bit _addressing_ modes are
totally valid to be used in zarch mode (with sam31 for example). The kernel
does that for example for some diagnoses under z/VM.
Nobody in problem state should probably do that, but its possible.

