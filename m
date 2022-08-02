Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7207F587E3A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:39:12 +0200 (CEST)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIt39-0001E6-Jk
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oIszi-0005lx-BF; Tue, 02 Aug 2022 10:35:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oIszc-0007Gm-KT; Tue, 02 Aug 2022 10:35:36 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 272EOfMm031043;
 Tue, 2 Aug 2022 14:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KhLmKeN7i5Dv1j1qqnjUddnUrpy6WsKiYWtUKyfzcBI=;
 b=eUZZq6/ah6uXyBMUS1luTcfBm8Ce2VdsL3pJ5UE+ZYF8ZMOG6+KOiLZ6HiGGv+qPV+t6
 v8fLHNAT87ZnY13S0+QjgAVR2HczMC+0oY1k6jeRp4Fxbvx2gV1dDT7eQvtwm2Hk6c6q
 I+BZED+aCuEXFtKzaBCsh0dLz/al4KKziJzOSAeKfgk1wMIpgCjKXCeGREM5UGzK7+G+
 vompCpkj68M5T7rIwdB69ryBxfPewXprAAsp3ch6yOHD2HldlUgH1fBNkuXjjWp2mrhr
 TM9Bxw9aIz9g80I2sZkXH7EOsqskegHDA/3twt6pzl631yVmjPff6nhiL8B0kj2UdtMV 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hq5ns8c32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 14:35:22 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 272EPg0o003230;
 Tue, 2 Aug 2022 14:35:21 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hq5ns8bsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 14:35:21 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 272DphIY002265;
 Tue, 2 Aug 2022 14:01:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3hmv98um4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 14:01:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 272E1jDL27787524
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Aug 2022 14:01:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 085B25204F;
 Tue,  2 Aug 2022 14:01:45 +0000 (GMT)
Received: from [9.171.91.57] (unknown [9.171.91.57])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9332A52051;
 Tue,  2 Aug 2022 14:01:44 +0000 (GMT)
Message-ID: <71d173c2-21eb-5966-8458-91de9bc48620@linux.ibm.com>
Date: Tue, 2 Aug 2022 16:01:44 +0200
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
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <1afd34c3-0aa6-541c-07e9-b0eef7e0f0d7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NR1m__QwauVjDDXRGW6uBF9Jg8P_tFzP
X-Proofpoint-GUID: t4o07lP8HV__1KxpOvJd5KXsiXk0_YGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_08,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 mlxscore=0 mlxlogscore=954
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208020067
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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



Am 02.08.22 um 15:54 schrieb David Hildenbrand:
> On 02.08.22 15:26, Christian Borntraeger wrote:
>>
>>
>> Am 20.07.22 um 14:08 schrieb Jason A. Donenfeld:
>>> In order for hosts running inside of TCG to initialize the kernel's
>>> random number generator, we should support the PRNO_TRNG instruction,
>>> backed in the usual way with the qemu_guest_getrandom helper. This is
>>> confirmed working on Linux 5.19-rc6.
>>>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Cc: Harald Freudenberger <freude@linux.ibm.com>
>>> Cc: Holger Dengler <dengler@linux.ibm.com>
>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> [...]
>>> +    case 114:
>>> +        if (r1 & 1 || !r1 || r2 & 1 || !r2)
>>> +                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>> +        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
>>> +        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
>>> +        break;
>>
>> I think I agree with Harald that some aspects are missing.
>> Linux does not seem to check, but we should also modify the query function to
>> indicate the availability of 114.
>>
>> As the msa helper deals with many instructions
>> ...
>> target/s390x/tcg/insn-data.def:    D(0xb91e, KMAC,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMAC)
>> target/s390x/tcg/insn-data.def:    D(0xb928, PCKMO,   RRE,   MSA3, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PCKMO)
>> target/s390x/tcg/insn-data.def:    D(0xb92a, KMF,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMF)
>> target/s390x/tcg/insn-data.def:    D(0xb92b, KMO,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMO)
>> target/s390x/tcg/insn-data.def:    D(0xb92c, PCC,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PCC)
>> target/s390x/tcg/insn-data.def:    D(0xb92d, KMCTR,   RRF_b, MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMCTR)
>> target/s390x/tcg/insn-data.def:    D(0xb92e, KM,      RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KM)
>> target/s390x/tcg/insn-data.def:    D(0xb92f, KMC,     RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMC)
>> target/s390x/tcg/insn-data.def:    D(0xb929, KMA,     RRF_b, MSA8, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMA)
>> target/s390x/tcg/insn-data.def:    D(0xb93c, PPNO,    RRE,   MSA5, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PPNO)
>> target/s390x/tcg/insn-data.def:    D(0xb93e, KIMD,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KIMD)
>> target/s390x/tcg/insn-data.def:    D(0xb93f, KLMD,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KLMD)
>> ...
>> and in theory other instructions might also have 114 we should at least check that this is ppno/prno.
>> Or we split out a prno helper from the msa helper.
>>
> 
> Doesn't
> 
> s390_get_feat_block(type, subfunc);
> if (!test_be_bit(fc, subfunc)) {
> 	tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> }
> 
> check that? As long as we don't implement 114 for any other instruction.
> that should properly fence off the other instructions.

Right that would help. We should still take care of the query function.

