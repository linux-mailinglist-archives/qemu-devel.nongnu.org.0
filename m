Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB43A8B3F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:39:06 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGm0-0005kx-J9
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ltGkd-0004yf-JX; Tue, 15 Jun 2021 17:37:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38942
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1ltGkb-0004fC-Fa; Tue, 15 Jun 2021 17:37:39 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FLXw4C143726; Tue, 15 Jun 2021 17:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=UpvoYxItfnJEGZhX9hH8TWbZYoLUbOq4a1hVDxMDfE8=;
 b=TdEVwCOj9cjzStW1O9gyKF8JD3QBcxmRQRsYjL5p4pb3fTuwAXsg8BGNV5WKF57fWnnT
 w4nsKPCh3h9bq984aiyiAi7E+MmBlX6aAWaAKkEO43/IErRXeNsJv1y1fRV+BIxGy0bl
 NzTigMplPchAqI0MyvWUiD0+BGHLsXx2ks00mbtqURIM+u4c72i/SFRnCGyt9FQSrqzG
 eJQ5u/e28/pspgqTO+47ZdWws5l45eJpTFsiWJg6HjssVQBJTBAr8onh0ykKPFsGY/OV
 4y6hCUdmYqRUVNAWbSgq6C89OejS4hwjf4wETzN963f7OopsAR7WCLnd/bS2PyRwzZjE 3w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39736w1r12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 17:37:24 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FLSAXT008401;
 Tue, 15 Jun 2021 21:37:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 394mj9t0r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 21:37:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15FLbMla27853110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 21:37:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65B557806E;
 Tue, 15 Jun 2021 21:37:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8E6F7807F;
 Tue, 15 Jun 2021 21:37:21 +0000 (GMT)
Received: from localhost (unknown [9.211.38.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Jun 2021 21:37:21 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Bruno Piazera Larsen
 <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
In-Reply-To: <7ce3cd57-0abf-f0d9-11ec-6fdc42b89b62@linaro.org>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
 <c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org>
 <1c27c473-be10-41cf-d633-bcd838fed78e@eldorado.org.br>
 <7ce3cd57-0abf-f0d9-11ec-6fdc42b89b62@linaro.org>
Date: Tue, 15 Jun 2021 18:37:19 -0300
Message-ID: <877diuq06o.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bv8lAKr3ccvb1tSVMLCRveH_fzezZWvk
X-Proofpoint-GUID: Bv8lAKr3ccvb1tSVMLCRveH_fzezZWvk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_07:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106150132
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/15/21 4:32 AM, Bruno Piazera Larsen wrote:
>> On 14/06/2021 19:37, Richard Henderson wrote:
>>> On 6/14/21 12:16 PM, Bruno Larsen (billionai) wrote:
>>>> This patch changes ppc_cpu_get_phys_page_debug so that it is now
>>>> able to translate both, priviledged and real mode addresses
>>>> independently of whether the CPU executing it has those permissions
>>>>
>>>> This was mentioned by Fabiano as something that would be very useful to
>>>> help with debugging, but could possibly constitute a security issue if
>>>> that debug function can be called in some way by prodution code. the
>>>> solution was implemented such that it would be trivial to wrap it arou=
nd
>>>> ifdefs for building only with --enable-debug, for instance, but we are
>>>> not sure this is the best approach, hence why it is an RFC.
>>>>
>>>> Suggested-by: Fabiano Rosas<farosas@linux.ibm.com>
>>>> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
>>>> ---
>>>> =C2=A0 target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
>>>> =C2=A0 1 file changed, 23 insertions(+)
>>>
>>> I think the first part is unnecessary.=C2=A0 Either the cpu is in super=
visor mode or it=20
>>> isn't, and gdb should use the correct address space.=C2=A0 If you reall=
y want to force=20
>>> supervisor lookup from a guest that is paused in usermode, I suppose yo=
u could force=20
>>> MSR.PR=3D1 while you're performing the access and set it back afterward.
>> I don't see why GDB should not be able to see supervisor level addresses=
 just because the=20
>> CPU can't.
>
> Because then when you are debugging, you then don't know whether the addr=
ess is actually=20
> accessible in the current cpu context.
>

@Bruno, so this is what I referred to somewhere else on the thread,
people expect GDB to have the same access level of the currently
executing code. So implementing my suggestion would break their
workflow.

>>> I think the second part is actively wrong -- real-mode address lookup w=
ill (for the most=20
>>> part) always succeed.=C2=A0 Moreover, the gdb user will have no idea th=
at you've silently=20
>>> changed addressing methods.
>>=20
>> I disagree. Real-mode address will mostly fail, since during the boot pr=
ocess Linux=20
>> kernels set the MMU to use only virtual addresses, so real mode addresse=
s only work when=20
>> debugging the firmware or the early setup of the kernel. After that, GDB=
 can basically=20
>> only see virtual addresses.
>
> Exactly.  But you changed that so that any unmapped address will re-try w=
ith real-mode,=20
> which (outside of hv) simply maps real->physical and returns the input.
>
> One should have to perform some special action to see addresses in a diff=
erent cpu=20
> context.  I don't think that gdb supports such a special action at the mo=
ment.  If you=20
> want that feature though, that's where you should start.

I think we can just drop this patch. The scenarios where debugging
across MMU contexts happen are quite limited.

My use case was a while back when implementing single-step for KVM
guests; there were some situations where GDB would have issues setting
breakpoints around kernel code that altered MSR_IR/DR. But that is
mostly anecdotal at this point. If I ever run into that again, now I
know where to look.

>
>
> r~

