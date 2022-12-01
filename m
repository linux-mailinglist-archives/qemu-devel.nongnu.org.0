Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7363F0AA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ioA-00029C-M7; Thu, 01 Dec 2022 07:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0io8-00028p-8X; Thu, 01 Dec 2022 07:36:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0io2-0005oC-K9; Thu, 01 Dec 2022 07:36:52 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B1CFdsK014132; Thu, 1 Dec 2022 12:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/gj17OMiiFlbpxoPKDT5iODLH7DA80D0pW62ivtISnE=;
 b=nM4J/WCuP2Ndt+UkZrisS9iTbOFlocIHW1dfqukNnb5BcYbfbgoDGMDAShN1sqwaDZc1
 QkmPw2K3I1Ct+yxUc3/5Euei92cFVixOoHfnm9WPnuInCLSBHPlEfzMfrZ5WmHCeNLNL
 1xsTTrZkB9DrZrINMoRuu0ytfOM0XF269yuB62Bp29wpGIz9z/fdXx1DqUcdhK5/5tpN
 bRySk5YCdanNPSuv5Bj3USG2xwwFgtHKiXKJMlatG3rOoLVkQu5rnawrl4OqRYUo1nTL
 hgaaoAJMyvKbzupdHjLcIzKuFdDlhHJBAhboP+OpIaL1gBkaJjxZXq2KGacIsY1SIwuc KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6v4a0eq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 12:36:36 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B1COXbY014600;
 Thu, 1 Dec 2022 12:36:35 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6v4a0epc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 12:36:35 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B1CZEjW013025;
 Thu, 1 Dec 2022 12:36:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3m3ae95av7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 12:36:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B1CaU1M26608374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Dec 2022 12:36:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 635895204F;
 Thu,  1 Dec 2022 12:36:30 +0000 (GMT)
Received: from [9.171.41.69] (unknown [9.171.41.69])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 888C15204E;
 Thu,  1 Dec 2022 12:36:29 +0000 (GMT)
Message-ID: <0aefeeb53c2b4297b9dc55ed53f45d2aa9b787c0.camel@linux.ibm.com>
Subject: Re: [PATCH-for-8.0 1/2] target/s390x: Replace TCGv by TCGv_i64 in
 op_mov2e()
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alessandro Di Federico <ale@rev.ng>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, qemu-s390x@nongnu.org, David Hildenbrand
 <david@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Anton Johansson <anjo@rev.ng>
Date: Thu, 01 Dec 2022 13:36:29 +0100
In-Reply-To: <20221130163436.87687-2-philmd@linaro.org>
References: <20221130163436.87687-1-philmd@linaro.org>
 <20221130163436.87687-2-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LfLD9tGIB5LPm3yYNIa5LlgKY08JVGWJ
X-Proofpoint-GUID: EZAZvD1JPRf7qMI3n2SBZnnq1mi-QYQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 mlxlogscore=960 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212010089
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Wed, 2022-11-30 at 17:34 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> Although TCGv is defined as TCGv_i64 on s390x,
> make it clear tcg_temp_new_i64() returns a TCGv_i64.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> =C2=A0target/s390x/tcg/translate.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/s390x/tcg/translate.c
> b/target/s390x/tcg/translate.c
> index 1e599ac259..a77039b863 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -3335,7 +3335,7 @@ static DisasJumpType op_mov2(DisasContext *s,
> DisasOps *o)
> =C2=A0static DisasJumpType op_mov2e(DisasContext *s, DisasOps *o)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 int b2 =3D get_field(s, b2);
> -=C2=A0=C2=A0=C2=A0 TCGv ar1 =3D tcg_temp_new_i64();
> +=C2=A0=C2=A0=C2=A0 TCGv_i64 ar1 =3D tcg_temp_new_i64();
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 o->out =3D o->in2;
> =C2=A0=C2=A0=C2=A0=C2=A0 o->g_out =3D o->g_in2;

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

It looks as if besides sparc and s390x there is one occurrence of this
in alpha?

$ git grep -w TCGv | grep -w tcg_temp_new_i64
target/alpha/translate.c:    TCGv tmp =3D tcg_temp_new_i64();

