Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C68046EB1C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:26:04 +0100 (CET)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLJ5-000335-Mi
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:26:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvLFT-0006Ir-VW; Thu, 09 Dec 2021 10:22:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvLFP-0000QL-N5; Thu, 09 Dec 2021 10:22:18 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9DxTwe027137; 
 Thu, 9 Dec 2021 15:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=jPObpxySJ/Yy4O89rs3Biy4tMm8Ik81r1btWHNnM0KA=;
 b=eZV4PuFweZ05B15ZuYAELssr2b59/+9Aw0lCnInKx+jzrjuHhIH/sPqwEPN8xKE267Vo
 roHgrQpz7/0QpHgk5x7TfVd74cpyUQspQSdtIvWPf6xtfpRRtjOtDoqv3B7N61SIuYiK
 Wo1FJDvXO98ZnmP/t6HJsLxknYl94EcmY0LaSVwOo+ZsYQx2oUlfobTULLTXEIKlaI4H
 8Eu+liusKURIp1bIpMi2WBcDGxofjiQiB7Jyt8BXVKCcaNhRiZRt/OdWTPWdCuKI45Nd
 hnN6FjzU9wxnMaPt9RzWjg4LOvWr44jvQY2KbGwF8THgZFxKJVdJ0dJGA34btIUbMGme ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cuk5ka1j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:22:07 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9EM1P1030743;
 Thu, 9 Dec 2021 15:22:07 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cuk5ka1hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:22:06 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9FCEEE021814;
 Thu, 9 Dec 2021 15:22:06 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3cqyyca9ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:22:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9FM4ht29163934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 15:22:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0C3EAC065;
 Thu,  9 Dec 2021 15:22:04 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0454AC066;
 Thu,  9 Dec 2021 15:22:03 +0000 (GMT)
Received: from localhost (unknown [9.163.12.190])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Dec 2021 15:22:03 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: powerpc_excp: Guard ALIGNMENT interrupt
 with CONFIG_TCG
In-Reply-To: <62461e08-a5ef-f39c-3b7a-3a9426c1b11a@redhat.com>
References: <20211208230650.2125095-1-farosas@linux.ibm.com>
 <62461e08-a5ef-f39c-3b7a-3a9426c1b11a@redhat.com>
Date: Thu, 09 Dec 2021 12:22:01 -0300
Message-ID: <87lf0t6bxi.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gwg_ikIM4WEKrJRA5qG4iDnhOvkW_72U
X-Proofpoint-GUID: d9atizlv_rnWl2UHN6Gs5nDFsynf3IFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_06,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112090082
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 12/9/21 00:06, Fabiano Rosas wrote:
>> We cannot have TCG code in powerpc_excp because the function is called
>> from kvm-only code via ppc_cpu_do_interrupt:
>>=20
>>  ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
>>  function =E2=80=98cpu_ldl_code=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>>=20
>> Fortunately, the Alignment interrupt is not among the ones dispatched
>> from kvm-only code, so we can keep it out of the disable-tcg build for
>> now.
>>=20
>> Fixes: 336e91f853 ("target/ppc: Move SPR_DSISR setting to powerpc_excp")
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>=20
>> ---
>>=20
>> Perhaps we could make powerpc_excp TCG only and have a separate
>> function that only knows the two interrupts that we use with KVM
>> (Program, Machine check). But for now this fix will do, I think.
>
> If KVM only uses 2 exception vectors, you could guard the
> enum in target/ppc/cpu.h using #ifdef'ry. While making the
> include uglier, it will helps to catch vector misused at
> compile time.

Yes, good point.

I just noticed that we also use System Reset with KVM. The other two are
kvm-only, but this one is in code shared with TCG, so it will need a bit
more work to disentangle. But should still be doable.

>> ---
>>  target/ppc/excp_helper.c | 2 ++
>>  1 file changed, 2 insertions(+)

