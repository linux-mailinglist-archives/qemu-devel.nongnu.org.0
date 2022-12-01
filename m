Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD263ECC6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 10:45:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0g7B-00067I-Sp; Thu, 01 Dec 2022 04:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1p0g76-00065n-AH; Thu, 01 Dec 2022 04:44:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1p0g72-0006lK-NW; Thu, 01 Dec 2022 04:44:15 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B18ov7Z004251; Thu, 1 Dec 2022 09:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JiYhMuiiucU5kDJiERf6XtwXL18GmfG3QI8EwBpMP9E=;
 b=q3fJRa8FZDj4pcZGzjEU7dlO/NKGUeTd+awCOlM2ZpKnZNYkOGsUTmfNH1IHLDpUMclh
 0jAWP3faLseENCAqb6e/e60f/28HfkqMnImzTbZAi/yRKWPJwIypKdC2H322Gm7O8Tuy
 Sl6u4coGBvijrHa6nq/6f8rTpJNOic838+qGfMqQxJNcY9jSeeYTl7KFqfNLs1t3YpJP
 GKXq8GztMkcmCO8q0ModDVEDiIrE3bt2UVODtRX/wrKpWqm9KpX/NdJWKhN3w2vVOC7m
 Fc7a/Co/f+RiBizWKewF/798Xe5OlJ/xaPnQZCX9XtGeZ0h8jNSEBw/aID/02H56biCv Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6s4asn0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 09:44:09 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B18qbS5010280;
 Thu, 1 Dec 2022 09:44:09 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6s4asmyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 09:44:08 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B19ZSEn025371;
 Thu, 1 Dec 2022 09:44:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3m3ae9f4ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 09:44:07 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2B19bW8v64487898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Dec 2022 09:37:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE2B7A405F;
 Thu,  1 Dec 2022 09:44:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CA13A405B;
 Thu,  1 Dec 2022 09:44:03 +0000 (GMT)
Received: from marcibm (unknown [9.179.9.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  1 Dec 2022 09:44:03 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: German Maglione <gmaglione@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Liebler <stli@linux.ibm.com>,
 virtio-fs@redhat.com, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Sven Schnelle <svens@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Add `sigreturn` to the seccomp
 whitelist
In-Reply-To: <CAJh=p+6ZoUD7788GewpvAPq2mc=QDEA89B3QMMcAynTqs9szxQ@mail.gmail.com>
References: <20221125143946.27717-1-mhartmay@linux.ibm.com>
 <CAJh=p+7igBB9CMTUi--HCpcuxdHgveqgkw5dY7frE7Wqf==04w@mail.gmail.com>
 <87lenvjvxo.fsf@linux.ibm.com>
 <CAJh=p+6ZoUD7788GewpvAPq2mc=QDEA89B3QMMcAynTqs9szxQ@mail.gmail.com>
Date: Thu, 01 Dec 2022 10:44:01 +0100
Message-ID: <87y1rr31cu.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UpgiQP78FHv-O4p-JS90ZE-ZULMqfS05
X-Proofpoint-GUID: hMj-iborTBOx1cm7pktgzepI9FGVKSwd
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010066
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

German Maglione <gmaglione@redhat.com> writes:

> On Mon, Nov 28, 2022 at 10:00 AM Marc Hartmayer <mhartmay@linux.ibm.com> =
wrote:
>>
>> German Maglione <gmaglione@redhat.com> writes:
>>
>> > On Fri, Nov 25, 2022 at 3:40 PM Marc Hartmayer <mhartmay@linux.ibm.com=
> wrote:
>> >>
>> >> The virtiofsd currently crashes on s390x. This is because of a
>> >> `sigreturn` system call. See audit log below:
>> >>
>> >> type=3DSECCOMP msg=3Daudit(1669382477.611:459): auid=3D4294967295 uid=
=3D0 gid=3D0 ses=3D4294967295 subj=3Dsystem_u:system_r:virtd_t:s0-s0:c0.c10=
23 pid=3D6649 comm=3D"virtiofsd" exe=3D"/usr/libexec/virtiofsd" sig=3D31 ar=
ch=3D80000016 syscall=3D119 compat=3D0 ip=3D0x3fff15f748a code=3D0x80000000=
AUID=3D"unset" UID=3D"root" GID=3D"root" ARCH=3Ds390x SYSCALL=3Dsigreturn
>> >>
>> >> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>> >> ---
>> >>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/=
passthrough_seccomp.c
>> >> index 888295c073de..0033dab4939e 100644
>> >> --- a/tools/virtiofsd/passthrough_seccomp.c
>> >> +++ b/tools/virtiofsd/passthrough_seccomp.c
>> >> @@ -110,6 +110,7 @@ static const int syscall_allowlist[] =3D {
>> >>  #endif
>> >>      SCMP_SYS(set_robust_list),
>> >>      SCMP_SYS(setxattr),
>> >> +    SCMP_SYS(sigreturn),
>> >>      SCMP_SYS(symlinkat),
>> >>      SCMP_SYS(syncfs),
>> >>      SCMP_SYS(time), /* Rarely needed, except on static builds */
>> >> --
>> >> 2.34.1
>> >>
>> >> _______________________________________________
>> >> Virtio-fs mailing list
>> >> Virtio-fs@redhat.com
>> >> https://listman.redhat.com/mailman/listinfo/virtio-fs
>> >>
>> >
>> > Reviewed-by:  German Maglione <gmaglione@redhat.com>
>>
>> Thanks.
>>
>> >
>> > Should we add this also in the rust version?, I see we don't have it
>> > enabled either.
>>
>> Yep - thanks.
>
> Could you test this MR to see if it is ok?
> https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/144

I couldn=E2=80=99t reproduce the problem using the Rust version - even with=
out
your patch. With your patch applied it=E2=80=99s (of course) still working.

>
> Thanks,
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

