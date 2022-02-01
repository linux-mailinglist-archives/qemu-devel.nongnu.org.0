Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC964A6022
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:29:23 +0100 (CET)
Received: from localhost ([::1]:43704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEv5u-0006fa-GE
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nEsio-0003BC-3N; Tue, 01 Feb 2022 07:57:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nEsiY-0003yt-3n; Tue, 01 Feb 2022 07:57:12 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211CUsF0026974; 
 Tue, 1 Feb 2022 12:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gk9jdjARctTy0Suv72h5Et4KXzXoVGgAFXoBbzeu3aA=;
 b=AWT1LeDBizE6xA0Y2cgfKRn+O89ZR541tw7oSwOln501bOdttYSyp7Z07WHckuoXYKaa
 OqbaB30GrTVJHrFUHPGEV0sh6k/RQgMiOXEbtWmfjmQq80zjgQlqpW2KY30rEbTEI6YL
 TMGvn3ukVHHQJbVhoXpa7MnBR9B2knuwhqPnASzCPpjNWRoHI8ow9jeAg7W65zhAOLC7
 ehH0G6e1E56OruCBsMTzl1WuLXQ8VJC1MCxzN5ANcnAF9QJz7dUXcU27+w+F0cZ7B6ka
 KrdxUlyD8Y8/ocgNSteDyjg834c/6IKXR/Zn58yXZDtb28aW0LH3RYGIEj9mEiV9KCG0 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dy1v9m00w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 12:54:05 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 211ChsQH013191;
 Tue, 1 Feb 2022 12:54:05 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dy1v9m00j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 12:54:05 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211CmO05012597;
 Tue, 1 Feb 2022 12:54:04 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3dvw7aqtbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 12:54:04 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 211Cs3n837224890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 12:54:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11679BE059;
 Tue,  1 Feb 2022 12:54:03 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C81BBE051;
 Tue,  1 Feb 2022 12:54:02 +0000 (GMT)
Received: from localhost (unknown [9.211.97.90])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  1 Feb 2022 12:54:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>
Subject: Re: [PATCH 00/11] target/ppc: powerpc_excp improvements [BookE] (6/n)
In-Reply-To: <2f5661b4-cbca-748f-e5e0-47935e7cf050@eik.bme.hu>
References: <20220128224018.1228062-1-farosas@linux.ibm.com>
 <c9bb63f8-c2e8-31e5-fe24-b9923c2c1821@eik.bme.hu>
 <4c9d1067-441c-7640-09cb-5e3a26b7e8e2@kaod.org>
 <2f5661b4-cbca-748f-e5e0-47935e7cf050@eik.bme.hu>
Date: Tue, 01 Feb 2022 09:54:00 -0300
Message-ID: <87y22un3x3.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Jueca2CbjFmB0TSDpTsChFQaQJLZLjFa
X-Proofpoint-GUID: cwGZlIE2I3aYEmWyajuE1yj6zhU0mwa1
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=918 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202010068
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Tue, 1 Feb 2022, C=C3=A9dric Le Goater wrote:
>> On 1/29/22 01:07, BALATON Zoltan wrote:
>>> On Fri, 28 Jan 2022, Fabiano Rosas wrote:
>>>> This series handles the BookE exception code.
>>>>=20
>>>> Tested the following machines/CPUs:
>>>>=20
>>>> =3D=3D bamboo =3D=3D
>>>> 440ep, 460ex, 440-xilinx-w-dfpu
>>>>=20
>>>> =3D=3D sam460ex =3D=3D
>>>> 440ep, 460ex, 440-xilinx-w-dfpu
>>>=20
>>> What OS did you test with? Other than the 460ex may not make much sense=
 on=20
>>> this board but checking it never hurts. If you only tried Linux kernel =
then=20
>>> something else to give more coverage could be the same MorphOS iso that=
=20
>>> used for pegasos2 which should also boot on sam460ex as shown here:
>>>=20
>>> http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
>>>=20
>>> or the AROS iso further up that page that should also boot on sam460ex.
>>
>> I didn't see any issue.
>>
>> Could you please give a try to this branch :
>>
>>  https://gitlab.com/legoater/qemu/-/tree/ppc-7.0
>
> Thanks for testing. It should be fine if it still boots so just go ahead=
=20
> and put the series in the next pull request. If I find anything I'll=20
> report when it's in master, I don't have the resources to follow branches=
=20
> but we have a long freeze time to find any bugs so ir should be OK.

I tested it but forgot to post here. It boots fine until the little
ballons screen and I can click around. So I'd say were good. =3D)

