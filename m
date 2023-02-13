Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55534694B36
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:33:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRapF-0002KU-8p; Mon, 13 Feb 2023 10:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRapB-0002Ir-4v; Mon, 13 Feb 2023 10:33:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRap9-0006Vi-57; Mon, 13 Feb 2023 10:33:00 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DFH5No032163; Mon, 13 Feb 2023 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BZVOVfXf0Z9IDQAtG3eQga3gQqgmjzZ9dso3WH4vlbg=;
 b=XOMsQ/C4QgF4GYgLWq2A53yezfVl+4wvbjwLEEi/33TV5eebctm3cky9i70bDxoQlB8S
 4SwJ7wn+omnONzLURzrnS7xcxruJkXr5pNbdps5BR8FK6L8Oa48miPxDZVo0LhJ2qeNw
 cXB6q6Q1S4Gh9pckBXbIxSv+kYWhq3KLksxeuLlODYRtngxzc0NnCxe87quYB7Yxvhjd
 E+mJvpq7z39qKTsPYq4Un38HgOT2AbHj8W+8ROtzijw2JosSajDi3FQm0DsEISaEv5fP
 xvbizvreuYf+AgW66ZcThCoVfaMYUFLfZidLX99qyeqUb7+Y7JFGL7lVwY8KI1D1P8DP LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqqqb8a32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:28:51 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DFJHi2007219;
 Mon, 13 Feb 2023 15:28:50 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqqqb8a2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:28:50 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DDMLjs009260;
 Mon, 13 Feb 2023 15:28:49 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3np2n734d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:28:49 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DFSlWS19727100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 15:28:48 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D951158043;
 Mon, 13 Feb 2023 15:28:47 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CDD55805D;
 Mon, 13 Feb 2023 15:28:46 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 15:28:45 +0000 (GMT)
Message-ID: <0dae0e66f0940920c0d654f97a03664869e4219e.camel@linux.ibm.com>
Subject: Re: [PATCH v2 15/19] hw/s390x/event-facility: Replace
 DO_UPCAST(SCLPEvent) by SCLP_EVENT()
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>, Li Qiang
 <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Date: Mon, 13 Feb 2023 10:28:45 -0500
In-Reply-To: <20230213070820.76881-16-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-16-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 91BHsd958EX8i9IU6zC-n0_-XKgiBMar
X-Proofpoint-GUID: jaEqdyg3jbx3ZHhRqb44BVnEk7WUMrjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130136
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
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

On Mon, 2023-02-13 at 08:08 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> Use the SCLP_EVENT() QOM type-checking macro to avoid DO_UPCAST().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
> =C2=A0hw/s390x/event-facility.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
> index faa51aa4c7..6891e3cd73 100644
> --- a/hw/s390x/event-facility.c
> +++ b/hw/s390x/event-facility.c
> @@ -64,8 +64,7 @@ static bool event_pending(SCLPEventFacility *ef)
> =C2=A0=C2=A0=C2=A0=C2=A0 SCLPEventClass *event_class;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 QTAILQ_FOREACH(kid, &ef->sbus.qbus.children, sib=
ling) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *qdev =3D kid->ch=
ild;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event =3D DO_UPCAST(SCLPEvent=
, qdev, qdev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event =3D SCLP_EVENT(kid->chi=
ld);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event_class =3D SCLP_EVE=
NT_GET_CLASS(event);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (event->event_pending=
 &&
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
event_class->get_send_mask() & ef->receive_mask) {


