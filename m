Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B10479394
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 19:09:37 +0100 (CET)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myHfk-0001dG-9r
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 13:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1myHeO-0000nn-0T; Fri, 17 Dec 2021 13:08:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1myHeM-0006pn-7x; Fri, 17 Dec 2021 13:08:11 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHFa4I8038675; 
 Fri, 17 Dec 2021 18:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Gmqxw+NdFBQ427pC1kFefQzFk0sdP98HfIWVkVJ0lV0=;
 b=cgMbwV8DuacEKIoe5WK1qTavgIulXOAPy5QohaivpxV2yq8lD8CgvdoV5UyOierjaa+H
 bo4ORc5iB0R+bsTK373tewPyJPLaUYGD/eHGwoUN6A3rt9++7cpzDClIrPD2NlN9aXa9
 MYBkLMjgOiAP9oZ6vJ53bB/HOZYovbQOMNjr5r2iv5+1X9L2s6v9OogBy0wYu+lGWbL9
 NdBDUQ6EjPp7uQo12+rW0vde86UQo2GZ2k9RXuKDXQc394c4/pxaH9HoYiQRHBT7riP9
 w6xJVWZKXDhyUX/PFgoRcvg00DwFw9YHnZDgohktpQVysmK+fdU6394RzfgnHQbvqnxj SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cymkx7cr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 18:08:00 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BHHemJq024723;
 Fri, 17 Dec 2021 18:08:00 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cymkx7cqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 18:08:00 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BHHxai7012873;
 Fri, 17 Dec 2021 18:07:58 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 3cy7e56e4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 18:07:58 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BHI7vPV9699634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 18:07:57 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4C8E780C2;
 Fri, 17 Dec 2021 18:07:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7329F78080;
 Fri, 17 Dec 2021 18:07:37 +0000 (GMT)
Received: from localhost (unknown [9.211.58.206])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 17 Dec 2021 18:07:37 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] Revert "target/ppc: Move SPR_DSISR setting to
 powerpc_excp"
In-Reply-To: <3d5b6237-de28-8285-b0a4-080f18ba5acd@linaro.org>
References: <20211209173323.2166642-1-farosas@linux.ibm.com>
 <3d5b6237-de28-8285-b0a4-080f18ba5acd@linaro.org>
Date: Fri, 17 Dec 2021 15:07:35 -0300
Message-ID: <8735mr85qw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MegSYe5N2slfj9WPQ35__8wB32sbdbga
X-Proofpoint-ORIG-GUID: laDtvOAB_uZ0zvGsD7TqFfaj1ndzIf8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_07,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=858 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, philmd@redhat.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/9/21 9:33 AM, Fabiano Rosas wrote:
>> This reverts commit 336e91f85332dda0ede4c1d15b87a19a0fb898a2.
>>=20
>> It breaks the --disable-tcg build:
>>=20
>>   ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
>>   function =E2=80=98cpu_ldl_code=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
>>=20
>> We should not have TCG code in powerpc_excp because some kvm-only
>> routines use it indirectly to dispatch interrupts. See
>> kvm_handle_debug, spapr_mce_req_event and
>> spapr_do_system_reset_on_cpu.
>>=20
>> We can re-introduce the change once we have split the interrupt
>> injection code between KVM and TCG.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>   target/ppc/excp_helper.c | 21 ++++++++++++---------
>>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> This is fine.  I had thought it would turn out to be helpful in conjuncti=
on with my=20
> user-only unaligned patch set, but in the end I went a different way and =
have a separate=20
> hook for user-only.
>
> It is correct to simply revert the patch first.
>
> I have ideas for further cleanup, if you have time:
>
> (1) The assignment to DSISR does not need to wait until powerpc_excp.  I =
believe we can=20
> assign to it directly in do_unaligned_access, and avoid using env->error_=
code as an=20
> intermediary.

Makes sense. I see that not all processors use DSISR during the
Alignment interrupt. I'll check the manuals and fix that as well.

I'm writing some tests to check each individual Alignment case and DAR
is not being set for ALIGN_LE. There might be others missing. I'll
probably end up moving the DAR code from ppc_cpu_do_unaligned_access
into powerpc_excp after all.

>
> (2) The note about opcode fields being set incorrectly could be fixed dur=
ing translation.=20
>   You'd use TARGET_INSN_START_EXTRA_WORDS to record the necessary informa=
tion during=20
> translation, is provided to restore_state_to_opc during unwinding, and th=
en moved into=20
> DSISR in do_unaligned_access.  Similar to target/arm and how env->excepti=
on.syndrome is=20
> managed, especially disas_set_insn_syndrome.
>

Ok, I'll give it a shot. Thanks for the detailed pointers.

