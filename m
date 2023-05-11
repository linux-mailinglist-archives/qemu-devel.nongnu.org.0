Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D66FF075
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:20:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4LX-0002w9-36; Thu, 11 May 2023 07:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1px4LU-0002vX-D2; Thu, 11 May 2023 07:20:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1px4LS-0000du-Or; Thu, 11 May 2023 07:20:28 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BB9sho003812; Thu, 11 May 2023 11:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Xtt4+nBlQDkfLeMf7z8RlQejPi/nO6q8gVkx/SwQILM=;
 b=FiXqUAVQ50m+gvi69UhCecHDw0475TdC8EqiGj4A8vVwBsp6regM/PfpcEJ7xkVkjWqZ
 bdrQrdzXR2+9OKiCKNhXZwZim+WPrE6ss0du2Eu+2zV2B4qoFqd7tdk7dFpHNsJQj/p+
 Rq8XeOWngZA3ZBctV4Ao1vwQq7m5d8QapTtz6cE2RHjZwHQZDLukZaJHSixEWmkOLBF8
 AI0Z8sXx/3SkIQPIduDFQfxpeZuWgmRN6K5jmjZjcF/zuZALJWughL6tl3rNsBmTf5Fe
 GPSsCztgRz3UZkAnrCrSIKGPfpTPD9q8MZDcJjn2ayIsF1rRwfPG3lS0vf6OPOVmAkI0 uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgcdvgkc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:20:24 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34BBBeOX014725;
 Thu, 11 May 2023 11:20:23 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgcdvgkb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:20:23 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34B4CoMe023348;
 Thu, 11 May 2023 11:20:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qf7s8hbh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 11:20:21 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34BBKJjI7668258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 May 2023 11:20:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EDEB20043;
 Thu, 11 May 2023 11:20:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9ABD20040;
 Thu, 11 May 2023 11:20:18 +0000 (GMT)
Received: from [9.171.14.79] (unknown [9.171.14.79])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 11 May 2023 11:20:18 +0000 (GMT)
Message-ID: <cfb547465b6b6bd27c75bea8fdc4bb7be3229c93.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] linux-user/s390x: Fix single-stepping SVC
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Date: Thu, 11 May 2023 13:20:18 +0200
In-Reply-To: <10879612-818e-a1af-5994-56ef84c524cb@msgid.tls.msk.ru>
References: <20230510230213.330134-1-iii@linux.ibm.com>
 <20230510230213.330134-2-iii@linux.ibm.com>
 <10879612-818e-a1af-5994-56ef84c524cb@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KyD3qK76YqMENmQ-eWd_UtKwlL4wpxeu
X-Proofpoint-GUID: IbKQUvMM7PHXTng0AyV_ZEkn85oSqwkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_07,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0 mlxlogscore=642
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110094
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Thu, 2023-05-11 at 13:55 +0300, Michael Tokarev wrote:
> 11.05.2023 02:02, Ilya Leoshkevich wrote:
> > Currently single-stepping SVC executes two instructions. The reason
> > is
> > that EXCP_DEBUG for the SVC instruction itself is masked by
> > EXCP_SVC.
> > Fix by re-raising EXCP_DEBUG.
>=20
> Is it a -stable material?
>=20
> /mjt

While I would personally love to see this in -stable, I don't think it
fits the official criteria - it's not a security fix and it's not a
regression.

