Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A849D4C7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 23:03:21 +0100 (CET)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCqNt-0006DR-1m
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 17:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nCqJQ-0003tu-OJ; Wed, 26 Jan 2022 16:58:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nCqJO-0003sj-VI; Wed, 26 Jan 2022 16:58:44 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QLwLX0027537; 
 Wed, 26 Jan 2022 21:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=RdXn5L2DKJbH5ERHgNwelC22VmG3EVgNGLufqoz/bkM=;
 b=at7GenFj0KUHb2L+fDOw9w1vZvzdVBdRbDytclI6mMSiehM4y1E7RorqFoQRpO/Iw9OA
 llnwusrfy0aT9tDg3l9hyLEdPYbzjEheFvBdawPRWkwloQmSgxAzwJnlDKHPJr+mZApj
 AxImd2LH9Oi2DkYUs76td62sQv9G2pyKIz6pvJNkrsoRu/8obGA8nqyDqy33fCq+gA1g
 rBwaR8yEwLq7Gm3x4S8zYC3X8boP1mth2VTbrN40i+wgapT0nR218sVP7TanLwQAtlLj
 Z/tHhORDkslo0Bk5vmu+B6zG6ic69Lhy8QPlpnvtTkBIZ4LBznB3QKYOt7RmSUqm/+8A 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du89mj3t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 21:58:21 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20QLwLYZ027478;
 Wed, 26 Jan 2022 21:58:21 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du89mj3rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 21:58:21 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20QLwAVx007281;
 Wed, 26 Jan 2022 21:58:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3dr9jb4h3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 21:58:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20QLwBS416122344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 21:58:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5B5AAE05F;
 Wed, 26 Jan 2022 21:58:11 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78634AE05C;
 Wed, 26 Jan 2022 21:58:10 +0000 (GMT)
Received: from localhost (unknown [9.211.99.130])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 26 Jan 2022 21:58:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
In-Reply-To: <d98af016-0a9-49d0-74b4-c59f26a4af6@eik.bme.hu>
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
 <d98af016-0a9-49d0-74b4-c59f26a4af6@eik.bme.hu>
Date: Wed, 26 Jan 2022 18:58:07 -0300
Message-ID: <87fspaqhw0.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L9YrPIkYX9kIjsC_5bPyC_FzxWnnRMwO
X-Proofpoint-ORIG-GUID: c-ZHx-2cU_f0Jbzl2n7ix2XQGMY2_J0q
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_08,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=752
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Wed, 26 Jan 2022, Fabiano Rosas wrote:
>> This handles the exception code for the 74xx family, i.e. 7400, 7410,
>> 7440, 7445, 7450, 7455, 7457.
>>
>> This is another family that is quite well known, so it should be
>> straight-forward as well.
>
> I guess this is what may break VOF on pegasos2. Was Philippe's test case 
> for this machine ever merged? (Although that may use the firmware ROM that 
> was preferred as it tests more of the machine and may predate VOF so not 
> sure it also tests with VOF.) The way to test it is this:
>
> Get morphos demo ISO from https://www.morphos-team.net/morphos-3.15.iso
> Extract boot.img from the root directory of the CD
> Run QEMU as shown at http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
>
> (For debugging maybe enabling vof traces would give more info but it was 
> a while so I don't remember the details any more.)
>
>> Based on legoater/ppc-7.0
>
> I could test when it's merged or when it applies on master but I don't 
> usually test on branches. Did you verify it still works with pegasos2 or 
> could you please make sure it won't break that use case?

I can test with pegasos2. I'll make sure we don't merge this before
testing there.

That said, I forgot about the sc 1 thing and it is indeed broken. I'll
send a v2 fixing it.

