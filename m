Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC00D63BD1C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 10:40:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozx4v-00074D-Kv; Tue, 29 Nov 2022 04:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1ozx4h-0006uO-Hv; Tue, 29 Nov 2022 04:38:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1ozx4e-0004pR-2U; Tue, 29 Nov 2022 04:38:46 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AT7c2xF002921; Tue, 29 Nov 2022 09:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KPiXkMI5rsvRFtZnAKXBVhAtBy9zMoxjWGveXJYbvgs=;
 b=omMxmJHs2Hnj3/aep/LRTHHfdwTHETU1Y6PEeLHsU9BH8xwXSrMK1GlB0G8PX3/yPa74
 X5CRjuQbK71j2JDraW66blOoybTfcPU1NMDKk493HYwTLM4xHImDW++5uL3YzU0AgXfN
 XLwawDdJ90FiKU5ETmC2aAVE7Xp1ptx4GGbGU27hAH51P89ebikzFl1vRlCd/t1ChNOm
 urXbDNhOVXsnDnk842FxfKhlTM8NpMhoLp8KvH9nIDTzR5bbcM6bTftRKSI6YYh628j4
 hFxI+RBHzzZO1Y5WtC/ZuhR2RJiOqHAdjKUhi/eLWGFgcn+xLN9M4QDQwx+qS8YWKEoG Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5a6cytrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 09:38:40 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT9LmuD027819;
 Tue, 29 Nov 2022 09:38:40 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5a6cytr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 09:38:40 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT9aaqR007148;
 Tue, 29 Nov 2022 09:38:38 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3m3a2htrf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 09:38:38 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AT9cZKD11076156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 09:38:35 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E569742042;
 Tue, 29 Nov 2022 09:38:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 711FF4203F;
 Tue, 29 Nov 2022 09:38:34 +0000 (GMT)
Received: from marcibm (unknown [9.171.40.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 29 Nov 2022 09:38:34 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Stefan Liebler <stli@linux.ibm.com>
Subject: Re: [PATCH] virtiofsd: Add `sigreturn` to the seccomp whitelist
In-Reply-To: <Y4UCPQ0E2ZY15aEq@work-vm>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <Y4UCPQ0E2ZY15aEq@work-vm>
Date: Tue, 29 Nov 2022 10:38:33 +0100
Message-ID: <87wn7ef6cm.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fZWwwXccRzKQlOuBjBzKLazPL-Vlpv8z
X-Proofpoint-GUID: zbBF6rfyMvQLPXoXjsC7MCUzpK_VVkQE
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_06,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211290059
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

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
>> The virtiofsd currently crashes on s390x. This is because of a
>> `sigreturn` system call. See audit log below:
>>=20
>> type=3DSECCOMP msg=3Daudit(1669382477.611:459): auid=3D4294967295 uid=3D=
0 gid=3D0 ses=3D4294967295 subj=3Dsystem_u:system_r:virtd_t:s0-s0:c0.c1023 =
pid=3D6649 comm=3D"virtiofsd" exe=3D"/usr/libexec/virtiofsd" sig=3D31 arch=
=3D80000016 syscall=3D119 compat=3D0 ip=3D0x3fff15f748a code=3D0x80000000AU=
ID=3D"unset" UID=3D"root" GID=3D"root" ARCH=3Ds390x SYSCALL=3Dsigreturn
>
> I'm curious; doesn't that mean that some signal is being delivered and
> you're returning?  Which one?

code=3D0x80000000 means that the seccomp action SECCOMP_RET_KILL_PROCESS
is taken =3D> process is killed by a SIGSYS signal (31) [1].

At least, that=E2=80=99s my understanding of this log message.

[1] https://man7.org/linux/man-pages/man2/seccomp.2.html

[=E2=80=A6snip=E2=80=A6]

> --=20
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
--=20
Kind regards / Beste Gr=C3=BC=C3=9Fe
   Marc Hartmayer

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen=20
Gesch=C3=A4ftsf=C3=BChrung: David Faller
Sitz der Gesellschaft: B=C3=B6blingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

