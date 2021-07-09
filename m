Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF303C25D9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:24:27 +0200 (CEST)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rQY-0000aI-9X
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1rPV-0008GV-Qy; Fri, 09 Jul 2021 10:23:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1rPT-0002C8-W6; Fri, 09 Jul 2021 10:23:21 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169E3TBM076085; Fri, 9 Jul 2021 10:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=5RPi49x7uRai1CpL3TGd7VnWscSrpSZrCpeNkOpXXow=;
 b=ovf3plDfPPfaEkLaWL7McztB0IGpDoWJKjS/BLGUPPyi79cecAoiRd1CeHLSnQiBOwnW
 98i+IsO9qN4OiTjTZjJPmqIVSZe64xdczTxcF1th7plVdtnnzcHRlYV0u6f+vIW1M0h2
 xnGMhb0H1zPqHUg4vZ6bBDPOuSJmv7GUPAVvurrIBomCI4qNPnv+W56fd4xOkqtISwdd
 WCZmb+Anyg7g3CaIF6O+WB0+Qfyw+UBc3xNEQuewD87HBLdgcELoNq6T4wK0fXGoZg6b
 P/kWM1TD6YxQKbEMlLvcf6wQziaLOMhtADWAzitbt1l6Pc0O/NOMNpZl7iB4nIzbw+AV kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39p2qr3her-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 10:23:16 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 169E3Tw6076101;
 Fri, 9 Jul 2021 10:23:16 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39p2qr3he9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 10:23:16 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 169EDAEv004509;
 Fri, 9 Jul 2021 14:23:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 39jfhe22hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 14:23:15 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 169ENDTe35979530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Jul 2021 14:23:13 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C1D56A05D;
 Fri,  9 Jul 2021 14:23:13 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF6F46A066;
 Fri,  9 Jul 2021 14:23:12 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  9 Jul 2021 14:23:12 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Jul 2021 10:23:12 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 1/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Organization: IBM
In-Reply-To: <8e6af279-6cb8-33af-8bf5-042dcb99f671@linaro.org>
References: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
 <20210707134231.1835-2-jonathan.albrecht@linux.vnet.ibm.com>
 <8e6af279-6cb8-33af-8bf5-042dcb99f671@linaro.org>
Message-ID: <bd35b4ccf4d0f972ab454652b4ed2e60@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WRU18qqtFiNawO2HRjZ5DW4SlZbMs7D7
X-Proofpoint-GUID: ovI63XqyGhn6tj5uc5wYtCCsJz9dyu1y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_09:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090070
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com, iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 laurent@vivier.eu, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-07-08 1:08 pm, Richard Henderson wrote:
> On 7/7/21 6:42 AM, Jonathan Albrecht wrote:
>> +                sig = TARGET_SIGFPE;
>> +                if ((n & 0x03) == 0) {
>> +                    /* An IEEE exception, simulated or otherwise. */
>>                       if (n & 0x80) {
>>                           n = TARGET_FPE_FLTINV;
>>                       } else if (n & 0x40) {
>> @@ -121,13 +123,12 @@ void cpu_loop(CPUS390XState *env)
>>                           n = TARGET_FPE_FLTUND;
>>                       } else if (n & 0x08) {
>>                           n = TARGET_FPE_FLTRES;
>> -                    } else {
>> -                        /* ??? Quantum exception; BFP, DFP error.  */
>> -                        goto do_sigill_opn;
>>                       }
>> -                    sig = TARGET_SIGFPE;
>> -                    goto do_signal_pc;
>> +                } else {
>> +                    /* compare-and-trap */
>> +                    n = 0;
>>                   }
> 
Thanks for the review. I should have a v3 ready shortly.

> Nearly, but not quite.  Replace the ??? Quantum exception with n = 0,
> otherwise si_code will be garbage for that case.
> 
Thx I'll fix that.

> The structure of the kernel code is
> 
>   if (n != 0) {
>     /* do_fp_trap */
>     si_code = 0;
>     if ((n & 3) == 0) {
>       /* select on bits 6 & 7 */
>     }
>     raise sigfpe w/ si_code
>   } else {
>     raise sigill
>   }
> 
> The comment for compare-and-trap is misleading, because there are lots
> of entries in "Figure 6-2. Data-exception codes (DXC)" which arrive
> there and are not compare-and-trap.
> 
I'll make the comment less specific.

> As a general comment, I think a single switch over DXC would be
> cleaner for both kernel and qemu.  It seems like giving different
> si_code for e.g. "0x40 IEEE division by zero" and "0x43 Simulated IEEE
> division by zero" is actively incorrect.
> 
I went over the DXC section and I see what you mean about the si_codes
for simulated IEEE exceptions. I'll plan on handling those the same as
non-simulated IEEE if no objections. Otherwise all non-IEEE will have
si_code == 0 except DXC == 0x00 will still goto do_sigill_opn.

> 
> r~

