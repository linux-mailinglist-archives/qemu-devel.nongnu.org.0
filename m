Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49CF591071
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 14:02:19 +0200 (CEST)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTMn-0001ot-Lb
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 08:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oMT6m-0000OU-JT
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38382
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oMT6g-0002Q5-CE
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:39 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CBMYUJ030840;
 Fri, 12 Aug 2022 11:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9Fqhu1FcQWxJPUODRb/BfY38b3wtrMHyHIMPWGcaAsU=;
 b=cXVGzQSgwTHLLtiE/N+kpW27bxZr4Xd+v8vU+5FdOJFH9emnNWwyaxkd8M2RjAEKRhKe
 S5Hppjy/QZHxdeGbZQXIhFDrzruM26zafL56641kyt6qgyMuOA8rHW7HUUMN5J6r4nOP
 HkjOIZ5ufD+HrxwWhOaCPAedlyLESNSAIUiUgjzag/YzmxYpeuZMe5HfbZxPPERcDvmz
 VV7HP3x1Ryvsdbj68p48633d5FiqUa5Z+X7lThMPsACnEGAyHouwkW0pOObKLJMoTAvg
 NYUGgNh/ri6hjD5SrFgG1/aVaC9l9VxPA3ZNDnJvHeHJxOgpN7VXoAPfsXS4ZTq57xgL +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwnxdrkg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 11:45:36 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CBNNqJ000778;
 Fri, 12 Aug 2022 11:45:36 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwnxdrkev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 11:45:36 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CBLWwW005931;
 Fri, 12 Aug 2022 11:45:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3huwvftcbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 11:45:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CBjUSE29032886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 11:45:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B3C2AE053;
 Fri, 12 Aug 2022 11:45:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCE8BAE045;
 Fri, 12 Aug 2022 11:45:29 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.3.179])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 11:45:29 +0000 (GMT)
Date: Fri, 12 Aug 2022 13:45:27 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Murilo Opsfelder =?UTF-8?B?QXJhw7pqbw==?= <muriloo@linux.ibm.com>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Message-ID: <20220812134527.70391185@p-imbrenda>
In-Reply-To: <fcc03c35-d2c6-a124-d9d0-958056476f20@linux.ibm.com>
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
 <YvT1wC0vi2juO5n3@redhat.com> <20220811155623.25f0d4b4@p-imbrenda>
 <YvUL2+Y6td7Ak0N/@redhat.com>
 <42b6bfa1-1983-b065-6b0d-9b5d89465f9b@linux.ibm.com>
 <20220812092623.19058f32@p-imbrenda>
 <fcc03c35-d2c6-a124-d9d0-958056476f20@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UOhbTyw67-dDaNOK_2goKDsydBGXCR5K
X-Proofpoint-GUID: 3qcLfOae9LdWWcB4oM6YxBOaxtu-8OVS
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_08,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxlogscore=987
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120032
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Aug 2022 08:38:59 -0300
Murilo Opsfelder Ara=C3=BAjo <muriloo@linux.ibm.com> wrote:

> On 8/12/22 04:26, Claudio Imbrenda wrote:
> > On Thu, 11 Aug 2022 23:05:52 -0300
> > Murilo Opsfelder Ara=C3=BAjo <muriloo@linux.ibm.com> wrote:
> >=20=20
> >> On 8/11/22 11:02, Daniel P. Berrang=C3=A9 wrote:
> >> [...]=20=20
> >>>>> Hmm, I was hoping you could just use SIGKILL to guarantee that this
> >>>>> gets killed off.  Is SIGKILL delivered too soon to allow for the
> >>>>> main QEMU process to have exited quickly ?=20=20
> >>>>
> >>>> yes, I tried. qemu has not finished exiting when the signal is
> >>>> delivered, the cleanup process dies before qemu, which defeats the
> >>>> purpose=20=20
> >>>
> >>> Ok, too bad.
> >>>=20=20
> >>>>> If so I wonder what happens when systemd just delivers SIGKILL to
> >>>>> all processes in the cgroup - I'm not sure there's a guarantee it
> >>>>> will SIGKILL the main qemu before it SIGKILLs this helper=20=20
> >>>>
> >>>> I'm afraid in that case there is no guarantee.
> >>>>
> >>>> for what it's worth, both virsh shutdown and destroy seem to do thin=
gs
> >>>> properly.=20=20
> >>>
> >>> Hmm, probably because libvirt tells QEMU to exit before systemd comes
> >>> along and tells everything in the cgroup to die with SIGKILL.=20=20
> >>
> >> It seems Libvirt sends SIGKILL if qemu process doesn't terminate withi=
n 10
> >> seconds after Libvirt sent SIGTERM:
> >>
> >> https://gitlab.com/libvirt/libvirt/-/blob/0615df084ec9996b5df88d6a1b59=
c557e22f3a12/src/util/virprocess.c#L375=20=20
> >
> > but this is fine.
> >
> > with asynchronous teardown, qemu will exit almost immediately when
> > receiving SIGTERM, and the cleanup process will start cleaning up.=20=20
>=20
> Under normal and orderly conditions, yes.
>=20
> >> So I guess this patch happened to work with Libvirt because the main q=
emu
> >> process terminated before the timeout and before SIGKILL was delivered=
.=20=20
> >
> > it seems so
> >=20=20
> >>
> >> The cleanup process is trying to solve the problem where the main qemu=
 process
> >> takes too long to terminate. However, if the cleanup process itself ta=
kes too
> >> long, SIGKILL will be sent by Libvirt anyway.=20=20
> >
> > but that is not a problem, the sole purpose of the cleanup process is
> > to terminate _after_ qemu. it doesn't matter what happens after qemu
> > has terminated. if you look at the patch, after going to great lengths
> > to assure that qemu has terminated, all the child process does is
> > _exit(0).
> >=20=20
> >>
> >> Perhaps we can describe this situation in the parameter help, e.g.: If
> >> management layer decides to send SIGKILL (e.g.: due to timeout or deli=
berate
> >> decision), the cleanup process can exit before the main process, decei=
ving its
> >> purpose.=20=20
> >
> > if the management layer (or the user) decides to send SIGKILL
> > immediately to the whole cgroup without sending SIGTERM first, then
> > this whole asynchronous teardown mechanism is defeated, yes.=20=20
>=20
> This situation is what we likely want to describe in the parameter help. =
I don't
> want to give users the false impression that this option will *always* be=
have
> the manner we expect it to work *most* of the time.

fair enough, I'll improve the documentation

>=20
> --
> Murilo


