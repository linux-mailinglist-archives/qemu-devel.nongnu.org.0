Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F9587EE8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:20:28 +0200 (CEST)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIth4-0003iV-Vs
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oItcR-0007mh-Jh; Tue, 02 Aug 2022 11:15:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oItcL-0005eo-Vt; Tue, 02 Aug 2022 11:15:37 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 272F8oEc022829;
 Tue, 2 Aug 2022 15:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XdvHmlUj7973KyzyeMcH/tdvaBPGpDJ4yyKzojb0Yk0=;
 b=eGlPotAtgGbFnYI6LNyHRCZDOqX6QHe+u0ydy003YLSPQfaIRb621emppGpQq4JgUl4s
 2o9+fKpJCjDL6WL3LAvw2WAa0xFh7LHRlRUzDoBF7/R+85K12kh/mUZ5dwxe7sWVcLYq
 8+zCdAtfdCS1IZvvisrdSrtbgaQtkF6ZOMWumLvHry6dZazzaHHq+VHmgVWUDT2zK8uN
 Dl2GDppQdWBSqorRbOLVIftE8OpXhpcrRCDm7nUh6PSHqjANei3Do11GiVvhA7zvlTKf
 0T8gn27Oak5OrvrqybDZeOH/Uo+iRqq+BGEOPthBks/hlpBB28NHWZWb/6ImC1vPzhC+ aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hq5ga2fg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 15:15:28 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 272FB72F019465;
 Tue, 2 Aug 2022 15:15:28 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hq5ga2ff4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 15:15:28 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 272F5rsF011840;
 Tue, 2 Aug 2022 15:15:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3hmuwhuvqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 15:15:26 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 272FFcGY33292746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Aug 2022 15:15:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25ACD5204F;
 Tue,  2 Aug 2022 15:15:23 +0000 (GMT)
Received: from [9.171.91.57] (unknown [9.171.91.57])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B0D4F5204E;
 Tue,  2 Aug 2022 15:15:22 +0000 (GMT)
Message-ID: <834c1a76-d972-a1b2-2c28-d0482335d3ba@linux.ibm.com>
Date: Tue, 2 Aug 2022 17:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
 <ef161533-0123-28f0-db1f-5257e82f6340@linux.ibm.com>
 <1afd34c3-0aa6-541c-07e9-b0eef7e0f0d7@redhat.com>
 <71d173c2-21eb-5966-8458-91de9bc48620@linux.ibm.com>
 <71b1b0f6-95b9-0249-e996-b8348470693f@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <71b1b0f6-95b9-0249-e996-b8348470693f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EH4byIRtdnFyzcKWu5Av9yFyITDIB0tB
X-Proofpoint-ORIG-GUID: EQwIkFhf5Y-D7G1ohCN-T7PE4i6rCn3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_08,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=925 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208020067
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



Am 02.08.22 um 16:53 schrieb David Hildenbrand:
> On 02.08.22 16:01, Christian Borntraeger wrote:
>>
>>
>> Am 02.08.22 um 15:54 schrieb David Hildenbrand:
>>> On 02.08.22 15:26, Christian Borntraeger wrote:
>>>>
>>>>
>>>> Am 20.07.22 um 14:08 schrieb Jason A. Donenfeld:
>>>>> In order for hosts running inside of TCG to initialize the kernel's
>>>>> random number generator, we should support the PRNO_TRNG instruction,
>>>>> backed in the usual way with the qemu_guest_getrandom helper. This is
>>>>> confirmed working on Linux 5.19-rc6.
>>>>>
>>>>> Cc: Thomas Huth <thuth@redhat.com>
>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>>> Cc: Harald Freudenberger <freude@linux.ibm.com>
>>>>> Cc: Holger Dengler <dengler@linux.ibm.com>
>>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>>> [...]
>>>>> +    case 114:
>>>>> +        if (r1 & 1 || !r1 || r2 & 1 || !r2)
>>>>> +                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>>>> +        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
>>>>> +        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
>>>>> +        break;
>>>>
>>>> I think I agree with Harald that some aspects are missing.
>>>> Linux does not seem to check, but we should also modify the query function to
>>>> indicate the availability of 114.
>>>>
>>>> As the msa helper deals with many instructions
>>>> ...
>>>> target/s390x/tcg/insn-data.def:    D(0xb91e, KMAC,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMAC)
>>>> target/s390x/tcg/insn-data.def:    D(0xb928, PCKMO,   RRE,   MSA3, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PCKMO)
>>>> target/s390x/tcg/insn-data.def:    D(0xb92a, KMF,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMF)
>>>> target/s390x/tcg/insn-data.def:    D(0xb92b, KMO,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMO)
>>>> target/s390x/tcg/insn-data.def:    D(0xb92c, PCC,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PCC)
>>>> target/s390x/tcg/insn-data.def:    D(0xb92d, KMCTR,   RRF_b, MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMCTR)
>>>> target/s390x/tcg/insn-data.def:    D(0xb92e, KM,      RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KM)
>>>> target/s390x/tcg/insn-data.def:    D(0xb92f, KMC,     RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMC)
>>>> target/s390x/tcg/insn-data.def:    D(0xb929, KMA,     RRF_b, MSA8, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMA)
>>>> target/s390x/tcg/insn-data.def:    D(0xb93c, PPNO,    RRE,   MSA5, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PPNO)
>>>> target/s390x/tcg/insn-data.def:    D(0xb93e, KIMD,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KIMD)
>>>> target/s390x/tcg/insn-data.def:    D(0xb93f, KLMD,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KLMD)
>>>> ...
>>>> and in theory other instructions might also have 114 we should at least check that this is ppno/prno.
>>>> Or we split out a prno helper from the msa helper.
>>>>
>>>
>>> Doesn't
>>>
>>> s390_get_feat_block(type, subfunc);
>>> if (!test_be_bit(fc, subfunc)) {
>>> 	tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>> }
>>>
>>> check that? As long as we don't implement 114 for any other instruction.
>>> that should properly fence off the other instructions.
>>
>> Right that would help. We should still take care of the query function.
>>
> s390_get_feat_block() should already take care of that as well, no?

Ah right, yes it fills subfunc. So yes, that should do the trick. Sorry for the noise.

