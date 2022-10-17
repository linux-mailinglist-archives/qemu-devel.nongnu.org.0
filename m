Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE38601471
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 19:14:12 +0200 (CEST)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okTgo-0007zo-Q7
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 13:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1okTey-00066W-8F; Mon, 17 Oct 2022 13:12:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mhartmay@linux.ibm.com>)
 id 1okTeu-0007GU-Ii; Mon, 17 Oct 2022 13:12:15 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HGuc9H008713;
 Mon, 17 Oct 2022 17:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=1dFESBJ/NU6XIvxl5EdRgtQQ2tqYt2ddHrx1ZbQkMlQ=;
 b=L9AsS4KHZBk8QeVIfScWKLx+2EEh6bFGJS/1TtorG1UHXADeT1SkkPPbZWLKEX5vfAuN
 st9ei95nY6B2lkVsdMEZJyF0ZRg15En8ZGCqTgDTn5m2cjYShRhKmXEOxgH14H8Gr7pg
 k0yLtb8owXYZl8XmH2saK/ePIY6BhvpG4miyC9o6oM1ZRT5sG4PvpOtWbIbwJkX0fJb8
 Rfi4/QcGKUjM8von7KFLBqJaNCEsJYNewVOXsFwshBdDEcZ7bHCCME0xXvQr/Ft3V2of
 tY5tw/mrAwJ5IIcM71kSZrMLxpBtmchOGktG2FSSQ1th52veZc/j/T26iRoosXwFrI9/ 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k988xecad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 17:12:09 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29HGuZa8008338;
 Mon, 17 Oct 2022 17:12:08 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k988xec9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 17:12:08 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29HH5Vb1024016;
 Mon, 17 Oct 2022 17:12:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3k7m4japa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 17:12:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29HHC2Wc64749930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 17:12:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8F6A11C04A;
 Mon, 17 Oct 2022 17:12:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C14411C04C;
 Mon, 17 Oct 2022 17:12:02 +0000 (GMT)
Received: from marcibm (unknown [9.171.1.192])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 17 Oct 2022 17:12:02 +0000 (GMT)
From: Marc Hartmayer <mhartmay@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com,
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: Re: [PATCH v6 02/10] dump: Write ELF section headers right after
 ELF header
In-Reply-To: <3a50cd3b-b130-a411-d89d-cd6e5eed7656@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-3-frankja@linux.ibm.com>
 <87edv6ehtm.fsf@linux.ibm.com>
 <3a50cd3b-b130-a411-d89d-cd6e5eed7656@linux.ibm.com>
Date: Mon, 17 Oct 2022 19:12:01 +0200
Message-ID: <87a65ue5ni.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sYwJFBHIZFv2rJCtYbzo2gmqhFazRnGs
X-Proofpoint-GUID: AphLSQSaZoB0OmQnBOm821PlYVzC4j8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170099
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

> On 10/17/22 14:49, Marc Hartmayer wrote:
>> Janosch Frank <frankja@linux.ibm.com> writes:
>>=20
>>> Let's start bundling the writes of the headers and of the data so we
>>> have a clear ordering between them. Since the ELF header uses offsets
>>> to the headers we can freely order them.
>>>
>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>> ---
>>>   dump/dump.c | 31 ++++++++++++++-----------------
>>>   1 file changed, 14 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/dump/dump.c b/dump/dump.c
>>> index e7a3b54ebe..b168a25321 100644
>>> --- a/dump/dump.c
>>> +++ b/dump/dump.c
>>> @@ -583,6 +583,8 @@ static void dump_begin(DumpState *s, Error **errp)
>>>        *   --------------
>>>        *   |  elf header |
>>>        *   --------------
>>> +     *   |  sctn_hdr   |
>>> +     *   --------------
>>=20
>> While you=E2=80=99re at it, I would suggest to add the location for the =
program
>> headers (phdr) as well. This would it make easier to understand the
>> memory layout & the code below as well.
>>=20
>> I guess it looks like:
>>=20
>> =E2=80=A6
>> ---------------
>> |  sctn_hdr   |
>> ---------------
>> |  prog_hdr   |
>> ---------------
>> =E2=80=A6
>>=20
>>=20
>> [=E2=80=A6snip]
>>=20
>
>
> They are already in there, have a look at the PT_* entries. I've left=20
> them like this because I assumed that the original author wanted to make=
=20
> a point by having them like this.

Makes sense - I mistakenly assumed that these were the actual segment
contents.

[=E2=80=A6snip]

