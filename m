Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D563A3F0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:02:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oza0I-0005ya-28; Mon, 28 Nov 2022 04:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1ozZzu-0005rI-Pg; Mon, 28 Nov 2022 04:00:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1ozZzq-0000bo-GB; Mon, 28 Nov 2022 04:00:16 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AS8KgaH001354; Mon, 28 Nov 2022 09:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=frS9Zh18JIFRLV3k0NYVkamO7NVNX+oTphRcy/+WDJc=;
 b=dGTkuRPU6p+Fxav92R6AaBOqNuaF5up9tLJ77JGBIv4lG6Hpvmkf7EP0XvWdl0J84vDR
 +Ihp3Nw6wjWYME4VLi5i9Dk2qmJZFE0WVjVkgrNMP7pJKa0ZLJTYe8OuyvlMOtRS/JA8
 KVM5PEutucHGQE9qPvd3UYcMPA1yeQE+Q9hpX10c9WiLnosZOkEZ2L3Nai2KgC/dLF/y
 H1zzWiDAHtcufC/iNN5KXOMbJsYRCJWBfs+zVfCjsp6zPPc9iYiojZo9WunJTYtM8hZ0
 eKOsenp+jUJyQMcES1TuJG7F5yhcgrg342l72uxhqkOzkNMIMooE41xrudr02+m+pFub GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vfjjgvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 09:00:10 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AS7lqFN020506;
 Mon, 28 Nov 2022 09:00:10 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vfjjguj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 09:00:09 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS8ouQm025131;
 Mon, 28 Nov 2022 09:00:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3m3a2hskxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 09:00:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AS905eo8258064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Nov 2022 09:00:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4C2FA4051;
 Mon, 28 Nov 2022 09:00:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CDFDA4040;
 Mon, 28 Nov 2022 09:00:04 +0000 (GMT)
Received: from marcibm (unknown [9.171.36.6])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 28 Nov 2022 09:00:04 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: German Maglione <gmaglione@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Liebler <stli@linux.ibm.com>,
 virtio-fs@redhat.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Sven Schnelle <svens@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Add `sigreturn` to the seccomp
 whitelist
In-Reply-To: <CAJh=p+7igBB9CMTUi--HCpcuxdHgveqgkw5dY7frE7Wqf==04w@mail.gmail.com>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <CAJh=p+7igBB9CMTUi--HCpcuxdHgveqgkw5dY7frE7Wqf==04w@mail.gmail.com>
Date: Mon, 28 Nov 2022 10:00:03 +0100
Message-ID: <87lenvjvxo.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LVIwBR9VSJfjBcB9_3K5POIEQVn1rJov
X-Proofpoint-GUID: KiU53g6_RMJoQ9MYj_gaO2leJ-3C_N_O
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_07,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280066
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mhartmay@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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

German Maglione <gmaglione@redhat.com> writes:

> On Fri, Nov 25, 2022 at 3:40 PM Marc Hartmayer <mhartmay@linux.ibm.com> w=
rote:
>>
>> The virtiofsd currently crashes on s390x. This is because of a
>> `sigreturn` system call. See audit log below:
>>
>> type=3DSECCOMP msg=3Daudit(1669382477.611:459): auid=3D4294967295 uid=3D=
0 gid=3D0 ses=3D4294967295 subj=3Dsystem_u:system_r:virtd_t:s0-s0:c0.c1023 =
pid=3D6649 comm=3D"virtiofsd" exe=3D"/usr/libexec/virtiofsd" sig=3D31 arch=
=3D80000016 syscall=3D119 compat=3D0 ip=3D0x3fff15f748a code=3D0x80000000AU=
ID=3D"unset" UID=3D"root" GID=3D"root" ARCH=3Ds390x SYSCALL=3Dsigreturn
>>
>> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>> ---
>>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/pas=
sthrough_seccomp.c
>> index 888295c073de..0033dab4939e 100644
>> --- a/tools/virtiofsd/passthrough_seccomp.c
>> +++ b/tools/virtiofsd/passthrough_seccomp.c
>> @@ -110,6 +110,7 @@ static const int syscall_allowlist[] =3D {
>>  #endif
>>      SCMP_SYS(set_robust_list),
>>      SCMP_SYS(setxattr),
>> +    SCMP_SYS(sigreturn),
>>      SCMP_SYS(symlinkat),
>>      SCMP_SYS(syncfs),
>>      SCMP_SYS(time), /* Rarely needed, except on static builds */
>> --
>> 2.34.1
>>
>> _______________________________________________
>> Virtio-fs mailing list
>> Virtio-fs@redhat.com
>> https://listman.redhat.com/mailman/listinfo/virtio-fs
>>
>
> Reviewed-by:  German Maglione <gmaglione@redhat.com>

Thanks.

>
> Should we add this also in the rust version?, I see we don't have it
> enabled either.

Yep - thanks.

>
> --=20
> German
>
--=20
Kind regards / Beste Gr=C3=BC=C3=9Fe
   Marc Hartmayer

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen=20
Gesch=C3=A4ftsf=C3=BChrung: David Faller
Sitz der Gesellschaft: B=C3=B6blingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

