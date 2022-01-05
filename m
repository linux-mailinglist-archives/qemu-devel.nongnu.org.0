Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BF44853CC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:48:13 +0100 (CET)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56eC-0004rs-Hi
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n56Xy-0008BC-5Q; Wed, 05 Jan 2022 08:41:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n56Xv-0002Vx-8A; Wed, 05 Jan 2022 08:41:44 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205CvLGg020664; 
 Wed, 5 Jan 2022 13:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=VGbRJtFCYvK8kS8ohOIac5g3vmTLZDhlyXoUuwnJjI8=;
 b=gy2flSWGDBZl4qrQHcBD4CmXUZnSZWUtYnGugNvo4psqYSHivYu9rJTLxpfPMX4wO8J2
 F+N08rDPy89hUVOw7wgfrFA3drW5UWx5TWpnY9NirslEUq7FznLuJpRyb2hdDWvF2o7W
 0Ye3IOEAiMt3B7m0QHlhfbd+cF2vorrmsgE86iXlUv3H+Rae3inNrN0sNtleL4jSPVh+
 uq2Xpx6r8Ogld4UUmnyr0/ZXG1sYwx9w5ChL5i3sJfdWCswQNdx1xyKZEQEwTMt+hU7p
 BpwXzLCy5wpAF/4iSAYRxot+bsE5VTkAhphFMvX+uY0X4xnEv69KAskbGLi8cTgf9dGn bw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dck05k9d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 13:41:37 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205DepvI003854;
 Wed, 5 Jan 2022 13:41:36 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3dd8hfvcs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 13:41:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205DfYNw24117590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 13:41:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 906A17806D;
 Wed,  5 Jan 2022 13:41:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFA077805E;
 Wed,  5 Jan 2022 13:41:33 +0000 (GMT)
Received: from localhost (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  5 Jan 2022 13:41:33 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] spapr: Fix support of POWER5+ processors
In-Reply-To: <20220105095142.3990430-3-clg@kaod.org>
References: <20220105095142.3990430-1-clg@kaod.org>
 <20220105095142.3990430-3-clg@kaod.org>
Date: Wed, 05 Jan 2022 10:41:31 -0300
Message-ID: <87a6ganvuc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8B9pBTVGUahlxgcd4YtKc9l-HcD5WNKP
X-Proofpoint-GUID: 8B9pBTVGUahlxgcd4YtKc9l-HcD5WNKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_03,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 mlxlogscore=925 impostorscore=0 suspectscore=0
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

> POWER5+ (ISA v2.03) processors are supported by the pseries machine
> but they do not have Altivec instructions. Do not advertise support
> for it in the DT.
>
> To be noted that this test is in contradiction with the assert in
> cap_vsx_apply().
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Tested-by: Fabiano Rosas <farosas@linux.ibm.com>

