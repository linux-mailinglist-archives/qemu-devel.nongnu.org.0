Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C471640399E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:19:16 +0200 (CEST)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwXr-0005Qv-7r
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mNwVC-0003Qx-2e
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:16:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mNwVA-0002xI-6O
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:16:29 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 188C3AVu029677; Wed, 8 Sep 2021 08:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/Cz4s+aN3gI+nzyxzKouJWWK2nbT+wM4XqhBKr8lfeo=;
 b=W4ogtQb0cfVsnKXewXiXNn4/+rrz6QkyaZVU/g8hl7wclId71vdA3N9gdsi+6HuE9XQp
 KTNQqbYtqFjnllWXvblHHcYVQfU8u1wzdeKqETMi4/Vjh715OIS8G4Tj2Q+iNM7OBl9l
 xpQ5k10HE4caRZiUt8tWAuI2jxBar87afYF6K3cj7Zl3KWPENxMbrgBIoQRl5qn4u/g9
 f+wqZ0F8wH51M1/uiaWfRyzsV7lA77okiXgjrlFFeFkaxMT4H+aCdUlelI583CmoIzIP
 8zoTdVaV2MI3ezzQiwFhw/jG5sfb4EyH552fJdCcVuldzPVk3A7/mJe2Taur5ulxbjIQ RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axrd4fk3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 08:16:20 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 188C3bwm031482;
 Wed, 8 Sep 2021 08:16:20 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axrd4fk37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 08:16:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 188CDMYZ015110;
 Wed, 8 Sep 2021 12:16:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3axcnp8eae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 12:16:18 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 188CGE8K40173976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Sep 2021 12:16:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA19DA4065;
 Wed,  8 Sep 2021 12:16:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54BA0A4059;
 Wed,  8 Sep 2021 12:16:14 +0000 (GMT)
Received: from sig-9-145-45-184.uk.ibm.com (unknown [9.145.45.184])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Sep 2021 12:16:14 +0000 (GMT)
Message-ID: <28b6a1950de1301f51bea78ba42273e5e5062923.camel@linux.ibm.com>
Subject: PING [PATCH v2] accel/tcg/user-exec: Fix read-modify-write of code
 on s390 hosts
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Riku Voipio <riku.voipio@iki.fi>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 08 Sep 2021 14:16:13 +0200
In-Reply-To: <20210803221606.150103-1-iii@linux.ibm.com>
References: <20210803221606.150103-1-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Sh8Mj-nlFdOa95nmcPmZfN8XCiTaz3YS
X-Proofpoint-ORIG-GUID: 3a11hGJGyuj40yYvnhOl1cyNVn-4OHZH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-08_05:2021-09-07,
 2021-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-08-04 at 00:16 +0200, Ilya Leoshkevich wrote:
> x86_64 dotnet/runtime uses cmpxchg for code patching. When running it
> under s390x qemu-linux user, cpu_signal_handler() does not recognize
> this as a write and does not restore PAGE_WRITE cleared by
> tb_page_add(), incorrectly forwarding the signal to the guest code.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> v1:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00464.html
> v1 -> v2: Fix comment style, fix CSST detection (Richard).
> 
>  accel/tcg/user-exec.c | 48 ++++++++++++++++++++++++++++++++++++-----
> --
>  1 file changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 90d1a2d327..8fed542622 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -680,18 +680,26 @@ int cpu_signal_handler(int host_signum, void
> *pinfo,
>  
>      pc = uc->uc_mcontext.psw.addr;
>  
> -    /* ??? On linux, the non-rt signal handler has 4 (!) arguments
> instead
> -       of the normal 2 arguments.  The 3rd argument contains the
> "int_code"
> -       from the hardware which does in fact contain the is_write
> value.
> -       The rt signal handler, as far as I can tell, does not give
> this value
> -       at all.  Not that we could get to it from here even if it
> were.  */
> -    /* ??? This is not even close to complete, since it ignores all
> -       of the read-modify-write instructions.  */
> +    /*
> +     * ??? On linux, the non-rt signal handler has 4 (!) arguments
> instead
> +     * of the normal 2 arguments.  The 4th argument contains the
> "Translation-
> +     * Exception Identification for DAT Exceptions" from the
> hardware (aka
> +     * "int_parm_long"), which does in fact contain the is_write
> value.
> +     * The rt signal handler, as far as I can tell, does not give
> this value
> +     * at all.  Not that we could get to it from here even if it
> were.
> +     * So fall back to parsing instructions.  Treat read-modify-
> write ones as
> +     * writes, which is not fully correct, but for tracking self-
> modifying code
> +     * this is better than treating them as reads.  Checking si_addr
> page flags
> +     * might be a viable improvement, albeit a racy one.
> +     */
> +    /* ??? This is not even close to complete.  */
>      pinsn = (uint16_t *)pc;
>      switch (pinsn[0] >> 8) {
>      case 0x50: /* ST */
>      case 0x42: /* STC */
>      case 0x40: /* STH */
> +    case 0xba: /* CS */
> +    case 0xbb: /* CDS */
>          is_write = 1;
>          break;
>      case 0xc4: /* RIL format insns */
> @@ -702,6 +710,12 @@ int cpu_signal_handler(int host_signum, void
> *pinfo,
>              is_write = 1;
>          }
>          break;
> +    case 0xc8: /* SSF format insns */
> +        switch (pinsn[0] & 0xf) {
> +        case 0x2: /* CSST */
> +            is_write = 1;
> +        }
> +        break;
>      case 0xe3: /* RXY format insns */
>          switch (pinsn[2] & 0xff) {
>          case 0x50: /* STY */
> @@ -715,7 +729,27 @@ int cpu_signal_handler(int host_signum, void
> *pinfo,
>              is_write = 1;
>          }
>          break;
> +    case 0xeb: /* RSY format insns */
> +        switch (pinsn[2] & 0xff) {
> +        case 0x14: /* CSY */
> +        case 0x30: /* CSG */
> +        case 0x31: /* CDSY */
> +        case 0x3e: /* CDSG */
> +        case 0xe4: /* LANG */
> +        case 0xe6: /* LAOG */
> +        case 0xe7: /* LAXG */
> +        case 0xe8: /* LAAG */
> +        case 0xea: /* LAALG */
> +        case 0xf4: /* LAN */
> +        case 0xf6: /* LAO */
> +        case 0xf7: /* LAX */
> +        case 0xfa: /* LAAL */
> +        case 0xf8: /* LAA */
> +            is_write = 1;
> +        }
> +        break;
>      }
> +
>      return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
>  }
>  

Hello,

Richard has reviewed this patch a while ago - is there anything else
that needs to be done before it can be picked up?

Best regards,
Ilya


