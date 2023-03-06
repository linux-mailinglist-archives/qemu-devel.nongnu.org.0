Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CA96ABD62
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:52:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8SH-0006DJ-FY; Mon, 06 Mar 2023 05:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pZ8S4-00068K-3h; Mon, 06 Mar 2023 05:52:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pZ8S2-0001Mi-Ly; Mon, 06 Mar 2023 05:52:19 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3269rIiY022144; Mon, 6 Mar 2023 10:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FrI43s3VyI1oGecUXShJQmPxv/S8EvDuTY1gkWXQiV0=;
 b=XIkN6cjVmxdIjPSepkBz15STA8pPHyoiWaBwIewW5pQUShqahhU7VpPiRQgJRKEmrTbI
 5m2+YnCbIE8v/FiMXhz+GkGhp2fOLd748GAzB6gyPX/GlX42/EqP16555zD13t04vs2S
 XrV67yYMxQJBVbGsp6rXu7v8Uo+gWpLJ3SU4egsLdDYrsiszALozQsuLe/bYHIMmH2ey
 z6uS1yWwTZNfUEjjgxpvY7p6AjOfeFq4ynw9XJCaBQHr1asFTmzalBF9SJOKwH+k9Q1H
 yxLLAdDVi/wWae8Vqy/AbvlhtS/zh45tvEIVS7RLLD7sw8a5ApZqrkcmEEGENaac70Om CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4uaed7pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 10:52:15 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326AVBGp024590;
 Mon, 6 Mar 2023 10:52:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4uaed7np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 10:52:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 325K7tv6005745;
 Mon, 6 Mar 2023 10:52:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3p41brak31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 10:52:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326AqA2964881036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 10:52:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 403222006B;
 Mon,  6 Mar 2023 10:52:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D985B20043;
 Mon,  6 Mar 2023 10:52:09 +0000 (GMT)
Received: from [9.171.79.58] (unknown [9.171.79.58])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Mar 2023 10:52:09 +0000 (GMT)
Message-ID: <463031327c69eafee9df44f8d29b6a218f6c4dfc.camel@linux.ibm.com>
Subject: Re: [PATCH v3 15/20] target/s390x: Drop tcg_temp_free from translate.c
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Date: Mon, 06 Mar 2023 11:52:09 +0100
In-Reply-To: <20230304181900.1097116-16-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jBgrJWaUgivpqICU5oGzAIrdGIkHcjSP
X-Proofpoint-ORIG-GUID: ZgBwJjEL7B4giE5p_mP5QeyA6NL7AEM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=889 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060088
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 2023-03-04 at 10:18 -0800, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---
> =C2=A0target/s390x/tcg/translate.c | 105 --------------------------------=
-
> --
> =C2=A01 file changed, 105 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

