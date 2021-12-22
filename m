Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3C247CFAE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 11:03:23 +0100 (CET)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzySv-0005nV-Lv
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 05:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzyQD-0004Od-OK; Wed, 22 Dec 2021 05:00:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzyQ4-0003su-EP; Wed, 22 Dec 2021 05:00:32 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM79QCG024401; 
 Wed, 22 Dec 2021 10:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=zxlw8QkGqJL49dznAzhzZ/Quv7M5xXP9km3touROXmo=;
 b=qY3hOaiKse/pS0m1QHG5cWdHck/EaL6pOfA3WVYDsVYg6VNnHGxlZloX+f4MwqUfNPHa
 k9oiAZ8HoL60FqNIGkrWOu3P4Ss0k8Wd3u4IbsawoJfiofSFUQmvv8zQBKFx461Y3Lwn
 4yv4PTw2TtC42ua0SKnWUH4/ptOLI27IJb05U5fQVXPh+UY8jxPTPFHjrcKFHKfIxQbY
 UNxBkXC880iuSC+Shuxpa5hq/W7stlQFMxmkfhpztwexLaCDigvAk0DFaS2311pj9TBP
 SyPo3DPYeLTyowxHVbK4mqykaFMRBy3pbKjYhO8xmGmPH5T772LDZviMrgGAnY56Tz6Z Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3g6wk9e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 10:00:14 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM9qkgg001323;
 Wed, 22 Dec 2021 10:00:13 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3g6wk9du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 10:00:13 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM9vBLX027787;
 Wed, 22 Dec 2021 10:00:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3d416t8qfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 10:00:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BMA0CLQ31392064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 10:00:12 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EC76AC06F;
 Wed, 22 Dec 2021 10:00:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22308AC05F;
 Wed, 22 Dec 2021 10:00:11 +0000 (GMT)
Received: from localhost (unknown [9.211.91.14])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Dec 2021 10:00:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/8] target/ppc: Print out literal exception names in logs
In-Reply-To: <20211222064025.1541490-2-clg@kaod.org>
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-2-clg@kaod.org>
Date: Wed, 22 Dec 2021 07:00:08 -0300
Message-ID: <8735mlhsd3.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CjHcoLOCVl2OfIp7a0Ry0ogeBeNl5-Zi
X-Proofpoint-GUID: RWjXZUS2Q-oy0B3QDFQu2LRYZLOYMhc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_04,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220054
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> It facilitates reading the logs when mask CPU_LOG_INT is activated. We
> should do the same for error codes.
>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>


