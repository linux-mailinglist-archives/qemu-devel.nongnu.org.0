Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DEA4A9C96
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:00:14 +0100 (CET)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG10P-0005Wg-9J
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:00:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG0sa-0002rh-2H; Fri, 04 Feb 2022 10:52:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG0s4-0000HG-DH; Fri, 04 Feb 2022 10:52:07 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214FKJZi024621; 
 Fri, 4 Feb 2022 15:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Vt1hVqNIjf4Lerdv7ZOdLrNXN/aCj4mHmZFPCQv4bvk=;
 b=Ih4wtjYrJXdvpkpTFjG4ZA7Nfvc3O8YOe9mi8frZFg7A8QtTtg+EuKZ64rgmPiOCUinl
 +QHkCBNlVGmC+NdUoQTtzAuIjBgIQXLJhggT8Tahm8dF09hiW5JjkLdGPVDc1VIXJEHR
 NxeNYofrx7h3dVLj9iVBPydYT1PKFknjxCY3BiE1QiWaeVfxhAKcmzwHkmQTZMiHbVZO
 mPxlBmmDcu+T4HpWBsYCQEUPtGbNGfLo3aIYbg5uvg5rhLluBszzYLvpPishrrYWEUyV
 vAayP9p0sprf2N8r1heKaw20lBqTtBOJAZjw77GEMJZQ0n9kCVArECN9n58MMCHNurL0 Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx0rfn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:50:58 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214Fkko1025971;
 Fri, 4 Feb 2022 15:50:58 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx0rfmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:50:58 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214Fn4hY028056;
 Fri, 4 Feb 2022 15:50:57 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3e0r0srtme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 15:50:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214FotTC35389724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 15:50:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15955C6062;
 Fri,  4 Feb 2022 15:50:55 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59E8CC605A;
 Fri,  4 Feb 2022 15:50:54 +0000 (GMT)
Received: from localhost (unknown [9.211.79.16])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Feb 2022 15:50:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/11] target/ppc: powerpc_excp improvements [6xx] (7/n)
In-Reply-To: <f8a83c3d-be90-30bc-5cdf-752fe3d1b04c@kaod.org>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
 <f8a83c3d-be90-30bc-5cdf-752fe3d1b04c@kaod.org>
Date: Fri, 04 Feb 2022 12:50:52 -0300
Message-ID: <87r18i8wbn.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mE8AKA-VKerRCKhDzqYHddamOkXeFdjj
X-Proofpoint-ORIG-GUID: O9FJLET_kcKKWf7w7LmbQnnES09CFT2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxlogscore=899 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040086
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 2/3/22 21:09, Fabiano Rosas wrote:
>
>> This series handles the 6xx family: 603, 604, G2, G2LE,=20
>
> What about the e300 ? I guess it's only a 603 variant for QEMU.

I forgot to mention.

>> MPC5xx and MPC8xx.
>
> These are linux-user only, no MMU. I wonder if we shouldn't simply
> drop support. At least we could remove POWERPC_MMU_MPC8xx.

I know nothing about linux-user use cases, sorry. We have other CPUs
that are linux-user only, though. And there's this TODO_USER_ONLY mess
in cpu-models as well. We could probably tackle all of it at once.

