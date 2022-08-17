Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37045975BB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 20:30:05 +0200 (CEST)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oONno-0003Dk-B2
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 14:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oONlL-0001LH-Gp; Wed, 17 Aug 2022 14:27:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oONlI-00027Z-Um; Wed, 17 Aug 2022 14:27:30 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HHjkHY031869;
 Wed, 17 Aug 2022 18:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0A0WOZAh4aZR64nVGg9TApWB67zV+zkFbuictYgqOaI=;
 b=TyUKCSGgjUodD0CiYRvOTn/j6hprScSvsARZ2JVB0RPi4KTPjBxCnL48Nc4QgJZDdubP
 Q7iv2Oyr02NBXBt/MW2fO+rh+zqW8xuIjIo8yyvHrSLbBJh6s8mVd9IT2WGH6rsu+bfg
 3fhrpy9oKtnV7gIsl92h2sXNcGTJ8VGdUCNFgqd7cyv0MK4WBHz2rsD5OmMiMXC0SH8d
 FET53I9pY2j6fz4Y6huW2vRyLD7iNHuIcMc9PLO6LHIaK7GnpgF4xY6fXCWAUFWdD+g+
 RYa7OMrJ1E3qAzgRyI98DLz2CgXzA/ht7l/eEuLCRuagIaB2hB+D31/Ft9VehqPVTJsE 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1511s97r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 18:27:09 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HIPa0Q029659;
 Wed, 17 Aug 2022 18:27:09 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1511s96h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 18:27:09 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HIM15b029173;
 Wed, 17 Aug 2022 18:27:06 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3hx3k8umfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 18:27:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27HIR3cQ22610318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Aug 2022 18:27:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4BF011C04A;
 Wed, 17 Aug 2022 18:27:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43FF611C050;
 Wed, 17 Aug 2022 18:27:03 +0000 (GMT)
Received: from [9.171.21.185] (unknown [9.171.21.185])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Aug 2022 18:27:03 +0000 (GMT)
Message-ID: <26d6dfc06f000910e6d88f330aa972aa2b41b87a.camel@linux.ibm.com>
Subject: Re: [PATCH v5 0/4] linux-user: Fix siginfo_t contents when jumping
 to non-readable pages
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, David
 Hildenbrand <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Date: Wed, 17 Aug 2022 20:27:02 +0200
In-Reply-To: <edbf4340-a3d9-e2b3-939c-1b882e5c57a9@linaro.org>
References: <20220817150506.592862-1-iii@linux.ibm.com>
 <edbf4340-a3d9-e2b3-939c-1b882e5c57a9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nVPRMRMZ9dSiDIY2QRbJPSgPDTphj1pB
X-Proofpoint-ORIG-GUID: jFk7ttbGZv8iQgCb4xaQ2ZHl1kmFJ0h1
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_11,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170067
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-08-17 at 11:23 -0500, Richard Henderson wrote:
> On 8/17/22 10:05, Ilya Leoshkevich wrote:
> > Hi,
> > 
> > I noticed that when we get a SEGV due to jumping to non-readable
> > memory, sometimes si_addr and program counter in siginfo_t are
> > slightly
> > off. I tracked this down to the assumption that translators stop
> > before
> > the end of a page, while in reality they may stop right after it.
> > 
> > Patch 1 fixes an invalidation issue, which may prevent SEGV from
> > happening altogether.
> > Patches 2-3 fix the main issue on x86_64 and s390x. Many other
> > architectures have fixed-size instructions and are not affected.
> > Patch 4 adds tests.
> > 
> > Note: this series depends on [1].
> 
> Hah.  I was just thinking that I should queue your patch set to tcg-
> next-7.2, and then 
> rebase my stuff off of that.  It would ensure that I have your test
> cases in tree so that 
> I don't keep regressing them on you.  :-)
> 
> I'll cherry pick the one patch you're depending on.
> 
> 
> r~

I just checked and cherry-picking [1] and [2] before this series
should be enough.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02462.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02461.html

