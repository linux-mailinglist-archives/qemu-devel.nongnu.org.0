Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF8B62D11D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 03:25:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovUZB-0005ue-Ix; Wed, 16 Nov 2022 21:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1ovUZA-0005uQ-Ai; Wed, 16 Nov 2022 21:23:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1ovUZ8-0008RR-IR; Wed, 16 Nov 2022 21:23:48 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AH1g44C023233; Thu, 17 Nov 2022 02:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=bseUM88Drjt52AQbqUMnEjkUHcvYsGvkPlaGQcytFFc=;
 b=lye1DNuSShAcY0Nj8mu+qDlc9VKA1pg0dZAYRFZegjGP7+QN5JSyES2SkUhSoxdOq5iq
 q3m4aj3XVhSfk2Zdkya8YnkzV15MU5EXnLCaXTwVh4jkST/CklvhYDeR7tmU8ZpgZQEH
 F6kWEO3g2vOdq/wVBrTvmb7musCUTWxHgjcquhxxYfEWXAVihxLMNE3VOJy+KmOdUPCD
 1IWQEkoPLt4qe2EwNhohwuguZMD8AK9RCteBVv0VSbjdH11H1XOeejo1+qDtaHdLVkvi
 NgED1BA9AbE0nf+jYT5P0NDFwB2AmblbwtEbAHC5YIaNSxUbXbYmTZVzIv46ArCnea5/ gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwbharqrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 02:23:32 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AH2FnNU013916;
 Thu, 17 Nov 2022 02:23:32 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwbharqr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 02:23:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AH2KV5j003483;
 Thu, 17 Nov 2022 02:23:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjev0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 02:23:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AH2O7i442139938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Nov 2022 02:24:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D51BC42041;
 Thu, 17 Nov 2022 02:23:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7192C42045;
 Thu, 17 Nov 2022 02:23:24 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.98.134])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 17 Nov 2022 02:23:24 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 17 Nov 2022 07:53:23 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: david@gibson.dropbear.id.au, clg@kaod.org, Daniel Henrique Barboza
 <danielhb413@gmail.com>, groug@kaod.org, Kowshik Jois B S
 <kowsjois@linux.ibm.com>
Subject: Re: [PATCH-for-7.2] target/ppc: Fix build warnings when building
 with 'disable-tcg'
In-Reply-To: <ac030320-2c3f-dd7d-8786-b845ce21f1f8@linaro.org>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <ac030320-2c3f-dd7d-8786-b845ce21f1f8@linaro.org>
Date: Thu, 17 Nov 2022 07:53:23 +0530
Message-ID: <87o7t6wc84.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mHnXLHPlQM0Ow7wD7CEadivhlE7_lw7K
X-Proofpoint-ORIG-GUID: 1ATHsh1fH_HUOEuJNBiLZgKVxxu0RF6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=748 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170013
Received-SPF: pass client-ip=148.163.158.5; envelope-from=vaibhav@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi Philippe,

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
> Oops sorry.
>
> Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")
Thanks for figuring and pointing this out

>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index a05a2ed595..94adcb766b 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1=
, target_ulong arg2,
>>   #endif
>>   #endif
>>=20=20=20
>> +#ifdef CONFIG_TCG
>>   static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint=
32_t lane)
>>   {
>>       const uint16_t c =3D 0xfffc;
>> @@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
>>   HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
>>   HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>>   HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
>> +#endif /* CONFIG_TCG */
>
> Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
>
Thanks

> Hmm this is another fix... You could split your patch in 2,
> but not a big deal. Regardless:

This being a trivial patch, descided against splitting it in 2.


> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Thanks,


--=20
Cheers
~ Vaibhav

