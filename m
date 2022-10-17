Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE1600F8B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 14:54:04 +0200 (CEST)
Received: from localhost ([::1]:51858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPd5-0008Cn-Hx
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 08:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1okPYZ-0008Ni-Aa; Mon, 17 Oct 2022 08:49:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1okPYX-000423-8B; Mon, 17 Oct 2022 08:49:23 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HC4uXc024975;
 Mon, 17 Oct 2022 12:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=K/kEUZX33HB7HdoBrujWE+6FIQJQYhN0EZ6dUONpyQk=;
 b=IUr8a4VyyEjmJKmyLtPkiN66RHozVsqgpLH8lOWHrCeA0r9PxS4yJhZo6uo24Ni5aSq3
 5B9CFtMZBulywKDxrjZpnyGv7lmiEEvNu7w+PcseutaWJrZnAS/GyhUjomdd/MBt/DnB
 pnR0zQNNlI3KzCRA5/Scvn6s0U4mu++BASoUXl7OeiJQ8Jrp3u2bTOQ/ILmX84t1j2pe
 D0jkyT5IlKFxqHKKPOyQqollorWf4qQLceKuRw9FnCClz41B+yNp8C2apbFuPSWWSnLp
 IHxvTc2qudGOypD9dHRivl4h/cS8FShSGJfYK//MAQNzlMD8a0qh67LPn48mj/t5SIZb uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86ugh631-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 12:49:17 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29HArwHK008962;
 Mon, 17 Oct 2022 12:49:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86ugh61j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 12:49:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29HCannl028102;
 Mon, 17 Oct 2022 12:49:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3k7m4jk0k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 12:49:14 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29HCnBhV721572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 12:49:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC8D5A4053;
 Mon, 17 Oct 2022 12:49:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D0D6A404D;
 Mon, 17 Oct 2022 12:49:10 +0000 (GMT)
Received: from marcibm (unknown [9.171.1.192])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 17 Oct 2022 12:49:10 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: Re: [PATCH v6 02/10] dump: Write ELF section headers right after
 ELF header
In-Reply-To: <20221017083822.43118-3-frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-3-frankja@linux.ibm.com>
Date: Mon, 17 Oct 2022 14:49:09 +0200
Message-ID: <87edv6ehtm.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z_cpOsd2-DZ-C13ULXs371zFQCcVgHTq
X-Proofpoint-ORIG-GUID: mBDAKT6cu43IDVe92dZAs0FoShk8cc5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_09,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=901 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170072
Received-SPF: pass client-ip=148.163.156.1;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Janosch Frank <frankja@linux.ibm.com> writes:

> Let's start bundling the writes of the headers and of the data so we
> have a clear ordering between them. Since the ELF header uses offsets
> to the headers we can freely order them.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index e7a3b54ebe..b168a25321 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -583,6 +583,8 @@ static void dump_begin(DumpState *s, Error **errp)
>       *   --------------
>       *   |  elf header |
>       *   --------------
> +     *   |  sctn_hdr   |
> +     *   --------------

While you=E2=80=99re at it, I would suggest to add the location for the pro=
gram
headers (phdr) as well. This would it make easier to understand the
memory layout & the code below as well.

I guess it looks like:

=E2=80=A6
---------------
|  sctn_hdr   |
---------------
|  prog_hdr   |
---------------
=E2=80=A6


[=E2=80=A6snip]

