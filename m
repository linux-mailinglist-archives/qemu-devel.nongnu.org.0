Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F1641196
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 00:41:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1Fcu-0004P0-SW; Fri, 02 Dec 2022 18:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p1Fcr-0004OD-Ha; Fri, 02 Dec 2022 18:39:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p1Fcg-0007iY-FR; Fri, 02 Dec 2022 18:39:24 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B2N2Xhf021938; Fri, 2 Dec 2022 23:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yBrldHdI9w149TUDGcF/abjkvGxtX9kLzpwqGrgElbs=;
 b=h0r5W/AjXbjFmJyV80g+cJiYn+H5xiI9rqKjRzH12Zg1H+60QFfwuCxEA+VGYt5KYW6P
 SvNTVWs/SKe4MaUPj7fsN4/3/3lu7LoFP88JazH7CCd453WC5kB2zBzqEo2yA2/YUesV
 d1EVjhvU1LearlV/HKOvDthbzO4PZRBMV9cN4rUCYE5uOm0sZAk40pqOxdYt3NlXHsSF
 CcZ6AvtBhl30T9Pb9YvrlgHKpi5TkbBP7u9TW1dFDoOYpFmcjDwKl3GN3B3qjl2KW9TP
 q5+gB/GYi0JlOo8eoL7XkI9P7zshDeHY46c1WKZrU6WhIoOxNo1724kRTEn+1cuk+VAM qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m7tpe8mut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Dec 2022 23:39:09 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B2Nd9tl014942;
 Fri, 2 Dec 2022 23:39:09 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m7tpe8muc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Dec 2022 23:39:09 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B2NZvEG022835;
 Fri, 2 Dec 2022 23:39:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3m7pjyg9mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Dec 2022 23:39:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B2Nd4QW1508042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Dec 2022 23:39:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2A1D4203F;
 Fri,  2 Dec 2022 23:39:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A08842041;
 Fri,  2 Dec 2022 23:39:04 +0000 (GMT)
Received: from [9.171.71.92] (unknown [9.171.71.92])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  2 Dec 2022 23:39:04 +0000 (GMT)
Message-ID: <9800841399b75a1676584f714d42e3fe2d2fbf5d.camel@linux.ibm.com>
Subject: Re: [PATCH v2 for-8.0] target/s390x/tcg: Fix and improve the SACF
 instruction
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org
Date: Sat, 03 Dec 2022 00:39:04 +0100
In-Reply-To: <20221201184443.136355-1-thuth@redhat.com>
References: <20221201184443.136355-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CihrT3xuE3ElvC0SGACGX7dt4KB8W82t
X-Proofpoint-GUID: Sms_oSpBy6T9KkvQjGUE6_ojKC6ZoiIP
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_12,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=633 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020190
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 2022-12-01 at 19:44 +0100, Thomas Huth wrote:
> The SET ADDRESS SPACE CONTROL FAST instruction is not privileged, it
> can be
> used from problem space, too. Just the switching to the home address
> space
> is privileged and should still generate a privilege exception. This
> bug is
> e.g. causing programs like Java that use the "getcpu" vdso kernel
> function
> to crash (see
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D990417#26=C2=A0).
>=20
> While we're at it, also check if DAT is not enabled. In that case the
> instruction is supposed to generate a special operation exception.
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/655
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
> =C2=A0target/s390x/tcg/insn-data.h.inc | 2 +-
> =C2=A0target/s390x/tcg/cc_helper.c=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
> =C2=A02 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

