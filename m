Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0663BDC7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:17:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozxfj-0003Ep-LN; Tue, 29 Nov 2022 05:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1ozxfe-00039p-1b; Tue, 29 Nov 2022 05:16:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1ozxfb-0006Qx-Uw; Tue, 29 Nov 2022 05:16:57 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AT9uhIg005223; Tue, 29 Nov 2022 10:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Z6bYehhqZZtobMu+v574NMN2Bnl7X83wkx2tH7UB0H4=;
 b=VI0z7weRj3Bg/kBwbaYaykcC+sw73JW5GuG1w2+B221e983nYaayLeQGMOcKfHlmk845
 xVJTw6vhmocRMwTGHsJHqniQpzzzsyXnjrTyhEp2S/cSORwVLm0oluFlPhQRccEOc6oB
 PFe3EH0LzRdcWHOTtilup8GSKoY7liGFQRZeJ1CALAjyR9KOQK16spjHyFQAaHtj0fGz
 ybMdi2uPXOo8o5sTn1iQ1anAF+Gq3OVoB/Th9IwZnV8U2IC6yqzXNzQzdcYJBoDN2GN2
 y2XHpiHOAMyK1BGDH9YM8bD0mEC+5Oyx3aWOJGjIWCy7sDatdSKYnrVf1tX/wOWrn5tj Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5fw1rg4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 10:16:54 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT9va7w010366;
 Tue, 29 Nov 2022 10:16:53 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5fw1rg48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 10:16:53 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATA613Y032156;
 Tue, 29 Nov 2022 10:16:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3m3ae8tt0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 10:16:51 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2ATAGmEj655970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 10:16:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DD4052050;
 Tue, 29 Nov 2022 10:16:48 +0000 (GMT)
Received: from marcibm (unknown [9.171.40.186])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id CEB3E5204E;
 Tue, 29 Nov 2022 10:16:47 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, Sven Schnelle
 <svens@linux.ibm.com>, Stefan Liebler <stli@linux.ibm.com>
Subject: Re: [PATCH] virtiofsd: Add `sigreturn` to the seccomp whitelist
In-Reply-To: <618edde1-31d8-9db8-48d9-137fe81b788b@de.ibm.com>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <Y4UCPQ0E2ZY15aEq@work-vm> <87wn7ef6cm.fsf@linux.ibm.com>
 <Y4XT/ZxuyU7F5h1n@work-vm>
 <1a94f96b-d9b6-44af-cedb-aa17eb1a3a84@de.ibm.com>
 <618edde1-31d8-9db8-48d9-137fe81b788b@de.ibm.com>
Date: Tue, 29 Nov 2022 11:16:47 +0100
Message-ID: <87sfi2f4kw.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UJfpz6rCBW2IAEXbyKUdV4VnidrvAKaU
X-Proofpoint-ORIG-GUID: obY5iULDfhToiN7KbMjQhPDEOOxYMelM
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_07,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211290062
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mhartmay@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

Christian Borntraeger <borntraeger@de.ibm.com> writes:

> Am 29.11.22 um 10:52 schrieb Christian Borntraeger:
>>=20
>>=20
>> Am 29.11.22 um 10:42 schrieb Dr. David Alan Gilbert:
>>> * Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
>>>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>>>>
>>>>> * Marc Hartmayer (mhartmay@linux.ibm.com) wrote:
>>>>>> The virtiofsd currently crashes on s390x. This is because of a
>>>>>> `sigreturn` system call. See audit log below:
>>>>>>
>>>>>> type=3DSECCOMP msg=3Daudit(1669382477.611:459): auid=3D4294967295 ui=
d=3D0 gid=3D0 ses=3D4294967295 subj=3Dsystem_u:system_r:virtd_t:s0-s0:c0.c1=
023 pid=3D6649 comm=3D"virtiofsd" exe=3D"/usr/libexec/virtiofsd" sig=3D31 a=
rch=3D80000016 syscall=3D119 compat=3D0 ip=3D0x3fff15f748a code=3D0x8000000=
0AUID=3D"unset" UID=3D"root" GID=3D"root" ARCH=3Ds390x SYSCALL=3Dsigreturn
>>>>>
>>>>> I'm curious; doesn't that mean that some signal is being delivered and
>>>>> you're returning?=C2=A0 Which one?
>>>>
>>>> code=3D0x80000000 means that the seccomp action SECCOMP_RET_KILL_PROCE=
SS
>>>> is taken =3D> process is killed by a SIGSYS signal (31) [1].
>>>>
>>>> At least, that=E2=80=99s my understanding of this log message.
>>>>
>>>> [1] https://man7.org/linux/man-pages/man2/seccomp.2.html
>>>
>>> But isn't that the fallout rather than the cause ? i.e. seccomp
>>> is sending a SIGSYS because the process used sigreturn, my question
>>> is why did the process call sigreturn in the first place - it must
>>> have received a signal to return from?
>>=20
>> Good question. virtiofsd seems to prepare itself for
>>=20
>> int fuse_set_signal_handlers(struct fuse_session *se)
>> {
>>  =C2=A0=C2=A0=C2=A0 /*
>>  =C2=A0=C2=A0=C2=A0=C2=A0 * If we used SIG_IGN instead of the do_nothing=
 function,
>>  =C2=A0=C2=A0=C2=A0=C2=A0 * then we would be unable to tell if we set SI=
G_IGN (and
>>  =C2=A0=C2=A0=C2=A0=C2=A0 * thus should reset to SIG_DFL in fuse_remove_=
signal_handlers)
>>  =C2=A0=C2=A0=C2=A0=C2=A0 * or if it was already set to SIG_IGN (and sho=
uld be left
>>  =C2=A0=C2=A0=C2=A0=C2=A0 * untouched.
>>  =C2=A0=C2=A0=C2=A0=C2=A0 */
>>  =C2=A0=C2=A0=C2=A0 if (set_one_signal_handler(SIGHUP, exit_handler, 0) =
=3D=3D -1 ||
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_one_signal_handler(SIGIN=
T, exit_handler, 0) =3D=3D -1 ||
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_one_signal_handler(SIGTE=
RM, exit_handler, 0) =3D=3D -1 ||
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_one_signal_handler(SIGPI=
PE, do_nothing, 0) =3D=3D -1) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>  =C2=A0=C2=A0=C2=A0 }
>>=20
>>=20
>>=20
>> Given that rt_sigreturn was already on the seccomp list it seems
>> to be expected that those handlers are called.
>
> For me, it seems to happen on shutdown:
>                  Stack trace of thread 1:
>                  #0  0x000003ffc06f348a __kernel_sigreturn (linux-vdso64.=
so.1 + 0x48a)
>                  #1  0x000003ffc06f3488 __kernel_sigreturn (linux-vdso64.=
so.1 + 0x488)
>                  #2  0x000003ff9af1be96 __GI___futex_abstimed_wait_cancel=
able64 (libc.so.6 + 0x9be96)
>                  #3  0x000003ff9af211b4 __pthread_clockjoin_ex (libc.so.6=
 + 0xa11b4)
>                  #4  0x000003ff9af2106e pthread_join@GLIBC_2.2 (libc.so.6=
 + 0xa106e)
>                  #5  0x000002aa35d2fe36 fv_queue_cleanup_thread (virtiofs=
d + 0x2fe36)
>                  #6  0x000002aa35d3152c stop_all_queues (virtiofsd + 0x31=
52c)
>                  #7  0x000002aa35d2869c main (virtiofsd + 0x2869c)
>                  #8  0x000003ff9aeb4872 __libc_start_call_main (libc.so.6=
 + 0x34872)
>                  #9  0x000003ff9aeb4950 __libc_start_main@@GLIBC_2.34 (li=
bc.so.6 + 0x34950)
>                  #10 0x000002aa35d290a0 .annobin_libvhost_user.c_end.star=
tup (virtiofsd + 0x290a0)
>
>

That=E2=80=99s also what I see.

--
Kind regards / Beste Gr=C3=BC=C3=9Fe
   Marc Hartmayer

IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Gregor Pillen=20
Gesch=C3=A4ftsf=C3=BChrung: David Faller
Sitz der Gesellschaft: B=C3=B6blingen
Registergericht: Amtsgericht Stuttgart, HRB 243294

