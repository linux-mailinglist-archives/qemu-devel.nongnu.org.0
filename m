Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF25897F5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 08:56:37 +0200 (CEST)
Received: from localhost ([::1]:53628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJUmZ-0000ER-Qz
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 02:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <freude@linux.ibm.com>)
 id 1oJUi3-0006QV-RC; Thu, 04 Aug 2022 02:51:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <freude@linux.ibm.com>)
 id 1oJUi1-00064m-Ej; Thu, 04 Aug 2022 02:51:55 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2746jXL6025832;
 Thu, 4 Aug 2022 06:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : reply-to : in-reply-to : references :
 message-id : content-type : content-transfer-encoding; s=pp1;
 bh=09ZGA4a4ovwhNkIw47dG1pGsI9X9tATiBFaHlTtA+8k=;
 b=kh3CB9svnCtDFQcGEfuS6JYtH5fEnpnhgVUoIrMUnQ/E1UWgY/nGhQSUW4YN/xRVCgNR
 zcLjUAEhKPwCM1jndjpT2h58IHPL/6ue1iEGiXiVCHC0hr71oG+b6jcvAFNHAXhZHSnH
 6uwIACLYVIUNeXaFr7eYiTA/2Hs5P+evFdJHg7GalGr2c2f8flPeSAkQ0Qohw2ThPfXr
 ySXRhrNUI+M/GJ+g/e0HLJe6QInKf5RwRh231EYn/cb14l0IJ+AdzsYEP/VOG4oo0svA
 2hweqkPdd1cyQw8lnwK5GnbjDPtQll8UZv+tK+BH6RFI85URRPyIfSaI20qsd4iTB+S2 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hr94j83wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 06:51:48 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2746plmB016025;
 Thu, 4 Aug 2022 06:51:47 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hr94j83vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 06:51:47 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2746pQuq015998;
 Thu, 4 Aug 2022 06:51:45 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 3hmv99vwy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 06:51:45 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2746pjNt18219900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Aug 2022 06:51:45 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24C75B205F;
 Thu,  4 Aug 2022 06:51:45 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0BB9B2064;
 Thu,  4 Aug 2022 06:51:44 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  4 Aug 2022 06:51:44 +0000 (GMT)
MIME-Version: 1.0
Date: Thu, 04 Aug 2022 08:51:44 +0200
From: Harald Freudenberger <freude@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Holger
 Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
In-Reply-To: <YupmwgYFShLfP8Xd@zx2c4.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
 <20220802190011.458871-3-Jason@zx2c4.com>
 <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
 <YupmwgYFShLfP8Xd@zx2c4.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0ff11adb819138cfed16dfb489b66f6f@linux.ibm.com>
X-Sender: freude@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LC6nj7C2XKivyeGlXWeVClG765H7mVtZ
X-Proofpoint-ORIG-GUID: DD04Y5nmItHWhC6nbgvMtGGRFLYXX52y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_01,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=742
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040026
Received-SPF: pass client-ip=148.163.156.1; envelope-from=freude@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: freude@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-08-03 14:14, Jason A. Donenfeld wrote:
> Hi David,
> 
> On Wed, Aug 03, 2022 at 01:55:21PM +0200, David Hildenbrand wrote:
>> On 02.08.22 21:00, Jason A. Donenfeld wrote:
>> > In order to fully support MSA_EXT_5, we have to also support the SHA-512
>> > special instructions. So implement those.
>> >
>> > The implementation began as something TweetNacl-like, and then was
>> > adjusted to be useful here. It's not very beautiful, but it is quite
>> > short and compact, which is what we're going for.
>> >
>> 
>> Do we have to worry about copyright/authorship of the original code or
>> did you write that from scratch?
> 
> I actually don't really remember how much of that is leftover from
> tweetnacl and how much I've rewritten - I've had some variant of this
> code or another kicking around in various projects and repos for a long
> time. But the tweetnacl stuff is public domain to begin with, so all
> good.
> 
>> Are we properly handling the length register (r2 + 1) in the
>> 24-bit/31-bit addressing mode?
>> Similarly, are we properly handling updates to the message register 
>> (r2)
>> depending on the addressing mode?
> 
> Ugh, probably not... I didn't do any of the deposit_64 stuff. I guess
> I'll look into that.
> 
>> It's worth noting that we might want to implement (also for 
>> PRNO-TRNG):
>> 
>> "The operation is ended when all
>> source bytes in the second operand have been pro-
>> cessed (called normal completion), or when a CPU-
>> determined number of blocks that is less than the
>> length of the second operand have been processed
>> (called partial completion). The CPU-determined
>> number of blocks depends on the model, and may be
>> a different number each time the instruction is exe-
>> cuted. The CPU-determined number of blocks is usu-
>> ally nonzero. In certain unusual situations, this
>> number may be zero, and condition code 3 may be
>> set with no progress."
>> 
>> Otherwise, a large length can make us loop quite a while in QEMU,
>> without the chance to deliver any other interrupts.
> 
> Hmm, okay. Looking at the Linux code, I see:
> 
>         s.even = (unsigned long)src;
>         s.odd  = (unsigned long)src_len;
>         asm volatile(
>                 "       lgr     0,%[fc]\n"
>                 "       lgr     1,%[pba]\n"
>                 "0:     .insn   rre,%[opc] << 16,0,%[src]\n"
>                 "       brc     1,0b\n" /* handle partial completion */
>                 : [src] "+&d" (s.pair)
>                 : [fc] "d" (func), [pba] "d" ((unsigned long)(param)),
>                   [opc] "i" (CPACF_KIMD)
>                 : "cc", "memory", "0", "1");
> 
> So I guess that means it'll just loop until it's done? Or do I need to
> return "1" from HELPER(msa)?
> 
> Jason

Hm, you don't really want to implement some kind of particial complete.
Qemu is an emulation and you would have to implement some kind of
fragmenting this based on machine generation. For my feeling this is
way too overengineered. Btw. as there came the request to handle
the 24-bit/31-bit addressing correctly. Is Qemu 32 bit supported ?

