Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DA4853BB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:42:52 +0100 (CET)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56Yz-00006Q-QY
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n56WW-0006a9-CD; Wed, 05 Jan 2022 08:40:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n56WU-0002Df-GR; Wed, 05 Jan 2022 08:40:16 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205D4V12019960; 
 Wed, 5 Jan 2022 13:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=re6iTRGGQrvEtG//O9D7gxqHaYfNdMTIwlbcrlIRrvk=;
 b=MdDwgPf/yJhhCj9CEwfW/ZtVoNREvcm+LrjnviYW+guPen5SNuQfmDfVHHiMxE1+Lk3B
 Z987hvPQtT/7RNgDnYwvgCoVIkMPLVhIKLsL2ic93Uzou197Yxg14R2Lum9N8owXF/5Y
 OzwEXTVGXAR3qHRaA90+TTauAQpGzx+Y8A/Dpir199hK61Iy1MyfWqVeRb33RW8WdSFe
 RCWpmsEkTJnRindZV8WvSzbi6z7gGiae8QiTazUD6wuKRNi+PP7N+PRqb3S9gsnibE0f
 fhsypBf/ROZnVgd5V5dRJmN/YSNHF+dQp/sw8P+A8TOH8HTZDChJDeoxT/hRbcfP/T5X rQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dck05k8a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 13:40:05 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205Ddoo6012502;
 Wed, 5 Jan 2022 13:40:04 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 3daekaxh1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 13:40:04 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205De3jS33554932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 13:40:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D42DC6057;
 Wed,  5 Jan 2022 13:40:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FED3C6062;
 Wed,  5 Jan 2022 13:40:02 +0000 (GMT)
Received: from localhost (unknown [9.211.59.200])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  5 Jan 2022 13:40:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] target/ppc: Add popcntb instruction to POWER5+
 processors
In-Reply-To: <20220105095142.3990430-2-clg@kaod.org>
References: <20220105095142.3990430-1-clg@kaod.org>
 <20220105095142.3990430-2-clg@kaod.org>
Date: Wed, 05 Jan 2022 10:40:00 -0300
Message-ID: <87czl6nvwv.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pJABXCmaHl0bXmLgzBmb6A8IbxNrd9a8
X-Proofpoint-GUID: pJABXCmaHl0bXmLgzBmb6A8IbxNrd9a8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_03,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 mlxlogscore=905 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050090
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> popcntb instruction was added in ISA v2.02. Add support for POWER5+
> processors since they implement ISA v2.03.
>
> PPC970 CPUs implement v2.01 and do not support popcntb.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

