Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8236686FC1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:39:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJtH-0004rd-VL; Wed, 01 Feb 2023 15:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNJtF-0004rB-AC
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:39:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pNJtD-0005ay-AV
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:39:33 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311KLke4018526; Wed, 1 Feb 2023 20:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=4EyMfreqU/NMMQ3vXaERsdxrzhLLh75VJhYrQml7tz0=;
 b=cOrJQRFJYttV4IC72eoHA6QsvgCBqF74b1gXFgGysCkMNHMK1hZbegegG7DgsCVbK73s
 Xp3o06bpeQSXS3k3eXc8hIG3pCq//Z05exRRleP7v1FBI3o9Nn+/MRb42d15QlxZaWeo
 W9A3f9S1n0FkNRVk3qQqqrXkTJkhHHfUfAIaNPvlcARhtj/r0CR2tJCWDe2q3Gva2ptA
 GgxVbrbGq6YkCKQrN/tibTc1V0cc5/C/3Gkm3DRzDKCLqB1YrrzpnMa2pyMaR8+jnJoT
 dSTwV1UWpTA/8lxrTso11xPkJWRqwR9c3SWp2fDenbPAHHYxf+g5TD23tKyFWOQXlN8/ uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfy258fj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 20:39:29 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311KNutp027393;
 Wed, 1 Feb 2023 20:39:28 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfy258fhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 20:39:28 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311J1ZwT025813;
 Wed, 1 Feb 2023 20:39:27 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3ncvtrwkuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 20:39:27 +0000
Received: from b03ledav001.gho.boulder.ibm.com ([9.17.130.232])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311KdQA410093262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 20:39:26 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A8FF6E050;
 Wed,  1 Feb 2023 20:41:35 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71F666E04E;
 Wed,  1 Feb 2023 20:41:34 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.110.248])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 20:41:34 +0000 (GMT)
Message-ID: <a2d5634ab624497d7d98569041e76661062f7eaf.camel@linux.ibm.com>
Subject: Re: [PATCH] x86: fix q35 kernel measurements broken due to rng seeding
From: James Bottomley <jejb@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, DOV MURIK <Dov.Murik1@il.ibm.com>
Date: Wed, 01 Feb 2023 15:38:53 -0500
In-Reply-To: <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
References: <da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com>
 <CAHmME9ouTTk1ONXm276CwunOpy=MAW1Q79x25kcQv=YJTZ88dQ@mail.gmail.com>
 <2b8fc552e1dc3a14de404eeaff0819ec8da7de54.camel@linux.ibm.com>
 <CAHmME9ps8w8TbC_6Bk8OQbJytR-_CJrcUWT_uXDV+xjL293NHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X6-Znu8qnBiWjaD5a4Cmu7imtcLhd-83
X-Proofpoint-ORIG-GUID: IYIdAIfJ7H0DUkGtwwuuzyEDVkQPs066
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=501 lowpriorityscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010174
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2023-02-01 at 12:51 -0500, Jason A. Donenfeld wrote:
> It's not a secret, but I have so little internet right now that I
> can't even load a webpage, and I'm on my phone, hence the short
> HTMLified emails.
> 
> In brief, though, it gets rid of all modifications to the kernel
> image all together, so it should fix your issue.

We've already tested it and established it doesn't because you simply
added your rng data to the end of a different integrity protected file
which now fails the integrity check instead of the kernel.

I checked the kernel source as well; I thought you'd have done the
usual thing and bumped the boot protocol version to steal space in
__pad9, but you didn't apparently.  To fix this up after the fact, I
recommend that we still steal space in _pad9[] but we make it have
enough space for a setup_data header as well as the 32 random bytes, so
we've officially reserved the space, but in earlier kernels than this
change gets to you can still use the setup_data_offset method, except
that it now uses the empty space in _pad9 via the setup_data mechanism.
That should find you space and get you out of having to expand any
integrity protected files.  The SEV direct boot will still work because
there's a check further down that doesn't copy the modified header back
over the kernel because it is ignored on efi stub boot anyway.

James


