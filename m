Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614326FF35C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:47:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px6cd-0007Qb-AU; Thu, 11 May 2023 09:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1px6cZ-0007Pr-5g; Thu, 11 May 2023 09:46:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1px6cX-0007co-3X; Thu, 11 May 2023 09:46:14 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BDdUbV020181; Thu, 11 May 2023 13:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Mbwmr3RZdwYeePdOsgL2h9TMhBvswU6R/ZKssBXh554=;
 b=GsIhgc95LlPdgAeyCn06NCA5xw6q0wy4DSQG7Twag+cwkq3QMZ+6y6Tzz1DnCBnqASnX
 NBzp0ZowCDzsVyfTdoeq1A47ew9vu0KsqqtfVx8PGRci/NJRQDajWgw9yy5G8RNq7Exl
 p2tcHToX6uDL5YnlRXME6s5fze17JZDeH+R9gdbqM6RNG7yN4+2EPTgg9qS7mpZstD0d
 inoj3ExWBCWLhN8P8+8W7Pqy4te5PwybCb9gOh7zQAKNuQtl1nq6H3YZRiDFeJA/vEj4
 migYN4m4xeMKaAiJc7nPnskFIeWMbxy1ksqmguEyPcP+oebQaORCyRa2lCpiuuh1VHe8 Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgyydkt2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 13:46:09 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34BDeMYp028587;
 Thu, 11 May 2023 13:45:54 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgyydks1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 13:45:53 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34BDfc8c002869;
 Thu, 11 May 2023 13:45:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qf7s8he1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 13:45:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34BDjNYC197200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 May 2023 13:45:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 070732004E;
 Thu, 11 May 2023 13:45:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 906CE20043;
 Thu, 11 May 2023 13:45:22 +0000 (GMT)
Received: from [9.171.14.79] (unknown [9.171.14.79])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 11 May 2023 13:45:22 +0000 (GMT)
Message-ID: <8c1e5072a92d3160d7f906208e0b9f4c78fdaf84.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] linux-user/s390x: Fix single-stepping SVC
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Date: Thu, 11 May 2023 15:45:22 +0200
In-Reply-To: <d60cbe36-0bc0-b991-6fb7-b942527988f1@msgid.tls.msk.ru>
References: <20230510230213.330134-1-iii@linux.ibm.com>
 <20230510230213.330134-2-iii@linux.ibm.com>
 <10879612-818e-a1af-5994-56ef84c524cb@msgid.tls.msk.ru>
 <cfb547465b6b6bd27c75bea8fdc4bb7be3229c93.camel@linux.ibm.com>
 <d60cbe36-0bc0-b991-6fb7-b942527988f1@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ojwf2YlSBN7mKHFZx9di04fztfqLAA7D
X-Proofpoint-GUID: pZCtbPumH8NbVVEKjZqp2Q5kzGSjf-as
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 mlxlogscore=565 suspectscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110117
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2023-05-11 at 15:32 +0300, Michael Tokarev wrote:
> 11.05.2023 14:20, Ilya Leoshkevich wrote:
> > On Thu, 2023-05-11 at 13:55 +0300, Michael Tokarev wrote:
>=20
> > > Is it a -stable material?
>=20
> > While I would personally love to see this in -stable, I don't think
> > it
> > fits the official criteria - it's not a security fix and it's not a
> > regression.
>=20
> I'm not sure I follow. It's definitely okay to include a bug fix into
> -stable, this has been done countless times in the past..
>=20
> /mjt

Okay, then let's include it into -stable.

It's just that I'm not too familiar with the QEMU -stable process, so
I read [1], and it sounded quite strict.

[1] https://www.qemu.org/docs/master/devel/stable-process.html

